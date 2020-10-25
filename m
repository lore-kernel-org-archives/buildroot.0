From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sun, 25 Oct 2020 23:24:56 +0300
Subject: [Buildroot] [PATCH v2 1/2] package/gpsd: bump version to 3.21
In-Reply-To: <20201025202457.1009025-1-geomatsi@gmail.com>
References: <20201025202457.1009025-1-geomatsi@gmail.com>
Message-ID: <20201025202457.1009025-2-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Olivier Dautricourt <olivier.dautricourt@orolia.com>

Update gpsd to latest release v3.21:
- bump version
- update checksums
- remove patch for v3.20: it is not needed for v3.21
- remove obsolete options and add them to Config.in.legacy

Signed-off-by: Olivier Dautricourt <olivier.dautricourt@orolia.com>
Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 Config.in.legacy                              |  20 +++
 ...s-during-gpsd-3.20-cross-compilation.patch | 148 ------------------
 package/gpsd/Config.in                        |  16 --
 package/gpsd/gpsd.hash                        |   4 +-
 package/gpsd/gpsd.mk                          |  11 +-
 5 files changed, 23 insertions(+), 176 deletions(-)
 delete mode 100644 package/gpsd/0001-Fix-errors-during-gpsd-3.20-cross-compilation.patch

diff --git a/Config.in.legacy b/Config.in.legacy
index 9d60cfea75..391b866ee8 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,26 @@ endif
 
 comment "Legacy options removed in 2020.11"
 
+config BR2_PACKAGE_GPSD_FIXED_PORT_SPEED
+	bool "compile with fixed serial port speed"
+	select BR2_LEGACY
+	help
+	  Since gpsd 3.20, GPSD_FIXED_PORT_SPEED is replaced
+	  by runtime option --speed.
+
+config BR2_PACKAGE_GPSD_RECONFIGURE
+	bool "allow gpsd to change device settings"
+	select BR2_LEGACY
+	help
+	  Since gpsd 3.21, GPSD_RECONFIGURE is replaced
+	  by runtime option --passive.
+
+config BR2_PACKAGE_GPSD_CONTROLSEND
+	bool "allow gpsctl/gpsmon to change device settings"
+	select BR2_LEGACY
+	help
+	  Option removed in gpsd 3.21
+
 config BR2_PACKAGE_LIBCROCO
 	bool "libcroco package was removed"
 	select BR2_LEGACY
