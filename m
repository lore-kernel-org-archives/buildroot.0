From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 19 Mar 2012 09:17:50 -0300
Subject: [Buildroot] [PATCH 3/3] dnsmasq: add option to support conntrack
In-Reply-To: <1332159470-13304-1-git-send-email-gustavo@zacarias.com.ar>
References: <1332159470-13304-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1332159470-13304-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add an option to support conntrack marking of DNS packets.
This allows for more sturdy firewall setups and/or accounting.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dnsmasq/Config.in  |    6 ++++++
 package/dnsmasq/dnsmasq.mk |   12 ++++++++++++
 2 files changed, 18 insertions(+), 0 deletions(-)

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
index c1995a0..205921f 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
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
