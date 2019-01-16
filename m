From: Vadim Kochan <vadim4j@gmail.com>
Date: Wed, 16 Jan 2019 23:51:35 +0200
Subject: [Buildroot] [RFC 3/3] package/s6-rc: Allow to integrate s6-rc
 services
In-Reply-To: <20190116215135.32142-1-vadim4j@gmail.com>
References: <20190116215135.32142-1-vadim4j@gmail.com>
Message-ID: <20190116215135.32142-4-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It allows to install s6-rc services by board or package into
/etc/s6-rc/service which will be compiled as s6-rc db as
/etc/s6-rc/compiled-initial. Services are compiled on stage
when rootfs overlay & post-build already performed.

Added rc.init & rc.shutdown scripts which are needed to run s6-rc
services.

This is very basic s6-rc system support which even does not have the
basic stuff like /proc /sys /dev setup, but this might be added in
future work.

All above is only possible if BR2_INIT_S6 is selected.

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
---
 package/s6-rc/rc.init     |  4 ++++
 package/s6-rc/rc.shutdown |  3 +++
 package/s6-rc/s6-rc.mk    | 32 ++++++++++++++++++++++++++++++++
 3 files changed, 39 insertions(+)
 create mode 100644 package/s6-rc/rc.init
 create mode 100644 package/s6-rc/rc.shutdown

diff --git a/package/s6-rc/rc.init b/package/s6-rc/rc.init
new file mode 100644
index 0000000000..6709c6488b
--- /dev/null
+++ b/package/s6-rc/rc.init
@@ -0,0 +1,4 @@
+#! /usr/bin/execlineb -P
+
+if { s6-rc-init /run/service }
+if { s6-rc -t 600000 -- change default }
diff --git a/package/s6-rc/rc.shutdown b/package/s6-rc/rc.shutdown
new file mode 100644
index 0000000000..58d49b5cfd
--- /dev/null
+++ b/package/s6-rc/rc.shutdown
@@ -0,0 +1,3 @@
+#! /usr/bin/execlineb -P
+
+s6-rc -da change
diff --git a/package/s6-rc/s6-rc.mk b/package/s6-rc/s6-rc.mk
index 222ba139c6..007e7d9e1b 100644
--- a/package/s6-rc/s6-rc.mk
+++ b/package/s6-rc/s6-rc.mk
@@ -11,6 +11,13 @@ S6_RC_LICENSE_FILES = COPYING
 S6_RC_INSTALL_STAGING = YES
 S6_RC_DEPENDENCIES = s6
 
+ifeq ($(BR2_INIT_S6),y)
+# Needs s6-rc-compile to create initial rc db, also
+# build after s6-linux-init to rewrite rc.init for run
+# s6-rc services.
+S6_RC_DEPENDENCIES += host-s6-rc s6-linux-init
+endif
+
 S6_RC_CONF_OPTS = \
 	--prefix=/usr \
 	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
@@ -44,6 +51,31 @@ define S6_RC_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
 endef
 
+ifeq ($(BR2_INIT_S6),y)
+
+define S6_RC_PREPARE_INIT_RC
+	mkdir -p $(TARGET_DIR)/etc/s6-rc/service/default
+	echo bundle > $(TARGET_DIR)/etc/s6-rc/service/default/type
+	touch $(TARGET_DIR)/etc/s6-rc/service/default/contents
+
+	mkdir -p $(TARGET_DIR)/etc/s6-rc/compiled-initial
+	ln -sf compiled-initial $(TARGET_DIR)/etc/s6-rc/compiled
+
+	$(INSTALL) -m 0755 $(S6_RC_PKGDIR)/rc.init $(TARGET_DIR)/etc/rc.init
+	$(INSTALL) -m 0755 $(S6_RC_PKGDIR)/rc.shutdown $(TARGET_DIR)/etc/rc.shutdown
+endef
+S6_RC_POST_INSTALL_TARGET_HOOKS += S6_RC_PREPARE_INIT_RC
+
+define S6_RC_FINALIZE_INIT_RC
+	rm -rf $(TARGET_DIR)/etc/s6-rc/compiled-initial
+	$(HOST_DIR)/bin/s6-rc-compile -v 1 \
+		$(TARGET_DIR)/etc/s6-rc/compiled-initial \
+		$(TARGET_DIR)/etc/s6-rc/service
+endef
+S6_RC_ROOTFS_PRE_CMD_HOOKS += S6_RC_FINALIZE_INIT_RC
+
+endif # BR2_INIT_S6
+
 HOST_S6_RC_DEPENDENCIES = host-s6
 
 HOST_S6_RC_CONF_OPTS = \
-- 
2.14.1
