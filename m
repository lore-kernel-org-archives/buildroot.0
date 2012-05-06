From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 6 May 2012 23:18:17 +0200
Subject: [Buildroot] [git commit] dnsmasq: bump to version 2.61 and enhance
Message-ID: <20120506212039.05CF696A44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=025eb2fb908cb3c500e69225832b59b5ffb08cf5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to dnsmasq version 2.61.
Add new conntrack functionality: makes for more sturdy firewall setups.
Make IDN build without libintl, it's no longer needed and problematic
for other packages when there's no NLS support enabled.
Locale support does require IDN so just build it when IDN=y.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dnsmasq/Config.in  |   13 ++++++++++---
 package/dnsmasq/dnsmasq.mk |   26 ++++++++++++++++++++------
 2 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/package/dnsmasq/Config.in b/package/dnsmasq/Config.in
index f434b8b..e67aa46 100644
--- a/package/dnsmasq/Config.in
+++ b/package/dnsmasq/Config.in
@@ -21,13 +21,14 @@ config BR2_PACKAGE_DNSMASQ_DHCP
 	  Enable DHCP server support in dnsmasq.
 
 config BR2_PACKAGE_DNSMASQ_IDN
-	bool "IDN support (BIG!)"
+	bool "IDN support"
 	depends on BR2_USE_WCHAR
-	select BR2_PACKAGE_LIBINTL
 	select BR2_PACKAGE_LIBIDN
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  Enable IDN support in dnsmasq.
-	  This option is a big space taker since is pulls in many libraries.
+	  This option is a big space taker since it pulls in many libraries.
 
 config BR2_PACKAGE_DNSMASQ_LUA
 	bool "Lua scripting support"
@@ -35,4 +36,10 @@ config BR2_PACKAGE_DNSMASQ_LUA
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
index c1995a0..2e3575c 100644
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
@@ -22,10 +22,23 @@ ifneq ($(BR2_PACKAGE_DNSMASQ_TFTP),y)
 	DNSMASQ_COPTS += -DNO_TFTP
 endif
 
+# NLS requires IDN so only enable it (i18n) when IDN is true
 ifeq ($(BR2_PACKAGE_DNSMASQ_IDN),y)
-	DNSMASQ_MAKE_OPT += all-i18n
-	DNSMASQ_DEPENDENCIES += libidn libintl
-	DNSMASQ_MAKE_OPT += LDFLAGS+="-lintl -lidn"
+	DNSMASQ_DEPENDENCIES += libidn $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
+	DNSMASQ_MAKE_OPT += LDFLAGS+="-lidn $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),-lintl)"
+	DNSMASQ_COPTS += -DHAVE_IDN
+	DNSMASQ_I18N = $(if $(BR2_ENABLE_LOCALE),-i18n)
+endif
+
+ifeq ($(BR2_PACKAGE_DNSMASQ_CONNTRACK),y)
+	DNSMASQ_DEPENDENCIES += host-pkg-config libnetfilter_conntrack
+endif
+
+ifeq ($(BR2_PACKAGE_DNSMASQ_CONNTRACK),y)
+define DNSMASQ_ENABLE_CONNTRACK
+	$(SED) 's^.*#define HAVE_CONNTRACK.*^#define HAVE_CONNTRACK^' \
+		$(DNSMASQ_DIR)/src/config.h
+endef
 endif
 
 ifeq ($(BR2_PACKAGE_DNSMASQ_LUA),y)
@@ -70,11 +83,12 @@ define DNSMASQ_BUILD_CMDS
 	$(DNSMASQ_FIX_PKGCONFIG)
 	$(DNSMASQ_ENABLE_DBUS)
 	$(DNSMASQ_ENABLE_LUA)
-	$(DNSMASQ_MAKE_ENV) $(MAKE) -C $(@D) $(DNSMASQ_MAKE_OPT)
+	$(DNSMASQ_ENABLE_CONNTRACK)
+	$(DNSMASQ_MAKE_ENV) $(MAKE) -C $(@D) $(DNSMASQ_MAKE_OPT) all$(DNSMASQ_I18N)
 endef
 
 define DNSMASQ_INSTALL_TARGET_CMDS
-	$(DNSMASQ_MAKE_ENV) $(MAKE) -C $(@D) $(DNSMASQ_MAKE_OPT) install
+	$(DNSMASQ_MAKE_ENV) $(MAKE) -C $(@D) $(DNSMASQ_MAKE_OPT) install$(DNSMASQ_I18N)
 	mkdir -p $(TARGET_DIR)/var/lib/misc/
 endef
 
