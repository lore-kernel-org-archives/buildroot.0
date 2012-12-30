From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Dec 2012 19:08:05 +0100
Subject: [Buildroot] [PATCH 1/1] target: add different methods to encode
	passwords
In-Reply-To: <cover.1356890711.git.yann.morin.1998@free.fr>
References: <cover.1356890711.git.yann.morin.1998@free.fr>
Message-ID: <4286e89fcb929e0f8280fe2da2782c93227c0353.1356890711.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Passwords can be encoded in different ways (from the weakest
to the strongest): des, md5, sha-256, sha-512

Add a choice entry to select the method, defaulting to 'md5'.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Previously, this was specific to encode the root password.
I have made it generic (ie. not root-specific), in case
buildroot needs to encode other passwords in the future
(eg. when packages can create users, for which I've just
sent an RFC)
---
 system/Config.in |   62 +++++++++++++++++++++++++++++++++++++++++++++++++----
 system/system.mk |    3 +-
 2 files changed, 59 insertions(+), 6 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index f1c260a..0978be7 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -12,6 +12,60 @@ config BR2_TARGET_GENERIC_ISSUE
        help
          Select system banner (/etc/issue) to be displayed at login.
 
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
+
 config BR2_TARGET_GENERIC_ROOT_PASSWD
 	string "Root password"
 	default ""
@@ -22,11 +76,9 @@ config BR2_TARGET_GENERIC_ROOT_PASSWD
 	  and root will need no password to log in.
 	  
 	  WARNING! WARNING!
-	  Although pretty strong, MD5 is now an old hash function, and
-	  suffers from some weaknesses, which makes it susceptible to attacks.
-	  It is showing its age, so this root password should not be trusted
-	  to properly secure any product that can be shipped to the wide,
-	  hostile world.
+	  You should not trust this password to properly secure any product that
+	  can be shipped to the wide, hostile world, depending on the type of
+	  password encoding you choose above (especially if you choose md5 or des).
 	  
 	  WARNING! WARNING!
 	  The password appears in clear in the .config file, and may appear
diff --git a/system/system.mk b/system/system.mk
index 7536ce6..e964e46 100644
--- a/system/system.mk
+++ b/system/system.mk
@@ -1,8 +1,9 @@
 TARGET_GENERIC_HOSTNAME:=$(call qstrip,$(BR2_TARGET_GENERIC_HOSTNAME))
 TARGET_GENERIC_ISSUE:=$(call qstrip,$(BR2_TARGET_GENERIC_ISSUE))
 TARGET_GENERIC_ROOT_PASSWD:=$(call qstrip,$(BR2_TARGET_GENERIC_ROOT_PASSWD))
+TARGET_GENERIC_PASSWD_METHOD:=$(call qstrip,$(BR2_TARGET_GENERIC_PASSWD_METHOD))
 ifneq ($(TARGET_GENERIC_ROOT_PASSWD),)
-TARGET_GENERIC_ROOT_PASSWD_HASH=$(shell mkpasswd -m md5 "$(TARGET_GENERIC_ROOT_PASSWD)")
+TARGET_GENERIC_ROOT_PASSWD_HASH=$(shell mkpasswd -m "$(TARGET_GENERIC_PASSWD_METHOD)" "$(TARGET_GENERIC_ROOT_PASSWD)")
 endif
 TARGET_GENERIC_GETTY:=$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT))
 TARGET_GENERIC_GETTY_BAUDRATE:=$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE))
-- 
1.7.2.5
