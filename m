From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 18 Oct 2011 09:32:10 -0300
Subject: [Buildroot] [PATCH 2/2] ntfs-3g: bump to version 2011.4.12 and
	enhance
In-Reply-To: <1318941130-19244-1-git-send-email-gustavo@zacarias.com.ar>
References: <1318941130-19244-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1318941130-19244-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ntfsprogs is now included into ntfs-3g so add an option to
enable/disable it.
It probably doesn't make sense to build ntfsprogs alone so it's not
implemented.

Add the encrypted volume support option now that we've got gnutls.

Also add support for libuuid if it's present.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ntfs-3g/Config.in  |   15 +++++++++++++++
 package/ntfs-3g/ntfs-3g.mk |   23 +++++++++++++++++++++--
 2 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/package/ntfs-3g/Config.in b/package/ntfs-3g/Config.in
index 865f9b4..5301038 100644
--- a/package/ntfs-3g/Config.in
+++ b/package/ntfs-3g/Config.in
@@ -12,5 +12,20 @@ config BR2_PACKAGE_NTFS_3G
 
 	  http://www.ntfs-3g.org/
 
+if BR2_PACKAGE_NTFS_3G
+
+config BR2_PACKAGE_NTFS_3G_ENCRYPTED
+	bool "encrypted volumes"
+	select BR2_PACKAGE_GNUTLS
+	help
+	  Enable support for NTFS encrypted volumes.
+
+config BR2_PACKAGE_NTFS_3G_NTFSPROGS
+	bool "ntfsprogs"
+	help
+	  Install NTFS utilities.
+
+endif
+
 comment "ntfs-3g requires a toolchain with LARGEFILE and WCHAR support"
 	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
diff --git a/package/ntfs-3g/ntfs-3g.mk b/package/ntfs-3g/ntfs-3g.mk
index 99fc20c..f6462bb 100644
--- a/package/ntfs-3g/ntfs-3g.mk
+++ b/package/ntfs-3g/ntfs-3g.mk
@@ -4,10 +4,29 @@
 #
 #############################################################
 
-NTFS_3G_VERSION = 2010.10.2
-NTFS_3G_SOURCE = ntfs-3g-$(NTFS_3G_VERSION).tgz
+NTFS_3G_VERSION = 2011.4.12
+NTFS_3G_SOURCE = ntfs-3g_ntfsprogs-$(NTFS_3G_VERSION).tgz
 NTFS_3G_SITE = http://tuxera.com/opensource
 NTFS_3G_CONF_OPT = --disable-ldconfig
 NTFS_3G_INSTALL_STAGING = YES
+NTFS_3G_DEPENDENCIES = host-pkg-config
+
+ifeq ($(BR2_PACKAGE_LIBFUSE),y)
+	NTFS_3G_CONF_OPT += --with-fuse=external
+	NTFS_3G_DEPENDENCIES += libfuse
+endif
+
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
+	NTFS_3G_DEPENDENCIES += util-linux
+endif
+
+ifeq ($(BR2_PACKAGE_NTFS_3G_ENCRYPTED),y)
+	NTFS_3G_CONF_OPT += --enable-crypto
+	NTFS_3G_DEPENDENCIES += gnutls
+endif
+
+ifneq ($(BR2_PACKAGE_NTFS_3G_NTFSPROGS),y)
+	NTFS_3G_CONF_OPT += --disable-ntfsprogs
+endif
 
 $(eval $(call AUTOTARGETS))
-- 
1.7.3.4
