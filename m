From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Aug 2009 16:15:37 +0200
Subject: [Buildroot] [PATCH 1/3] netsnmp: convert to autotools.in and fix
	build issues
In-Reply-To: <cover.1249395336.git.thomas.petazzoni@free-electrons.com>
References: <cover.1249395336.git.thomas.petazzoni@free-electrons.com>
Message-ID: <d96368ad9339edf62aa87890d5cea79bf7ddfc34.1249395336.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to fix build issues on net-snmp with openssl configured
reported on the mailing-list, this patch converts net-snmp to the
Makefile.autotools.in infrastructure. This allows to fix build issues.

This patch removes support for the Perl stuff in net-snmp because it
doesn't build. This is most likely not a problem, since Perl support
was dependent on BR2_HAVE_PERL, a configuration symbol that doesn't
exist in Buildroot since several years.

Moreover, we introduce a patch to the build system so that it doesn't
call ldconfig on /usr/lib at install time, which is completely useless
when doing cross-compilation.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../netsnmp-5.4.2.1-build-system-fixup.patch       |   29 +++
 package/netsnmp/netsnmp.mk                         |  179 ++++++--------------
 2 files changed, 80 insertions(+), 128 deletions(-)
 create mode 100644 package/netsnmp/netsnmp-5.4.2.1-build-system-fixup.patch

diff --git a/package/netsnmp/netsnmp-5.4.2.1-build-system-fixup.patch b/package/netsnmp/netsnmp-5.4.2.1-build-system-fixup.patch
new file mode 100644
index 0000000..f9c50ab
--- /dev/null
+++ b/package/netsnmp/netsnmp-5.4.2.1-build-system-fixup.patch
@@ -0,0 +1,29 @@
+Index: net-snmp-5.4.2.1/Makefile.rules
+===================================================================
+--- net-snmp-5.4.2.1.orig/Makefile.rules
++++ net-snmp-5.4.2.1/Makefile.rules
+@@ -172,7 +172,6 @@
+ 			echo "installing $$i in $(INSTALL_PREFIX)$(libdir)"; \
+ 			$(RANLIB) $(INSTALL_PREFIX)$(libdir)/$$i ; \
+ 		done ; \
+-		$(LIB_LDCONFIG_CMD) ; \
+ 	fi
+ 
+ installpostlibs: $(INSTALLPOSTLIBS)
+@@ -184,7 +183,6 @@
+ 			echo "installing $$i in $(INSTALL_PREFIX)$(libdir)"; \
+ 			$(RANLIB) $(INSTALL_PREFIX)$(libdir)/$$i ; \
+ 		done ; \
+-		$(LIB_LDCONFIG_CMD) ; \
+ 	fi
+ 
+ installucdlibs: $(INSTALLUCDLIBS)
+@@ -196,7 +194,6 @@
+ 			echo "installing $$i in $(INSTALL_PREFIX)$(libdir)"; \
+ 			$(RANLIB) $(INSTALL_PREFIX)$(libdir)/$$i ; \
+ 		done ; \
+-		$(LIB_LDCONFIG_CMD) ; \
+ 	fi
+ 
+ installsubdirlibs:
+
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 2af8e0c..fe60979 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -2,28 +2,15 @@
 #
 # netsnmp
 #
-#############################################################
-NETSNMP_VERSION:=5.4.2.1
-NETSNMP_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/net-snmp/
-NETSNMP_DIR:=$(BUILD_DIR)/net-snmp-$(NETSNMP_VERSION)
-NETSNMP_SOURCE:=net-snmp-$(NETSNMP_VERSION).tar.gz
-
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
+############################################################
+NETSNMP_VERSION = 5.4.2.1
+NETSNMP_SOURCE = net-snmp-$(NETSNMP_VERSION).tar.gz
+NETSNMP_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/net-snmp/
+NETSNMP_AUTORECONF = NO
+NETSNMP_INSTALL_STAGING = YES
+NETSNMP_INSTALL_TARGET = YES
+# netsnmp doesn't understand install-strip
+NETSNMP_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 ifeq ($(BR2_ENDIAN),"BIG")
 NETSNMP_ENDIAN=big
@@ -31,21 +18,6 @@ else
 NETSNMP_ENDIAN=little
 endif
 
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
-endif
-
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 NETSNMP_CONFIGURE_OPENSSL:=--with-openssl=$(STAGING_DIR)/usr/include/openssl
 else
@@ -56,104 +28,55 @@ ifneq ($(findstring y,$(BR2_HAVE_MANPAGES)$(BR2_HAVE_INFOPAGES)),y)
 NETSNMP_DOCS:=--disable-manuals
 endif
 
