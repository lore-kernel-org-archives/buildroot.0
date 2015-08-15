From: Alex Suykov <alex.suykov@gmail.com>
Date: Sat, 15 Aug 2015 19:15:06 +0300
Subject: [Buildroot] [PATCH] clapack: musl patches
Message-ID: <20150815161506.GA28405@vostro>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/a94f097193cd5444dee5cd9df9d544ce736a7e7e/
http://autobuild.buildroot.net/results/036014e492f7caf793b92a9822ab6a0b1a54f2e8/

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 package/clapack/0006-remove-uninit-f2c.patch | 24 ++++++++++++++++++++++++
 package/clapack/0007-off64-t.patch           | 16 ++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 package/clapack/0006-remove-uninit-f2c.patch
 create mode 100644 package/clapack/0007-off64-t.patch

diff --git a/package/clapack/0006-remove-uninit-f2c.patch b/package/clapack/0006-remove-uninit-f2c.patch
new file mode 100644
index 0000000..251c702
--- /dev/null
+++ b/package/clapack/0006-remove-uninit-f2c.patch
@@ -0,0 +1,24 @@
+uninit.c includes glibc-specific <fpu_control.h> not provided by musl.
+Somewhat portable replacement is <fenv.h>, which is available in musl
+but requires non-trivial changes to uninit.c.
+
+f2c uses _uninit_f2c() from uninit.c to implement its -trapuv option,
+pre-initializiing floating-point variables to NaN and asking FPU to send
+SIGFPE whenever NaN value is encountered.
+
+clapack source has already been run through f2c without -trapuv,
+so uninit.c code is not used anywhere and can be safely excluded.
+
+Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
+
+--- a/F2CLIBS/libf2c/CMakeLists.txt
++++ b/F2CLIBS/libf2c/CMakeLists.txt
+@@ -1,7 +1,7 @@
+ set(MISC 
+   f77vers.c i77vers.c main.c s_rnge.c abort_.c exit_.c getarg_.c iargc_.c
+   getenv_.c signal_.c s_stop.c s_paus.c system_.c cabs.c ctype.c
+-  derf_.c derfc_.c erf_.c erfc_.c sig_die.c uninit.c)
++  derf_.c derfc_.c erf_.c erfc_.c sig_die.c)
+ set(POW pow_ci.c pow_dd.c pow_di.c pow_hh.c pow_ii.c pow_ri.c pow_zi.c pow_zz.c)
+ set(CX 	c_abs.c c_cos.c c_div.c c_exp.c c_log.c c_sin.c c_sqrt.c)
+ set(DCX	z_abs.c z_cos.c z_div.c z_exp.c z_log.c z_sin.c z_sqrt.c)
diff --git a/package/clapack/0007-off64-t.patch b/package/clapack/0007-off64-t.patch
new file mode 100644
index 0000000..bf66d3c
--- /dev/null
+++ b/package/clapack/0007-off64-t.patch
@@ -0,0 +1,16 @@
+musl only provides off64_t, not __off64_t.
+glibc and uclibc have both defined.
+
+Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
+
+--- a/F2CLIBS/libf2c/sysdep1.h
++++ b/F2CLIBS/libf2c/sysdep1.h
+@@ -10,7 +10,7 @@
+ 
+ #ifdef __linux__
+ #define USE_LARGEFILE
+-#define OFF_T __off64_t
++#define OFF_T off64_t
+ #endif
+ 
+ #ifdef _AIX43
-- 
2.0.3
