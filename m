From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Aug 2015 13:08:45 +0200
Subject: [Buildroot] [PATCH] libpthsem: fix setjmp/longjmp detection
Message-ID: <1439982525-6788-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libpthsem has been affected since quite a while by build issues, but
occuring only on Nathaniel Roach's autobuilder. The failure message
is:

  error: #error "Unsupported Linux (g)libc version and/or platform"

This message comes from pth_mctx.c file, which implements five methods
for machine context initialization:

  VARIANT 1: THE STANDARDIZED SVR4/SUSv2 APPROACH
  VARIANT 2: THE SIGNAL STACK TRICK
  VARIANT 3: LINUX SPECIFIC JMP_BUF FIDDLING
  VARIANT 4: INTERACTIVE SPECIFIC JMP_BUF FIDDLING
  VARIANT 5: WIN32 SPECIFIC JMP_BUF FIDDLING

The "Unsupported (g)libc version and/or platform" only appears when
"VARIANT 4" is used, since VARIANT 4 only supports a very limited
number of platforms. So when building with Nathaniel's autobuilder,
VARIANT 4 is chosen.

However, when you build libpthsem on some other machine than
Nathaniel's autobuilder, VARIANT 2 is chosen, and works regardless of
the glibc version or architecture.

VARIANT 2 is chosen when:

      !PTH_MCTX_DSP(sjljlx)  &&\
      !PTH_MCTX_DSP(sjljisc) &&\
      !PTH_MCTX_DSP(sjljw32)

On both Nathaniel's autobuilder, and on a different machine, the
PTH_MCTX_MTH macro gives sjlj:

  #define PTH_MCTX_MTH_use PTH_MCTX_MTH_sjlj

However, on a "normal" machine, the PTH_MCTX_DSP macro gives ssjlj:

  #define PTH_MCTX_DSP_use PTH_MCTX_DSP_ssjlj

While on Nathaniel's autobuilder, it gives:

  #define PTH_MCTX_DSP_use PTH_MCTX_DSP_sjljlx

This explains why VARIANT 4 is being used on Nathaniel's autobuilder,
while VARIANT 2 is used when building on other platforms.

The decision of the value for PTH_MCTX_DSP is derived as follows in
configure.ac:

 AC_CHECK_SJLJ(sjlj=yes, sjlj=no, sjlj_type)
 [...]
 elif test ".$sjlj" = .yes; then
    mctx_mth=sjlj
    mctx_dsp=$sjlj_type
 [...]
 AC_DEFINE_UNQUOTED(PTH_MCTX_DSP_use, [PTH_MCTX_DSP_$mctx_dsp], [define for machine context dispatching])

So basically, the value of PTH_MCTX_DSP is $sjlj_type, as returned by
the AC_CHECK_SJLJ autoconf macro, implemented in
acinclude.m4. However, reading this macro is quite informative: it
does a number of tests that are not cross-compile
friendly. Especially, it looks at the kernel version with 'uname -r'
to decide whether the Linux system is braindead or not. If the system
runs a 2.2.x kernel or newer 2.x, or a 3.x kernel, everything is fine,
the system is not braindead, and sjlj_type is set to ssjlj. However,
if the build system runs a 4.x kernel, then it is considered as
braindead, and sjlj_type is set to sjljlx.

And indeed, Nathaniel's autobuilder is running a 4.x kernel, while all
other autobuilders run 2.x or 3.x kernels.

Since for all sane Linux systems, this AC_CHECK_SJLJ macro concludes
that the setjmp/longtmp type is ssjlj, this commit takes the simplest
route of forcing this value, skipping the broken detection.

Note that we're overriding ac_cv_check_sjlj instead of using the
--with-mctx-* options, since the latter do not work properly in the
context of Nathaniel's autobuilder, as the broken cross-compilation
tests continue to cause problems.

Fixes:

  http://autobuild.buildroot.org/results/3dd/3dd66d70c2e36f2d9fb0a0fe01bbdec009d55067/
  and many similar build failures

This patch has been tested by Nathaniel Roach in the context of his
autobuilder instance which was causing the original problem.

Tested-by: Nathaniel Roach <nroach44@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libpthsem/libpthsem.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/libpthsem/libpthsem.mk b/package/libpthsem/libpthsem.mk
index f9f6f71..b8a3d7d 100644
--- a/package/libpthsem/libpthsem.mk
+++ b/package/libpthsem/libpthsem.mk
@@ -13,6 +13,20 @@ LIBPTHSEM_AUTORECONF = YES
 LIBPTHSEM_INSTALL_STAGING = YES
 LIBPTHSEM_CONFIG_SCRIPTS = pthsem-config
 
+# Force the setjmp/longjmp detection, because the test being done in
+# the AC_CHECK_SJLJ macro is not cross-compilation safe: it checks the
+# running kernel with 'uname -r', and checks the C library version by
+# looking at /usr/include/features.h. In terms of kernel version, it
+# assumes any version later than 2.2.x is fine, except that it doesn't
+# recognize 4.x as a valid kernel version, recognizing such systems as
+# "braindead" and therefore falling back to the 'sjljlx' value for
+# ac_cv_check_sjlj. In terms of C library version, it wants
+# __GLIBC_MINOR to be at least 1. Since both conditions are true for
+# all Buildroot systems, we can simply force the setjmp/longjmp
+# detection to ssjlj.
+LIBPTHSEM_CONF_ENV += \
+	ac_cv_check_sjlj=ssjlj
+
 ifeq ($(BR2_PACKAGE_LIBPTHSEM_COMPAT),y)
 LIBPTHSEM_CONF_OPTS += --enable-compat
 LIBPTHSEM_CONFIG_SCRIPTS += pth-config
-- 
2.5.0
