From: Alex Suykov <alex.suykov@gmail.com>
Date: Mon, 6 Apr 2015 01:01:50 +0300
Subject: [Buildroot] [RFC v2 1/6] common service startup files
In-Reply-To: <cover.1428263859.git.alex.suykov@gmail.com>
References: <cover.1428263859.git.alex.suykov@gmail.com>
Message-ID: <3bd26c2eb02c97488c235dbf76c5abd5e19884fc.1428263859.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch introduces support infrastructure for per-project .run
files containing the information needed to generate either sysv
intiscripts or systemd services in a common format.

Packages are expected to set $(PKG)_INIT_RUN = list of .run files
to install in their .mk files, allowing pkg-generic to call
support/init/install with appropriate arguments.

Alternatively, packages may define $(PKG)_INSTALL_INIT, calling
support/init/install themselves or doing something more elaborate.
Packages may also define $(PKG)_INSTALL_INIT_SYSV or _SYSTEMD,
overriding non-specific _INSTALL_INIT.

The format of the .run files is simple set of "key: value" lines,
reflecting the structure of the data while also being somewhat
readable.

Explicit $(PKG)_INIT_RUN in every .mk file provides clues for unaware
users regarding the purpose of otherwise unremarkable .run files.
INIT_RUN string is grepable.

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 package/pkg-generic.mk |  26 +++-
 package/pkg-utils.mk   |   4 +
 support/init/install   | 349 +++++++++++++++++++++++++++++++++++++++++++++++++
 system/Config.in       |   6 +
 4 files changed, 381 insertions(+), 4 deletions(-)
 create mode 100755 support/init/install

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 0d95541..833f9b5 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -235,10 +235,7 @@ $(BUILD_DIR)/%/.stamp_target_installed:
 	@$(call MESSAGE,"Installing to target")
 	$(foreach hook,$($(PKG)_PRE_INSTALL_TARGET_HOOKS),$(call $(hook))$(sep))
 	+$($(PKG)_INSTALL_TARGET_CMDS)
-	$(if $(BR2_INIT_SYSTEMD),\
-		$($(PKG)_INSTALL_INIT_SYSTEMD))
-	$(if $(BR2_INIT_SYSV)$(BR2_INIT_BUSYBOX),\
-		$($(PKG)_INSTALL_INIT_SYSV))
+	+$($(PKG)_INSTALL_INIT_$(INIT))
 	$(foreach hook,$($(PKG)_POST_INSTALL_TARGET_HOOKS),$(call $(hook))$(sep))
 	$(Q)if test -n "$($(PKG)_CONFIG_SCRIPTS)" ; then \
 		$(RM) -f $(addprefix $(TARGET_DIR)/usr/bin/,$($(PKG)_CONFIG_SCRIPTS)) ; \
@@ -763,6 +760,27 @@ ifneq ($$(call suitable-extractor,$$($(2)_SOURCE)),$$(XZCAT))
 DL_TOOLS_DEPENDENCIES += $$(firstword $$(call suitable-extractor,$$($(2)_SOURCE)))
 endif
 
+ifeq ($(4),target)
+
+ifndef $(3)_INSTALL_INIT
+ ifdef $(3)_INIT_RUN
+  define $(3)_INSTALL_INIT
+	support/init/install $(BR2_INIT) $(TARGET_DIR) \
+		$$(addprefix $(pkgdir),$$($(3)_INIT_RUN))
+  endef
+ endif
+endif
+
+# Init-specific rules override generic INSTALL_INIT
+ifndef $(3)_INSTALL_INIT_$(INIT)
+ ifdef $(3)_INSTALL_INIT
+  $(3)_INSTALL_INIT_$(INIT) = $$($(3)_INSTALL_INIT)
+ endif
+endif
+
+endif # $(4) == target
+
+
 endif # $(2)_KCONFIG_VAR
 endef # inner-generic-package
 
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 7eddc47..057a693 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -76,6 +76,10 @@ INFLATE.tar  = cat
 # suitable-extractor(filename): returns extractor based on suffix
 suitable-extractor = $(INFLATE$(suffix $(1)))
 
