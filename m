From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 3 Oct 2009 22:01:08 +0200
Subject: [Buildroot] [git commit master] quagga: snmp support needs netsnmp
Message-ID: <20091003200149.D5E93776FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0d6bea5119e25ee3c331ab27b30886cceee11aa1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/quagga/Config.in |    1 +
 package/quagga/quagga.mk |    5 ++++-
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/package/quagga/Config.in b/package/quagga/Config.in
index e1a5c73..e540cc6 100644
--- a/package/quagga/Config.in
+++ b/package/quagga/Config.in
@@ -59,6 +59,7 @@ config BR2_PACKAGE_QUAGGA_NETLINK
 
 config BR2_PACKAGE_QUAGGA_SNMP
 	bool "SNMP support"
+	select BR2_PACKAGE_NETSNMP
 
 config BR2_PACKAGE_QUAGGA_TCP_ZEBRA
 	bool "TCP/IP socket connection between zebra and proto daemon"
diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index fb520ee..d2f0616 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -10,6 +10,8 @@ QUAGGA_DIR:=$(BUILD_DIR)/quagga-$(QUAGGA_VERSION)
 QUAGGA_CAT:=$(ZCAT)
 
 QUAGGA_CONFIGURE:=
+QUAGGA_DEPENDENCIES:=
+
 ifeq ($(BR2_PACKAGE_QUAGGA_ZEBRA),y)
 QUAGGA_CONFIGURE+=--enable-zebra
 ifndef QUAGGA_TARGET_BINARY
@@ -96,6 +98,7 @@ QUAGGA_CONFIGURE+=--disable-netlink
 endif
 ifeq ($(BR2_PACKAGE_QUAGGA_SNMP),y)
 QUAGGA_CONFIGURE+=--enable-snmp
+QUAGGA_DEPENDENCIES+=netsnmp
 else
 QUAGGA_CONFIGURE+=--disable-snmp
 endif
@@ -163,7 +166,7 @@ ifneq ($(BR2_HAVE_INFOPAGES),y)
 	rm -rf $(TARGET_DIR)/usr/info
 endif
 
-quagga: $(TARGET_DIR)/usr/sbin/$(QUAGGA_TARGET_BINARY)
+quagga: $(QUAGGA_DEPENDENCIES) $(TARGET_DIR)/usr/sbin/$(QUAGGA_TARGET_BINARY)
 
 quagga-clean:
 	-$(MAKE) DESTDIR=$(TARGET_DIR) -C $(QUAGGA_DIR) uninstall
-- 
1.6.3.3
