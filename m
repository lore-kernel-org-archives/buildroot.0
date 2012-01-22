From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 22 Jan 2012 02:20:19 +0100
Subject: [Buildroot] [PATCH 1/2] sofia-sip: new package
Message-ID: <1327195220-25133-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/multimedia/Config.in                       |    1 +
 package/multimedia/sofia-sip/Config.in             |   12 ++++++
 ...ag.h-reintroduce-soatag_local_sdp_str_ref.patch |   26 +++++++++++++
 package/multimedia/sofia-sip/sofia-sip.mk          |   40 ++++++++++++++++++++
 4 files changed, 79 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/sofia-sip/Config.in
 create mode 100644 package/multimedia/sofia-sip/sofia-sip-1.12.11-0001-soa_tag.h-reintroduce-soatag_local_sdp_str_ref.patch
 create mode 100644 package/multimedia/sofia-sip/sofia-sip.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index a05d1d9..4779daf 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -40,6 +40,7 @@ source "package/multimedia/mplayer/Config.in"
 source "package/multimedia/musepack/Config.in"
 source "package/multimedia/portaudio/Config.in"
 source "package/multimedia/pulseaudio/Config.in"
+source "package/multimedia/sofia-sip/Config.in"
 source "package/multimedia/speex/Config.in"
 source "package/multimedia/tidsp-binaries/Config.in"
 source "package/multimedia/taglib/Config.in"
diff --git a/package/multimedia/sofia-sip/Config.in b/package/multimedia/sofia-sip/Config.in
new file mode 100644
index 0000000..28b5984
--- /dev/null
+++ b/package/multimedia/sofia-sip/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_SOFIA_SIP
+	bool "sofia-sip"
+	help
+	  Sofia-SIP - a RFC3261 compliant SIP User-Agent library.
+	  http://sourceforge.net/projects/sofia-sip
+
+config BR2_PACKAGE_SOFIA_SIP_OPENSSL
+	bool "OpenSSL support for sofia-sip"
+	depends on BR2_PACKAGE_SOFIA_SIP
+	select BR2_PACKAGE_OPENSSL
+	help
+	  Include OpenSSL support for sofia-sip
diff --git a/package/multimedia/sofia-sip/sofia-sip-1.12.11-0001-soa_tag.h-reintroduce-soatag_local_sdp_str_ref.patch b/package/multimedia/sofia-sip/sofia-sip-1.12.11-0001-soa_tag.h-reintroduce-soatag_local_sdp_str_ref.patch
new file mode 100644
index 0000000..f7ad390
--- /dev/null
+++ b/package/multimedia/sofia-sip/sofia-sip-1.12.11-0001-soa_tag.h-reintroduce-soatag_local_sdp_str_ref.patch
@@ -0,0 +1,26 @@
+From bcd0f17fd83f2dfe570a3ab17249a5c7290b27f2 Mon Sep 17 00:00:00 2001
+From: Pekka Pessi <Pekka.Pessi@nokia.com>
+Date: Thu, 24 Mar 2011 14:45:21 +0200
+Subject: [PATCH] soa_tag.h: reintroduce soatag_local_sdp_str_ref
+
+Thanks to Erik Habicht <e.habicht@thiesen.com> for spotting it
+---
+ libsofia-sip-ua/soa/sofia-sip/soa_tag.h |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/libsofia-sip-ua/soa/sofia-sip/soa_tag.h b/libsofia-sip-ua/soa/sofia-sip/soa_tag.h
+index 723ca02..d9448d6 100644
+--- a/libsofia-sip-ua/soa/sofia-sip/soa_tag.h
++++ b/libsofia-sip-ua/soa/sofia-sip/soa_tag.h
+@@ -118,7 +118,7 @@ SOFIAPUBVAR tag_typedef_t soatag_local_sdp_ref;
+ SOFIAPUBVAR tag_typedef_t soatag_local_sdp_str;
+ #define SOATAG_LOCAL_SDP_STR_REF(x) \
+   soatag_local_sdp_str_ref, tag_str_vr(&(x))
+-SOFIAPUBVAR tag_typedef_t soatag_session_sdp_str_ref;
++SOFIAPUBVAR tag_typedef_t soatag_local_sdp_str_ref;
+ 
+ #define SOATAG_AF(x)             soatag_af, tag_int_v((x))
+ SOFIAPUBVAR tag_typedef_t soatag_af;
+-- 
+1.7.7
+
diff --git a/package/multimedia/sofia-sip/sofia-sip.mk b/package/multimedia/sofia-sip/sofia-sip.mk
new file mode 100644
index 0000000..d6f4081
--- /dev/null
+++ b/package/multimedia/sofia-sip/sofia-sip.mk
@@ -0,0 +1,40 @@
+#############################################################
+# 
+# sofia-SIP
+#
+#############################################################
+
+
+SOFIA_SIP_VERSION = 1.12.11
+SOFIA_SIP_SITE    = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sofia-sip
+SOFIA_SIP_SOURCE  = sofia-sip-$(SOFIA_SIP_VERSION).tar.gz
+SOFIA_SIP_INSTALL_STAGING = YES
+
+ifneq ($(BR2_HAVE_DOCUMENTATION),y)
+# If doxygen is not installed on the host, documentation won't be generated.
+SOFIA_SIP_CONF_OPT += --with-doxygen=no
+endif
+
+ifneq ($(BR2_INET_IPV6),y)
+SOFIA_SIP_CONF_OPT += --disable-ip6
+endif
+
+ifneq ($(BR2_ENABLE_DEBUG),y)
+SOFIA_SIP_CONF_OPT += --enable-ndebug
+endif
+
+ifeq ($(BR2_PACKAGE_SOFIA_SIP_OPENSSL),y)
+SOFIA_SIP_CONF_OPT += --with-openssl
+SOFIA_SIP_DEPENDENCIES += openssl
+else
+SOFIA_SIP_CONF_OPT += --without-openssl
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
+SOFIA_SIP_CONF_OPT += --with-glib
+SOFIA_SIP_DEPENDENCIES += libglib2
+else
+SOFIA_SIP_CONF_OPT += --without-glib
+endif
+
+$(eval $(call AUTOTARGETS))
-- 
1.7.8.3
