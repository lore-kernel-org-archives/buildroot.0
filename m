From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 21 Jun 2020 09:59:59 +0200
Subject: [Buildroot] [PATCH v3 6/7] package/systemd: add an option
 BR2_PACKAGE_SYSTEMD_GUEST
In-Reply-To: <20200621080000.180089-1-francois.perrad@gadz.org>
References: <20200621080000.180089-1-francois.perrad@gadz.org>
Message-ID: <20200621080000.180089-7-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

this option allows a systemd tailored for a guest/container

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/systemd/Config.in  | 14 ++++++++++----
 package/systemd/systemd.mk |  6 +++++-
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index dd3b8c534..a8595dce8 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -35,10 +35,10 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	select BR2_PACKAGE_UTIL_LINUX_MOUNT
 	select BR2_PACKAGE_UTIL_LINUX_NOLOGIN
 	select BR2_PACKAGE_UTIL_LINUX_FSCK
-	select BR2_PACKAGE_KMOD
-	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # kmod-tools
-	select BR2_PACKAGE_KMOD_TOOLS
-	select BR2_TARGET_TZ_INFO
+	select BR2_PACKAGE_KMOD if !BR2_PACKAGE_SYSTEMD_GUEST
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS if !BR2_PACKAGE_SYSTEMD_GUEST # kmod-tools
+	select BR2_PACKAGE_KMOD_TOOLS if !BR2_PACKAGE_SYSTEMD_GUEST
+	select BR2_TARGET_TZ_INFO if !BR2_PACKAGE_SYSTEMD_GUEST
 	select BR2_NEEDS_HOST_UTF8_LOCALE
 	select BR2_PACKAGE_HOST_SYSTEMD # for systemctl preset-all, during target-finalize
 	help
@@ -90,6 +90,12 @@ if BR2_PACKAGE_SYSTEMD
 config BR2_PACKAGE_PROVIDES_UDEV
 	default "systemd"
 
+config BR2_PACKAGE_SYSTEMD_GUEST
+	bool "systemd-guest"
+	default n
+	help
+	  this option allows a systemd tailored for a guest/container.
+
 config BR2_PACKAGE_SYSTEMD_BOOT
 	bool "systemd-boot"
 	depends on BR2_i386 || BR2_x86_64
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index b7213dd12..c5572c369 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -13,11 +13,15 @@ SYSTEMD_DEPENDENCIES = \
 	$(BR2_COREUTILS_HOST_DEPENDENCY) \
 	$(if $(BR2_PACKAGE_BASH_COMPLETION),bash-completion) \
 	host-gperf \
-	kmod \
 	libcap \
 	util-linux \
 	$(TARGET_NLS_DEPENDENCIES)
 
+ifneq ($(BR2_PACKAGE_SYSTEMD_GUEST),y)
+	SYSTEMD_DEPENDENCIES += kmod
+endif
+
+
 SYSTEMD_PROVIDES = udev
 
 SYSTEMD_CONF_OPTS += \
-- 
2.25.1
