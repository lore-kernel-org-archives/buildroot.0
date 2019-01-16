From: Vadim Kochan <vadim4j@gmail.com>
Date: Wed, 16 Jan 2019 23:51:33 +0200
Subject: [Buildroot] [RFC 1/3] package/s6-linux-init: Build also for the host
In-Reply-To: <20190116215135.32142-1-vadim4j@gmail.com>
References: <20190116215135.32142-1-vadim4j@gmail.com>
Message-ID: <20190116215135.32142-2-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add strict dependency for host-s6-linux-init to use s6-linux-init-maker
on the host during the rootfs generation.

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
---
 package/s6-linux-init/s6-linux-init.mk | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/package/s6-linux-init/s6-linux-init.mk b/package/s6-linux-init/s6-linux-init.mk
index d25504ae5a..913f837c1f 100644
--- a/package/s6-linux-init/s6-linux-init.mk
+++ b/package/s6-linux-init/s6-linux-init.mk
@@ -8,7 +8,7 @@ S6_LINUX_INIT_VERSION = 0.4.0.0
 S6_LINUX_INIT_SITE = http://skarnet.org/software/s6-linux-init
 S6_LINUX_INIT_LICENSE = ISC
 S6_LINUX_INIT_LICENSE_FILES = COPYING
-S6_LINUX_INIT_DEPENDENCIES = s6 s6-linux-utils s6-portable-utils
+S6_LINUX_INIT_DEPENDENCIES = s6 s6-linux-utils s6-portable-utils host-s6-linux-init
 
 S6_LINUX_INIT_CONF_OPTS = \
 	--prefix=/usr \
@@ -33,4 +33,31 @@ define S6_LINUX_INIT_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
 endef
 
+HOST_S6_LINUX_INIT_DEPENDENCIES = host-s6
+
+HOST_S6_LINUX_INIT_CONF_OPTS = \
+	--prefix=$(HOST_DIR) \
+	--with-sysdeps=$(HOST_DIR)/usr/lib/skalibs/sysdeps \
+	--with-include=$(HOST_DIR)/usr/include \
+	--with-dynlib=$(HOST_DIR)/usr/lib \
+	--with-lib=$(HOST_DIR)/usr/lib/execline \
+	--with-lib=$(HOST_DIR)/usr/lib/s6 \
+	--with-lib=$(HOST_DIR)/usr/lib/skalibs \
+	--disable-static \
+	--enable-shared \
+	--disable-allstatic
+
+define HOST_S6_LINUX_INIT_CONFIGURE_CMDS
+	(cd $(@D); $(HOST_CONFIGURE_OPTS) ./configure $(HOST_S6_LINUX_INIT_CONF_OPTS))
+endef
+
+define HOST_S6_LINUX_INIT_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define HOST_S6_LINUX_INIT_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) install
+endef
+
 $(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
2.14.1
