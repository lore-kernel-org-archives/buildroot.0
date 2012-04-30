From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 30 Apr 2012 09:49:38 -0300
Subject: [Buildroot] [PATCH 4/4] dnsmasq: bump to version 2.61
In-Reply-To: <1335790178-25333-1-git-send-email-gustavo@zacarias.com.ar>
References: <1335790178-25333-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1335790178-25333-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump dnsmasq to version 2.61 and add new conntrack functionality.
This allows for more sturdy firewall setups and/or accounting.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dnsmasq/Config.in  |    6 ++++++
 package/dnsmasq/dnsmasq.mk |   14 +++++++++++++-
 2 files changed, 19 insertions(+), 1 deletions(-)

diff --git a/package/dnsmasq/Config.in b/package/dnsmasq/Config.in
index f434b8b..fa2499e 100644
--- a/package/dnsmasq/Config.in
+++ b/package/dnsmasq/Config.in
@@ -35,4 +35,10 @@ config BR2_PACKAGE_DNSMASQ_LUA
 	help
 	  Enable lua scripting for dnsmasq
 
+config BR2_PACKAGE_DNSMASQ_CONNTRACK
+	bool "conntrack marking support"
+	select BR2_PACKAGE_LIBNETFILTER_CONNTRACK
+	help
+	  Enable DNS query connection marking in netfilter.
+
 endif
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index c1995a0..3f189d7 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-DNSMASQ_VERSION = 2.60
+DNSMASQ_VERSION = 2.61
 DNSMASQ_SITE = http://thekelleys.org.uk/dnsmasq
 DNSMASQ_MAKE_ENV = CC="$(TARGET_CC)"
 DNSMASQ_MAKE_OPT = COPTS="$(DNSMASQ_COPTS)" PREFIX=/usr CFLAGS="$(TARGET_CFLAGS)"
@@ -28,6 +28,17 @@ ifeq ($(BR2_PACKAGE_DNSMASQ_IDN),y)
 	DNSMASQ_MAKE_OPT += LDFLAGS+="-lintl -lidn"
 endif
 
+ifeq ($(BR2_PACKAGE_DNSMASQ_CONNTRACK),y)
+	DNSMASQ_DEPENDENCIES += host-pkg-config libnetfilter_conntrack
+endif
+
+ifeq ($(BR2_PACKAGE_DNSMASQ_CONNTRACK),y)
+define DNSMASQ_ENABLE_CONNTRACK
+	$(SED) 's^.*#define HAVE_CONNTRACK.*^#define HAVE_CONNTRACK^' \
+		$(DNSMASQ_DIR)/src/config.h
+endef
+endif
+
 ifeq ($(BR2_PACKAGE_DNSMASQ_LUA),y)
 	DNSMASQ_DEPENDENCIES += lua
 	DNSMASQ_MAKE_OPT += LDFLAGS+="-ldl"
@@ -70,6 +81,7 @@ define DNSMASQ_BUILD_CMDS
 	$(DNSMASQ_FIX_PKGCONFIG)
 	$(DNSMASQ_ENABLE_DBUS)
 	$(DNSMASQ_ENABLE_LUA)
+	$(DNSMASQ_ENABLE_CONNTRACK)
 	$(DNSMASQ_MAKE_ENV) $(MAKE) -C $(@D) $(DNSMASQ_MAKE_OPT)
 endef
 
-- 
1.7.3.4
