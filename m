From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 10 Jan 2016 21:59:22 +0100
Subject: [Buildroot] [PATCH v5 06/29] package/freeswitch: enable optional
	zrtp support
In-Reply-To: <1452459585-7085-1-git-send-email-bernd.kuhls@t-online.de>
References: <1452459585-7085-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1452459585-7085-7-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable the new option BR2_PACKAGE_FREESWITCH_ZRTP to improve privacy by
default.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/freeswitch/0003-aarch64_zrtp.patch | 22 ++++++++++++++++++++++
 package/freeswitch/Config.in               | 18 +++++++++++++++++-
 package/freeswitch/freeswitch.mk           |  9 +++++++--
 3 files changed, 46 insertions(+), 3 deletions(-)
 create mode 100644 package/freeswitch/0003-aarch64_zrtp.patch

diff --git a/package/freeswitch/0003-aarch64_zrtp.patch b/package/freeswitch/0003-aarch64_zrtp.patch
new file mode 100644
index 0000000..5d78d81
--- /dev/null
+++ b/package/freeswitch/0003-aarch64_zrtp.patch
@@ -0,0 +1,22 @@
+Add aarch64 support in zrtp.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr freeswitch-16d600c0350a79c2532c739dd1432f7ed318ea09.org/libs/libzrtp/include/zrtp_config.h freeswitch-16d600c0350a79c2532c739dd1432f7ed318ea09/libs/libzrtp/include/zrtp_config.h
+--- freeswitch-16d600c0350a79c2532c739dd1432f7ed318ea09.org/libs/libzrtp/include/zrtp_config.h	2015-09-04 23:46:10.000000000 +0200
++++ freeswitch-16d600c0350a79c2532c739dd1432f7ed318ea09/libs/libzrtp/include/zrtp_config.h	2015-09-06 15:29:38.642038763 +0200
+@@ -88,7 +88,13 @@
+  */
+ #define ZRTP_BYTE_ORDER ZBO_BIG_ENDIAN
+ 
+-#elif defined(ARM) || defined(_ARM_) || defined(ARMV4) || defined(__arm__)
++#elif defined(__AARCH64EB__)
++/*
++ * aarch64, big endian
++ */
++#define ZRTP_BYTE_ORDER ZBO_BIG_ENDIAN
++
++#elif defined(ARM) || defined(_ARM_) || defined(ARMV4) || defined(__arm__) || defined(__AARCH64EL__)
+ /*
+  * ARM, default to little endian
+  */
diff --git a/package/freeswitch/Config.in b/package/freeswitch/Config.in
index 24f5a5b..48f7983 100644
--- a/package/freeswitch/Config.in
+++ b/package/freeswitch/Config.in
@@ -4,7 +4,7 @@ comment "freeswitch needs a toolchain w/ C++, threads"
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
 
-config BR2_PACKAGE_FREESWITCH
+menuconfig BR2_PACKAGE_FREESWITCH
 	bool "freeswitch"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
@@ -30,3 +30,19 @@ config BR2_PACKAGE_FREESWITCH
 	  protocols using audio, video, text or any other form of media.
 
 	  https://www.freeswitch.org
+
+if BR2_PACKAGE_FREESWITCH
+
+config BR2_PACKAGE_FREESWITCH_ZRTP
+	bool "zrtp"
+	default y
+	help
+	  ZRTP (composed of Z and Real-time Transport Protocol) is a
+	  cryptographic key-agreement protocol to negotiate the keys for
+	  encryption between two end points in a Voice over Internet
+	  Protocol (VoIP) phone telephony call based on the Real-time
+	  Transport Protocol.
+
+	  https://wiki.freeswitch.org/wiki/ZRTP
+
+endif # BR2_PACKAGE_FREESWITCH
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index f05da80..6bb23db 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -61,8 +61,7 @@ FREESWITCH_CONF_OPTS = \
 	--without-erlang \
 	--enable-fhs \
 	--without-python \
-	--disable-system-xmlrpc-c \
-	--disable-zrtp
+	--disable-system-xmlrpc-c
 
 # Enable more optional modules
 FREESWITCH_ENABLED_MODULES += \
@@ -120,6 +119,12 @@ endef
 
 FREESWITCH_PRE_CONFIGURE_HOOKS += FREESWITCH_ENABLE_MODULES
 
+ifeq ($(BR2_PACKAGE_FREESWITCH_ZRTP),y)
+FREESWITCH_CONF_OPTS += --enable-zrtp
+else
+FREESWITCH_CONF_OPTS += --disable-zrtp
+endif
+
 ifeq ($(BR2_PACKAGE_LIBEDIT),y)
 FREESWITCH_DEPENDENCIES += libedit
 FREESWITCH_CONF_OPTS += --enable-core-libedit-support
-- 
2.6.4
