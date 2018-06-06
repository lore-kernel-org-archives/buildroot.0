From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Jun 2018 22:19:55 +0200
Subject: [Buildroot] [git commit] dnsmasq: NLS/i18n does not mandate libidn
 anymore
Message-ID: <20180606201820.8575C83D92@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2d6300e67f69695fb8af0c923a2bd037a0434777
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since May 2017, automatic inclusion of IDN has been removed when
building internationalisation support:
http://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=43cdf1c3d074e75389392d495690923ef37d3248

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dnsmasq/dnsmasq.mk | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index f519835828..79c5619966 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -9,11 +9,14 @@ DNSMASQ_SOURCE = dnsmasq-$(DNSMASQ_VERSION).tar.xz
 DNSMASQ_SITE = http://thekelleys.org.uk/dnsmasq
 DNSMASQ_MAKE_ENV = $(TARGET_MAKE_ENV) CC="$(TARGET_CC)"
 DNSMASQ_MAKE_OPTS = COPTS="$(DNSMASQ_COPTS)" PREFIX=/usr CFLAGS="$(TARGET_CFLAGS)"
-DNSMASQ_MAKE_OPTS += DESTDIR=$(TARGET_DIR) LDFLAGS="$(TARGET_LDFLAGS)"
-DNSMASQ_DEPENDENCIES = host-pkgconf
+DNSMASQ_MAKE_OPTS += DESTDIR=$(TARGET_DIR) LDFLAGS="$(TARGET_LDFLAGS)" \
+	LIBS+=$(TARGET_NLS_LIBS)
+DNSMASQ_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 DNSMASQ_LICENSE = GPL-2.0 or GPL-3.0
 DNSMASQ_LICENSE_FILES = COPYING COPYING-v3
 
+DNSMASQ_I18N = $(if $(BR2_SYSTEM_ENABLE_NLS),-i18n)
+
 ifneq ($(BR2_PACKAGE_DNSMASQ_DHCP),y)
 DNSMASQ_COPTS += -DNO_DHCP
 endif
@@ -30,12 +33,9 @@ ifneq ($(BR2_PACKAGE_DNSMASQ_TFTP),y)
 DNSMASQ_COPTS += -DNO_TFTP
 endif
 
-# NLS requires IDN so only enable it (i18n) when IDN is true
 ifeq ($(BR2_PACKAGE_DNSMASQ_IDN),y)
-DNSMASQ_DEPENDENCIES += libidn $(TARGET_NLS_DEPENDENCIES)
-DNSMASQ_MAKE_OPTS += LIBS+=$(TARGET_NLS_LIBS)
+DNSMASQ_DEPENDENCIES += libidn
 DNSMASQ_COPTS += -DHAVE_IDN
-DNSMASQ_I18N = $(if $(BR2_SYSTEM_ENABLE_NLS),-i18n)
 endif
 
 ifeq ($(BR2_PACKAGE_DNSMASQ_CONNTRACK),y)
