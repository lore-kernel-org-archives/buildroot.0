From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 25 Mar 2013 19:36:35 +0100
Subject: [Buildroot] [git commit] dnsmasq: add missing dependency on
	host-gettext
Message-ID: <20130325191506.8191B9B2D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=af9605d822e8712c2bd4d3cb585595c2fe6b41a6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When idn support is enabled, the dnsmasq build procedure requires
xgettext, which is provided by host-gettext.

Moreover, dnsmasq.mk was not passing $(TARGET_MAKE_ENV) in the
environment, so $(HOST_DIR)/usr/bin was not in the PATH. For that
reason, the dnsmasq Makefile could not find the xgettext program.

Fixes:
http://autobuild.buildroot.org/results/f7feaa818500a369a6c4c5fd8899c168f21b1460/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dnsmasq/dnsmasq.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index fe75e7b..285f06e 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -6,7 +6,7 @@
 
 DNSMASQ_VERSION = 2.65
 DNSMASQ_SITE = http://thekelleys.org.uk/dnsmasq
-DNSMASQ_MAKE_ENV = CC="$(TARGET_CC)"
+DNSMASQ_MAKE_ENV = $(TARGET_MAKE_ENV) CC="$(TARGET_CC)"
 DNSMASQ_MAKE_OPT = COPTS="$(DNSMASQ_COPTS)" PREFIX=/usr CFLAGS="$(TARGET_CFLAGS)"
 DNSMASQ_MAKE_OPT += DESTDIR=$(TARGET_DIR) LDFLAGS="$(TARGET_LDFLAGS)"
 DNSMASQ_LICENSE = Dual GPLv2/GPLv3
@@ -26,7 +26,7 @@ endif
 
 # NLS requires IDN so only enable it (i18n) when IDN is true
 ifeq ($(BR2_PACKAGE_DNSMASQ_IDN),y)
-	DNSMASQ_DEPENDENCIES += libidn $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
+	DNSMASQ_DEPENDENCIES += libidn $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) host-gettext
 	DNSMASQ_MAKE_OPT += LDFLAGS+="-lidn $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),-lintl)"
 	DNSMASQ_COPTS += -DHAVE_IDN
 	DNSMASQ_I18N = $(if $(BR2_ENABLE_LOCALE),-i18n)
