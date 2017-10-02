From: Baruch Siach <baruch@tkos.co.il>
Date: Mon,  2 Oct 2017 20:38:26 +0300
Subject: [Buildroot] [PATCH v2 2/2] dnsmasq: simplify build configuration
In-Reply-To: <9b9ffd72d158a792696b98b6612e4e66ee11892a.1506965906.git.baruch@tkos.co.il>
References: <9b9ffd72d158a792696b98b6612e4e66ee11892a.1506965906.git.baruch@tkos.co.il>
Message-ID: <f88a9ebaa4fc5a3ac0b8697efaa5da40fd041e82.1506965906.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop direct sed'ing of config.h for HAVE_CONNTRACK, HAVE_LUASCRIPT, and
HAVE_DBUS. Use MAKE_OPTS COPTS parameters instead, like we do already
for all other options.

Rename DNSMASQ_ENABLE_LUA to DNSMASQ_TWEAK_LIBLUA since it now does only
that.

Merge two conntrack and three dbus conditional sections.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v2: No change
---
 package/dnsmasq/dnsmasq.mk | 42 ++++++++++--------------------------------
 1 file changed, 10 insertions(+), 32 deletions(-)

diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 7322170432a0..9f96030eb624 100644
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
-- 
2.14.2
