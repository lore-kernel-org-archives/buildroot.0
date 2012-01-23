From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 23 Jan 2012 22:41:54 +0100
Subject: [Buildroot] [PATCH v2 1/2] libre: new package
Message-ID: <1327354915-2278-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Laurent Kersten <laurent.kersten@essensium.com>
---
v2: renamed re->libre
    Mention openssl and zlib support in Config.in help text
    Fix cross-compilation and ccache problems
---
 package/Config.in       |    1 +
 package/libre/Config.in |   15 +++++++++++
 package/libre/libre.mk  |   61 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 77 insertions(+), 0 deletions(-)
 create mode 100644 package/libre/Config.in
 create mode 100644 package/libre/libre.mk

diff --git a/package/Config.in b/package/Config.in
index f219e37..f4fa7c6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -352,6 +352,7 @@ source "package/libmbus/Config.in"
 source "package/libnl/Config.in"
 source "package/libpcap/Config.in"
 source "package/libosip2/Config.in"
+source "package/libre/Config.in"
 source "package/librsync/Config.in"
 source "package/libsoup/Config.in"
 source "package/libupnp/Config.in"
diff --git a/package/libre/Config.in b/package/libre/Config.in
new file mode 100644
index 0000000..444fc9c
--- /dev/null
+++ b/package/libre/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_LIBRE
+	bool "re library"
+	help
+	  Toolkit library for asynchronous network IO
+	  with protocol stacks including SIP, SDP, RTP,
+	  STUN, TURN, ICE and DNS.
+
+	  SSL support will be enabled if the OPENSSL library is
+	  selected, and compression support will be enabled if
+	  the ZLIB library is selected.
+
+	  Warning: if you use uClibc, you must enable
+	  UCLIBC_HAS_BSD_RES_CLOSE.
+  
+	  http://www.creytiv.com
diff --git a/package/libre/libre.mk b/package/libre/libre.mk
new file mode 100644
index 0000000..3ce7703
--- /dev/null
+++ b/package/libre/libre.mk
@@ -0,0 +1,61 @@
+#############################################################
+#
+# libre
+# http://www.creytiv.com
+#
+#############################################################
+
+LIBRE_VERSION = 0.2.0
+LIBRE_SITE = http://www.creytiv.com/pub
+LIBRE_SOURCE = re-$(LIBRE_VERSION).tar.gz
+LIBRE_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LIBRE_DEPENDENCIES += openssl
+endif
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+LIBRE_DEPENDENCIES += zlib
+endif
+
+LIBRE_MAKE_ENV = \
+	$(TARGET_CONFIGURE_OPTS) \
+	SYSROOT="$(STAGING_DIR)/usr" \
+	LFLAGS="$(TARGET_LDFLAGS)"
+
+LIBRE_MAKE_OPT = \
+	CC="$(TARGET_CC_NOCCACHE)" \
+	ARCH="$(ARCH)" \
+	OS=linux
+
+ifeq ($(BR2_CCACHE),y)
+LIBRE_MAKE_OPT += \
+	CCACHE=$(CCACHE)
+endif
+
+define LIBRE_BUILD_CMDS
+	$(LIBRE_MAKE_ENV) $(MAKE) -C $(@D) $(LIBRE_MAKE_OPT)
+endef
+
+define LIBRE_CLEAN_CMDS
+	$(LIBRE_MAKE_ENV) $(MAKE) -C $(@D) $(LIBRE_MAKE_OPT) clean
+endef
+
+define LIBRE_INSTALL_STAGING_CMDS
+	$(LIBRE_MAKE_ENV) DESTDIR=$(STAGING_DIR) $(MAKE) -C $(@D) $(LIBRE_MAKE_OPT) install
+endef
+
+define LIBRE_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 644 -D $(@D)/libre.so $(TARGET_DIR)/usr/lib/libre.so
+endef
+
+define LIBRE_UNINSTALL_STAGING_CMDS
+	$(RM) -r $(STAGING_DIR)/usr/include/re
+	$(RM) $(STAGING_DIR)/usr/lib/libre.a
+	$(RM) $(STAGING_DIR)/usr/lib/libre.so
+endef
+
+define LIBRE_UNINSTALL_TARGET_CMDS
+	$(RM) $(TARGET_DIR)/usr/lib/libre.so
+endef
+
+$(eval $(call GENTARGETS))
-- 
1.7.8.3
