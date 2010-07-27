From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Jul 2010 00:46:15 +0200
Subject: [Buildroot] [PATCH 1/3] Convert net-snmp to autotargets
In-Reply-To: <cover.1280270762.git.thomas.petazzoni@free-electrons.com>
References: <cover.1280270762.git.thomas.petazzoni@free-electrons.com>
Message-ID: <d54f37fb0813143c6b3e83504bd17874e38094c9.1280270762.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo@zacarias.com.ar>

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/netsnmp/Config.in  |    5 --
 package/netsnmp/netsnmp.mk |  172 ++++++++++----------------------------------
 2 files changed, 38 insertions(+), 139 deletions(-)

diff --git a/package/netsnmp/Config.in b/package/netsnmp/Config.in
index 810b654..5a3e9aa 100644
--- a/package/netsnmp/Config.in
+++ b/package/netsnmp/Config.in
@@ -1,13 +1,8 @@
 config BR2_PACKAGE_NETSNMP
 	bool "netsnmp"
-	# Build with external toolchains is broken, libtool strips
-	# --sysroot at link time
-	depends on !BR2_TOOLCHAIN_EXTERNAL
 	help
 	  Suite of applications used to implement SNMP v1, SNMP v2c, and
 	  SNMP v3 using both IPv4 and IPv6.
 
 	  http://net-snmp.sourceforge.net/
 
-comment "lmbench is broken with external toolchains"
-        depends on BR2_TOOLCHAIN_EXTERNAL
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index c5232c7..8f8bc76 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -3,150 +3,54 @@
 # netsnmp
 #
 #############################################################
-NETSNMP_VERSION:=5.5
-NETSNMP_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/net-snmp/
-NETSNMP_DIR:=$(BUILD_DIR)/net-snmp-$(NETSNMP_VERSION)
-NETSNMP_SOURCE:=net-snmp-$(NETSNMP_VERSION).tar.gz
 
