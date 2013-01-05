From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  5 Jan 2013 15:52:02 +0100
Subject: [Buildroot] [PATCH 1/2] system: set root password only for default
	skeleton
In-Reply-To: <cover.1357397453.git.yann.morin.1998@free.fr>
References: <cover.1357397453.git.yann.morin.1998@free.fr>
Message-ID: <1f2432a8027f1e1c780a45b488be8be03f1b1b93.1357397453.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In case one is using a custom skeleton, the root pasword might already be
set in this case, and should not be overriden.

Just ask for (and set) the root password only for the default skeleton.

Reported-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <jacmet@uclibc.org>
---
 system/Config.in |   42 +++++++++++++++++++++---------------------
 system/system.mk |    2 ++
 2 files changed, 23 insertions(+), 21 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index 5b66ac0..19bdd2d 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -12,27 +12,6 @@ config BR2_TARGET_GENERIC_ISSUE
        help
          Select system banner (/etc/issue) to be displayed at login.
 
-config BR2_TARGET_GENERIC_ROOT_PASSWD
-	string "Root password"
-	default ""
-	help
-	  Set the initial root password (in clear). It will be md5-encrypted.
-	  
-	  If set to empty (the default), then no root password will be set,
-	  and root will need no password to log in.
-	  
-	  WARNING! WARNING!
-	  Although pretty strong, MD5 is now an old hash function, and
-	  suffers from some weaknesses, which makes it susceptible to attacks.
-	  It is showing its age, so this root password should not be trusted
-	  to properly secure any product that can be shipped to the wide,
-	  hostile world.
-	  
-	  WARNING! WARNING!
-	  The password appears in clear in the .config file, and may appear
-	  in the build log! Avoid using a valuable password if either the
-	  .config file or the build log may be distributed!
-
 choice
 	prompt "/dev management"
 	default BR2_ROOTFS_DEVICE_CREATION_STATIC
@@ -140,6 +119,27 @@ endif
 
 if BR2_ROOTFS_SKELETON_DEFAULT
 
+config BR2_TARGET_GENERIC_ROOT_PASSWD
+	string "Root password"
+	default ""
+	help
+	  Set the initial root password (in clear). It will be md5-encrypted.
+	  
+	  If set to empty (the default), then no root password will be set,
+	  and root will need no password to log in.
+	  
+	  WARNING! WARNING!
+	  Although pretty strong, MD5 is now an old hash function, and
+	  suffers from some weaknesses, which makes it susceptible to attacks.
+	  It is showing its age, so this root password should not be trusted
+	  to properly secure any product that can be shipped to the wide,
+	  hostile world.
+	  
+	  WARNING! WARNING!
+	  The password appears in clear in the .config file, and may appear
+	  in the build log! Avoid using a valuable password if either the
+	  .config file or the build log may be distributed!
+
 config BR2_TARGET_GENERIC_GETTY_PORT
 	string "Port to run a getty (login prompt) on"
 	default "ttyS0"
diff --git a/system/system.mk b/system/system.mk
index 3c4d06e..651f7df 100644
--- a/system/system.mk
+++ b/system/system.mk
@@ -47,7 +47,9 @@ ifneq ($(TARGET_GENERIC_ISSUE),)
 TARGETS += target-generic-issue
 endif
 
+ifeq ($(BR2_ROOTFS_SKELETON_DEFAULT),y)
 TARGETS += target-root-passwd
+endif
 
 ifneq ($(TARGET_GENERIC_GETTY),)
 ifeq ($(BR2_ROOTFS_SKELETON_DEFAULT),y)
-- 
1.7.2.5
