From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 22 Jan 2012 14:50:24 +0100
Subject: [Buildroot] [PATCH 1/2] re: new package
Message-ID: <1327240226-6082-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Laurent Kersten <laurent.kersten@essensium.com>
---
 package/Config.in    |    1 +
 package/re/Config.in |   11 +++++++++++
 package/re/re.mk     |   49 +++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 61 insertions(+), 0 deletions(-)
 create mode 100644 package/re/Config.in
 create mode 100644 package/re/re.mk

diff --git a/package/Config.in b/package/Config.in
index efed5a0..100ee53 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -353,6 +353,7 @@ source "package/libmbus/Config.in"
 source "package/libnl/Config.in"
 source "package/libpcap/Config.in"
 source "package/libosip2/Config.in"
+source "package/re/Config.in"
 source "package/librsync/Config.in"
 source "package/libsoup/Config.in"
 source "package/libupnp/Config.in"
diff --git a/package/re/Config.in b/package/re/Config.in
new file mode 100644
index 0000000..c458ba6
--- /dev/null
+++ b/package/re/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_RE
+	bool "re library"
+	help
+	  Toolkit library for asynchronous network IO
+	  with protocol stacks including SIP, SDP, RTP,
+	  STUN, TURN, ICE and DNS.
+
+	  Warning: if you use uClibc, you must enable
+	  UCLIBC_HAS_BSD_RES_CLOSE.
+  
+	  http://www.creytiv.com
diff --git a/package/re/re.mk b/package/re/re.mk
new file mode 100644
index 0000000..93bc50a
--- /dev/null
+++ b/package/re/re.mk
@@ -0,0 +1,49 @@
+#############################################################
+#
+# re
+#
+#############################################################
+
+RE_VERSION = 0.2.0
+RE_SITE = http://www.creytiv.com/pub
+RE_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+RE_DEPENDENCIES += openssl
+endif
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+RE_DEPENDENCIES += zlib
+endif
+
+RE_MAKE_ENV = \
+	$(TARGET_CONFIGURE_OPTS) \
+	SYSROOT=$(STAGING_DIR)/usr \
+	LFLAGS="$(TARGET_LDFLAGS)"
+
+define RE_BUILD_CMDS
+	$(RE_MAKE_ENV) $(MAKE) -C $(@D) all
+endef
+
+define RE_CLEAN_CMDS
+	$(RE_MAKE_ENV) $(MAKE) -C $(@D) clean
+endef
+
+define RE_INSTALL_STAGING_CMDS
+	$(RE_MAKE_ENV) DESTDIR=$(STAGING_DIR) $(MAKE) -C $(@D) install
+endef
+
+define RE_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 644 -D $(@D)/libre.so $(TARGET_DIR)/usr/lib/libre.so
+endef
+
+define RE_UNINSTALL_STAGING_CMDS
+	$(RM) -r $(STAGING_DIR)/usr/include/re
+	$(RM) $(STAGING_DIR)/usr/lib/libre.a
+	$(RM) $(STAGING_DIR)/usr/lib/libre.so
+endef
+
+define RE_UNINSTALL_TARGET_CMDS
+	$(RM) $(TARGET_DIR)/usr/lib/libre.so
+endef
+
+$(eval $(call GENTARGETS))
-- 
1.7.8.3
