From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  7 Jan 2014 23:46:07 +0100
Subject: [Buildroot] [PATCH 4/5] system: default to empty issue/hostname for
	custom skeleton
In-Reply-To: <cover.1389134731.git.yann.morin.1998@free.fr>
References: <cover.1389134731.git.yann.morin.1998@free.fr>
Message-ID: <cffd411631d99ddd729f0e29888b0fb14941889a.1389134731.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sagaert Johan <sagaert.johan@skynet.be>

A custom skeleton may include /etc/issue and/or /etc/hostname, in
which case we do not want to override them.

But those files could also be missing from the custom skeleton, or
the user may want to override their content.

Make the current default value for isue and hostname depend on the
generic skeleton, and default to empty for a custom skeleton.

Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
[yann.morin.1998 at free.fr: change from hiding it behind SKELETON_DEFAULT
    to use conditional default values; move below the skeleton choice;
    improve help entries]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 system/Config.in | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index 54c196c..4bdd610 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -1,17 +1,5 @@
 menu "System configuration"
 
-config BR2_TARGET_GENERIC_HOSTNAME
-	string "System hostname"
-	default "buildroot"
-	help
-	  Select system hostname to be stored in /etc/hostname.
-
-config BR2_TARGET_GENERIC_ISSUE
-	string "System banner"
-	default "Welcome to Buildroot"
-	help
-	  Select system banner (/etc/issue) to be displayed at login.
-
 choice
 	bool "Passwords encoding"
 	default BR2_TARGET_GENERIC_PASSWD_MD5
@@ -179,6 +167,26 @@ config BR2_ROOTFS_SKELETON_CUSTOM_PATH
 	  Path custom target skeleton.
 endif
 
+config BR2_TARGET_GENERIC_HOSTNAME
+	string "System hostname"
+	default "buildroot" if BR2_ROOTFS_SKELETON_DEFAULT
+	default ""          if ! BR2_ROOTFS_SKELETON_DEFAULT
+	help
+	  Select system hostname to be stored in /etc/hostname.
+
+	  Leave empty to not create /etc/hostname, or to keep the
+	  one from a custom skeleton.
+
+config BR2_TARGET_GENERIC_ISSUE
+	string "System banner"
+	default "Welcome to Buildroot" if BR2_ROOTFS_SKELETON_DEFAULT
+	default ""                     if ! BR2_ROOTFS_SKELETON_DEFAULT
+	help
+	  Select system banner (/etc/issue) to be displayed at login.
+
+	  Leave empty to not create /etc/issue, or to keep the
+	  one from a custom skeleton.
+
 if BR2_ROOTFS_SKELETON_DEFAULT
 
 config BR2_TARGET_GENERIC_ROOT_PASSWD
-- 
1.8.1.2
