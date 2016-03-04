From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sat,  5 Mar 2016 00:32:43 +0100
Subject: [Buildroot] [PATCH v3] libpjsip: new package
Message-ID: <1457134363-26450-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Bernd Kuhls <bernd.kuhls@t-online.de>

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Patrick Keroulas <patrick.keroulas@savoirfairelinux.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>

---

I adopted this patch since Bernd has no more interest in it.

v2 from Bernd is here: https://patchwork.ozlabs.org/patch/464737/

Changes v2 -> v3:
 - bump to 2.4.5
 - disable gsm, pa, srtp and speex
 - add sha256 hash

v2: various changes (Thomas)
  - changed portaudio dependency to avoid using third_party/portaudio/
  - removed 0001-disable-tests.patch
    not necessary anymore since ipv6 changes in buildroot
  - added license information
---
 package/Config.in              |  1 +
 package/libpjsip/Config.in     | 12 ++++++++++++
 package/libpjsip/libpjsip.hash |  5 +++++
 package/libpjsip/libpjsip.mk   | 38 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 56 insertions(+)
 create mode 100644 package/libpjsip/Config.in
 create mode 100644 package/libpjsip/libpjsip.hash
 create mode 100644 package/libpjsip/libpjsip.mk

diff --git a/package/Config.in b/package/Config.in
index 3c6e448c8c45..727bac8e9d72 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1132,6 +1132,7 @@ menu "Networking"
 	source "package/liboping/Config.in"
 	source "package/libosip2/Config.in"
 	source "package/libpcap/Config.in"
+	source "package/libpjsip/Config.in"
 	source "package/librsync/Config.in"
 	source "package/libshairplay/Config.in"
 	source "package/libshout/Config.in"
diff --git a/package/libpjsip/Config.in b/package/libpjsip/Config.in
new file mode 100644
index 000000000000..45387c4b39b9
--- /dev/null
+++ b/package/libpjsip/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_LIBPJSIP
+	bool "libpjsip"
+	depends on BR2_INSTALL_LIBSTDCPP
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
index 000000000000..e0d3d14323ab
--- /dev/null
+++ b/package/libpjsip/libpjsip.hash
@@ -0,0 +1,5 @@
+# From http://www.pjsip.org/release/2.4.5/MD5SUM.TXT
+md5	f58b3485977b3a700256203a554b3869  pjproject-2.4.5.tar.bz2
+
+# Locally computed
+sha256	086f5e70dcaee312b66ddc24dac6ef85e6f1fec4eed00ff2915cebe0ee3cdd8d	pjproject-2.4.5.tar.bz2
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
new file mode 100644
index 000000000000..ee250f5b11ef
--- /dev/null
+++ b/package/libpjsip/libpjsip.mk
@@ -0,0 +1,38 @@
+################################################################################
+#
+# libpjsip
+#
+################################################################################
+
+LIBPJSIP_VERSION = 2.4.5
+LIBPJSIP_SOURCE = pjproject-$(LIBPJSIP_VERSION).tar.bz2
+LIBPJSIP_SITE = http://www.pjsip.org/release/$(LIBPJSIP_VERSION)
+LIBPJSIP_LICENSE = GPLv2+
+LIBPJSIP_LICENSE_FILES = COPYING
+LIBPJSIP_INSTALL_STAGING = YES
+
+LIBPJSIP_CONF_ENV = \
+	LD="$(TARGET_CC)" \
+	CFLAGS="$(TARGET_CFLAGS) -DPJ_HAS_IPV6=1"
+
+LIBPJSIP_CONF_OPTS = \
+	--disable-sound \
+	--disable-gsm \
+	--disable-speex-codec \
+	--disable-speex-aec \
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
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
+LIBPJSIP_DEPENDENCIES += util-linux
+endif
+
+$(eval $(autotools-package))
-- 
1.9.1
