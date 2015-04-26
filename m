From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 26 Apr 2015 17:00:50 +0200
Subject: [Buildroot] [PATCH 2/3] package/libpjsip: new package
In-Reply-To: <1430060451-4075-1-git-send-email-bernd.kuhls@t-online.de>
References: <1430060451-4075-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1430060451-4075-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                         |    1 +
 package/libpjsip/0001-disable-tests.patch |   12 +++++++
 package/libpjsip/Config.in                |   14 +++++++++
 package/libpjsip/libpjsip.hash            |    2 ++
 package/libpjsip/libpjsip.mk              |   49 +++++++++++++++++++++++++++++
 5 files changed, 78 insertions(+)
 create mode 100644 package/libpjsip/0001-disable-tests.patch
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
diff --git a/package/libpjsip/0001-disable-tests.patch b/package/libpjsip/0001-disable-tests.patch
new file mode 100644
index 0000000..3b140ed
--- /dev/null
+++ b/package/libpjsip/0001-disable-tests.patch
@@ -0,0 +1,12 @@
+diff -uNr pjproject-2.3.org/pjlib/build/Makefile pjproject-2.3/pjlib/build/Makefile
+--- pjproject-2.3.org/pjlib/build/Makefile	2014-02-04 08:39:55.000000000 +0100
++++ pjproject-2.3/pjlib/build/Makefile	2015-03-01 18:34:13.432524074 +0100
+@@ -66,7 +66,7 @@
+ # $(TARGET) is defined in os-$(OS_NAME).mak file in current directory.
+ #
+ 
+-all: $(TARGETS) $(TARGETS_EXE)
++all: $(TARGETS)
+ 
+ lib: $(TARGETS)
+ 
diff --git a/package/libpjsip/Config.in b/package/libpjsip/Config.in
new file mode 100644
index 0000000..2f5fdd2
--- /dev/null
+++ b/package/libpjsip/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_LIBPJSIP
+	bool "libpjsip"
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_LIBGSM
+	select BR2_PACKAGE_LIBSRTP
+	help
+	  PJSIP is a free and open source multimedia communication
+	  library written in C language implementing standard based
+	  protocols such as: SIP, SDP, RTP, STUN, TURN, and ICE.
+
+	  http://www.pjsip.org
+
+comment "libpjsip needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
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
index 0000000..8f445e6
--- /dev/null
+++ b/package/libpjsip/libpjsip.mk
@@ -0,0 +1,49 @@
+################################################################################
+#
+# libpjsip
+#
+################################################################################
+
+LIBPJSIP_VERSION = 2.4
+LIBPJSIP_SOURCE = pjproject-$(LIBPJSIP_VERSION).tar.bz2
+LIBPJSIP_SITE = http://www.pjsip.org/release/$(LIBPJSIP_VERSION)
+LIBPJSIP_INSTALL_STAGING = YES
+
+LIBPJSIP_DEPENDENCIES = libgsm libsrtp
+
+LIBPJSIP_CONF_ENV = \
+	LD="$(TARGET_CC)" \
+	CFLAGS="$(TARGET_CFLAGS) -DPJ_HAS_IPV6=1"
+
+LIBPJSIP_CONF_OPTS = \
+	--with-external-gsm \
+	--with-external-srtp \
+	--disable-sound \
+	--disable-resample \
+	--disable-video \
+	--disable-opencore-amr
+
+ifeq ($(BR2_PACKAGE_PORTAUDIO),y)
+LIBPJSIP_CONF_OPTS += --with-external-pa
+LIBPJSIP_DEPENDENCIES += portaudio
+endif
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
