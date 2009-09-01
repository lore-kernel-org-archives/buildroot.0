From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 1 Sep 2009 23:05:30 +0200
Subject: [Buildroot] [git commit master] dnsmasq: misc fixes
Message-ID: <20090901210607.012FD776BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=74834991a8d2a308b46d0d1375ffab90c75c6c39
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #527

* convert to Makefile.autotools.in format
* Bump to version 2.50 fixes security issues CVE 2009-2957 and 2009-2958.
* fix dbus paths and dependencies
* Install manpage conditionally
* Introduce new DHCP server option

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Daniele Salvatore Albano <d.albano@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    6 +++
 package/dnsmasq/Config.in  |    7 ++++
 package/dnsmasq/dnsmasq.mk |   82 ++++++++++++++++----------------------------
 3 files changed, 43 insertions(+), 52 deletions(-)

diff --git a/CHANGES b/CHANGES
index d6dd84e..414aa16 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,9 @@
+2009.11, Not yet released:
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#527: misc fixes for dnsmasq package
+
 2009.08, Released August 31th, 2009:
 
 	Additional fixes and cleanups.
diff --git a/package/dnsmasq/Config.in b/package/dnsmasq/Config.in
index a6c7502..073f57b 100644
--- a/package/dnsmasq/Config.in
+++ b/package/dnsmasq/Config.in
@@ -13,3 +13,10 @@ config BR2_PACKAGE_DNSMASQ_TFTP
 	help
 	  Enable TFTP support in dnsmasq.
 
+config BR2_PACKAGE_DNSMASQ_DHCP
+	bool "dhcp support"
+	default y
+	depends on BR2_PACKAGE_DNSMASQ
+	help
+	  Enable DHCP server support in dnsmasq.
+
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 59ca4d4..d37c65f 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -4,81 +4,59 @@
 #
 #############################################################
 
-DNSMASQ_SITE:=http://thekelleys.org.uk/dnsmasq
-DNSMASQ_UPVER:=2.47
-DNSMASQ_SOURCE:=dnsmasq-$(DNSMASQ_UPVER).tar.gz
-DNSMASQ_DIR:=$(BUILD_DIR)/dnsmasq-$(DNSMASQ_UPVER)
-DNSMASQ_BINARY:=dnsmasq
-DNSMASQ_TARGET_BINARY:=usr/sbin/dnsmasq
+DNSMASQ_VERSION = 2.50
+DNSMASQ_SOURCE = dnsmasq-$(DNSMASQ_VERSION).tar.gz
+DNSMASQ_SITE = http://thekelleys.org.uk/dnsmasq
+DNSMASQ_AUTORECONF = NO
+DNSMASQ_MAKE_ENV = CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)"
+DNSMASQ_MAKE_OPT = COPTS="$(DNSMASQ_COPTS)" PREFIX=/usr
+DNSMASQ_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) PREFIX=/usr install
 
-DNSMASQ_COPTS:=
+DNSMASQ_DEPENDENCIES = uclibc
 
 ifneq ($(BR2_INET_IPV6),y)
-DNSMASQ_COPTS+=-DNO_IPV6
+DNSMASQ_COPTS += -DNO_IPV6
+endif
+
+ifneq ($(BR2_PACKAGE_DNSMASQ_DHCP),y)
+DNSMASQ_COPTS += -DNO_DHCP
 endif
 
 ifneq ($(BR2_PACKAGE_DNSMASQ_TFTP),y)
-DNSMASQ_COPTS+=-DNO_TFTP
+DNSMASQ_COPTS += -DNO_TFTP
 endif
 
 ifneq ($(BR2_LARGEFILE),y)
-DNSMASQ_COPTS+=-DNO_LARGEFILE
+DNSMASQ_COPTS += -DNO_LARGEFILE
 endif
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
-DNSMASQ_DBUS:=dbus
-else
-DNSMASQ_DBUS:=
+DNSMASQ_DEPENDENCIES += host-pkgconfig dbus
 endif
 
