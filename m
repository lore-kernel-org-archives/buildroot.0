From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 27 Jan 2019 16:59:36 -0200
Subject: [Buildroot] [PATCH 1/8] package/s6-networking: fix dependency when
 libressl is enabled
In-Reply-To: <20190127185943.1136-1-ricardo.martincoski@gmail.com>
References: <20190127185943.1136-1-ricardo.martincoski@gmail.com>
Message-ID: <20190127185943.1136-2-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit "c5b85231fb s6-networking: enable SSL if libressl is selected"
actually dropped the dependency on s6-dns and s6 when libressl is
enabled.
Fix this by using += inside the conditional code.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
NOTE: I don't know why the autobuilders didn't caught this.

On current master (f6843a75fe), test-pkg with this config:
BR2_PACKAGE_OPENSSL=y
BR2_PACKAGE_LIBRESSL=y
BR2_PACKAGE_S6_NETWORKING=y
results in:
6 builds, 1 skipped, 5 build failed, 0 legal-info failed
After this patch:
6 builds, 1 skipped, 0 build failed, 0 legal-info failed
---
 package/s6-networking/s6-networking.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/s6-networking/s6-networking.mk b/package/s6-networking/s6-networking.mk
index 7c9f087051..b621eb225d 100644
--- a/package/s6-networking/s6-networking.mk
+++ b/package/s6-networking/s6-networking.mk
@@ -12,33 +12,33 @@ S6_NETWORKING_INSTALL_STAGING = YES
 S6_NETWORKING_DEPENDENCIES = s6-dns s6
 
 S6_NETWORKING_CONF_OPTS = \
 	--prefix=/usr \
 	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
 	--with-include=$(STAGING_DIR)/usr/include \
 	--with-dynlib=$(STAGING_DIR)/usr/lib \
 	--with-lib=$(STAGING_DIR)/usr/lib/execline \
 	--with-lib=$(STAGING_DIR)/usr/lib/s6 \
 	--with-lib=$(STAGING_DIR)/usr/lib/s6-dns \
 	--with-lib=$(STAGING_DIR)/usr/lib/skalibs \
 	$(if $(BR2_STATIC_LIBS),,--disable-allstatic) \
 	$(SHARED_STATIC_LIBS_OPTS)
 
 ifeq ($(BR2_PACKAGE_LIBRESSL),y)
 S6_NETWORKING_CONF_OPTS += --enable-ssl=libressl
-S6_NETWORKING_DEPENDENCIES = libressl
+S6_NETWORKING_DEPENDENCIES += libressl
 endif
 
 define S6_NETWORKING_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure $(S6_NETWORKING_CONF_OPTS))
 endef
 
 define S6_NETWORKING_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
 endef
 
 define S6_NETWORKING_REMOVE_STATIC_LIB_DIR
 	rm -rf $(TARGET_DIR)/usr/lib/s6-networking
 endef
 
 S6_NETWORKING_POST_INSTALL_TARGET_HOOKS += S6_NETWORKING_REMOVE_STATIC_LIB_DIR
 
-- 
2.17.1
