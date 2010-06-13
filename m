From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 13 Jun 2010 23:46:26 +0200
Subject: [Buildroot] [git commit master 1/1] ipsec-tools: bump version,
	convert to autotools format and simplify Config.in
Message-ID: <20100613214747.A98A280DA7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=dff1d590b2a0fadf58b6eed60029b2ecbab7c710
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #2035

- Remove -Werror from CFLAGS
- Always enable ipv6 support if available in toolchain
- Always install into staging

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                            |    5 +-
 package/ipsec-tools/Config.in      |   26 +------
 package/ipsec-tools/ipsec-tools.mk |  151 +++++++-----------------------------
 3 files changed, 34 insertions(+), 148 deletions(-)

diff --git a/CHANGES b/CHANGES
index 3ba7195..a7fb6b3 100644
--- a/CHANGES
+++ b/CHANGES
@@ -8,8 +8,8 @@
 	luasocket, rings, wsapi, xavante
 
 	Updated/fixed packages: cdrkit, file, gawk, gstreamer, intltool,
-	iptables, libidn, lmbench, netperf, openssl, php, qt, sqlite,
-	tn5250, usbutils, xkeyboard-config
+	ipsec-tools, iptables, libidn, lmbench, netperf, openssl, php,
+	qt, sqlite, tn5250, usbutils, xkeyboard-config
 
 	Removed packages: modutils
 
@@ -31,6 +31,7 @@
 	#1957: Bump sqlite to 3.6.23.1
 	#1987: intltool: Fix spelling mistake
 	#1999: Typo in path checking
+	#2035: ipsec-tools-0.7.2 fails to build with gcc-4.4.x
 
 2010.05, Released May 30th, 2010:
 
diff --git a/package/ipsec-tools/Config.in b/package/ipsec-tools/Config.in
index d29cb86..8a5f3d1 100644
--- a/package/ipsec-tools/Config.in
+++ b/package/ipsec-tools/Config.in
@@ -6,16 +6,16 @@ config BR2_PACKAGE_IPSEC_TOOLS
 	help
 	  This package is required to support IPSec for Linux 2.6+
 
+if BR2_PACKAGE_IPSEC_TOOLS
+
 config BR2_PACKAGE_IPSEC_TOOLS_ADMINPORT
 	default y
-	depends on BR2_PACKAGE_IPSEC_TOOLS
 	bool "Enable racoonctl(8)."
 	help
 	  Lets racoon to listen to racoon admin port, which is to
 	  be contacted by racoonctl(8).
 
 config BR2_PACKAGE_IPSEC_TOOLS_NATT
-	depends on BR2_PACKAGE_IPSEC_TOOLS
 	bool "Enable NAT-Traversal"
 	help
 	  This needs kernel support, which is available on Linux. On
@@ -27,9 +27,7 @@ config BR2_PACKAGE_IPSEC_TOOLS_NATT
 	  live in a country where software patents are legal, using
 	  NAT-Traversal might infringe a patent.
 
-
 config BR2_PACKAGE_IPSEC_TOOLS_FRAG
-	depends on BR2_PACKAGE_IPSEC_TOOLS
 	bool "Enable IKE fragmentation."
 	help
 	  Enable IKE fragmentation, which is a workaround for
@@ -37,32 +35,12 @@ config BR2_PACKAGE_IPSEC_TOOLS_FRAG
 
 config BR2_PACKAGE_IPSEC_TOOLS_STATS
 	default y
-	depends on BR2_PACKAGE_IPSEC_TOOLS
 	bool "Enable statistics logging function."
 
-config BR2_PACKAGE_IPSEC_TOOLS_IPV6
-	default y
-	depends on BR2_PACKAGE_IPSEC_TOOLS && BR2_INET_IPV6
-	bool "Enable IPv6 support"
-	help
-	  This option has no effect if uClibc has been compiled without
-	  IPv6 support.
-
 config BR2_PACKAGE_IPSEC_TOOLS_READLINE
-	depends on BR2_PACKAGE_IPSEC_TOOLS
 	select BR2_PACKAGE_READLINE
 	bool "Enable readline input support if available."
 
