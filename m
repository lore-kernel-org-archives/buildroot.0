From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed,  5 Jun 2019 14:13:36 +0200
Subject: [Buildroot] [PATCH 2/2] package/libnss: re-enable package on
 microblaze
In-Reply-To: <20190605121336.2512-1-giulio.benetti@micronovasrl.com>
References: <20190524231547.35975ecf@windsurf>
 <20190605121336.2512-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190605121336.2512-2-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With Microblaze Gcc version < 8.x the build hangs due to bug 85862:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85862
To avoid this, the libnss package has a !BR2_TOOLCHAIN_HAS_GCC_BUG_85862
dependency. However, gcc bug 85862 only triggers when optimization is
enabled, so we can work around the issue by passing -O0, which is what
we do in other Buildroot packages to work around this bug.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/libnss/Config.in | 4 ----
 package/libnss/libnss.mk | 8 +++++++-
 2 files changed, 7 insertions(+), 5 deletions(-)

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
index 484c79e9da..893ff80154 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -13,9 +13,15 @@ LIBNSS_DEPENDENCIES = libnspr sqlite zlib
 LIBNSS_LICENSE = MPL-2.0
 LIBNSS_LICENSE_FILES = nss/COPYING
 
+LIBNSS_CFLAGS = $(TARGET_CFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85862),y)
+LIBNSS_CFLAGS += -O0
+endif
+
 # Need to pass down TARGET_CFLAGS and TARGET_LDFLAGS
 define LIBNSS_FIXUP_LINUX_MK
-	echo 'OS_CFLAGS += ${TARGET_CFLAGS}' >> $(@D)/nss/coreconf/Linux.mk
+	echo 'OS_CFLAGS += ${LIBNSS_CFLAGS}' >> $(@D)/nss/coreconf/Linux.mk
 	echo 'LDFLAGS += ${TARGET_LDFLAGS}' >> $(@D)/nss/coreconf/Linux.mk
 endef
 
-- 
2.17.1
