From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 6 Nov 2012 08:20:17 +0100
Subject: [Buildroot] [git commit] quota: add support to use RPC support from
	libtirpc
Message-ID: <20121106072426.99EFF99BFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c5fc090f562af3a6afe8f83070abb74bb27a3d84
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/quota/Config.in |    6 +++---
 package/quota/quota.mk  |   13 +++++++++++--
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/package/quota/Config.in b/package/quota/Config.in
index a26f91f..f7d0fe9 100644
--- a/package/quota/Config.in
+++ b/package/quota/Config.in
@@ -1,15 +1,15 @@
 config BR2_PACKAGE_QUOTA
 	bool "quota"
-	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_MOUNT
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	help
 	  Implementation of the disk quota system.
 
 	  http://sourceforge.net/projects/linuxquota/
 
-comment "quota requires a toolchain with RPC + LARGEFILE + WCHAR support"
-	depends on !(BR2_TOOLCHAIN_HAS_NATIVE_RPC && BR2_LARGEFILE && BR2_USE_WCHAR)
+comment "quota requires a toolchain with LARGEFILE + WCHAR support"
+	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
diff --git a/package/quota/quota.mk b/package/quota/quota.mk
index abe3675..7019059 100644
--- a/package/quota/quota.mk
+++ b/package/quota/quota.mk
@@ -8,13 +8,22 @@ QUOTA_VERSION = 4.00
 QUOTA_SOURCE = quota-$(QUOTA_VERSION).tar.gz
 QUOTA_SITE = http://downloads.sourceforge.net/project/linuxquota/quota-tools/$(QUOTA_VERSION)
 
-QUOTA_MAKE_OPT = $(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
+QUOTA_CFLAGS = $(TARGET_CFLAGS)
+QUOTA_LDFLAGS = $(TARGET_LDFLAGS)
 
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
 QUOTA_DEPENDENCIES = gettext
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
