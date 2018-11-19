From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Nov 2018 15:55:41 +0100
Subject: [Buildroot] [PATCH v2 1/3] glibc: ensure BR2_MAKE is also used for
 subdirs
Message-ID: <20181119145544.3466-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The configure script contains logic to figure out what make program to
invoke for subdirectories (trying gnumake, gmake, make).  Explicitly force
it to use our BR2_MAKE to ensure the right make version is used.

As GLIBC_CONF_ENV is only initialized below, move this section below it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
v2:
- Fix CONV/CONF typo, move section below GLIBC_CONF_ENV initialization
 package/glibc/glibc.mk | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 708c22f723..762c040688 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -31,10 +31,6 @@ GLIBC_ADD_TOOLCHAIN_DEPENDENCY = NO
 GLIBC_DEPENDENCIES = host-gcc-initial linux-headers host-bison host-gawk \
 	$(BR2_MAKE_HOST_DEPENDENCY)
 
-# glibc requires make >= 4.0 since 2.28 release.
-# https://www.sourceware.org/ml/libc-alpha/2018-08/msg00003.html
-GLIBC_MAKE = $(BR2_MAKE)
-
 GLIBC_SUBDIR = build
 
 GLIBC_INSTALL_STAGING = YES
@@ -82,6 +78,11 @@ ifeq ($(BR2_riscv),y)
 GLIBC_CONF_ENV += libc_cv_slibdir=/lib64 libc_cv_rtlddir=/lib
 endif
 
+# glibc requires make >= 4.0 since 2.28 release.
+# https://www.sourceware.org/ml/libc-alpha/2018-08/msg00003.html
+GLIBC_MAKE = $(BR2_MAKE)
+GLIBC_CONF_ENV += ac_cv_prog_MAKE="$(BR2_MAKE)"
+
 # Even though we use the autotools-package infrastructure, we have to
 # override the default configure commands for several reasons:
 #
-- 
2.11.0