-config BR2_PACKAGE_IPSEC_TOOLS_LIBS
-	bool "Install IPSec libraries under staging_dir/lib"
-	default y
-	depends on BR2_PACKAGE_IPSEC_TOOLS
-	help
-	  Install libipsec.a and libracoon.a under staging_dir/lib for further
-	  development on a host machine.
-
-if BR2_PACKAGE_IPSEC_TOOLS
-
 choice
 	prompt "Security context"
 	default BR2_PACKAGE_IPSEC_SECCTX_DISABLE
diff --git a/package/ipsec-tools/ipsec-tools.mk b/package/ipsec-tools/ipsec-tools.mk
index 911da7c..eddc7ce 100644
--- a/package/ipsec-tools/ipsec-tools.mk
+++ b/package/ipsec-tools/ipsec-tools.mk
@@ -4,158 +4,65 @@
 #
 #############################################################
 
-IPSEC_TOOLS_VERSION:=0.7.2
-IPSEC_TOOLS_SOURCE:=ipsec-tools-$(IPSEC_TOOLS_VERSION).tar.bz2
-IPSEC_TOOLS_CAT:=$(BZCAT)
-IPSEC_TOOLS_DIR:=$(BUILD_DIR)/ipsec-tools-$(IPSEC_TOOLS_VERSION)
+IPSEC_TOOLS_VERSION = 0.7.3
+IPSEC_TOOLS_SOURCE = ipsec-tools-$(IPSEC_TOOLS_VERSION).tar.bz2
+IPSEC_TOOLS_SITE = http://ftp.sunet.se/pub/NetBSD/misc/ipsec-tools/0.7/
+IPSEC_TOOLS_INSTALL_STAGING = YES
+IPSEC_TOOLS_DEPENDENCIES = openssl flex host-flex
 
-IPSEC_TOOLS_BINARY_SETKEY:=src/setkey/setkey
-IPSEC_TOOLS_BINARY_RACOON:=src/racoon/racoon
-IPSEC_TOOLS_BINARY_RACOONCTL:=src/racoon/racoonctl
+# configure hardcodes -Werror, so override CFLAGS on make invocation
+IPSEC_TOOLS_MAKE_OPT = CFLAGS='$(TARGET_CFLAGS)'
 
-IPSEC_TOOLS_TARGET_BINARY_SETKEY:=usr/sbin/setkey
-IPSEC_TOOLS_TARGET_BINARY_RACOON:=usr/sbin/racoon
-IPSEC_TOOLS_TARGET_BINARY_RACOONCTL:=usr/sbin/racoonctl
-IPSEC_TOOLS_SITE=http://ftp.sunet.se/pub/NetBSD/misc/ipsec-tools/0.7/
+IPSEC_TOOLS_CONF_OPT = \
+	  --disable-hybrid \
+	  --without-libpam \
+	  --disable-gssapi \
+	  --with-kernel-headers=$(STAGING_DIR)/usr/include
 
 ifeq ($(BR2_PACKAGE_IPSEC_TOOLS_ADMINPORT), y)
-IPSEC_TOOLS_CONFIG_FLAGS+= --enable-adminport
+IPSEC_TOOLS_CONF_OPT+= --enable-adminport
 else
-IPSEC_TOOLS_CONFIG_FLAGS+= --disable-adminport
+IPSEC_TOOLS_CONF_OPT+= --disable-adminport
 endif
 
 ifeq ($(BR2_PACKAGE_IPSEC_TOOLS_NATT), y)
-IPSEC_TOOLS_CONFIG_FLAGS+= --enable-natt
+IPSEC_TOOLS_CONF_OPT+= --enable-natt
 else
-IPSEC_TOOLS_CONFIG_FLAGS+= --disable-natt
+IPSEC_TOOLS_CONF_OPT+= --disable-natt
 endif
 
 ifeq ($(BR2_PACKAGE_IPSEC_TOOLS_FRAG), y)
-IPSEC_TOOLS_CONFIG_FLAGS+= --enable-frag
+IPSEC_TOOLS_CONF_OPT+= --enable-frag
 else
-IPSEC_TOOLS_CONFIG_FLAGS+= --disable-frag
+IPSEC_TOOLS_CONF_OPT+= --disable-frag
 endif
 
 ifeq ($(BR2_PACKAGE_IPSEC_TOOLS_STATS), y)
