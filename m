From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Apr 2018 21:34:50 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] dnsmasq: simplify build
 configuration
Message-ID: <20180410205255.8075D88398@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e78164574befccb595fe3c0c4c9a4ae07d85b7f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Drop direct sed'ing of config.h for HAVE_CONNTRACK, HAVE_LUASCRIPT, and
HAVE_DBUS. Use MAKE_OPTS COPTS parameters instead, like we do already
for all other options.

Rename DNSMASQ_ENABLE_LUA to DNSMASQ_TWEAK_LIBLUA since it now does only
that.

Merge two conntrack and three dbus conditional sections.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 1042fea88aea4ebddcac5e215286394f1ad012b4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dnsmasq/dnsmasq.mk | 42 ++++++++++--------------------------------
 1 file changed, 10 insertions(+), 32 deletions(-)

diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 18216a6e22..a4657e2a23 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -40,32 +40,31 @@ endif
 
 ifeq ($(BR2_PACKAGE_DNSMASQ_CONNTRACK),y)
 DNSMASQ_DEPENDENCIES += libnetfilter_conntrack
-endif
-
-ifeq ($(BR2_PACKAGE_DNSMASQ_CONNTRACK),y)
-define DNSMASQ_ENABLE_CONNTRACK
-	$(SED) 's^.*#define HAVE_CONNTRACK.*^#define HAVE_CONNTRACK^' \
-		$(DNSMASQ_DIR)/src/config.h
-endef
+DNSMASQ_COPTS += -DHAVE_CONNTRACK
 endif
 
 ifeq ($(BR2_PACKAGE_DNSMASQ_LUA),y)
 DNSMASQ_DEPENDENCIES += lua
+DNSMASQ_COPTS += -DHAVE_LUASCRIPT
 
 # liblua uses dlopen when dynamically linked
 ifneq ($(BR2_STATIC_LIBS),y)
 DNSMASQ_MAKE_OPTS += LIBS+="-ldl"
 endif
 
-define DNSMASQ_ENABLE_LUA
+define DNSMASQ_TWEAK_LIBLUA
 	$(SED) 's/lua5.2/lua/g' $(DNSMASQ_DIR)/Makefile
-	$(SED) 's^.*#define HAVE_LUASCRIPT.*^#define HAVE_LUASCRIPT^' \
-		$(DNSMASQ_DIR)/src/config.h
 endef
 endif
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
 DNSMASQ_DEPENDENCIES += dbus
+DNSMASQ_COPTS += -DHAVE_DBUS
+
+define DNSMASQ_INSTALL_DBUS
+	$(INSTALL) -m 0644 -D $(@D)/dbus/dnsmasq.conf \
+		$(TARGET_DIR)/etc/dbus-1/system.d/dnsmasq.conf
+endef
 endif
 
 define DNSMASQ_FIX_PKGCONFIG
@@ -73,33 +72,12 @@ define DNSMASQ_FIX_PKGCONFIG
 		$(DNSMASQ_DIR)/Makefile
 endef
 
-ifeq ($(BR2_PACKAGE_DBUS),y)
-define DNSMASQ_ENABLE_DBUS
-	$(SED) 's^.*#define HAVE_DBUS.*^#define HAVE_DBUS^' \
-		$(DNSMASQ_DIR)/src/config.h
-endef
-else
-define DNSMASQ_ENABLE_DBUS
-	$(SED) 's^.*#define HAVE_DBUS.*^/* #define HAVE_DBUS */^' \
-		$(DNSMASQ_DIR)/src/config.h
-endef
-endif
-
 define DNSMASQ_BUILD_CMDS
 	$(DNSMASQ_FIX_PKGCONFIG)
-	$(DNSMASQ_ENABLE_DBUS)
-	$(DNSMASQ_ENABLE_LUA)
-	$(DNSMASQ_ENABLE_CONNTRACK)
+	$(DNSMASQ_TWEAK_LIBLUA)
 	$(DNSMASQ_MAKE_ENV) $(MAKE) -C $(@D) $(DNSMASQ_MAKE_OPTS) all$(DNSMASQ_I18N)
 endef
 
-ifeq ($(BR2_PACKAGE_DBUS),y)
-define DNSMASQ_INSTALL_DBUS
-	$(INSTALL) -m 0644 -D $(@D)/dbus/dnsmasq.conf \
-		$(TARGET_DIR)/etc/dbus-1/system.d/dnsmasq.conf
-endef
-endif
-
 define DNSMASQ_INSTALL_TARGET_CMDS
 	$(DNSMASQ_MAKE_ENV) $(MAKE) -C $(@D) $(DNSMASQ_MAKE_OPTS) install$(DNSMASQ_I18N)
 	mkdir -p $(TARGET_DIR)/var/lib/misc/
