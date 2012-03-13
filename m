From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 13 Mar 2012 14:47:41 +0100
Subject: [Buildroot] [git commit] dnsmasq: bump to version 2.60
Message-ID: <20120313135401.AEC4B90D7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f1e2288d157b5cd8b4b8a037dfb77eb804703a53
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to version 2.60 of dnsmasq with the new lua scripting option.
Switch LDFLAGS from MAKE_ENV to MAKE_OPT to make it work properly.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dnsmasq/Config.in  |   13 ++++++++++---
 package/dnsmasq/dnsmasq.mk |   30 ++++++++++++++++++++++++------
 2 files changed, 34 insertions(+), 9 deletions(-)

diff --git a/package/dnsmasq/Config.in b/package/dnsmasq/Config.in
index e9c4870..f434b8b 100644
--- a/package/dnsmasq/Config.in
+++ b/package/dnsmasq/Config.in
@@ -6,26 +6,33 @@ config BR2_PACKAGE_DNSMASQ
 
 	  http://www.thekelleys.org.uk/dnsmasq/
 
+if BR2_PACKAGE_DNSMASQ
+
 config BR2_PACKAGE_DNSMASQ_TFTP
 	bool "tftp support"
 	default y
-	depends on BR2_PACKAGE_DNSMASQ
 	help
 	  Enable TFTP support in dnsmasq.
 
 config BR2_PACKAGE_DNSMASQ_DHCP
 	bool "dhcp support"
 	default y
-	depends on BR2_PACKAGE_DNSMASQ
 	help
 	  Enable DHCP server support in dnsmasq.
 
 config BR2_PACKAGE_DNSMASQ_IDN
 	bool "IDN support (BIG!)"
-	depends on BR2_PACKAGE_DNSMASQ
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_LIBINTL
 	select BR2_PACKAGE_LIBIDN
 	help
 	  Enable IDN support in dnsmasq.
 	  This option is a big space taker since is pulls in many libraries.
+
+config BR2_PACKAGE_DNSMASQ_LUA
+	bool "Lua scripting support"
+	select BR2_PACKAGE_LUA
+	help
+	  Enable lua scripting for dnsmasq
+
+endif
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index fc43abd..c1995a0 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -4,11 +4,11 @@
 #
 #############################################################
 
-DNSMASQ_VERSION = 2.59
+DNSMASQ_VERSION = 2.60
 DNSMASQ_SITE = http://thekelleys.org.uk/dnsmasq
-DNSMASQ_MAKE_ENV = CC="$(TARGET_CC)" LDFLAGS="$(TARGET_LDFLAGS)"
+DNSMASQ_MAKE_ENV = CC="$(TARGET_CC)"
 DNSMASQ_MAKE_OPT = COPTS="$(DNSMASQ_COPTS)" PREFIX=/usr CFLAGS="$(TARGET_CFLAGS)"
-DNSMASQ_MAKE_OPT += DESTDIR=$(TARGET_DIR)
+DNSMASQ_MAKE_OPT += DESTDIR=$(TARGET_DIR) LDFLAGS="$(TARGET_LDFLAGS)"
 
 ifneq ($(BR2_INET_IPV6),y)
 	DNSMASQ_COPTS += -DNO_IPV6
@@ -25,7 +25,20 @@ endif
 ifeq ($(BR2_PACKAGE_DNSMASQ_IDN),y)
 	DNSMASQ_MAKE_OPT += all-i18n
 	DNSMASQ_DEPENDENCIES += libidn libintl
-	DNSMASQ_MAKE_ENV += LDFLAGS+="-lintl -lidn"
+	DNSMASQ_MAKE_OPT += LDFLAGS+="-lintl -lidn"
+endif
+
+ifeq ($(BR2_PACKAGE_DNSMASQ_LUA),y)
+	DNSMASQ_DEPENDENCIES += lua
+	DNSMASQ_MAKE_OPT += LDFLAGS+="-ldl"
+endif
+
+ifeq ($(BR2_PACKAGE_DNSMASQ_LUA),y)
+define DNSMASQ_ENABLE_LUA
+	$(SED) 's/lua5.1/lua/g' $(DNSMASQ_DIR)/Makefile
+	$(SED) 's^.*#define HAVE_LUASCRIPT.*^#define HAVE_LUASCRIPT^' \
+		$(DNSMASQ_DIR)/src/config.h
+endef
 endif
 
 ifneq ($(BR2_LARGEFILE),y)
@@ -36,12 +49,15 @@ ifeq ($(BR2_PACKAGE_DBUS),y)
 	DNSMASQ_DEPENDENCIES += host-pkg-config dbus
 endif
 
+define DNSMASQ_FIX_PKGCONFIG
+	$(SED) 's^PKG_CONFIG = pkg-config^PKG_CONFIG = $(PKG_CONFIG_HOST_BINARY)^' \
+		$(DNSMASQ_DIR)/Makefile
+endef
+
 ifeq ($(BR2_PACKAGE_DBUS),y)
 define DNSMASQ_ENABLE_DBUS
 	$(SED) 's^.*#define HAVE_DBUS.*^#define HAVE_DBUS^' \
 		$(DNSMASQ_DIR)/src/config.h
-	$(SED) 's^PKG_CONFIG = pkg-config^PKG_CONFIG = $(PKG_CONFIG_HOST_BINARY)^' \
-		$(DNSMASQ_DIR)/Makefile
 endef
 else
 define DNSMASQ_ENABLE_DBUS
@@ -51,7 +67,9 @@ endef
 endif
 
 define DNSMASQ_BUILD_CMDS
+	$(DNSMASQ_FIX_PKGCONFIG)
 	$(DNSMASQ_ENABLE_DBUS)
+	$(DNSMASQ_ENABLE_LUA)
 	$(DNSMASQ_MAKE_ENV) $(MAKE) -C $(@D) $(DNSMASQ_MAKE_OPT)
 endef
 
