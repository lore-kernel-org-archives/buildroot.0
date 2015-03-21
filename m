From: Alex Suykov <alex.suykov@gmail.com>
Date: Sat, 21 Mar 2015 20:30:29 +0200
Subject: [Buildroot] [RFC 05/11] bare bb init configuration
In-Reply-To: <cover.1426960081.git.alex.suykov@gmail.com>
References: <cover.1426960081.git.alex.suykov@gmail.com>
Message-ID: <505ef418b986406eac8615b207579ddfae221c6f.1426960081.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch introduces a new init system: bb init without
system V initscripts.

Busybox init is quite capable of running foreground daemons,
with fast startup and auto-restarts but without the overhead
of systemd. It lacks telinit and cannot start or stop daemons
at runtime, but not every systems needs runtime control.

With the infrastructure mostly in place, implementing this
is straightforward. Per-package initlines are installed in
output/parts/ and init/finalize script picks them up to form
a complete inittab.

Whenever a daemon needs some pre-start initialization and/or
can not be started directly from inittab for other reasons,
a shell script is created in /etc/rc/.

To keep things organized, initialization scripts (scripts that
do not start a long-running foreground process) are put in
/etc/rc/sys/ while anything directly in /etc/rc/ is expected
to be used for :respawn: lines.
---
 package/Makefile.in      |  2 ++
 support/init/finalize    | 44 ++++++++++++++++++++++++-
 support/init/install-run | 83 ++++++++++++++++++++++++++++++++++++++++++++++--
 support/init/rc.sys/mdev |  4 +++
 support/init/rc.sys/udev |  8 +++++
 system/Config.in         | 16 ++++++++--
 6 files changed, 152 insertions(+), 5 deletions(-)
 create mode 100755 support/init/rc.sys/mdev
 create mode 100755 support/init/rc.sys/udev

diff --git a/package/Makefile.in b/package/Makefile.in
index 599fe7f..df3b3b7 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -412,6 +412,8 @@ ifdef BR2_INIT_SYSV
 BR2_INIT = initscripts
 else ifdef BR2_INIT_BUSYBOX
 BR2_INIT = initscripts
+else ifdef BR2_INIT_BUSYBOX_BARE
+BR2_INIT = inittab
 else ifdef BR2_INIT_SYSTEMD
 BR2_INIT = systemd
 else
diff --git a/support/init/finalize b/support/init/finalize
index fada2be..ba4f462 100755
--- a/support/init/finalize
+++ b/support/init/finalize
@@ -172,6 +172,48 @@ def initscripts():
 
 # ------------------------------------------------------------------------------
 
+# Inittab is almost the same as initscripts, except all services
+# are listed directly instead of running rcS and rcK
+def inittab():
+    writeto('output/target/etc/inittab')
+    pipefile('support/init/sysv.init')
+    wnl()
+
+    sysv_mount()
+    sysv_net()
+    # These are started *before* anything else, in particular before
+    # any system initialization, to catch possible messages and
+    # to give a chance to peek at the system state if something hangs.
+    sysv_syslog()
+    sysv_getty()
+    inittab_udev()
+
+    # This follows initscript idea of priority, with mixed
+    # w-type and s-type entries. Makes little sense actually,
+    # but the code is a bit shorter this way, and install-init
+    # already kinda splits w/s-type with its default prio settings.
+    lines = readlines('output/parts/inittab/')
+    lines = map(sysv_line, sorted(lines, key=sysv_prio))
+    if lines:
+        wnl()
+        for l in lines: w('%s', l.rstrip())
+
+    wnl()
+    pipefile('support/init/sysv.fini')
+
+def inittab_udev():
+    if BR2.ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV:
+        copyfile('support/init/rc.sys/udev', 'output/target/etc/rc/sys/udev')
+        w('null:2345:respawn:/sbin/udevd')
+        w('null:2345:wait:/etc/rc/sys/udev')
+    elif BR2.ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV:
+        # mdev is not a deamon
+        copyfile('support/init/rc.sys/mdev', 'output/target/etc/rc/sys/mdev')
+        copyfile('support/init/mdev.conf', 'output/target/etc/mdev.conf')
+        w('null:2345:wait:/etc/rc/sys/mdev')
+
+# ------------------------------------------------------------------------------
+
 # Installed service files must be linked to relevant *.wants directories.
 # Other than that, there is nothing to do with systemd configuration.
 def systemd():
@@ -191,7 +233,7 @@ def systemd():
 # ------------------------------------------------------------------------------
 
 output = None
-inits = [ 'initscripts', 'systemd' ]
+inits = [ 'inittab', 'initscripts', 'systemd' ]
 BR2 = Br2('.config')
 
 if len(argv) > 1 and argv[1] == '-':
diff --git a/support/init/install-run b/support/init/install-run
index 24b79c7..5a06e63 100755
--- a/support/init/install-run
+++ b/support/init/install-run
@@ -23,7 +23,7 @@ from os import open as osopen
 from os import read as osread
 from os import write as oswrite
 
-inits = ['initscripts', 'systemd']
+inits = ['inittab', 'initscripts', 'systemd']
 output = None
 nopath = False
 
@@ -37,7 +37,7 @@ class Run:
         # accepting unadorned commands for pre/post groups.
 
         for k in ['description', 'user', 'group', 'umask',
-                  'pidfile', 'priority',
+                  'pidfile', 'priority', 'short',
                   'after', 'requires', 'wantedby',
                   'busname', 'conflicts', 'killwith', 'restart']:
             setattr(self, k, None)