-IPSEC_TOOLS_CONFIG_FLAGS+= --enable-stats
+IPSEC_TOOLS_CONF_OPT+= --enable-stats
 else
-IPSEC_TOOLS_CONFIG_FLAGS+= --disable-stats
+IPSEC_TOOLS_CONF_OPT+= --disable-stats
 endif
 
 ifeq ($(BR2_INET_IPV6),y)
-
-ifeq ($(BR2_PACKAGE_IPSEC_TOOLS_IPV6), y)
-IPSEC_TOOLS_CONFIG_FLAGS+= --enable-ipv6
+IPSEC_TOOLS_CONF_OPT+= --enable-ipv6
 else
-IPSEC_TOOLS_CONFIG_FLAGS+= $(DISABLE_IPV6)
-endif
-
-else # ignore user's choice if it doesn't
-IPSEC_TOOLS_CONFIG_FLAGS+= $(DISABLE_IPV6)
+IPSEC_TOOLS_CONF_OPT+= --disable-ipv6
 endif
 
 ifneq ($(BR2_PACKAGE_IPSEC_TOOLS_READLINE), y)
-IPSEC_TOOLS_CONFIG_FLAGS+= --without-readline
+IPSEC_TOOLS_CONF_OPT+= --without-readline
+else
+IPSEC_DEPENDENCIES += readline
 endif
 
 ifeq ($(BR2_PACKAGE_IPSEC_SECCTX_DISABLE),y)
-IPSEC_TOOLS_CONFIG_FLAGS+= --enable-security-context=no
+IPSEC_TOOLS_CONF_OPT+= --enable-security-context=no
 endif
 ifeq ($(BR2_PACKAGE_IPSEC_SECCTX_ENABLE),y)
-IPSEC_TOOLS_CONFIG_FLAGS+= --enable-security-context=yes
+IPSEC_TOOLS_CONF_OPT+= --enable-security-context=yes
 endif
 ifeq ($(BR2_PACKAGE_IPSEC_SECCTX_KERNEL),y)