-$(DL_DIR)/$(DNSMASQ_SOURCE):
-	$(call DOWNLOAD,$(DNSMASQ_SITE),$(DNSMASQ_SOURCE))
+$(eval $(call AUTOTARGETS,package,dnsmasq))
 
-$(DNSMASQ_DIR)/.source: $(DL_DIR)/$(DNSMASQ_SOURCE)
-	$(ZCAT) $(DL_DIR)/$(DNSMASQ_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(DNSMASQ_DIR) package/dnsmasq/ \*.patch
-	touch $@
-
-$(DNSMASQ_DIR)/src/$(DNSMASQ_BINARY): $(DNSMASQ_DIR)/.source $(DNSMASQ_DBUS)
+$(DNSMASQ_TARGET_CONFIGURE):
 ifeq ($(BR2_PACKAGE_DBUS),y)
 	$(SED) 's^.*#define HAVE_DBUS.*^#define HAVE_DBUS^' \
 		$(DNSMASQ_DIR)/src/config.h
+	$(SED) 's^PKG_CONFIG = pkg-config^PKG_CONFIG = $(PKG_CONFIG_HOST_BINARY)^' \
+		$(DNSMASQ_DIR)/Makefile
+	$(SED) 's^--cflags dbus-1^--cflags dbus-1 \| sed s\\\#-I/\\\#-I$(STAGING_DIR)/\\\#g^' \
+		$(DNSMASQ_DIR)/Makefile
 else
 	$(SED) 's^.*#define HAVE_DBUS.*^/* #define HAVE_DBUS */^' \
 		$(DNSMASQ_DIR)/src/config.h
 endif
-	$(MAKE) CC=$(TARGET_CC) CFLAGS="$(TARGET_CFLAGS)" AWK=awk \
-		COPTS='$(DNSMASQ_COPTS)' PREFIX=/usr -C $(DNSMASQ_DIR)
-	touch -c $@
+	touch $@
 
-$(TARGET_DIR)/$(DNSMASQ_TARGET_BINARY): $(DNSMASQ_DIR)/src/$(DNSMASQ_BINARY)
-	$(MAKE) DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(DNSMASQ_DIR) install
-	$(STRIPCMD) $(TARGET_DIR)/$(DNSMASQ_TARGET_BINARY)
-	mkdir -p $(TARGET_DIR)/var/lib/misc
-	# Isn't this vulnerable to symlink attacks?
-	ln -sf /tmp/dnsmasq.leases $(TARGET_DIR)/var/lib/misc/dnsmasq.leases
+$(DNSMASQ_HOOK_POST_INSTALL):
 ifneq ($(BR2_HAVE_MANPAGES),y)
-	rm -rf $(TARGET_DIR)/usr/share/man
+	rm -f $(TARGET_DIR)/usr/share/man/man8/dnsmasq.8
 endif
-	touch -c $@
-
-dnsmasq: uclibc $(TARGET_DIR)/$(DNSMASQ_TARGET_BINARY)
 
-dnsmasq-source: $(DL_DIR)/$(DNSMASQ_SOURCE)
-
-dnsmasq-clean:
-	rm -f $(addprefix $(TARGET_DIR)/,var/lib/misc/dnsmasq.leases \
-					 usr/share/man/man?/dnsmasq.* \
-					 $(DNSMASQ_TARGET_BINARY))
-	-$(MAKE) -C $(DNSMASQ_DIR) clean
-
-dnsmasq-dirclean:
-	rm -rf $(DNSMASQ_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_DNSMASQ),y)
-TARGETS+=dnsmasq
-endif
+$(DNSMASQ_TARGET_UNINSTALL):
+	$(call MESSAGE,"Uninstalling")
+	rm -f $(TARGET_DIR)/usr/sbin/dnsmasq
+	rm -f $(TARGET_DIR)/usr/share/man/man8/dnsmasq.8
+	rm -f $(DNSMASQ_TARGET_INSTALL_TARGET) $(DNSMASQ_HOOK_POST_INSTALL)
-- 
1.6.3.3