@@ -219,6 +219,81 @@ def maybesu(r, cmd):
     else:
         return cmd
 
+# return either cmd, sh cmd or su cmd; the caller can *not* handle
+# shell commands, so anything unusual must be escaped with sh -c
+def maybesush(r, cmd):
+    # everything below assumes the caller uses execvp even with no sh
+    # which is ok for all init systemd that use su
+    shneeded = match(r'^.*[<>&|$"()]', cmd)
+
+    if r.user:
+        if shneeded:
+            return "su - %s -c '%s'" % (r.user, cmd)
+        else:
+            return "su - %s %s" % (r.user, cmd)
+    else:
+        if shneeded:
+            return "sh -c '%s'" % (r.user, cmd)
+        else:
+            return cmd
+
+# ------------------------------------------------------------------------------
+
+def inittab(r):
+    short = r.short if r.short else r.name
+    rlvls = '345' # BR does not use runlevels
+    writeto('output/parts/inittab/%s.line' % r.name, 0o644)
+    script = None
+    r.substcmds()
+
+    if r.umask:
+        r.pre.insert(0, "umask %s" % r.umask)
+
+    if r.exec:
+        action, cmd = 'respawn', r.exec
+    elif r.start:
+        action, cmd = 'wait', r.start
+    elif len(r.pre) == 1:
+        action, cmd = 'wait', r.pre[0]
+    else:
+        action, cmd = 'wait', None
+    if ((r.exec or r.start) and r.pre) or (len(r.pre) > 1):
+        sdir = 'rc' if r.start or r.exec else 'rc/sys'
+        script = '/etc/%s/%s' % (sdir, r.name)
+        cmd = script
+
+    if not script:
+        cmd = maybesush(r, cmd)
+
+    # let tty be null for all anything intalled from .run files
+    w("%02d:%s:%s:%s:%s", int(r.priority), 'null', rlvls, action, cmd)
+
+    if not script:
+        return
+
+    writeto('output/target%s' % script, 0o755)
+    w("#!/bin/sh")
+    if r.description:
+        w("# %s", r.description)
+    wnl
+
+    for c in r.pre:
+        # this may result in profoundly ugly code, but luckily
+        # the only service that uses it atm has exactly one line pre
+        w("%s", maybesu(r, c))
+
+    if r.exec:
+        w("exec %s", maybesu(r, r.exec))
+    elif r.start:
+        w("%s", maybesu(r, r.start))
+
+    # TODO: handle pre-post scripts
+    # This should result in *two* lines, not one, with the second
+    # line being probably :06: with relevant setup in finalize-init
+    # to make sysvinit switch to those runlevels on reboot/poweroff
+    # XXX: would that be a natural solution for sysv?
+    # XXX: bb init does not support runlevels
+
 # ------------------------------------------------------------------------------
 
 def initscripts(r):
@@ -381,6 +456,10 @@ def systemd(r):
 #     bypass inittab -
 
 bypasstable = {
+    'inittab': [
+        ('*.line',      'output/parts/inittab/*'),
+        ('sys:*',       'output/target/etc/rc/sys/*'),
+        ('*',           'output/target/etc/rc/*') ],
     'initscripts': [
         ('*:*.init',    'output/target/etc/init.d/S$1$2'),
         ('*.init',      'output/target/etc/init.d/S50$1'),
diff --git a/support/init/rc.sys/mdev b/support/init/rc.sys/mdev
new file mode 100755
index 0000000..dd66441
--- /dev/null
+++ b/support/init/rc.sys/mdev
@@ -0,0 +1,4 @@
+#!/bin/sh
+
+echo /sbin/mdev >/proc/sys/kernel/hotplug
+exec /sbin/mdev -s
diff --git a/support/init/rc.sys/udev b/support/init/rc.sys/udev
new file mode 100755
index 0000000..d5e40ea
--- /dev/null
+++ b/support/init/rc.sys/udev
@@ -0,0 +1,8 @@
+#!/bin/sh
+
+# udevd must be running by this point!
+
+printf '\000\000\000\000' > /proc/sys/kernel/hotplug
+udevadm trigger --type=subsystems --action=add
+udevadm trigger --type=devices --action=add
+udevadm settle --timeout=30
diff --git a/system/Config.in b/system/Config.in
index c0ee345..d25ad85 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -86,8 +86,20 @@ choice
 	  There are several possible configurations providing
 	  varying degrees of control over the spawned processes.
 
+config BR2_INIT_BUSYBOX_BARE
+	bool "BusyBox / inittab"
+	select BR2_PACKAGE_BUSYBOX
+	help
+	  Minimalistic init implementation from busybox.
+	  Daemons are written directly to /etc/inittab.
+
+	  No runlevel support.
+	  No runtime control over processes.
+	  Daemons are started in foreground mode,
+	  failed processes are respawned.
+
 config BR2_INIT_BUSYBOX
-	bool "BusyBox"
+	bool "BusyBox / initscripts"
 	select BR2_PACKAGE_BUSYBOX
 	help
 	  Minimalistic init implementation from busybox
@@ -100,7 +112,7 @@ config BR2_INIT_BUSYBOX
 	  Failed processes are not respawned.
 
 config BR2_INIT_SYSV
-	bool "systemV"
+	bool "sysvinit / initscripts"
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # sysvinit
 	select BR2_PACKAGE_SYSVINIT
 	help
-- 
2.0.3
