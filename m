From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 6 Jan 2013 21:52:18 +0100
Subject: [Buildroot] [git commit] target: add different methods to encode
	passwords
Message-ID: <20130106205645.652BD9A630@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=72defc45dd7cb3f75f2cb2669225084293a5d9cb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Passwords can be encoded in different ways (from the weakest
to the strongest): des, md5, sha-256, sha-512

Add a choice entry to select the method, defaulting to 'md5'.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 system/Config.in |   54 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 system/system.mk |    3 ++-
 2 files changed, 56 insertions(+), 1 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index 19bdd2d..69863c4 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -13,6 +13,60 @@ config BR2_TARGET_GENERIC_ISSUE
          Select system banner (/etc/issue) to be displayed at login.
 
 choice
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
+choice
 	prompt "/dev management"
 	default BR2_ROOTFS_DEVICE_CREATION_STATIC
 
diff --git a/system/system.mk b/system/system.mk
index 651f7df..4e131b0 100644
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
