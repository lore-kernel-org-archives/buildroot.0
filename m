From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Mon, 29 Jan 2018 08:57:05 +0100
Subject: [Buildroot] [PATCH] package/gpsd: upgrade to 3.17,
 remove obsolete patch
Message-ID: <1517212625-32760-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The upstream patch which disables the build-time systemctl call made it into
this release so removing it here. Also adding hash for the COPYING file.

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
---
 ...001-SConstruct-do-not-force-O2-by-default.patch | 29 +++++++++++++++
 ...eract-with-systemctl-when-cross-compiling.patch | 41 ----------------------
 ...002-SConstruct-do-not-force-O2-by-default.patch | 29 ---------------
 package/gpsd/gpsd.hash                             |  3 +-
 package/gpsd/gpsd.mk                               |  2 +-
 5 files changed, 32 insertions(+), 72 deletions(-)
 create mode 100644 package/gpsd/0001-SConstruct-do-not-force-O2-by-default.patch
 delete mode 100644 package/gpsd/0001-do-not-interact-with-systemctl-when-cross-compiling.patch
 delete mode 100644 package/gpsd/0002-SConstruct-do-not-force-O2-by-default.patch

diff --git a/package/gpsd/0001-SConstruct-do-not-force-O2-by-default.patch b/package/gpsd/0001-SConstruct-do-not-force-O2-by-default.patch
new file mode 100644
index 0000000..641afa3
--- /dev/null
+++ b/package/gpsd/0001-SConstruct-do-not-force-O2-by-default.patch
@@ -0,0 +1,29 @@
+From eb7cce5dbb53a64cf55ac0d9a7fa4dcbebd4b173 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Mon, 14 Aug 2017 23:24:38 +0200
+Subject: [PATCH] SConstruct: do not force -O2 by default
+
+-O2 can cause problems on some architectures, so do not force it by
+ default.
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+---
+ SConstruct | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/SConstruct b/SConstruct
+index fe444a2..93d91a4 100644
+--- a/SConstruct
++++ b/SConstruct
+@@ -330,8 +330,6 @@ if not 'CCFLAGS' in os.environ:
+     # Should we build with optimisation?
+     if env['debug'] or env['coveraging']:
+         env.Append(CCFLAGS=['-O0'])
+-    else:
+-        env.Append(CCFLAGS=['-O2'])
+ 
+ # Get a slight speedup by not doing automatic RCS and SCCS fetches.
+ env.SourceCode('.', None)
+-- 
+2.9.4
+
diff --git a/package/gpsd/0001-do-not-interact-with-systemctl-when-cross-compiling.patch b/package/gpsd/0001-do-not-interact-with-systemctl-when-cross-compiling.patch
deleted file mode 100644
index 9e91a02..0000000
--- a/package/gpsd/0001-do-not-interact-with-systemctl-when-cross-compiling.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 777cb3737ae85b13642fff48eabb601c4d40f527 Mon Sep 17 00:00:00 2001
-From: James Knight <james.d.knight@live.com>
-Date: Tue, 16 Feb 2016 23:51:08 -0500
-Subject: [PATCH] do not interact with systemctl when cross-compiling
-
-The installation process for GPSd on a systemd environment will attempt
-to reload systemd's manager configuration (systemctl daemon-reload).
-This is to allow the system to take advantage of the newly installed
-GPSd services. When cross-compiling, the installation process should not
-attempt to interact with the build environment's systemd instance (if
-any). The following change checks if the build is not cross compiling
-(via 'not env["sysroot"]') before attempting to do a systemd reload.
-
-Signed-off-by: James Knight <james.d.knight@live.com>
-[yann.morin.1998 at free.fr: tweak to apply on 3.16]
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
----
- SConstruct | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/SConstruct b/SConstruct
-index c3bfd0d1..97c1b3a9 100644
---- a/SConstruct
-+++ b/SConstruct
-@@ -1909,10 +1909,12 @@ udev_install = Utility('udev-install', 'install', [
-     ] + hotplug_wrapper_install)
- 
- if env['systemd']:
-+    env.Requires(udev_install, systemd_install)
-+
-+if env['systemd'] and not env["sysroot"]:
-     systemctl_daemon_reload = Utility('systemctl-daemon-reload', '', [ 'systemctl daemon-reload || true'])
-     env.AlwaysBuild(systemctl_daemon_reload)
-     env.Precious(systemctl_daemon_reload)
--    env.Requires(udev_install, systemd_install)
-     env.Requires(systemctl_daemon_reload, systemd_install)
-     env.Requires(udev_install, systemctl_daemon_reload)
- 
--- 
-2.11.0
-
diff --git a/package/gpsd/0002-SConstruct-do-not-force-O2-by-default.patch b/package/gpsd/0002-SConstruct-do-not-force-O2-by-default.patch
deleted file mode 100644
index 641afa3..0000000
--- a/package/gpsd/0002-SConstruct-do-not-force-O2-by-default.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From eb7cce5dbb53a64cf55ac0d9a7fa4dcbebd4b173 Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@openadk.org>
-Date: Mon, 14 Aug 2017 23:24:38 +0200
-Subject: [PATCH] SConstruct: do not force -O2 by default
-
--O2 can cause problems on some architectures, so do not force it by
- default.
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
----
- SConstruct | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/SConstruct b/SConstruct
-index fe444a2..93d91a4 100644
---- a/SConstruct
-+++ b/SConstruct
-@@ -330,8 +330,6 @@ if not 'CCFLAGS' in os.environ:
-     # Should we build with optimisation?
-     if env['debug'] or env['coveraging']:
-         env.Append(CCFLAGS=['-O0'])
--    else:
--        env.Append(CCFLAGS=['-O2'])
- 
- # Get a slight speedup by not doing automatic RCS and SCCS fetches.
- env.SourceCode('.', None)
--- 
-2.9.4
-
diff --git a/package/gpsd/gpsd.hash b/package/gpsd/gpsd.hash
index 3083af2..805c298 100644
--- a/package/gpsd/gpsd.hash
+++ b/package/gpsd/gpsd.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	03579af13a4d3fe0c5b79fa44b5f75c9f3cac6749357f1d99ce5d38c09bc2029	gpsd-3.16.tar.gz
+sha256	68e0dbecfb5831997f8b3d6ba48aed812eb465d8c0089420ab68f9ce4d85e77a	gpsd-3.17.tar.gz
+sha256	71ff85d18bf063954cfc4251678d0e772223e21f80febbd99d5524c90f73f832	COPYING
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 2b9c38a..e3fa20c 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GPSD_VERSION = 3.16
+GPSD_VERSION = 3.17
 GPSD_SITE = http://download-mirror.savannah.gnu.org/releases/gpsd
 GPSD_LICENSE = BSD-3-Clause
 GPSD_LICENSE_FILES = COPYING
-- 
2.7.4
