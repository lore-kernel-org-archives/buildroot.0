From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Jan 2015 14:37:10 +0100
Subject: [Buildroot] [git commit] sofia-sip: new package
Message-ID: <20150101135131.689E8807F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fbfa66535072bf6bffdddfbe30f8adda801d13b2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
 - Add better Config.in help text.
 - Fix the hash file format.
 - Fix comment header in .mk file.
 - Remove SOURCE variable, as it had the default value.
 - Add dependency on host-pkgconf, used by the configure script.
 - Add LICENSE and LICENSE_FILES variables.
 - Do not use BR2_HAVE_DOCUMENTATION, this option has been
   removed. Instead, always disable doxygen.
 - Simplify the IPv6 test.
 - Add optional dependency on OpenSSL.
 - Fixup the handling of the --enable-ndebug.]

Signed-off-by: Gregory Dymarek <gregd72002@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 package/sofia-sip/Config.in                        |   10 +++++
 ...ag.h-reintroduce-soatag_local_sdp_str_ref.patch |   26 +++++++++++++
 package/sofia-sip/sofia-sip.hash                   |    2 +
 package/sofia-sip/sofia-sip.mk                     |   38 ++++++++++++++++++++
 5 files changed, 77 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 0d7ff76..43b2b61 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -865,6 +865,7 @@ menu "Networking"
 	source "package/rtmpdump/Config.in"
 	source "package/slirp/Config.in"
 	source "package/snmppp/Config.in"
+	source "package/sofia-sip/Config.in"
 	source "package/thrift/Config.in"
 	source "package/usbredir/Config.in"
 	source "package/wvstreams/Config.in"
diff --git a/package/sofia-sip/Config.in b/package/sofia-sip/Config.in
new file mode 100644
index 0000000..9e42ff7
--- /dev/null
+++ b/package/sofia-sip/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_SOFIA_SIP
+	bool "sofia-sip"
+	help
+	  Sofia-SIP is an open-source SIP User-Agent library,
+	  compliant with the IETF RFC3261 specification (see the
+	  feature table). It can be used as a building block for SIP
+	  client software for uses such as VoIP, IM, and many other
+	  real-time and person-to-person communication services.
+
+	  http://sofia-sip.sourceforge.net/
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
index 0000000..fe9c4b1
--- /dev/null
+++ b/package/sofia-sip/sofia-sip.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 2b01bc2e1826e00d1f7f57d29a2854b15fd5fe24695e47a14a735d195dd37c81 sofia-sip-1.12.11.tar.gz
diff --git a/package/sofia-sip/sofia-sip.mk b/package/sofia-sip/sofia-sip.mk
new file mode 100644
index 0000000..8bb40f1
--- /dev/null
+++ b/package/sofia-sip/sofia-sip.mk
@@ -0,0 +1,38 @@
+################################################################################
+#
+# sofia-sip
+#
+################################################################################
+
+SOFIA_SIP_VERSION = 1.12.11
+SOFIA_SIP_SITE = http://downloads.sourceforge.net/project/sofia-sip/sofia-sip/$(SOFIA_SIP_VERSION)
+SOFIA_SIP_INSTALL_STAGING = YES
+SOFIA_SIP_DEPENDENCIES = host-pkgconf
+SOFIA_SIP_LICENSE = LGPLv2.1+
+SOFIA_SIP_LICENSE_FILES = COPYING COPYRIGHTS
+
+SOFIA_SIP_CONF_OPTS = --with-doxygen=no
+
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_INET_IPV6),)
+SOFIA_SIP_CONF_OPTS = --disable-ip6
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
+SOFIA_SIP_CONF_OPTS += --with-glib
+SOFIA_SIP_DEPENDENCIES += libglib2
+else
+SOFIA_SIP_CONF_OPTS += --without-glib
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+SOFIA_SIP_CONF_OPTS += --with-openssl
+SOFIA_SIP_DEPENDENCIES += openssl
+else
+SOFIA_SIP_CONF_OPTS += --without-openssl
+endif
+
+ifeq ($(BR2_ENABLE_DEBUG),y)
+SOFIA_SIP_CONF_OPTS += --enable-ndebug
+endif
+
+$(eval $(autotools-package))
