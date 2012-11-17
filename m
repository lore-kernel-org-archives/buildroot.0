From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 17 Nov 2012 23:41:58 +0100
Subject: [Buildroot] [git commit] gsl: fix build on !i386 uClibc
Message-ID: <20121117225526.709679A081@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7603f9d38af9d950686319d0ded621e82f4f1694
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

uClibc pretends to implement <fenv.h> as it installs the header, but
in practice, it only implements the functions for i386. This makes gsl
unhappy as it detects fenv.h, but then cannot use the fenv functions.

Fixes:

  http://autobuild.buildroot.org/results/732cc07faeca2a9098dc5106e8f654eb1323451a/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gsl/gsl.mk |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/package/gsl/gsl.mk b/package/gsl/gsl.mk
index 7196859..6591591 100644
--- a/package/gsl/gsl.mk
+++ b/package/gsl/gsl.mk
@@ -10,4 +10,17 @@ GSL_INSTALL_STAGING = YES
 GSL_LICENSE = GPLv3
 GSL_LICENSE_FILES = COPYING
 
+# uClibc pretends to have fenv support as it installs <fenv.h>, but in
+# practice, it only implements it for i386. Problem reported upstream
+# at: http://lists.busybox.net/pipermail/uclibc/2012-October/047067.html.
+# So we tell gsl that fenv related functions are not available in this
+# case.
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)$(BR2_TOOLCHAIN_CTNG_uClibc),y)
+ifneq ($(BR2_i386),y)
+GSL_CONF_ENV = \
+       ac_cv_have_decl_feenableexcept=no \
+       ac_cv_have_decl_fesettrapenable=no
+endif
+endif
+
 $(eval $(autotools-package))