-$(NETSNMP_DIR)/.configured: $(NETSNMP_DIR)/.unpacked
-	(cd $(NETSNMP_DIR); rm -f config.cache; \
-		autoconf && \
-		ac_cv_NETSNMP_CAN_USE_SYSCTL=yes \
-		$(NETSNMP_CONFIGURE_PERL_ENV) \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure \
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
-	rm -rf $(TARGET_DIR)/usr/share/doc
-ifneq ($(BR2_HAVE_MANPAGES),y)
-	rm -rf $(TARGET_DIR)/usr/share/man
-endif
-ifneq ($(BR2_HAVE_INFOPAGES),y)
-	rm -rf $(TARGET_DIR)/usr/share/info
-endif
+NETSNMP_CONF_ENV = \
+	ac_cv_NETSNMP_CAN_USE_SYSCTL=yes
+
+NETSNMP_CONF_OPT = \
+	--with-endianness=$(NETSNMP_ENDIAN) \
+	--with-persistent-directory=/var/lib/snmp \
+	--enable-ucd-snmp-compatibility \
+	--enable-shared \
+	--disable-static \
+	--with-logfile=none \
+	--without-rpm \
+	$(NETSNMP_CONFIGURE_OPENSSL) \
+	$(NETSNMP_DOCS) \
+	--without-dmalloc \
+	--without-efence \
+	--without-rsaref \
+	--with-sys-contact="root" \
+	--with-sys-location="Unknown" \
+	--with-mib-modules="host smux ucd-snmp/dlmod" \
+	--with-out-transports="$(NETSNMP_WO_TRANSPORT)" \
+	--with-defaults \
+	--disable-debugging \
+	--enable-mini-agent \
+	--without-kmem-usage \
+	--disable-embedded-perl \
+	--disable-perl-cc-checks \
+	--without-perl-modules \
+	$(DISABLE_IPV6)
+
+NETSNMP_DEPENDENCIES = uclibc \
+	$(if $(BR2_PACKAGE_OPENSSL),openssl)
+
+$(eval $(call AUTOTARGETS,package,netsnmp))
+
+$(NETSNMP_HOOK_POST_INSTALL):
 	# Copy the .conf files.
 	$(INSTALL) -D -m 0644 $(NETSNMP_DIR)/EXAMPLE.conf $(TARGET_DIR)/etc/snmp/snmpd.conf
 	-mv $(TARGET_DIR)/usr/share/snmp/mib2c*.conf $(TARGET_DIR)/etc/snmp
-	# Remove the unsupported snmpcheck program
-	rm -f $(TARGET_DIR)/usr/bin/snmpcheck
+	# Remove the Perl programs
+	for i in snmpconf mib2c fixproc snmpcheck tkmib ipf-mod.pl traptoemail ; do \
+		rm -f $(TARGET_DIR)/usr/bin/$$i ; \
+	done
+	# Remove the useless -config script
+	rm -f $(TARGET_DIR)/usr/bin/net-snmp-config
 	# Install the "broken" headers
 	$(INSTALL) -D -m 0644 $(NETSNMP_DIR)/agent/mibgroup/struct.h $(STAGING_DIR)/usr/include/net-snmp/agent/struct.h
 	$(INSTALL) -D -m 0644 $(NETSNMP_DIR)/agent/mibgroup/util_funcs.h $(STAGING_DIR)/usr/include/net-snmp/util_funcs.h
 	$(INSTALL) -D -m 0644 $(NETSNMP_DIR)/agent/mibgroup/mibincl.h $(STAGING_DIR)/usr/include/net-snmp/library/mibincl.h
 	$(INSTALL) -D -m 0644 $(NETSNMP_DIR)/agent/mibgroup/header_complex.h $(STAGING_DIR)/usr/include/net-snmp/agent/header_complex.h
 	$(INSTALL) -D -m 0755 package/netsnmp/S59snmpd $(TARGET_DIR)/etc/init.d/S59snmpd
+	touch $@
 
-netsnmp: $(if $(BR2_PACKAGE_OPENSSL),openssl) $(TARGET_DIR)/usr/sbin/snmpd
-
-netsnmp-headers: $(TARGET_DIR)/usr/include/net-snmp/net-snmp-config.h
-	$(INSTALL) -d $(TARGET_DIR)/usr/include/net-snmp
-	cp -a $(STAGING_DIR)/usr/include/net-snmp $(TARGET_DIR)/usr/include/net-snmp
-	cp -a $(STAGING_DIR)/usr/include/ucd-snmp $(TARGET_DIR)/usr/include/net-snmp
-
-netsnmp-source: $(DL_DIR)/$(NETSNMP_SOURCE)
-
-netsnmp-clean:
-	-$(MAKE) PREFIX=$(TARGET_DIR) INSTALL_PREFIX=$(TARGET_DIR) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(NETSNMP_DIR) uninstall
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
-- 
1.6.0.4