-IPSEC_TOOLS_CONFIG_FLAGS+= --enable-security-context=kernel
-endif
-
-$(DL_DIR)/$(IPSEC_TOOLS_SOURCE):
-	$(call DOWNLOAD,$(IPSEC_TOOLS_SITE),$(IPSEC_TOOLS_SOURCE))
-
-$(IPSEC_TOOLS_DIR)/.patched: $(DL_DIR)/$(IPSEC_TOOLS_SOURCE)
-	$(IPSEC_TOOLS_CAT) $(DL_DIR)/$(IPSEC_TOOLS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(IPSEC_TOOLS_DIR) package/ipsec-tools ipsec-tools-$(IPSEC_TOOLS_VERSION)\*.patch
-	$(CONFIG_UPDATE) $(IPSEC_TOOLS_DIR)
-	touch $@
-
-$(IPSEC_TOOLS_DIR)/.configured: $(IPSEC_TOOLS_DIR)/.patched
-	( cd $(IPSEC_TOOLS_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-	  ./configure $(QUIET) \
-	  --target=$(GNU_TARGET_NAME) \
-	  --host=$(GNU_TARGET_NAME) \
-	  --build=$(GNU_HOST_NAME) \
-	  --prefix=/usr \
-	  --sysconfdir=/etc \
-	  --disable-hybrid \
-	  --without-libpam \
-	  --disable-gssapi \
-	  --with-kernel-headers=$(STAGING_DIR)/usr/include \
-	  $(IPSEC_TOOLS_CONFIG_FLAGS) \
-	)
-	# simpler than patching that cruft..
-	(echo '#undef bzero'; \
-	 echo '#define bzero(a, b) memset((a), 0, (b))'; \
-	 echo '#undef bcopy'; \
-	 echo '#define bcopy(src, dest, len) memmove(dest, src, len)'; \
-	 echo '#undef index'; \
-	 echo '#define index(a, b) strchr(a, b)'; \
-	) >> $(IPSEC_TOOLS_DIR)/config.h
-	touch $@
-
-$(IPSEC_TOOLS_DIR)/$(IPSEC_TOOLS_BINARY_SETKEY) \
-$(IPSEC_TOOLS_DIR)/$(IPSEC_TOOLS_BINARY_RACOON) \
-$(IPSEC_TOOLS_DIR)/$(IPSEC_TOOLS_BINARY_RACOONCTL): \
-    $(IPSEC_TOOLS_DIR)/.configured
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(IPSEC_TOOLS_DIR)
-
-$(TARGET_DIR)/$(IPSEC_TOOLS_TARGET_BINARY_SETKEY) \
-$(TARGET_DIR)/$(IPSEC_TOOLS_TARGET_BINARY_RACOON) \
-$(TARGET_DIR)/$(IPSEC_TOOLS_TARGET_BINARY_RACOONCTL): \
-  $(IPSEC_TOOLS_DIR)/$(IPSEC_TOOLS_BINARY_SETKEY) \
-  $(IPSEC_TOOLS_DIR)/$(IPSEC_TOOLS_BINARY_RACOON) \
-  $(IPSEC_TOOLS_DIR)/$(IPSEC_TOOLS_BINARY_RACOONCTL)
-	$(MAKE) -C $(IPSEC_TOOLS_DIR) DESTDIR=$(TARGET_DIR) install
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(REMOVE_SECTION_COMMENT) \
-	  $(REMOVE_SECTION_NOTE) \
-	  $(TARGET_DIR)/$(IPSEC_TOOLS_TARGET_BINARY_SETKEY) \
-	  $(TARGET_DIR)/$(IPSEC_TOOLS_TARGET_BINARY_RACOON) \
-	  $(TARGET_DIR)/$(IPSEC_TOOLS_TARGET_BINARY_RACOONCTL)
-ifeq ($(BR2_PACKAGE_IPSEC_TOOLS_LIBS), y)
-	install -D $(addprefix $(IPSEC_TOOLS_DIR)/src/, \
-		libipsec/.libs/libipsec.a libipsec/.libs/libipsec.la \
-		racoon/.libs/libracoon.a racoon/.libs/libracoon.la) \
-		$(STAGING_DIR)/lib
-endif
-ifneq ($(BR2_PACKAGE_IPSEC_TOOLS_ADMINPORT), y)
-	rm -f $(TARGET_DIR)/$(IPSEC_TOOLS_TARGET_BINARY_RACOONCTL)
-endif
-
-IPSEC_TOOLS_PROGS= $(TARGET_DIR)/$(IPSEC_TOOLS_TARGET_BINARY_SETKEY) \
-    $(TARGET_DIR)/$(IPSEC_TOOLS_TARGET_BINARY_RACOON)
-
-ifeq ($(BR2_PACKAGE_IPSEC_TOOLS_ADMINPORT), y)
-IPSEC_TOOLS_PROGS+= $(TARGET_DIR)/$(IPSEC_TOOLS_TARGET_BINARY_RACOONCTL)
+IPSEC_TOOLS_CONF_OPT+= --enable-security-context=kernel
 endif
 
-ipsec-tools: openssl flex host-flex $(IPSEC_TOOLS_PROGS)
-
-ipsec-tools-source: $(DL_DIR)/$(IPSEC_TOOLS_SOURCE)
-
-ipsec-tools-uninstall:
-
-ipsec-tools-clean:
-	-$(MAKE) -C $(IPSEC_TOOLS_DIR) DESTDIR=$(TARGET_DIR) uninstall
-	-$(MAKE) -C $(IPSEC_TOOLS_DIR) clean
-ifeq ($(BR2_PACKAGE_IPSEC_TOOLS_LIBS),y)
-	rm -f $(addprefix $(STAGING_DIR)/lib/, \
-		libipsec.a libipsec.la libracoon.a libracoon.la)
-endif
-	rm -f $(IPSEC_TOOLS_DIR)/.configured
-
-ipsec-tools-dirclean:
-	rm -rf $(IPSEC_TOOLS_DIR)
-
-ifeq ($(BR2_PACKAGE_IPSEC_TOOLS), y)
-TARGETS+=ipsec-tools
-endif
+$(eval $(call AUTOTARGETS,package,ipsec-tools))
-- 
1.7.1
