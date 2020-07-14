From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 10:01:05 +0200
Subject: [Buildroot] [git commit] package/gpsd: bump version to 3.20
Message-ID: <20200714075826.BDEAB81909@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f32cf8e7527990b603d8c05b35be93b55d7a9f53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removes BR2_PACKAGE_GPSD_PPS config option, since PPS functionality is
no longer optional and always enabled in gpsd's SCons configuration.

Removed passing ntpshm=y to SCons since that feature is also no longer
optional.

Added a patch adapted from changes merged upstream post-3.20 to fix a
build failure during cross-compilation when checking sizeof(time_t)
and where shared libraries were being linked with ld rather than g++.

Signed-off-by: Robert Hancock <hancock@sedsystems.ca>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...errors-during-gpsd-3.20-cross-compilation.patch | 148 +++++++++++++++++++++
 package/gpsd/Config.in                             |   3 -
 package/gpsd/gpsd.hash                             |   2 +-
 package/gpsd/gpsd.mk                               |   6 +-
 4 files changed, 150 insertions(+), 9 deletions(-)

diff --git a/package/gpsd/0001-Fix-errors-during-gpsd-3.20-cross-compilation.patch b/package/gpsd/0001-Fix-errors-during-gpsd-3.20-cross-compilation.patch
new file mode 100644
index 0000000000..7ab863d4a3
--- /dev/null
+++ b/package/gpsd/0001-Fix-errors-during-gpsd-3.20-cross-compilation.patch
@@ -0,0 +1,148 @@
+From 727c37ef78f2229998ac51942f5d11c754d0c6b9 Mon Sep 17 00:00:00 2001
+From: Robert Hancock <hancock@sedsystems.ca>
+Date: Mon, 13 Jul 2020 17:33:48 -0600
+Subject: [PATCH] Fix errors during gpsd 3.20 cross-compilation
+
+Adapt some post-3.20 changes to the gpsd SConstruct file from the
+gpsd master branch to fix issues when cross-compiling. Original
+commits did not cherry-pick cleanly onto 3.20 due to other
+upstream changes.
+
+Signed-off-by: Robert Hancock <hancock@sedsystems.ca>
+---
+ SConstruct | 81 ++++++++++++++++++++++--------------------------------
+ 1 file changed, 33 insertions(+), 48 deletions(-)
+
+diff --git a/SConstruct b/SConstruct
+index 33e0ff326..93e8fcfea 100644
+--- a/SConstruct
++++ b/SConstruct
+@@ -386,13 +386,16 @@ env['SC_PYTHON'] = sys.executable  # Path to SCons Python
+ # So we rely on MergeFlags/ParseFlags to do the right thing for us.
+ env['STRIP'] = "strip"
+ env['PKG_CONFIG'] = "pkg-config"
+-for i in ["AR", "CC", "CXX", "LD",
+-          "PKG_CONFIG", "STRIP", "TAR"]:
++for i in ["AR",      # linker for static libs, usually "ar"
++          "CC",
++          "CXX",
++          # "LD",    # scons does not use LD, usually "ld"
++          "PKG_CONFIG",
++          "SHLINK",  # linker for shared libs, usually "gcc" or "g++", NOT "ld"
++          "STRIP",
++          "TAR"]:
+     if i in os.environ:
+-        j = i
+-        if i == "LD":
+-            i = "SHLINK"
+-        env[i] = os.getenv(j)
++        env[i] = os.getenv(i)
+ for i in ["ARFLAGS", "CFLAGS", "CXXFLAGS", "LDFLAGS", "SHLINKFLAGS",
+           "CPPFLAGS", "CCFLAGS", "LINKFLAGS"]:
+     if i in os.environ:
+@@ -483,7 +486,7 @@ devenv = (("ADDR2LINE", "addr2line"),
+           ("GCCBUG", "gccbug"),
+           ("GCOV", "gcov"),
+           ("GPROF", "gprof"),
+-          ("LD", "ld"),
++          # ("LD", "ld"),     # scons does not use LD
+           ("NM", "nm"),
+           ("OBJCOPY", "objcopy"),
+           ("OBJDUMP", "objdump"),
+@@ -565,6 +568,22 @@ def CheckXsltproc(context):
+     return ret
+ 
+ 
++def CheckTime_t(context):
++    context.Message('Checking if sizeof(time_t) is 64 bits... ')
++    ret = context.TryLink("""
++        #include <time.h>
++
++        int main(int argc, char **argv) {
++            static int test_array[1 - 2 * ((long int) sizeof(time_t) < 8 )];
++            test_array[0] = 0;
++            (void) argc; (void) argv;
++            return 0;
++        }
++    """, '.c')
++    context.Result(ret)
++    return ret
++
++
+ def CheckCompilerOption(context, option):
+     context.Message('Checking if compiler accepts %s... ' % (option,))
+     old_CFLAGS = context.env['CFLAGS'][:]  # Get a *copy* of the old list
+@@ -597,42 +616,6 @@ def CheckHeaderDefines(context, file, define):
+     return ret
+ 
+ 
+-def CheckSizeOf(context, type):
+-    """Check sizeof 'type'"""
+-    context.Message('Checking size of ' + type + '... ')
+-
+-    program = """
+-#include <stdlib.h>
+-#include <stdio.h>
+-
+-/*
+- * The CheckSizeOf function does not have a way for the caller to
+- * specify header files to be included to provide the type being
+- * checked.  As a workaround until that is remedied, include the
+- * header required for time_t, which is the sole current use of this
+- * function.
+- */
+-#include <time.h>
+-
+-int main() {
+-    printf("%d", (int)sizeof(""" + type + """));
+-    return 0;
+-}
+-"""
+-
+-    # compile it
+-    ret = context.TryCompile(program, '.c')
+-    if 0 == ret:
+-        announce('ERROR: TryCompile failed\n')
+-        # fall back to sizeof(time_t) is 8
+-        return '8'
+-
+-    # run it
+-    ret = context.TryRun(program, '.c')
+-    context.Result(ret[0])
+-    return ret[1]
+-
+-
+ def CheckCompilerDefines(context, define):
+     context.Message('Checking if compiler supplies %s... ' % (define,))
+     ret = context.TryLink("""
+@@ -708,8 +691,8 @@ config = Configure(env, custom_tests={
+     'CheckCompilerOption': CheckCompilerOption,
+     'CheckHeaderDefines': CheckHeaderDefines,
+     'CheckPKG': CheckPKG,
+-    'CheckSizeOf': CheckSizeOf,
+     'CheckXsltproc': CheckXsltproc,
++    'CheckTime_t': CheckTime_t,
+     'GetPythonValue': GetPythonValue,
+     })
+ 
+@@ -1043,11 +1026,13 @@ else:
+             confdefs.append("/* #undef HAVE_%s_H */\n"
+                             % hdr.replace("/", "_").upper())
+ 
+-    sizeof_time_t = config.CheckSizeOf("time_t")
+-    confdefs.append("#define SIZEOF_TIME_T %s\n" % sizeof_time_t)
+-    announce("sizeof(time_t) is %s" % sizeof_time_t)
+-    if 4 >= int(sizeof_time_t):
++    if 0 == config.CheckTime_t():
+         announce("WARNING: time_t is too small.  It will fail in 2038")
++        sizeof_time_t = 4
++    else:
++        sizeof_time_t = 8
++
++    confdefs.append("#define SIZEOF_TIME_T %s\n" % sizeof_time_t)
+ 
+     # check function after libraries, because some function require libraries
+     # for example clock_gettime() require librt on Linux glibc < 2.17
+-- 
+2.18.4
+
diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index ea0dea3ba6..3e13f1ba71 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -44,9 +44,6 @@ config BR2_PACKAGE_GPSD_PROFILING
 comment "profiling support not available with uClibc-based toolchain"
 	depends on !BR2_TOOLCHAIN_USES_GLIBC
 
-config BR2_PACKAGE_GPSD_PPS
-	bool "PPS time syncing support"
-
 config BR2_PACKAGE_GPSD_USER
 	bool "GPSD privilege revocation user"
 
diff --git a/package/gpsd/gpsd.hash b/package/gpsd/gpsd.hash
index 40f2b7c990..af53fc05bf 100644
--- a/package/gpsd/gpsd.hash
+++ b/package/gpsd/gpsd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	27dd24d45b2ac69baab7933da2bf6ae5fb0be90130f67e753c110a3477155f39	gpsd-3.19.tar.gz
+sha256	172a7805068eacb815a3c5225436fcb0be46e7e49a5001a94034eac43df85e50	gpsd-3.20.tar.gz
 sha256	13ba6fe5b2f41f03b854f9ac5f271e116d5ed55890cc20f5fe44dcfa0dc5958b	COPYING
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 96176fb187..57955b7895 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GPSD_VERSION = 3.19
+GPSD_VERSION = 3.20
 GPSD_SITE = http://download-mirror.savannah.gnu.org/releases/gpsd
 GPSD_LICENSE = BSD-2-Clause
 GPSD_LICENSE_FILES = COPYING
@@ -25,7 +25,6 @@ GPSD_SCONS_OPTS = \
 	strip=no \
 	python=no \
 	qt=no \
-	ntpshm=yes \
 	systemd=$(if $(BR2_INIT_SYSTEMD),yes,no)
 
 ifeq ($(BR2_PACKAGE_NCURSES),y)
@@ -163,9 +162,6 @@ GPSD_SCONS_OPTS += ublox=no
 endif
 
 # Features
-ifneq ($(BR2_PACKAGE_GPSD_PPS),y)
-GPSD_SCONS_OPTS += pps=no
-endif
 ifeq ($(BR2_PACKAGE_GPSD_SQUELCH),y)
 GPSD_SCONS_OPTS += squelch=yes
 endif
