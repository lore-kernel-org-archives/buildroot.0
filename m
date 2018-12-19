From: Markus Mayer <mmayer@broadcom.com>
Date: Wed, 19 Dec 2018 13:04:52 -0800
Subject: [Buildroot] [PATCH v2 1/4] system cfg: introduce option
 BR2_SYSTEM_DEFAULT_PATH
In-Reply-To: <20181219210455.14754-1-mmayer@broadcom.com>
References: <20181219210455.14754-1-mmayer@broadcom.com>
Message-ID: <20181219210455.14754-2-mmayer@broadcom.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The configuration option BR2_SYSTEM_DEFAULT_PATH allows the user to
override the default path, which can be used by /etc/profile and some
system daemons.

It defaults to the value previously hard-coded in /etc/profile. This
default should be suitable for most users.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
---
 system/Config.in | 9 +++++++++
 system/system.mk | 4 ++++
 2 files changed, 13 insertions(+)

diff --git a/system/Config.in b/system/Config.in
index 0f77b9b6721a..afae487a4bd5 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -386,6 +386,15 @@ comment "automatic network configuration via DHCP needs ifupdown or busybox or n
 
 endif # BR2_ROOTFS_SKELETON_DEFAULT
 
+config BR2_SYSTEM_DEFAULT_PATH
+	string "Set the system's default PATH"
+	default "/bin:/sbin:/usr/bin:/usr/sbin"
+	help
+	  Sets the system's default PATH. It is being used in /etc/profile
+	  in the skeleton-init-common package and by some daemons.
+
+	  The default should work in most cases.
+
 config BR2_ENABLE_LOCALE_PURGE
 	bool "Purge unwanted locales"
 	default y
diff --git a/system/system.mk b/system/system.mk
index ca6bf1388f39..8db87cb12930 100644
--- a/system/system.mk
+++ b/system/system.mk
@@ -86,3 +86,7 @@ define SYSTEM_REMOUNT_ROOT_INITTAB
 	$(SED) '/^[^#].*-o remount,rw \/$$/s~^~#~' $(TARGET_DIR)/etc/inittab
 endef
 endif
+
+ifeq ($(BR_BUILDING)$(BR2_SYSTEM_DEFAULT_PATH),y"")
+$(error BR2_SYSTEM_DEFAULT_PATH can't be empty)
+endif
-- 
2.17.1