+# Uppercase init name suitable for use in variables
+# BR2_INIT="sysv" INIT=SYSV
+INIT = $(call UPPERCASE,$(call qstrip,$(BR2_INIT)))
+
 # MESSAGE Macro -- display a message in bold type
 MESSAGE = echo "$(TERM_BOLD)>>> $($(PKG)_NAME) $($(PKG)_VERSION) $(call qstrip,$(1))$(TERM_RESET)"
 TERM_BOLD := $(shell tput smso)
diff --git a/support/init/install b/support/init/install
new file mode 100755
index 0000000..f5f21de
--- /dev/null
+++ b/support/init/install
@@ -0,0 +1,349 @@
+#!/usr/bin/env python
+
+# Usage:
+#
+#   support/init/install init-system target-directory file1.run file2.run ...
+#
+# Each .run file describes a single daemon to be spawned on system startup.
+# This script turns .run into relevant files for init-system and writes
+# those to target-directory.
+#
+# Expected format of the .run files:
+#
+#   # comment
+#   description: Some sample daemon
+#   umask: 077
+#   foreground: /sbin/daemon -A -b 7000
+#
+# The first word is the key, the rest is value. See Run.__init__ below
+# for the list of possible keys.
+#
+# Most daemons should only need foreground: line, which is the command
+# to start it in foreground (non-forking) mode.
+
+# Typical test run:
+#
+#   .../support/init/install sysv . foo.run
+#
+# that should create ./etc/init.d/S50foo or something similar.
+
+# Bundling all init systems into a single script, vs having install-init-(system)
+# scripts for each system, may look strange, but it turns out large parts of the
+# code below are common for all init systems.
+
+import re
+import os
+import sys
+
+class Run:
+    class ParseError(Exception): pass
+    class KeywordError(Exception): pass
+    class ConfigError(Exception): pass
+
+    def __init__(self, path):
+        self.name = None
+        self.path = None
+
+        # possible keywords in the .run file
+        self.attr = {
+            # process properties
+            'pidfile': None,        # if set, assume the daemon writes it
+            'umask': None,
+            'user': None,           # effective uid to run the daemon as
+            'group': None,          # effecitve gid
+            # non-process info
+            'description': None,    # systemd, and comment in initscripts
+            'after': None,          # systemd only
+            'priority': None,       # sysv only
+            # commands to run
+            'prestart': [ ],        # commands to run before starting the daemon
+            'foreground': None,     # command to start the daemon in fg mode
+            'background': None,     # same, in background mode
+                                    # (the daemon is assumed to fork)
+
+            'start': None,          # sysv-specific, skips start-stop-daemon
+            'stop': None,           # sysv-specific, skips start-stop-daemon
+            'reload': None          # both sysv and systemd can use this
+        }
+
+        # constructing Run from a file means parsing that file
+        if path: self.parse(path)
+
+    # [] to access .attr dictionary
+    def __setitem__(self, key, val):
+        if key not in self.attr:
+            raise Run.KeywordError(key)
+        if type(self.attr[key]) is list:
+            self.attr[key].append(val)
+        else:
+            self.attr[key] = val
+
+    def __getitem__(self, key):
+        return self.attr[key]
+
+    # Input file has simple "key any-string-value" structure
+    # for all significant lines, possibly also comments and empty
+    # lines. This reads it into attr[].
+    def parse(self, path):
+        self.path = path
+        self.name = re.sub(r'\..*', '', os.path.basename(path))
+        with open(path) as fh:
+            for lnum, line in enumerate(fh, 1):
+                line = line.strip()
+
+                # skip comments and empty lines
+                if line[0] == '#' or not re.match(r'\S', line):
+                    continue
+
+                m = re.match(r'^([a-z]+):\s+(.*)', line)
+                if not m:
+                    raise Run.ParseError(path, lnum, 'bad line format')
+                try:
+                    self[m.group(1)] = m.group(2)
+                except Run.KeywordError as e:
+                    raise Run.ParseError(path, lnum, 'unknown keyword %s' % e.args[0])
+
+def die(message, *args):
+    sys.stderr.write((message+"\n") % tuple(args))
+    exit(-1)
+
+# Directory structure under $TARGET_DIR is init-specific
+# and may not be there by the time init/install gets called.
+# mode is 0644 for systemd services but 0755 for initscripts.
+def openmode(path, mode):
+    pathdir = os.path.dirname(path)
+    if not os.path.isdir(pathdir):
+        os.makedirs(pathdir)
+    fd = os.open(path, os.O_WRONLY | os.O_CREAT | os.O_TRUNC)
+    os.fchmod(fd, mode)
+    return os.fdopen(fd, 'w')
+
+# ------------------------------------------------------------------------------
+
+# Sysv initscripts are expected to spawn background daemons, tracking them
+# via pid files. In case background line was supplied, it will be used,
+# otherwise start-stop-daemon will use foreground command and fork/daemonize
+# the process itself.
+#
+# Pre-start commands naturally go to the start) block.
+
+class Initscript(Run):
+    ssd = '/sbin/start-stop-daemon'
+
+    def write(self, targetdir):
+        scriptname = '%s/etc/init.d/S%s%s' % (targetdir, self.priority(), self.name)
+        script = openmode(scriptname, 0o755)
+
+        def caseblock(patt, lines):
+            script.write("\t%s)\n" % patt)
+            for line in lines:
+                if not line is None:
+                    script.write("\t\t%s\n" % line)
+            script.write("\t\t;;\n")
+
+        script.write("#!/bin/sh\n\n")
+        if self['description']:
+            script.write("# %s\n\n" % self['description'])
+        script.write("case \"$1\" in\n")
+        caseblock('start', self.start())
+        caseblock('stop', self.stop())
+        # XXX: is it needed / does anyone use this?
+        if self['reload']:
+            caseblock('reload', [self['reload']])
+            caseblock('restart', ['$0 stop', 'sleep 1', '$0 start'])
+        else:
+            caseblock('reload|restart', ['$0 stop', 'sleep 1', '$0 start'])
+        script.write("esac\n")
+
+        script.close()
+
+    # Priority field (that 50 in S50foo) gets almost no use in buildroot
+    # since the stuff that needs strict order (mounts, swap and such)
+    # happens directly in inittab. For the services installed via .run files,
+    # the idea is to do sysinit first, then start daemons.
+    # For (rare) case that do not fit, allow specifying it explicitly.
+    def priority(self):
+        if self['priority']:
+            return self['priority']
+        else:
+            return '50'
+
+    def pidfile(self):
+        if self['pidfile']:
+            return self['pidfile']
+        else:
+            return'/var/run/%s' % self.name
+
+    def start(self):
+        if self['start']:
+            return [self['start']]
+
+        start = [ self.ssd, '-S' ]
+        if self['user']:
+            start.extend(['-c', self['user']])
+        if self['group']:
+            start.extend(['-g', self['group']])
+
+        start.extend(['-p', self.pidfile()])
+
+        if self['umask']:
+            start.extend(['-k', self['umask']])
+
+        # start-stop-daemon requires -- before command args
+        def dashdashargs(cmd):
+            return re.sub(r'\s+', ' -- ', cmd, 1)
+
+        # When running services in background mode, prefer background
+        # commands since they tend to be simplier (as in, an option
+        # required to prevent forking)
+        if self['background']:
+            start.append(dashdashargs(self['background']))
+        elif self['foreground']:
+            start.extend(['-m', '-b', dashdashargs(self['foreground'])])
+        else:
+            raise Run.ConfigError(self.path, "no process to start")
+
+        cmds = self['prestart'][:]
+        cmds.append(" ".join(start))
+
+        return cmds
+
+    def stop(self):
+        if self['stop']:
+            return [self['stop']]
+        else:
+            # do not bother checking executable name,
+            # it does not improve things much
+            return ["%s -K -p %s" % (self.ssd, self.pidfile())]
+
+# ------------------------------------------------------------------------------
+
+# Systemd .service files are essentially .run files with slightly different
+# key names and completely pointless sections.
+# Foreground command is preferred, but background can be used as well.
+
+class Service(Run):
+    sysdir = '/usr/lib/systemd/system'
+
+    def write(self, targetdir):
+        filename = '%s%s/%s.service' % (targetdir, self.sysdir, self.name)
+        service = openmode(filename, 0o644)
+
+        def writefield(tag, key = None):
+            if key is None:
+                key = tag.lower()
+            if(self[key]):
+                service.write("%s=%s\n" % (tag, self[key]))
+
+        service.write("[Unit]\n")
+        writefield('Description')
+        if self['after']:
+            service.write("After=%s\n" % self.after())
+
+        service.write("\n")
+        service.write("[Service]\n")
+        writefield('UMask')
+        writefield('User')
+        writefield('Group')
+
+        # not needed to control foreground services
+        if not self['foreground']:
+            writefield('PIDFile')
+
+        for cmd in self['prestart']:
+            service.write("ExecStartPre=%s\n" % cmd)
+
+        if self['foreground']:
+            # Type=simple is the default
+            service.write("ExecStart=%s\n" % self['foreground'])
+        elif self['background']:
+            service.write("Type=forking\n")
+            service.write("ExecStart=%s\n" % self['background'])
+        else:
+            raise Run.ConfigError(self.path, "no process to start")
+
+        writefield('ExecStop', 'stop')
+        writefield('ExecReload', 'reload')
+
+        # systemd does not object against including this with
+        # Type=forking and can apparently restart forking daemons
+        # in some cases.
+        service.write("Restart=always\n")
+
+        # systemd default is to setuid/setgid for prestart entries.
+        # That's the opposite of what initscripts do. For now, just
+        # force initscripts behavior and do not bother with possible
+        # su invocactions.
+        if self['prestart']:
+            service.write("PermissionsStartOnly=true\n")
+
+        # Buildroot does not use targets. Just boot into the default multi-user.
+        service.write("\n")
+        service.write("[Install]\n")
+        service.write("WantedBy=%s\n" % 'multi-user.target')
+
+        Service.enable(filename, 'multi-user.target')
+
+    # systemd needs dependency specification to order entries,
+    # and just throwing "syslog network audit" on every single
+    # entry does not look like a good solution (though it would
+    # likely work).
+    #
+    # To simplify things a bit, and to allow possible use for
+    # non-systemd inits, allow using short-hand notation like
+    # "syslog network" instead of "syslog.target network.target".
+    #
+    # Non-suffixed entries in After make no sense, so there is no
+    # problem in mixing shorthands and raw unit names.
+
+    shorthand = {
+            'network': 'network.target',
+            'syslog': 'syslog.target',
+            'auditd': 'auditd.service' }
+
+    def after(self):
+        after = [ ]
+        for unit in self['after'].split():
+            if unit in self.shorthand:
+                unit = self.shorthand[unit]
+            after.append(unit)
+        return " ".join(after)
+
+    # Mimic current BR systemd installation routines and create
+    # relevant symlinks to make the service "enabled".
+    #
+    # XXX: this should be in support/init/finalize, not here.
+
+    def enable(filename, wantedby):
+        base = os.path.basename(filename)
+        link = "%s/%s.wants/%s" % (os.path.dirname(filename), wantedby, base)
+        ldir = os.path.dirname(link)
+        if os.path.islink(link):
+            os.unlink(link)
+        if not os.path.isdir(ldir):
+            os.makedirs(ldir)
+        os.symlink("../" + base, link)
+
+
+# ------------------------------------------------------------------------------
+
+if len(sys.argv) < 2:
+    die("Usage: support/init/install init-system target-dir file.run file.run ...")
+
+try:
+    init = {
+    # init-system: parser-class
+        'sysv': Initscript,
+        'systemd': Service
+    }[sys.argv[1]]
+except KeyError:
+    die("Unknown init system %s", sys.argv[1])
+
+try:
+    for f in sys.argv[3:]:
+        if f.endswith('.run'):
+            init(f).write(sys.argv[2])
+except Run.ParseError as e:
+    die("%s:%s: %s", *e.args)
+except Run.ConfigError as e:
+    die("%s: %s", *e.args)
diff --git a/system/Config.in b/system/Config.in
index 935f7a1..b654e39 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -107,6 +107,12 @@ config BR2_INIT_NONE
 
 endchoice
 
+config BR2_INIT
+	string
+	default "sysv" if BR2_INIT_SYSV || BR2_INIT_BUSYBOX
+	default "systemd" if BR2_INIT_SYSTEMD
+	default "none"
+
 choice
 	prompt "/dev management" if !BR2_INIT_SYSTEMD
 	default BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS
-- 
2.0.3
