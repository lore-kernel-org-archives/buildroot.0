From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Jul 2012 20:49:50 +0200
Subject: [Buildroot] [PATCH 3/3] gpsd: remove patch to handle
	ncurses5-config custom location
In-Reply-To: <1343328590-1803-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1343328590-1803-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1343328590-1803-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that ncurses has been bumped to 5.9, it installs .pc files for
pkg-config, which allows gpsd to find it properly without the need to
specify a custom location for ncurses5-config.

Since gpsd now uses pkg-config to find the ncurses library, we also
add host-pkg-config in the dependencies.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../gpsd/gpsd-02-sconstruct-disable-rpath.patch    |   17 ++++++++
 .../gpsd-02-sconstruct-ncurses-config-path.patch   |   44 --------------------
 .../gpsd/gpsd-03-sconstruct-disable-rpath.patch    |   17 --------
 package/gpsd/gpsd.mk                               |    3 +-
 4 files changed, 18 insertions(+), 63 deletions(-)
 create mode 100644 package/gpsd/gpsd-02-sconstruct-disable-rpath.patch
 delete mode 100644 package/gpsd/gpsd-02-sconstruct-ncurses-config-path.patch
 delete mode 100644 package/gpsd/gpsd-03-sconstruct-disable-rpath.patch

diff --git a/package/gpsd/gpsd-02-sconstruct-disable-rpath.patch b/package/gpsd/gpsd-02-sconstruct-disable-rpath.patch
new file mode 100644
index 0000000..5476450
--- /dev/null
+++ b/package/gpsd/gpsd-02-sconstruct-disable-rpath.patch
@@ -0,0 +1,17 @@
+Disable addition of RPATH to the generated libraries
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/SConstruct
+===================================================================
+--- a/SConstruct
++++ b/SConstruct
+@@ -273,8 +273,6 @@
+     env.Prepend(LIBPATH=[installdir('libdir')])
+ else:
+     env.Prepend(LIBPATH=[env["sysroot"] + installdir('libdir')])
+-if env["shared"]:
+-    env.Prepend(RPATH=[installdir('libdir')])
+ 
+ # Give deheader a way to set compiler flags
+ if 'MORECFLAGS' in os.environ:
diff --git a/package/gpsd/gpsd-02-sconstruct-ncurses-config-path.patch b/package/gpsd/gpsd-02-sconstruct-ncurses-config-path.patch
deleted file mode 100644
index 5c440bf..0000000
--- a/package/gpsd/gpsd-02-sconstruct-ncurses-config-path.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-Add option to specify the path to ncurses5-config
-
-By default, gpsd's SConstruct looks in the PATH to find
-ncurses5-config, which means that it finds our HOST_DIR
-ncurses5-config. We add an option that allows to specify a custom path
-to the ncurses5-config script.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/SConstruct
-===================================================================
---- a/SConstruct
-+++ b/SConstruct
-@@ -172,6 +172,7 @@
-     ("fixed_stop_bits",     0,             "fixed serial port stop bits"),
-     ("target",              "",            "cross-development target"),
-     ("sysroot",             "",            "cross-development system root"),
-+    ("ncurses_config",      "",            "ncurses5-config path"),
-     )
- for (name, default, help) in nonboolopts:
-     opts.Add(name, help, default)
-@@ -447,6 +448,11 @@
- else:
-     pkg_config = lambda pkg: ['!%s --cflags --libs --static %s' %(env['PKG_CONFIG'], pkg, )]
- 
-+if env['ncurses_config']:
-+    ncurses_config = env['ncurses_config']
-+else:
-+    ncurses_config = "ncurses5-config"
-+
- # The actual distinction here is whether the platform has ncurses in the
- # base system or not. If it does, pkg-config is not likely to tell us
- # anything useful. FreeBSD does, Linux doesn't. Most likely other BSDs
-@@ -455,8 +461,8 @@
- if env['ncurses']:
-     if config.CheckPKG('ncurses'):
-         ncurseslibs = pkg_config('ncurses')
--    elif config.CheckExecutable('ncurses5-config --version', 'ncurses5-config'):
--        ncurseslibs = ['!ncurses5-config --libs --cflags']
-+    elif config.CheckExecutable('%s --version' % ncurses_config, 'ncurses5-config'):
-+        ncurseslibs = ['!%s --libs --cflags' % ncurses_config]
-     elif sys.platform.startswith('freebsd'):
-         ncurseslibs= [ '-lncurses' ]
-     elif sys.platform.startswith('openbsd'):
diff --git a/package/gpsd/gpsd-03-sconstruct-disable-rpath.patch b/package/gpsd/gpsd-03-sconstruct-disable-rpath.patch
deleted file mode 100644
index 5476450..0000000
--- a/package/gpsd/gpsd-03-sconstruct-disable-rpath.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Disable addition of RPATH to the generated libraries
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/SConstruct
-===================================================================
---- a/SConstruct
-+++ b/SConstruct
-@@ -273,8 +273,6 @@
-     env.Prepend(LIBPATH=[installdir('libdir')])
- else:
-     env.Prepend(LIBPATH=[env["sysroot"] + installdir('libdir')])
--if env["shared"]:
--    env.Prepend(RPATH=[installdir('libdir')])
- 
- # Give deheader a way to set compiler flags
- if 'MORECFLAGS' in os.environ:
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 190732f..4482a11 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -9,7 +9,7 @@ GPSD_LICENSE = BSD-3c
 GPSD_LICENSE_FILES = COPYING
 GPSD_INSTALL_STAGING = YES
 
-GPSD_DEPENDENCIES = host-scons
+GPSD_DEPENDENCIES = host-scons host-pkg-config
 
 GPSD_LDFLAGS = $(TARGET_LDFLAGS)
 
@@ -25,7 +25,6 @@ GPSD_SCONS_OPTS = \
 
 ifeq ($(BR2_PACKAGE_NCURSES),y)
 	GPSD_DEPENDENCIES += ncurses
-	GPSD_SCONS_OPTS += ncurses_config=$(STAGING_DIR)/usr/bin/ncurses5-config
 else
 	GPSD_SCONS_OPTS += ncurses=no
 endif
-- 
1.7.9.5
