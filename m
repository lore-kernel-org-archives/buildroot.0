From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 24 Jun 2018 17:44:52 +0200
Subject: [Buildroot] [PATCH 1/1] collectd: use --disable-werror
Message-ID: <20180624154452.31187-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since version 5.6.0, --disable-werror is available:
https://github.com/collectd/collectd/pull/1222

So use this option, instead of adding a hook to remove it from
Makefile.in

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/collectd/collectd.mk | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index ef45f342ae..589324e612 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -42,6 +42,7 @@ COLLECTD_CONF_OPTS += \
 	--with-nan-emulation \
 	--with-fp-layout=$(COLLECTD_FP_LAYOUT) \
 	--with-perl-bindings=no \
+	--disable-werror \
 	$(foreach p, $(COLLECTD_PLUGINS_DISABLE), --disable-$(p)) \
 	$(if $(BR2_PACKAGE_COLLECTD_AGGREGATION),--enable-aggregation,--disable-aggregation) \
 	$(if $(BR2_PACKAGE_COLLECTD_APACHE),--enable-apache,--disable-apache) \
@@ -194,14 +195,6 @@ else
 COLLECTD_CONF_OPTS += --with-libgcrypt=no
 endif
 
-# released software should not break on minor warnings
-define COLLECTD_DROP_WERROR
-	$(SED) 's/-Werror//' \
-		$(@D)/src/Makefile.in $(@D)/src/libcollectdclient/Makefile.in
-endef
-
-COLLECTD_POST_PATCH_HOOKS += COLLECTD_DROP_WERROR
-
 define COLLECTD_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
 	rm -f $(TARGET_DIR)/usr/bin/collectd-nagios
-- 
2.14.1
