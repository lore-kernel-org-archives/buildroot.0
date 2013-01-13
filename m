From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sun, 13 Jan 2013 15:13:44 +0100
Subject: [Buildroot] [PATCH 1/1] Only show hostname,
	issue and password options when default skeleton is selected.
Message-ID: <1358086424-17961-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Only show hostname, issue and password options when the default skeleton is selected.
Moved the menu sections so that when a custom skeleton is selected the issue, hostname
and default password options are hidden.
Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
---
 system/Config.in | 132 +++++++++++++++++++++++++++----------------------------
 1 file changed, 66 insertions(+), 66 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index 69863c4..066f1d2 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -1,71 +1,5 @@
 menu "System configuration"
 
-config BR2_TARGET_GENERIC_HOSTNAME
-       string "System hostname"
-       default "buildroot"
-       help
-         Select system hostname to be stored in /etc/hostname.
-
-config BR2_TARGET_GENERIC_ISSUE
-       string "System banner"
-       default "Welcome to Buildroot"
-       help
-         Select system banner (/etc/issue) to be displayed at login.
-
-choice
-	bool "Passwords encoding"
-	default BR2_TARGET_GENERIC_PASSWD_MD5
-	help
-	  Choose the password encoding scheme to use when Buildroot
-	  needs to encode a password (eg. the root password, below).
-	  
-	  Note: this is used at build-time, and *not* at runtime.
-
-config BR2_TARGET_GENERIC_PASSWD_DES
-	bool "des"
-	help
-	  Use standard 56-bit DES-based crypt(3) to encode passwords.
-	  
-	  Old, wildly available, but also the weakest, very susceptible to
-	  brute-force attacks.
-
-config BR2_TARGET_GENERIC_PASSWD_MD5
-	bool "md5"
-	help
-	  Use MD5 to encode passwords.
-	  
-	  The default. Wildly available, and pretty good.
-	  Although pretty strong, MD5 is now an old hash function, and
-	  suffers from some weaknesses, which makes it susceptible to
-	  brute-force attacks.
-
-config BR2_TARGET_GENERIC_PASSWD_SHA256
-	bool "sha-256"
-	help
-	  Use SHA256 to encode passwords.
-	  
-	  Very strong, but not ubiquitous, although available in glibc
-	  for some time now. Choose only if you are sure your C library
-	  understands SHA256 passwords.
-
-config BR2_TARGET_GENERIC_PASSWD_SHA512
-	bool "sha-512"
-	help
-	  Use SHA512 to encode passwords.
-	  
-	  Extremely strong, but not ubiquitous, although available in glibc
-	  for some time now. Choose only if you are sure your C library
-	  understands SHA512 passwords.
-
-endchoice # Passwd encoding
-
-config BR2_TARGET_GENERIC_PASSWD_METHOD
-	string
-	default "des"       if BR2_TARGET_GENERIC_PASSWD_DES
-	default "md5"       if BR2_TARGET_GENERIC_PASSWD_MD5
-	default "sha-256"   if BR2_TARGET_GENERIC_PASSWD_SHA256
-	default "sha-512"   if BR2_TARGET_GENERIC_PASSWD_SHA512
-
 choice
 	prompt "/dev management"
 	default BR2_ROOTFS_DEVICE_CREATION_STATIC
@@ -173,6 +107,18 @@ endif
 
 if BR2_ROOTFS_SKELETON_DEFAULT
 
+config BR2_TARGET_GENERIC_HOSTNAME
+       string "System hostname"
+       default "buildroot"
+       help
+         Select system hostname to be stored in /etc/hostname.
+
+config BR2_TARGET_GENERIC_ISSUE
+       string "System banner"
+       default "Welcome to Buildroot"
+       help
+         Select system banner (/etc/issue) to be displayed at login.
+
 config BR2_TARGET_GENERIC_ROOT_PASSWD
 	string "Root password"
 	default ""
@@ -193,6 +139,60 @@ config BR2_TARGET_GENERIC_ROOT_PASSWD
 	  The password appears in clear in the .config file, and may appear
 	  in the build log! Avoid using a valuable password if either the
 	  .config file or the build log may be distributed!
+         
+choice
+	bool "Passwords encoding"
+	default BR2_TARGET_GENERIC_PASSWD_MD5
+	help
+	  Choose the password encoding scheme to use when Buildroot
+	  needs to encode a password (eg. the root password, below).
+	  
+	  Note: this is used at build-time, and *not* at runtime.
+
+config BR2_TARGET_GENERIC_PASSWD_DES
+	bool "des"
+	help
+	  Use standard 56-bit DES-based crypt(3) to encode passwords.
+	  
+	  Old, wildly available, but also the weakest, very susceptible to
+	  brute-force attacks.
+
+config BR2_TARGET_GENERIC_PASSWD_MD5
+	bool "md5"
+	help
+	  Use MD5 to encode passwords.
+	  
+	  The default. Wildly available, and pretty good.
+	  Although pretty strong, MD5 is now an old hash function, and
+	  suffers from some weaknesses, which makes it susceptible to
+	  brute-force attacks.
+
+config BR2_TARGET_GENERIC_PASSWD_SHA256
+	bool "sha-256"
+	help
+	  Use SHA256 to encode passwords.
+	  
+	  Very strong, but not ubiquitous, although available in glibc
+	  for some time now. Choose only if you are sure your C library
+	  understands SHA256 passwords.
+
+config BR2_TARGET_GENERIC_PASSWD_SHA512
+	bool "sha-512"
+	help
+	  Use SHA512 to encode passwords.
+	  
+	  Extremely strong, but not ubiquitous, although available in glibc
+	  for some time now. Choose only if you are sure your C library
+	  understands SHA512 passwords.
+
+endchoice # Passwd encoding
+
+config BR2_TARGET_GENERIC_PASSWD_METHOD
+	string
+	default "des"       if BR2_TARGET_GENERIC_PASSWD_DES
+	default "md5"       if BR2_TARGET_GENERIC_PASSWD_MD5
+	default "sha-256"   if BR2_TARGET_GENERIC_PASSWD_SHA256
+	default "sha-512"   if BR2_TARGET_GENERIC_PASSWD_SHA512
 
 config BR2_TARGET_GENERIC_GETTY_PORT
 	string "Port to run a getty (login prompt) on"
-- 
1.8.0.1
