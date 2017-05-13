From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 13 May 2017 10:27:36 +0200
Subject: [Buildroot] [PATCH] package/gpsd: do not interact with systemd on
	install
Message-ID: <20170513082736.22734-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When building on a systemd-based host for a systemd-based target, gpsd's
buildsystem will try to tell systemd to reload the its configuration and
recreate the entire dependency tree of services.

Of course, this can not work when run as a user:
    >>> gpsd 3.16 Installing to target
    ==== AUTHENTICATING FOR org.freedesktop.systemd1.reload-daemon ===
    Authentication is required to reload the systemd state.
    Authenticating as: root
    Password:

In fact, this does not even mean anything in cross-compilation.

Fortunately, upstream has already fixed their sin, so we backport it
(tweaked to apply onto 3.16).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>

---
Note: this was never observed in any of the autobuilders, even those
running on a systemd-based distro, because in this case stdin is
redirected and systemctl simply fails, but the construct is just to
ignore the failure, so the build proceeds; the issue only occurs when
there is an actual terminal to provide user input... :-/
---
 ...eract-with-systemctl-when-cross-compiling.patch | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/gpsd/0001-do-not-interact-with-systemctl-when-cross-compiling.patch

diff --git a/package/gpsd/0001-do-not-interact-with-systemctl-when-cross-compiling.patch b/package/gpsd/0001-do-not-interact-with-systemctl-when-cross-compiling.patch
new file mode 100644
index 0000000000..9e91a02ef3
--- /dev/null
+++ b/package/gpsd/0001-do-not-interact-with-systemctl-when-cross-compiling.patch
@@ -0,0 +1,41 @@
+From 777cb3737ae85b13642fff48eabb601c4d40f527 Mon Sep 17 00:00:00 2001
+From: James Knight <james.d.knight@live.com>
+Date: Tue, 16 Feb 2016 23:51:08 -0500
+Subject: [PATCH] do not interact with systemctl when cross-compiling
+
+The installation process for GPSd on a systemd environment will attempt
+to reload systemd's manager configuration (systemctl daemon-reload).
+This is to allow the system to take advantage of the newly installed
+GPSd services. When cross-compiling, the installation process should not
+attempt to interact with the build environment's systemd instance (if
+any). The following change checks if the build is not cross compiling
+(via 'not env["sysroot"]') before attempting to do a systemd reload.
+
+Signed-off-by: James Knight <james.d.knight@live.com>
+[yann.morin.1998 at free.fr: tweak to apply on 3.16]
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+ SConstruct | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/SConstruct b/SConstruct
+index c3bfd0d1..97c1b3a9 100644
+--- a/SConstruct
++++ b/SConstruct
+@@ -1909,10 +1909,12 @@ udev_install = Utility('udev-install', 'install', [
+     ] + hotplug_wrapper_install)
+ 
+ if env['systemd']:
++    env.Requires(udev_install, systemd_install)
++
++if env['systemd'] and not env["sysroot"]:
+     systemctl_daemon_reload = Utility('systemctl-daemon-reload', '', [ 'systemctl daemon-reload || true'])
+     env.AlwaysBuild(systemctl_daemon_reload)
+     env.Precious(systemctl_daemon_reload)
+-    env.Requires(udev_install, systemd_install)
+     env.Requires(systemctl_daemon_reload, systemd_install)
+     env.Requires(udev_install, systemctl_daemon_reload)
+ 
+-- 
+2.11.0
+
-- 
2.11.0