-NETSNMP_WO_TRANSPORT:=
-ifneq ($(BR2_INET_IPX),y)
-NETSNMP_WO_TRANSPORT+= IPX
-endif
-ifneq ($(BR2_INET_IPV6),y)
-NETSNMP_WO_TRANSPORT+= UDPIPv6 TCPIPv6
-endif
-
-$(DL_DIR)/$(NETSNMP_SOURCE):
-	$(call DOWNLOAD,$(NETSNMP_SITE),$(NETSNMP_SOURCE))
-
-$(NETSNMP_DIR)/.unpacked: $(DL_DIR)/$(NETSNMP_SOURCE)
-	$(ZCAT) $(DL_DIR)/$(NETSNMP_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(NETSNMP_DIR) package/netsnmp/ \*$(NETSNMP_VERSION)\*.patch
-	$(CONFIG_UPDATE) $(@D)
-	touch $@
+NETSNMP_VERSION = 5.5
+NETSNMP_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/net-snmp
+NETSNMP_SOURCE = net-snmp-$(NETSNMP_VERSION).tar.gz
+NETSNMP_INSTALL_STAGING = YES
+NETSNMP_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
+NETSNMP_LIBTOOL_PATCH = NO
+NETSNMP_CONF_ENV = ac_cv_NETSNMP_CAN_USE_SYSCTL=yes
+NETSNMP_CONF_OPT = --with-persistent-directory=/var/lib/snmp --disable-static \
+		--with-defaults --enable-mini-agent --without-rpm \
+		--with-logfile=none --without-kmem-usage $(DISABLE_IPV6) \
+		--enable-as-needed --disable-debugging --without-perl-modules \
+		--disable-embedded-perl --disable-perl-cc-checks \
+		--with-sys-contact="root at unknown" \
+		--with-sys-location="Unknown" \
+		--with-mib-modules="host smux ucd-snmp/dlmod"
 
 ifeq ($(BR2_ENDIAN),"BIG")
-NETSNMP_ENDIAN=big
+	NETSNMP_CONF_OPT += --with-endianness=big
 else
-NETSNMP_ENDIAN=little
-endif
-
-ifeq ($(BR2_HAVE_PERL),y)
-NETSNMP_CONFIGURE_PERL_ENV:=\
-		PERLCC="$(TARGET_CC)"
-NETSNMP_CONFIGURE_PERL:=\
-		--disable-embedded-perl \
-		--disable-perl-cc-checks \
-		--enable-as-needed
-else
-NETSNMP_CONFIGURE_PERL_ENV:=
-NETSNMP_CONFIGURE_PERL:=\
-		--disable-embedded-perl \
-		--disable-perl-cc-checks \
-		--without-perl-modules
+	NETSNMP_CONF_OPT += --with-endianness=little
 endif
 
+# OpenSSL
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-NETSNMP_CONFIGURE_OPENSSL:=--with-openssl=$(STAGING_DIR)/usr/include/openssl
+	NETSNMP_CONF_OPT += \
+		--with-openssl=$(STAGING_DIR)/usr/include/openssl
 else
-NETSNMP_CONFIGURE_OPENSSL:=--without-openssl
+	NETSNMP_CONF_OPT += --without-openssl
 endif
 
+# Docs
 ifneq ($(BR2_HAVE_DOCUMENTATION),y)
-NETSNMP_DOCS:=--disable-manuals
+	NETSNMP_CONF_OPT += --disable-manuals
 endif
 
-$(NETSNMP_DIR)/.configured: $(NETSNMP_DIR)/.unpacked
-	(cd $(NETSNMP_DIR); rm -f config.cache; \
-		$(AUTOCONF) && \
-		ac_cv_NETSNMP_CAN_USE_SYSCTL=yes \
-		$(NETSNMP_CONFIGURE_PERL_ENV) \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--with-cc=$(TARGET_CROSS)gcc \
-		--with-linkcc=$(TARGET_CROSS)gcc \
-		--with-ar=$(TARGET_CROSS)ar \
-		--with-cflags="$(TARGET_CFLAGS)" \
-		--with-ldflags="$(TARGET_LDFLAGS)" \
-		--with-endianness=$(NETSNMP_ENDIAN) \
-		--with-persistent-directory=/var/lib/snmp \
-		--enable-ucd-snmp-compatibility \
-		--enable-shared \
-		--disable-static \
-		--with-logfile=none \
-		--without-rpm \
-		$(NETSNMP_CONFIGURE_OPENSSL) \
-		$(NETSNMP_DOCS) \
-		$(NETSNMP_CONFIGURE_PERL) \
-		--without-dmalloc \
-		--without-efence \
-		--without-rsaref \
-		--with-sys-contact="root" \
-		--with-sys-location="Unknown" \
-		--with-mib-modules="host smux ucd-snmp/dlmod" \
-		--with-out-transports="$(NETSNMP_WO_TRANSPORT)" \
-		--with-defaults \
-		--disable-debugging \
-		--prefix=/usr \
-		--sysconfdir=/etc \
-		--enable-mini-agent \
-		--without-kmem-usage \
-		$(DISABLE_IPV6) \
-	)
-	touch $@
-
-$(NETSNMP_DIR)/agent/snmpd: $(NETSNMP_DIR)/.configured
-	$(MAKE1) -C $(NETSNMP_DIR)
-	touch -c $@
-
-$(TARGET_DIR)/usr/sbin/snmpd: $(NETSNMP_DIR)/agent/snmpd
-	$(MAKE) PREFIX=$(TARGET_DIR)/usr \
-	    prefix=$(TARGET_DIR)/usr \
-	    exec_prefix=$(TARGET_DIR)/usr \
-	    persistentdir=$(TARGET_DIR)/var/lib/snmp \
-	    includedir=$(STAGING_DIR)/usr/include/net-snmp \
-	    ucdincludedir=$(STAGING_DIR)/usr/include/ucd-snmp \
-	    -C $(NETSNMP_DIR) install
-	# Copy the .conf files.
-	$(INSTALL) -D -m 0644 $(NETSNMP_DIR)/EXAMPLE.conf $(TARGET_DIR)/etc/snmp/snmpd.conf
-	-mv $(TARGET_DIR)/usr/share/snmp/mib2c*.conf $(TARGET_DIR)/etc/snmp
-	# Remove the unsupported snmpcheck program
-	rm -f $(TARGET_DIR)/usr/bin/snmpcheck
-	# Install the "broken" headers
-	$(INSTALL) -D -m 0644 $(NETSNMP_DIR)/agent/mibgroup/struct.h $(STAGING_DIR)/usr/include/net-snmp/agent/struct.h
-	$(INSTALL) -D -m 0644 $(NETSNMP_DIR)/agent/mibgroup/util_funcs.h $(STAGING_DIR)/usr/include/net-snmp/util_funcs.h
-	$(INSTALL) -D -m 0644 $(NETSNMP_DIR)/agent/mibgroup/mibincl.h $(STAGING_DIR)/usr/include/net-snmp/library/mibincl.h
-	$(INSTALL) -D -m 0644 $(NETSNMP_DIR)/agent/mibgroup/header_complex.h $(STAGING_DIR)/usr/include/net-snmp/agent/header_complex.h
-	$(INSTALL) -D -m 0755 package/netsnmp/S59snmpd $(TARGET_DIR)/etc/init.d/S59snmpd
-
-netsnmp: host-autoconf $(if $(BR2_PACKAGE_OPENSSL),openssl) $(TARGET_DIR)/usr/sbin/snmpd
-
-netsnmp-headers: $(TARGET_DIR)/usr/include/net-snmp/net-snmp-config.h
-	$(INSTALL) -d $(TARGET_DIR)/usr/include/net-snmp
-	cp -a $(STAGING_DIR)/usr/include/net-snmp $(TARGET_DIR)/usr/include/net-snmp
-	cp -a $(STAGING_DIR)/usr/include/ucd-snmp $(TARGET_DIR)/usr/include/net-snmp
-
-netsnmp-source: $(DL_DIR)/$(NETSNMP_SOURCE)
-
-netsnmp-clean:
-	-$(MAKE) PREFIX=$(TARGET_DIR) INSTALL_PREFIX=$(TARGET_DIR) DESTDIR=$(TARGET_DIR) CC="$(TARGET_CC)" -C $(NETSNMP_DIR) uninstall
-	-$(MAKE) -C $(NETSNMP_DIR) clean
-	-rm -rf $(TARGET_DIR)/etc/snmp/{snmpd{,trapd},mib2c*}.conf \
-		$(TARGET_DIR)/etc/default/snmpd \
-		$(TARGET_DIR)/usr/include/net-snmp
-
-netsnmp-dirclean:
-	rm -rf $(NETSNMP_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_NETSNMP),y)
-TARGETS+=netsnmp
-endif
+define NETSNMP_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		DESTDIR=$(TARGET_DIR) install
+	$(INSTALL) -D -m 0755 package/netsnmp/S59snmpd \
+		$(TARGET_DIR)/etc/init.d/S59snmpd
+endef
+
+define NETSNMP_UNINSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		DESTDIR=$(TARGET_DIR) uninstall
+	rm -f $(TARGET_DIR)/etc/init.d/S59snmpd
+	rm -f $(TARGET_DIR)/usr/lib/libnetsnmp*
+endef
+
+$(eval $(call AUTOTARGETS,package,netsnmp))
-- 
1.7.0.4
