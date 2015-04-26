From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 26 Apr 2015 21:58:50 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/libpjsip: new package
Message-ID: <1430078330-14821-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: various changes (Thomas)
  - changed portaudio dependency to avoid using third_party/portaudio/
  - removed 0001-disable-tests.patch
    not necessary anymore since ipv6 changes in buildroot
  - added license information

 package/Config.in              |    1 +
 package/libpjsip/Config.in     |   16 ++++++++++++++
 package/libpjsip/libpjsip.hash |    2 ++
 package/libpjsip/libpjsip.mk   |   47 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 66 insertions(+)
 create mode 100644 package/libpjsip/Config.in
 create mode 100644 package/libpjsip/libpjsip.hash
 create mode 100644 package/libpjsip/libpjsip.mk

diff --git a/package/Config.in b/package/Config.in
index 744ebc6..2a06a3d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -961,6 +961,7 @@ menu "Networking"
 	source "package/liboping/Config.in"
 	source "package/libosip2/Config.in"
 	source "package/libpcap/Config.in"
+	source "package/libpjsip/Config.in"
 	source "package/librsync/Config.in"
 	source "package/libshairplay/Config.in"
 	source "package/libshout/Config.in"
diff --git a/package/libpjsip/Config.in b/package/libpjsip/Config.in
new file mode 100644
index 0000000..ae3c65b
--- /dev/null
+++ b/package/libpjsip/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_LIBPJSIP
+	bool "libpjsip"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS # portaudio
+	select BR2_PACKAGE_LIBGSM
+	select BR2_PACKAGE_LIBSRTP
+	select BR2_PACKAGE_PORTAUDIO
+	help
+	  PJSIP is a free and open source multimedia communication
+	  library written in C language implementing standard based
+	  protocols such as: SIP, SDP, RTP, STUN, TURN, and ICE.
+
+	  http://www.pjsip.org
+
+comment "libpjsip needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libpjsip/libpjsip.hash b/package/libpjsip/libpjsip.hash
new file mode 100644
index 0000000..c647ac4
--- /dev/null
+++ b/package/libpjsip/libpjsip.hash
@@ -0,0 +1,2 @@
+# From http://www.pjsip.org/release/2.4/MD5SUM.TXT
+md5	39629ca3fcedbdc7dbd8c5a707060095	pjproject-2.4.tar.bz2
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
new file mode 100644
index 0000000..6308da1
--- /dev/null
+++ b/package/libpjsip/libpjsip.mk
@@ -0,0 +1,47 @@
+################################################################################
+#
+# libpjsip
+#
+################################################################################
+
+LIBPJSIP_VERSION = 2.4
+LIBPJSIP_SOURCE = pjproject-$(LIBPJSIP_VERSION).tar.bz2
+LIBPJSIP_SITE = http://www.pjsip.org/release/$(LIBPJSIP_VERSION)
+LIBPJSIP_LICENSE = GPLv2+
+LIBPJSIP_LICENSE_FILES = COPYING
+LIBPJSIP_INSTALL_STAGING = YES
+
+LIBPJSIP_DEPENDENCIES = libgsm libsrtp portaudio
+
+LIBPJSIP_CONF_ENV = \
+	LD="$(TARGET_CC)" \
+	CFLAGS="$(TARGET_CFLAGS) -DPJ_HAS_IPV6=1"
+
+LIBPJSIP_CONF_OPTS = \
+	--with-external-gsm \
+	--with-external-pa \
+	--with-external-srtp \
+	--disable-sound \
+	--disable-resample \
+	--disable-video \
+	--disable-opencore-amr
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LIBPJSIP_DEPENDENCIES += openssl
+LIBPJSIP_CONF_OPTS += --with-ssl=$(STAGING_DIR)/usr
+else
+LIBPJSIP_CONF_OPTS += --disable-ssl
+endif
+
+ifeq ($(BR2_PACKAGE_SPEEX),y)
+LIBPJSIP_CONF_OPTS += --with-external-speex
+LIBPJSIP_DEPENDENCIES += speex
+else
+LIBPJSIP_CONF_OPTS += --disable-speex-codec --disable-speex-aec
+endif
+
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
+LIBPJSIP_DEPENDENCIES += util-linux
+endif
+
+$(eval $(autotools-package))
-- 
1.7.10.4
