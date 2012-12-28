From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 28 Dec 2012 22:20:54 +0100
Subject: [Buildroot] [PATCH 2/2] target: add different methods to encode the
	root password
In-Reply-To: <cover.1356728899.git.yann.morin.1998@free.fr>
References: <cover.1356728899.git.yann.morin.1998@free.fr>
Message-ID: <88cda76d37f0ec750a96a5a53b93cd67b55d39e7.1356728899.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The password can be encoded in different ways (from the weakest
to the strongest): des, md5, sha-256, sha-512

Add a choice entry to select the method, defaulting to 'md5'.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 system/Config.in |   46 ++++++++++++++++++++++++++++++++++++++++++++++
 system/system.mk |    3 ++-
 2 files changed, 48 insertions(+), 1 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index deead86..2c90e8a 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -34,6 +34,52 @@ config BR2_TARGET_GENERIC_ROOT_PASSWD
 	  .config file or the build log may be distributed!
 
 choice
+	bool "root password encoding"
+	depends on BR2_TARGET_GENERIC_ROOT_PASSWD != ""
+	default BR2_TARGET_GENERIC_ROOT_PASSWD_MD5
+
+config BR2_TARGET_GENERIC_ROOT_PASSWD_DES
+	bool "des"
+	help
+	  Use standard 56-bit DES-based crypt(3).
+	  
+	  Old, wildly available, but also the weakest.
+
+config BR2_TARGET_GENERIC_ROOT_PASSWD_MD5
+	bool "md5"
+	help
+	  Use MD5 to encode the password.
+	  
+	  The default, wildly available, and pretty good.
+
+config BR2_TARGET_GENERIC_ROOT_PASSWD_SHA256
+	bool "sha-256"
+	help
+	  Use SHA256 to encode the password.
+	  
+	  Very strong, but not ubiquitous, although available in glibc
+	  for some time now. Choose only if you are sure your C library
+	  understands SHA256 passwords.
+
+config BR2_TARGET_GENERIC_ROOT_PASSWD_SHA512
+	bool "sha-512"
+	help
+	  Use SHA512 to encode the password.
+	  
+	  Extremely strong, but not ubiquitous, although available in glibc
+	  for some time now. Choose only if you are sure your C library
+	  understands SHA512 passwords.
+
+endchoice # root passwd encoding
+
+config BR2_TARGET_GENERIC_ROOT_PASSWD_METHOD
+	string
+	default "des"       if BR2_TARGET_GENERIC_ROOT_PASSWD_DES
+	default "md5"       if BR2_TARGET_GENERIC_ROOT_PASSWD_MD5
+	default "sha-256"   if BR2_TARGET_GENERIC_ROOT_PASSWD_SHA256
+	default "sha-512"   if BR2_TARGET_GENERIC_ROOT_PASSWD_SHA512
+
+choice
 	prompt "/dev management"
 	default BR2_ROOTFS_DEVICE_CREATION_STATIC
 
diff --git a/system/system.mk b/system/system.mk
index a23feef..f5a8310 100644
--- a/system/system.mk
+++ b/system/system.mk
@@ -1,6 +1,7 @@
 TARGET_GENERIC_HOSTNAME:=$(call qstrip,$(BR2_TARGET_GENERIC_HOSTNAME))
 TARGET_GENERIC_ISSUE:=$(call qstrip,$(BR2_TARGET_GENERIC_ISSUE))
 TARGET_GENERIC_ROOT_PASSWD:=$(call qstrip,$(BR2_TARGET_GENERIC_ROOT_PASSWD))
+TARGET_GENERIC_ROOT_PASSWD_METHOD:=$(call qstrip,$(BR2_TARGET_GENERIC_ROOT_PASSWD_METHOD))
 TARGET_GENERIC_GETTY:=$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT))
 TARGET_GENERIC_GETTY_BAUDRATE:=$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE))
 TARGET_GENERIC_GETTY_TERM:=$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_TERM))
@@ -19,7 +20,7 @@ target-no-root-passwd:
 	$(SED) "s/^root:[^:]*:/root::/" $(TARGET_DIR)/etc/shadow
 
 target-root-passwd:
-	root_passwd="$$( mkpasswd -m md5 "$(TARGET_GENERIC_ROOT_PASSWD)" )"; \
+	root_passwd="$$( mkpasswd -m "$(TARGET_GENERIC_ROOT_PASSWD_METHOD)" "$(TARGET_GENERIC_ROOT_PASSWD)" )"; \
 	$(SED) "s,^root::,root:$${root_passwd}:," $(TARGET_DIR)/etc/shadow
 
 target-generic-getty-busybox:
-- 
1.7.2.5
