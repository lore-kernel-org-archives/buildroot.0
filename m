From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 22 May 2019 15:59:03 +0200
Subject: [Buildroot] [PATCH v2 4/7] package/libnss: re-enable package if
 BUG_85862 is present
In-Reply-To: <20190522135906.30796-1-giulio.benetti@micronovasrl.com>
References: <10430096-81de-792a-8b49-c59ed5e9de2e@micronovasrl.com>
 <20190522135906.30796-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190522135906.30796-5-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With Microblaze Gcc version < 7.x build hangs on compiling first files.
This is due to bug 85862:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85862
This package has been excluded from building if BUG_85862 is present.
Bug shows up building libnss with optimization.

In config.mk append BUILD_OPT=1 only if
BR2_TOOLCHAIN_HAS_GCC_BUG_85862=y otherwise don't declare BUILD_OPT
forcing build system to not emit -O* flag.
Then remove 'depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_85862' and its
comment if not available from Config.in

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/libnss/Config.in | 4 ----
 package/libnss/libnss.mk | 8 ++++++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libnss/Config.in b/package/libnss/Config.in
index 34ddb91dfa..599c9a6536 100644
--- a/package/libnss/Config.in
+++ b/package/libnss/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_LIBNSS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnspr
 	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT # libnspr
 	depends on !BR2_STATIC_LIBS
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_85862
 	select BR2_PACKAGE_LIBNSPR
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_ZLIB
@@ -19,6 +18,3 @@ config BR2_PACKAGE_LIBNSS
 comment "libnss needs a toolchain w/ threads, dynamic library"
 	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
-
-comment "libnss needs a toolchain not affected by GCC bug 85862"
-	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_85862
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 73c9b08fd2..1cee9eecb3 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -13,6 +13,7 @@ LIBNSS_DEPENDENCIES = libnspr sqlite zlib
 LIBNSS_LICENSE = MPL-2.0
 LIBNSS_LICENSE_FILES = nss/COPYING
 
+
 # --gc-sections triggers binutils ld segfault
 # https://sourceware.org/bugzilla/show_bug.cgi?id=21180
 ifeq ($(BR2_microblaze),y)
@@ -33,7 +34,6 @@ LIBNSS_BUILD_VARS = \
 	MOZILLA_CLIENT=1 \
 	NSPR_INCLUDE_DIR=$(STAGING_DIR)/usr/include/nspr \
 	NSPR_LIB_DIR=$(STAGING_DIR)/usr/lib \
-	BUILD_OPT=1 \
 	NS_USE_GCC=1 \
 	NSS_DISABLE_GTESTS=1 \
 	NSS_USE_SYSTEM_SQLITE=1 \
@@ -43,6 +43,10 @@ LIBNSS_BUILD_VARS = \
 	OS_RELEASE="2.6" \
 	OS_TEST="$(LIBNSS_ARCH)"
 
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85862),)
+LIBNSS_BUILD_VARS += BUILD_OPT=1
+endif
+
 # #pragma usage needs gcc >= 4.8
 # See https://bugzilla.mozilla.org/show_bug.cgi?id=1226179
 ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_8),)
@@ -62,7 +66,7 @@ define LIBNSS_BUILD_CMDS
 		SOURCE_MD_DIR=$(@D)/$(LIBNSS_DISTDIR) \
 		DIST=$(@D)/$(LIBNSS_DISTDIR) \
 		CHECKLOC= \
-		$(LIBNSS_BUILD_VARS)
+		$(LIBNSS_BUILD_VARS) CFLAGS="$(LIBNSS_CFLAGS)"
 	$(TARGET_CONFIGURE_OPTS) $(MAKE1) -C $(@D)/nss lib/dbm all \
 		SOURCE_MD_DIR=$(@D)/$(LIBNSS_DISTDIR) \
 		DIST=$(@D)/$(LIBNSS_DISTDIR) \
-- 
2.17.1
