From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 25 Jun 2010 13:35:09 +0200
Subject: [Buildroot] [git commit master 1/1] dnsmasq: bump to 2.55 and
	migrate to gentargets
Message-ID: <20100625114235.3211481DD5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1c7de59a7387b3927e46e647a6654e48a05c85e3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #2005

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    3 +-
 package/dnsmasq/dnsmasq.mk |   45 ++++++++++++++++++++++++++-----------------
 2 files changed, 29 insertions(+), 19 deletions(-)

diff --git a/CHANGES b/CHANGES
index 585a700..8b0fb71 100644
--- a/CHANGES
+++ b/CHANGES
@@ -14,7 +14,7 @@
 	luasocket, rings, wsapi, xavante, xterm
 
 	Updated/fixed packages: berkeleydb, busybox, cdrkit, dash,
-	dialog, diffutils, distcc, dmalloc, fbv, file, gawk,
+	dialog, diffutils, distcc, dmalloc, dnsmasq, fbv, file, gawk,
 	gstreamer, gzip, intltool, ipsec-tools, iptables, libart,
 	libfuse, libgpg-error, libidn, liblockfile, links, lmbench,
 	lrzsz, make, module-init-tools, nbd, ncurses, netperf,
@@ -44,6 +44,7 @@
 	#1957: Bump sqlite to 3.6.23.1
 	#1987: intltool: Fix spelling mistake
 	#1999: Typo in path checking
+	#2005: Bump dnsmasq to 2.55 and migrate to gentargets
 	#2035: ipsec-tools-0.7.2 fails to build with gcc-4.4.x
 	#2038: Bump ncurses to 5.7
 	#2095: make gconfig: undefined reference to symbol 'dlsym@@GLIBC_2.2.5'
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index d32b794..ea47e96 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -4,57 +4,66 @@
 #
 #############################################################
 
-DNSMASQ_VERSION = 2.52
+DNSMASQ_VERSION = 2.55
 DNSMASQ_SITE = http://thekelleys.org.uk/dnsmasq
-DNSMASQ_AUTORECONF = NO
 DNSMASQ_MAKE_ENV = CC="$(TARGET_CC)" LDFLAGS="$(TARGET_LDFLAGS)"
 DNSMASQ_MAKE_OPT = COPTS="$(DNSMASQ_COPTS)" PREFIX=/usr CFLAGS="$(TARGET_CFLAGS)"
-DNSMASQ_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) PREFIX=/usr install
+DNSMASQ_MAKE_OPT += DESTDIR=$(TARGET_DIR)
 
 ifneq ($(BR2_INET_IPV6),y)
-DNSMASQ_COPTS += -DNO_IPV6
+	DNSMASQ_COPTS += -DNO_IPV6
 endif
 
 ifneq ($(BR2_PACKAGE_DNSMASQ_DHCP),y)
-DNSMASQ_COPTS += -DNO_DHCP
+	DNSMASQ_COPTS += -DNO_DHCP
 endif
 
 ifneq ($(BR2_PACKAGE_DNSMASQ_TFTP),y)
-DNSMASQ_COPTS += -DNO_TFTP
+	DNSMASQ_COPTS += -DNO_TFTP
 endif
 
 ifeq ($(BR2_PACKAGE_DNSMASQ_IDN),y)
-DNSMASQ_MAKE_OPT += all-i18n
-DNSMASQ_DEPENDENCIES += libidn libintl
-DNSMASQ_MAKE_ENV += LDFLAGS+="-lintl"
+	DNSMASQ_MAKE_OPT += all-i18n
+	DNSMASQ_DEPENDENCIES += libidn libintl
+	DNSMASQ_MAKE_ENV += LDFLAGS+="-lintl"
 endif
 
 ifneq ($(BR2_LARGEFILE),y)
-DNSMASQ_COPTS += -DNO_LARGEFILE
+	DNSMASQ_COPTS += -DNO_LARGEFILE
 endif
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
-DNSMASQ_DEPENDENCIES += host-pkg-config dbus
+	DNSMASQ_DEPENDENCIES += host-pkg-config dbus
 endif
 
-$(eval $(call AUTOTARGETS,package,dnsmasq))
-
-$(DNSMASQ_TARGET_CONFIGURE):
 ifeq ($(BR2_PACKAGE_DBUS),y)
+define DNSMASQ_ENABLE_DBUS
 	$(SED) 's^.*#define HAVE_DBUS.*^#define HAVE_DBUS^' \
 		$(DNSMASQ_DIR)/src/config.h
 	$(SED) 's^PKG_CONFIG = pkg-config^PKG_CONFIG = $(PKG_CONFIG_HOST_BINARY)^' \
 		$(DNSMASQ_DIR)/Makefile
 	$(SED) 's^--cflags dbus-1^--cflags dbus-1 \| sed s\\\#-I/\\\#-I$(STAGING_DIR)/\\\#g^' \
 		$(DNSMASQ_DIR)/Makefile
+endef
 else
+define DNSMASQ_ENABLE_DBUS
 	$(SED) 's^.*#define HAVE_DBUS.*^/* #define HAVE_DBUS */^' \
 		$(DNSMASQ_DIR)/src/config.h
+endef
 endif
-	touch $@
 
-$(DNSMASQ_TARGET_UNINSTALL):
-	$(call MESSAGE,"Uninstalling")
+define DNSMASQ_BUILD_CMDS
+	$(DNSMASQ_ENABLE_DBUS)
+	$(DNSMASQ_MAKE_ENV) $(MAKE) -C $(@D) $(DNSMASQ_MAKE_OPT)
+endef
+
+define DNSMASQ_INSTALL_TARGET_CMDS
+	$(DNSMASQ_MAKE_ENV) $(MAKE) -C $(@D) $(DNSMASQ_MAKE_OPT) install
+endef
+
+define DNSMASQ_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/sbin/dnsmasq
 	rm -f $(TARGET_DIR)/usr/share/man/man8/dnsmasq.8
-	rm -f $(DNSMASQ_TARGET_INSTALL_TARGET) $(DNSMASQ_HOOK_POST_INSTALL)
+endef
+
+$(eval $(call GENTARGETS,package,dnsmasq))
-- 
1.7.1
