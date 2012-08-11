From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Aug 2012 19:40:47 +0200
Subject: [Buildroot] [PATCH 15/20] quota: add support to use RPC support
	from libtirpc
In-Reply-To: <cover.1344706801.git.thomas.petazzoni@free-electrons.com>
References: <cover.1344706801.git.thomas.petazzoni@free-electrons.com>
Message-ID: <e55c1cbfa2a0e61480bf8723b92d39a49014bf37.1344706801.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/quota/Config.in |    6 +++---
 package/quota/quota.mk  |   13 +++++++++++--
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/package/quota/Config.in b/package/quota/Config.in
index 788af1b..4220e67 100644
--- a/package/quota/Config.in
+++ b/package/quota/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_QUOTA
 	bool "quota"
-	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	depends on BR2_RPC_SUPPORT_AVAILABLE
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_UTIL_LINUX
@@ -12,5 +12,5 @@ config BR2_PACKAGE_QUOTA
 
 	  http://sourceforge.net/projects/linuxquota/
 
-comment "quota requires a toolchain with RPC + LARGEFILE + WCHAR support"
-	depends on !(BR2_TOOLCHAIN_HAS_NATIVE_RPC && BR2_LARGEFILE && BR2_USE_WCHAR)
+comment "quota requires a toolchain with LARGEFILE + WCHAR support, and RPC (toolchain or libtirpc)"
+	depends on !(BR2_RPC_SUPPORT_AVAILABLE && BR2_LARGEFILE && BR2_USE_WCHAR)
diff --git a/package/quota/quota.mk b/package/quota/quota.mk
index 44a5073..278df6d 100644
--- a/package/quota/quota.mk
+++ b/package/quota/quota.mk
@@ -8,13 +8,22 @@ QUOTA_VERSION = 4.00
 QUOTA_SOURCE = quota-$(QUOTA_VERSION).tar.gz
 QUOTA_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/linuxquota/quota-tools/$(QUOTA_VERSION)
 
-QUOTA_MAKE_OPT = $(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
+QUOTA_CFLAGS = $(TARGET_CFLAGS)
+QUOTA_LDFLAGS = $(TARGET_LDFLAGS)
 
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
 QUOTA_DEPENDENCIES = gettext libintl
-QUOTA_MAKE_OPT += LDFLAGS="$(TARGET_LDFLAGS) -lintl"
+QUOTA_LDFLAGS += -lintl
 endif
 
+ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
+QUOTA_DEPENDENCIES += libtirpc
+QUOTA_CFLAGS += -I$(STAGING_DIR)/usr/include/tirpc/
+QUOTA_LDFLAGS += -ltirpc
+endif
+
+QUOTA_MAKE_OPT = $(TARGET_CONFIGURE_OPTS) CFLAGS="$(QUOTA_CFLAGS) -D_GNU_SOURCE" LDFLAGS="$(QUOTA_LDFLAGS)"
+
 # Package uses autoconf but not automake.
 QUOTA_INSTALL_TARGET_OPT = \
 	ROOTDIR=$(TARGET_DIR) \
-- 
1.7.9.5
