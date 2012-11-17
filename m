From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Nov 2012 23:24:04 +0100
Subject: [Buildroot] [PATCH 06/10] gsl: fix build on !i386 uClibc
In-Reply-To: <cover.1353191025.git.thomas.petazzoni@free-electrons.com>
References: <cover.1353191025.git.thomas.petazzoni@free-electrons.com>
Message-ID: <03dca9a70c465309e3295c0051d31fd932132cec.1353191025.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

uClibc pretends to implement <fenv.h> as it installs the header, but
in practice, it only implements the functions for i386. This makes gsl
unhappy as it detects fenv.h, but then cannot use the fenv functions.

Fixes:

  http://autobuild.buildroot.org/results/732cc07faeca2a9098dc5106e8f654eb1323451a/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gsl/gsl.mk |   13 +++++++++++++
 1 file changed, 13 insertions(+)

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
-- 
1.7.9.5
