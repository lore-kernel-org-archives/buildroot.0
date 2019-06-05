From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed,  5 Jun 2019 14:13:35 +0200
Subject: [Buildroot] [PATCH 1/2] package/libnss: use correct CFLAGS and
 LDFLAGS
In-Reply-To: <20190524231547.35975ecf@windsurf>
References: <20190524231547.35975ecf@windsurf>
Message-ID: <20190605121336.2512-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Actually libnss is configure with BUILD_OPT=1 that doesn't take into
account TARGET_CFLAGS nor TARGET_LDFLAGS resulting in pre-chosen
optimizations and debugging symbols.

Can't pass TARGET_CFLAGS through CFLAGS or similar otherwise other
iternal libnss will be overwritten(i.e. -fPIC), so prefer to append
TARGET_CFLAGS at the end of Linux.mk as well as TARGET_LDFLAGS according
to internal libnss Makefile system's names. And obviously remove
BUILD_OPT=1 from BUILD_VARS.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/libnss/libnss.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 89d614fe1c..484c79e9da 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -13,6 +13,14 @@ LIBNSS_DEPENDENCIES = libnspr sqlite zlib
 LIBNSS_LICENSE = MPL-2.0
 LIBNSS_LICENSE_FILES = nss/COPYING
 
+# Need to pass down TARGET_CFLAGS and TARGET_LDFLAGS
+define LIBNSS_FIXUP_LINUX_MK
+	echo 'OS_CFLAGS += ${TARGET_CFLAGS}' >> $(@D)/nss/coreconf/Linux.mk
+	echo 'LDFLAGS += ${TARGET_LDFLAGS}' >> $(@D)/nss/coreconf/Linux.mk
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
@@ -102,7 +109,6 @@ HOST_LIBNSS_BUILD_VARS = \
 	MOZILLA_CLIENT=1 \
 	NSPR_INCLUDE_DIR=$(HOST_DIR)/include/nspr \
 	NSPR_LIB_DIR=$(HOST_DIR)/lib \
-	BUILD_OPT=1 \
 	NS_USE_GCC=1 \
 	NSS_DISABLE_GTESTS=1 \
 	NSS_USE_SYSTEM_SQLITE=1 \
-- 
2.17.1