diff --git a/package/gpsd/0001-Fix-errors-during-gpsd-3.20-cross-compilation.patch b/package/gpsd/0001-Fix-errors-during-gpsd-3.20-cross-compilation.patch
deleted file mode 100644
index 7ab863d4a3..0000000000
--- a/package/gpsd/0001-Fix-errors-during-gpsd-3.20-cross-compilation.patch
+++ /dev/null
@@ -1,148 +0,0 @@
-From 727c37ef78f2229998ac51942f5d11c754d0c6b9 Mon Sep 17 00:00:00 2001
-From: Robert Hancock <hancock@sedsystems.ca>
-Date: Mon, 13 Jul 2020 17:33:48 -0600
-Subject: [PATCH] Fix errors during gpsd 3.20 cross-compilation
-
-Adapt some post-3.20 changes to the gpsd SConstruct file from the
-gpsd master branch to fix issues when cross-compiling. Original
-commits did not cherry-pick cleanly onto 3.20 due to other
-upstream changes.
-
-Signed-off-by: Robert Hancock <hancock@sedsystems.ca>
----
- SConstruct | 81 ++++++++++++++++++++++--------------------------------
- 1 file changed, 33 insertions(+), 48 deletions(-)
-
-diff --git a/SConstruct b/SConstruct
-index 33e0ff326..93e8fcfea 100644
---- a/SConstruct
-+++ b/SConstruct
-@@ -386,13 +386,16 @@ env['SC_PYTHON'] = sys.executable  # Path to SCons Python
- # So we rely on MergeFlags/ParseFlags to do the right thing for us.
- env['STRIP'] = "strip"
- env['PKG_CONFIG'] = "pkg-config"
--for i in ["AR", "CC", "CXX", "LD",
--          "PKG_CONFIG", "STRIP", "TAR"]:
-+for i in ["AR",      # linker for static libs, usually "ar"
-+          "CC",
-+          "CXX",
-+          # "LD",    # scons does not use LD, usually "ld"
-+          "PKG_CONFIG",
-+          "SHLINK",  # linker for shared libs, usually "gcc" or "g++", NOT "ld"
-+          "STRIP",
-+          "TAR"]:
-     if i in os.environ:
--        j = i
--        if i == "LD":
--            i = "SHLINK"
--        env[i] = os.getenv(j)
-+        env[i] = os.getenv(i)
- for i in ["ARFLAGS", "CFLAGS", "CXXFLAGS", "LDFLAGS", "SHLINKFLAGS",
-           "CPPFLAGS", "CCFLAGS", "LINKFLAGS"]:
-     if i in os.environ:
-@@ -483,7 +486,7 @@ devenv = (("ADDR2LINE", "addr2line"),
-           ("GCCBUG", "gccbug"),
-           ("GCOV", "gcov"),
-           ("GPROF", "gprof"),
--          ("LD", "ld"),
-+          # ("LD", "ld"),     # scons does not use LD
-           ("NM", "nm"),
-           ("OBJCOPY", "objcopy"),
-           ("OBJDUMP", "objdump"),
-@@ -565,6 +568,22 @@ def CheckXsltproc(context):
-     return ret
- 
- 
-+def CheckTime_t(context):
-+    context.Message('Checking if sizeof(time_t) is 64 bits... ')
-+    ret = context.TryLink("""
-+        #include <time.h>
-+
-+        int main(int argc, char **argv) {
-+            static int test_array[1 - 2 * ((long int) sizeof(time_t) < 8 )];
-+            test_array[0] = 0;
-+            (void) argc; (void) argv;
-+            return 0;
-+        }
-+    """, '.c')
-+    context.Result(ret)
-+    return ret
-+
-+
- def CheckCompilerOption(context, option):
-     context.Message('Checking if compiler accepts %s... ' % (option,))
-     old_CFLAGS = context.env['CFLAGS'][:]  # Get a *copy* of the old list
-@@ -597,42 +616,6 @@ def CheckHeaderDefines(context, file, define):
-     return ret
- 
- 
--def CheckSizeOf(context, type):
--    """Check sizeof 'type'"""
--    context.Message('Checking size of ' + type + '... ')
--
--    program = """
--#include <stdlib.h>
--#include <stdio.h>
--
--/*
-- * The CheckSizeOf function does not have a way for the caller to
-- * specify header files to be included to provide the type being
-- * checked.  As a workaround until that is remedied, include the
-- * header required for time_t, which is the sole current use of this
-- * function.
-- */
--#include <time.h>
--
--int main() {
--    printf("%d", (int)sizeof(""" + type + """));
--    return 0;
--}
--"""
--
--    # compile it
--    ret = context.TryCompile(program, '.c')
--    if 0 == ret:
--        announce('ERROR: TryCompile failed\n')
--        # fall back to sizeof(time_t) is 8
--        return '8'
--
--    # run it
--    ret = context.TryRun(program, '.c')
--    context.Result(ret[0])
--    return ret[1]
--
--
- def CheckCompilerDefines(context, define):
-     context.Message('Checking if compiler supplies %s... ' % (define,))
-     ret = context.TryLink("""
-@@ -708,8 +691,8 @@ config = Configure(env, custom_tests={
-     'CheckCompilerOption': CheckCompilerOption,
-     'CheckHeaderDefines': CheckHeaderDefines,
-     'CheckPKG': CheckPKG,
--    'CheckSizeOf': CheckSizeOf,
-     'CheckXsltproc': CheckXsltproc,
-+    'CheckTime_t': CheckTime_t,
-     'GetPythonValue': GetPythonValue,
-     })
- 
-@@ -1043,11 +1026,13 @@ else:
-             confdefs.append("/* #undef HAVE_%s_H */\n"
-                             % hdr.replace("/", "_").upper())
- 
--    sizeof_time_t = config.CheckSizeOf("time_t")
--    confdefs.append("#define SIZEOF_TIME_T %s\n" % sizeof_time_t)
--    announce("sizeof(time_t) is %s" % sizeof_time_t)
--    if 4 >= int(sizeof_time_t):
-+    if 0 == config.CheckTime_t():
-         announce("WARNING: time_t is too small.  It will fail in 2038")
-+        sizeof_time_t = 4
-+    else:
-+        sizeof_time_t = 8
-+
-+    confdefs.append("#define SIZEOF_TIME_T %s\n" % sizeof_time_t)
- 
-     # check function after libraries, because some function require libraries
-     # for example clock_gettime() require librt on Linux glibc < 2.17
--- 
-2.18.4
-
diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index 3e13f1ba71..5dd57c34b8 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -60,14 +60,6 @@ config BR2_PACKAGE_GPSD_GROUP_VALUE
 	default "nobody"
 	depends on BR2_PACKAGE_GPSD_GROUP
 
-config BR2_PACKAGE_GPSD_FIXED_PORT_SPEED
-	bool "compile with fixed serial port speed"
-
-config BR2_PACKAGE_GPSD_FIXED_PORT_SPEED_VALUE
-	int "serial port speed"
-	default "9600"
-	depends on BR2_PACKAGE_GPSD_FIXED_PORT_SPEED
-
 config BR2_PACKAGE_GPSD_MAX_CLIENT
 	bool "compile with limited maximum clients"
 
@@ -84,14 +76,6 @@ config BR2_PACKAGE_GPSD_MAX_DEV_VALUE
 	default "2"
 	depends on BR2_PACKAGE_GPSD_MAX_DEV
 
-config BR2_PACKAGE_GPSD_RECONFIGURE
-	bool "allow gpsd to change device settings"
-	default y
-
-config BR2_PACKAGE_GPSD_CONTROLSEND
-	bool "allow gpsctl/gpsmon to change device settings"
-	default y
-
 config BR2_PACKAGE_GPSD_SQUELCH
 	bool "squelch gpsd_report and gpsd_hexdump to save cpu"
 
diff --git a/package/gpsd/gpsd.hash b/package/gpsd/gpsd.hash
index af53fc05bf..b91ab16e18 100644
--- a/package/gpsd/gpsd.hash
+++ b/package/gpsd/gpsd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	172a7805068eacb815a3c5225436fcb0be46e7e49a5001a94034eac43df85e50	gpsd-3.20.tar.gz
-sha256	13ba6fe5b2f41f03b854f9ac5f271e116d5ed55890cc20f5fe44dcfa0dc5958b	COPYING
+sha256	65504c3af8d3b0cce3c07405b8815d7730d2d2be2da7d28d275f1a9c57c6fe91	gpsd-3.21.tar.gz
+sha256	fdf339997bbca9eaf507476b82fbcac608fc39a3d89b86b51e16db4c9f933716	COPYING
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 57955b7895..62c4c611c3 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GPSD_VERSION = 3.20
+GPSD_VERSION = 3.21
 GPSD_SITE = http://download-mirror.savannah.gnu.org/releases/gpsd
 GPSD_LICENSE = BSD-2-Clause
 GPSD_LICENSE_FILES = COPYING
@@ -165,12 +165,6 @@ endif
 ifeq ($(BR2_PACKAGE_GPSD_SQUELCH),y)
 GPSD_SCONS_OPTS += squelch=yes
 endif
-ifneq ($(BR2_PACKAGE_GPSD_RECONFIGURE),y)
-GPSD_SCONS_OPTS += reconfigure=no
-endif
-ifneq ($(BR2_PACKAGE_GPSD_CONTROLSEND),y)
-GPSD_SCONS_OPTS += controlsend=no
-endif
 ifneq ($(BR2_PACKAGE_GPSD_OLDSTYLE),y)
 GPSD_SCONS_OPTS += oldstyle=no
 endif
@@ -186,9 +180,6 @@ endif
 ifeq ($(BR2_PACKAGE_GPSD_GROUP),y)
 GPSD_SCONS_OPTS += gpsd_group=$(BR2_PACKAGE_GPSD_GROUP_VALUE)
 endif
-ifeq ($(BR2_PACKAGE_GPSD_FIXED_PORT_SPEED),y)
-GPSD_SCONS_OPTS += fixed_port_speed=$(BR2_PACKAGE_GPSD_FIXED_PORT_SPEED_VALUE)
-endif
 ifeq ($(BR2_PACKAGE_GPSD_MAX_CLIENT),y)
 GPSD_SCONS_OPTS += max_clients=$(BR2_PACKAGE_GPSD_MAX_CLIENT_VALUE)
 endif
-- 
2.29.1
