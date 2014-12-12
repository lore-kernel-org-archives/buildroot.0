From: Gregory Dymarek <gregd72002@gmail.com>
Date: Fri, 12 Dec 2014 15:42:46 +0000
Subject: [Buildroot] [PATCH v2 6/7] Adding sofia-sip
In-Reply-To: <1418398967-2183-1-git-send-email-gregd72002@gmail.com>
References: <1418398967-2183-1-git-send-email-gregd72002@gmail.com>
Message-ID: <1418398967-2183-7-git-send-email-gregd72002@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gregory Dymarek <gregd72002@gmail.com>
---
 package/Config.in                                  |  1 +
 package/sofia-sip/Config.in                        |  5 ++++
 ...ag.h-reintroduce-soatag_local_sdp_str_ref.patch | 26 ++++++++++++++++++
 package/sofia-sip/sofia-sip.hash                   |  1 +
 package/sofia-sip/sofia-sip.mk                     | 31 ++++++++++++++++++++++
 5 files changed, 64 insertions(+)
 create mode 100644 package/sofia-sip/Config.in
 create mode 100644 package/sofia-sip/sofia-sip-1.12.11-0001-soa_tag.h-reintroduce-soatag_local_sdp_str_ref.patch
 create mode 100644 package/sofia-sip/sofia-sip.hash
 create mode 100644 package/sofia-sip/sofia-sip.mk

diff --git a/package/Config.in b/package/Config.in
index 77430b9..316d899 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -862,6 +862,7 @@ menu "Networking"
 	source "package/rtmpdump/Config.in"
 	source "package/slirp/Config.in"
 	source "package/snmppp/Config.in"
+	source "package/sofia-sip/Config.in"
 	source "package/thrift/Config.in"
 	source "package/usbredir/Config.in"
 	source "package/wvstreams/Config.in"
diff --git a/package/sofia-sip/Config.in b/package/sofia-sip/Config.in
new file mode 100644
index 0000000..d9045b5
--- /dev/null
+++ b/package/sofia-sip/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_SOFIA_SIP
+	bool "sofia-sip"
+	help
+	Adds Sofia-SIP Library
+	http://sofia-sip.sourceforge.net
diff --git a/package/sofia-sip/sofia-sip-1.12.11-0001-soa_tag.h-reintroduce-soatag_local_sdp_str_ref.patch b/package/sofia-sip/sofia-sip-1.12.11-0001-soa_tag.h-reintroduce-soatag_local_sdp_str_ref.patch
new file mode 100644
index 0000000..2d52348
--- /dev/null
+++ b/package/sofia-sip/sofia-sip-1.12.11-0001-soa_tag.h-reintroduce-soatag_local_sdp_str_ref.patch
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
diff --git a/package/sofia-sip/sofia-sip.hash b/package/sofia-sip/sofia-sip.hash
new file mode 100644
index 0000000..4f352c3
--- /dev/null
+++ b/package/sofia-sip/sofia-sip.hash
@@ -0,0 +1 @@
+sha256,2b01bc2e1826e00d1f7f57d29a2854b15fd5fe24695e47a14a735d195dd37c81
diff --git a/package/sofia-sip/sofia-sip.mk b/package/sofia-sip/sofia-sip.mk
new file mode 100644
index 0000000..6be04f5
--- /dev/null
+++ b/package/sofia-sip/sofia-sip.mk
@@ -0,0 +1,31 @@
+#############################################################
+#
+# sofiasip
+#
+#############################################################
+SOFIA_SIP_VERSION = 1.12.11
+SOFIA_SIP_SOURCE = sofia-sip-$(SOFIA_SIP_VERSION).tar.gz 
+SOFIA_SIP_SITE = http://downloads.sourceforge.net/project/sofia-sip/sofia-sip/$(SOFIA_SIP_VERSION) 
+SOFIA_SIP_INSTALL_STAGING = YES
+
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_INET_IPV6),y)
+else
+	SOFIA_SIP_CONF_OPTS = --disable-ip6
+endif
+
+ifneq ($(BR2_HAVE_DOCUMENTATION),y)
+# If doxygen is not installed on the host, documentation won't be generated.
+	SOFIA_SIP_CONF_OPTS += --with-doxygen=no
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
+        SOFIA_SIP_CONF_OPTS += --with-glib
+        SOFIA_SIP_DEPENDENCIES += libglib2
+else
+        SOFIA_SIP_CONF_OPTS += --without-glib
+endif
+
+ifneq ($(BR2_ENABLE_DEBUG),y)
+        SOFIA_SIP_CONF_OPTS += --enable-ndebug
+endif
+$(eval $(autotools-package))
-- 
1.9.1
