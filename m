From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Jun 2016 21:07:30 +0200
Subject: [Buildroot] [PATCH 08/24 v2] system: move the rootfs skeleton choice
In-Reply-To: <cover.1466622379.git.yann.morin.1998@free.fr>
References: <cover.1466622379.git.yann.morin.1998@free.fr>
Message-ID: <4ab3e1017436a1f608eb37300087551f05f42740.1466622379.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In the following commits, we'll be switching more options to be
conditional on the default or custom skeleton.

So, it makes sense that those options come after the choice of a
skeleton.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 system/Config.in | 56 ++++++++++++++++++++++++++++----------------------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index 04b886b..662443b 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -1,5 +1,33 @@
 menu "System configuration"
 
+choice
+	prompt "Root FS skeleton"
+
+config BR2_ROOTFS_SKELETON_DEFAULT
+	bool "default target skeleton"
+	help
+	  Use default target skeleton
+
+config BR2_ROOTFS_SKELETON_CUSTOM
+	bool "custom target skeleton"
+	help
+	  Use custom target skeleton.
+
+endchoice
+
+if BR2_ROOTFS_SKELETON_CUSTOM
+
+config BR2_ROOTFS_SKELETON_CUSTOM_PATH
+	string "custom target skeleton path"
+	help
+	  Path to custom target skeleton.
+
+# dummy config so merged /usr workarounds can also be activated for
+# custom rootfs skeleton
+config BR2_ROOTFS_MERGED_USR
+
+endif
+
 config BR2_TARGET_GENERIC_HOSTNAME
 	string "System hostname"
 	default "buildroot"
@@ -163,34 +191,6 @@ config BR2_ROOTFS_STATIC_DEVICE_TABLE
 	  See package/makedevs/README for details on the usage and
 	  syntax of these files.
 
-choice
-	prompt "Root FS skeleton"
-
-config BR2_ROOTFS_SKELETON_DEFAULT
-	bool "default target skeleton"
-	help
-	  Use default target skeleton
-
-config BR2_ROOTFS_SKELETON_CUSTOM
-	bool "custom target skeleton"
-	help
-	  Use custom target skeleton.
-
-endchoice
-
-if BR2_ROOTFS_SKELETON_CUSTOM
-
-config BR2_ROOTFS_SKELETON_CUSTOM_PATH
-	string "custom target skeleton path"
-	help
-	  Path to custom target skeleton.
-
-# dummy config so merged /usr workarounds can also be activated for
-# custom rootfs skeleton
-config BR2_ROOTFS_MERGED_USR
-
-endif
-
 if BR2_ROOTFS_SKELETON_DEFAULT
 
 config BR2_ROOTFS_MERGED_USR
-- 
2.7.4
