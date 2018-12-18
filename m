From: Markus Mayer <mmayer@broadcom.com>
Date: Mon, 17 Dec 2018 16:51:13 -0800
Subject: [Buildroot] [PATCH 1/4] system cfg: introduce option
 BR2_SYSTEM_DEFAULT_PATH
In-Reply-To: <20181218005116.17435-1-mmayer@broadcom.com>
References: <20181218005116.17435-1-mmayer@broadcom.com>
Message-ID: <20181218005116.17435-2-mmayer@broadcom.com>
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
 system/Config.in | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/system/Config.in b/system/Config.in
index 0f77b9b6721a..93458c0011b7 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -386,6 +386,16 @@ comment "automatic network configuration via DHCP needs ifupdown or busybox or n
 
 endif # BR2_ROOTFS_SKELETON_DEFAULT
 
+config BR2_SYSTEM_DEFAULT_PATH
+	string "Set the system's default PATH"
+	default "/bin:/sbin:/usr/bin:/usr/sbin" if !BR2_ROOTFS_MERGED_USR
+	default "/bin:/sbin" if BR2_ROOTFS_MERGED_USR
+	help
+	  Sets the system's default PATH. It is being used in /etc/profile
+	  in the skeleton-init-common package and by some daemons.
+
+	  The default should work in most cases.
+
 config BR2_ENABLE_LOCALE_PURGE
 	bool "Purge unwanted locales"
 	default y
-- 
2.17.1
