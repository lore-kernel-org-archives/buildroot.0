From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Aug 2019 00:48:26 +0200
Subject: [Buildroot] [git commit] package/libnss: use correct CFLAGS and
 LDFLAGS
Message-ID: <20190731224547.0CF60883AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5e787b001422b4bee24c8ffb7450da38fcc531a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently libnss is configured with BUILD_OPT=1 and due to that that
it doesn't take into account Buildroot TARGET_CFLAGS nor
TARGET_LDFLAGS resulting in pre-chosen optimizations and debugging
symbols being used.

We can't pass TARGET_CFLAGS through CFLAGS or similar otherwise other
internal libnss one will be overwritten (i.e. -fPIC), so we prefer to
append TARGET_CFLAGS at the end of Linux.mk as well as TARGET_LDFLAGS
according to internal libnss Makefile system's names. And obviously
remove BUILD_OPT=1 from BUILD_VARS.

This reveals hidden bugs when building with -Os due to bogus
uninitialized warnings from gcc turned into errors because of -Werror,
so we explicitly pass NSS_ENABLE_WERROR=0 to avoid the use of -Werror.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
[Thomas: drop the libnss patches, and pass NSS_ENABLE_WERROR instead]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libnss/libnss.mk | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 89d614fe1c..d72ae94c5b 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -13,6 +13,14 @@ LIBNSS_DEPENDENCIES = libnspr sqlite zlib
 LIBNSS_LICENSE = MPL-2.0
 LIBNSS_LICENSE_FILES = nss/COPYING
 
+# Need to pass down TARGET_CFLAGS and TARGET_LDFLAGS
+define LIBNSS_FIXUP_LINUX_MK
+	echo 'OS_CFLAGS += $(TARGET_CFLAGS)' >> $(@D)/nss/coreconf/Linux.mk
+	echo 'LDFLAGS += $(TARGET_LDFLAGS)' >> $(@D)/nss/coreconf/Linux.mk
+endef
+
+LIBNSS_PRE_CONFIGURE_HOOKS += LIBNSS_FIXUP_LINUX_MK
+
 # --gc-sections triggers binutils ld segfault
 # https://sourceware.org/bugzilla/show_bug.cgi?id=21180
 ifeq ($(BR2_microblaze),y)
@@ -33,7 +41,6 @@ LIBNSS_BUILD_VARS = \
 	MOZILLA_CLIENT=1 \
 	NSPR_INCLUDE_DIR=$(STAGING_DIR)/usr/include/nspr \
 	NSPR_LIB_DIR=$(STAGING_DIR)/usr/lib \
-	BUILD_OPT=1 \
 	NS_USE_GCC=1 \
 	NSS_DISABLE_GTESTS=1 \
 	NSS_USE_SYSTEM_SQLITE=1 \
@@ -41,7 +48,8 @@ LIBNSS_BUILD_VARS = \
 	NATIVE_CC="$(HOSTCC)" \
 	OS_ARCH="Linux" \
 	OS_RELEASE="2.6" \
-	OS_TEST="$(LIBNSS_ARCH)"
+	OS_TEST="$(LIBNSS_ARCH)" \
+	NSS_ENABLE_WERROR=0
 
 # #pragma usage needs gcc >= 4.8
 # See https://bugzilla.mozilla.org/show_bug.cgi?id=1226179
@@ -102,13 +110,13 @@ HOST_LIBNSS_BUILD_VARS = \
 	MOZILLA_CLIENT=1 \
 	NSPR_INCLUDE_DIR=$(HOST_DIR)/include/nspr \
 	NSPR_LIB_DIR=$(HOST_DIR)/lib \
-	BUILD_OPT=1 \
 	NS_USE_GCC=1 \
 	NSS_DISABLE_GTESTS=1 \
 	NSS_USE_SYSTEM_SQLITE=1 \
 	SQLITE_INCLUDE_DIR=$(HOST_DIR)/include \
 	ZLIB_INCLUDE_DIR=$(HOST_DIR)/include \
-	NSS_ENABLE_ECC=1
+	NSS_ENABLE_ECC=1 \
+	NSS_ENABLE_WERROR=0
 
 HOST_LIBNSS_DEPENDENCIES = host-libnspr host-sqlite host-zlib
 
