From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Dec 2018 16:48:22 +0100
Subject: [Buildroot] [PATCH] package/lldpd: fix readline dependency
Message-ID: <20181210154822.24110-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

lldpd can optionally depend on readline, but readline is never added
to LLDPD_DEPENDENCIES, which this commit fixes.

This was detected using per-package directories.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lldpd/lldpd.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/lldpd/lldpd.mk b/package/lldpd/lldpd.mk
index 939cd128fa..6a520448da 100644
--- a/package/lldpd/lldpd.mk
+++ b/package/lldpd/lldpd.mk
@@ -36,7 +36,6 @@ LLDPD_CONF_OPTS = \
 	--without-libbsd \
 	--disable-hardening \
 	--disable-privsep \
-	$(if $(BR2_PACKAGE_READLINE),--with-readline,--without-readline) \
 	$(if $(BR2_PACKAGE_LLDPD_CDP),--enable-cdp,--disable-cdp) \
 	$(if $(BR2_PACKAGE_LLDPD_FDP),--enable-fdp,--disable-fdp) \
 	$(if $(BR2_PACKAGE_LLDPD_EDP),--enable-edp,--disable-edp) \
@@ -46,6 +45,13 @@ LLDPD_CONF_OPTS = \
 	$(if $(BR2_PACKAGE_LLDPD_DOT3),--enable-dot3,--disable-dot3) \
 	$(if $(BR2_PACKAGE_LLDPD_CUSTOM_TLV),--enable-custom,--disable-custom)
 
+ifeq ($(BR2_PACKAGE_READLINE),y)
+LLDPD_CONF_OPTS += --with-readline
+LLDPD_DEPENDENCIES += readline
+else
+LLDPD_CONF_OPTS += --without-readline
+endif
+
 define LLDPD_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/lldpd/S60lldpd \
 		$(TARGET_DIR)/etc/init.d/S60lldpd
-- 
2.19.2
