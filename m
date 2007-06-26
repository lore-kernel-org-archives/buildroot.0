From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 26 Jun 2007 10:45:10 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package: bind iperf
	ipsec-tools lsof python qtopi etc...
Message-ID: <20070626174510.A7DC3A457D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-26 10:45:08 -0700 (Tue, 26 Jun 2007)
New Revision: 18947

Log:
- use BR2_INET_IPV6


Modified:
   trunk/buildroot/package/bind/bind.mk
   trunk/buildroot/package/iperf/iperf.mk
   trunk/buildroot/package/ipsec-tools/Config.in
   trunk/buildroot/package/ipsec-tools/ipsec-tools.mk
   trunk/buildroot/package/lsof/lsof.mk
   trunk/buildroot/package/python/python.mk
   trunk/buildroot/package/qtopia4/qtopia4.mk


Changeset:
Modified: trunk/buildroot/package/bind/bind.mk
===================================================================
--- trunk/buildroot/package/bind/bind.mk	2007-06-26 16:58:11 UTC (rev 18946)
+++ trunk/buildroot/package/bind/bind.mk	2007-06-26 17:45:08 UTC (rev 18947)
@@ -45,7 +45,7 @@
 		--localstatedir=/var \
 		--without-openssl \
 		--with-randomdev=/dev/random \
-		--enable-ipv6 \
+		$(DISABLE_IPV6) \
 		--with-libtool \
 		--with-pic \
 	);

Modified: trunk/buildroot/package/iperf/iperf.mk
===================================================================
--- trunk/buildroot/package/iperf/iperf.mk	2007-06-26 16:58:11 UTC (rev 18946)
+++ trunk/buildroot/package/iperf/iperf.mk	2007-06-26 17:45:08 UTC (rev 18947)
@@ -29,7 +29,7 @@
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
-		--disable-ipv6 \
+		$(DISABLE_IPV6) \
 		--disable-dependency-tracking \
 		--disable-web100 \
 		--prefix=/usr \

Modified: trunk/buildroot/package/ipsec-tools/Config.in
===================================================================
--- trunk/buildroot/package/ipsec-tools/Config.in	2007-06-26 16:58:11 UTC (rev 18946)
+++ trunk/buildroot/package/ipsec-tools/Config.in	2007-06-26 17:45:08 UTC (rev 18947)
@@ -44,7 +44,7 @@
 
 config BR2_PACKAGE_IPSEC_TOOLS_IPV6
 	default y
-	depends on BR2_PACKAGE_IPSEC_TOOLS
+	depends on BR2_PACKAGE_IPSEC_TOOLS && BR2_INET_IPV6
 	bool "Enable IPv6 support"
 	help
 		This option has no effect if uClibc has been compiled without

Modified: trunk/buildroot/package/ipsec-tools/ipsec-tools.mk
===================================================================
--- trunk/buildroot/package/ipsec-tools/ipsec-tools.mk	2007-06-26 16:58:11 UTC (rev 18946)
+++ trunk/buildroot/package/ipsec-tools/ipsec-tools.mk	2007-06-26 17:45:08 UTC (rev 18947)
@@ -42,18 +42,16 @@
 IPSEC_TOOLS_CONFIG_FLAGS+=	--disable-stats
 endif
 
-# At first check, if uClibc supports IPv6
-ifeq ($(shell grep -qs '__UCLIBC_HAS_IPV6__ 1' \
-	$(STAGING_DIR)/include/bits/uClibc_config.h && echo IPV6), IPV6)
+ifeq ($(BR2_INET_IPV6),y)
 
 ifeq ($(strip $(BR2_PACKAGE_IPSEC_TOOLS_IPV6)), y)
 IPSEC_TOOLS_CONFIG_FLAGS+=	--enable-ipv6
 else
-IPSEC_TOOLS_CONFIG_FLAGS+=	--disable-ipv6
+IPSEC_TOOLS_CONFIG_FLAGS+=	$(DISABLE_IPV6)
 endif
 
 else # ignore user's choice if it doesn't
-IPSEC_TOOLS_CONFIG_FLAGS+=	--disable-ipv6
+IPSEC_TOOLS_CONFIG_FLAGS+=	$(DISABLE_IPV6)
 endif
 
 ifneq ($(strip $(BR2_PACKAGE_IPSEC_TOOLS_READLINE)), y)

Modified: trunk/buildroot/package/lsof/lsof.mk
===================================================================
--- trunk/buildroot/package/lsof/lsof.mk	2007-06-26 16:58:11 UTC (rev 18946)
+++ trunk/buildroot/package/lsof/lsof.mk	2007-06-26 17:45:08 UTC (rev 18947)
@@ -15,7 +15,7 @@
 ifeq ($(BR2_LARGEFILE),)
 BR2_LSOF_CFLAGS+=-U_FILE_OFFSET_BITS
 endif
-ifeq ($(UCLIBC_HAS_IPV6),)
+ifeq ($(BR2_INET_IPV6),)
 BR2_LSOF_CFLAGS+=-UHASIPv6
 endif
 

Modified: trunk/buildroot/package/python/python.mk
===================================================================
--- trunk/buildroot/package/python/python.mk	2007-06-26 16:58:11 UTC (rev 18946)
+++ trunk/buildroot/package/python/python.mk	2007-06-26 17:45:08 UTC (rev 18947)
@@ -11,12 +11,6 @@
 PYTHON_BINARY:=python
 PYTHON_TARGET_BINARY:=usr/bin/python
 
-#ifndef BR2_SUPPORT_IPv6
-#PYTHON_DISABLE_IPv6=--disable-ipv6
-#else
-#PYTHON_DISABLE_IPv6=--enable-ipv6
-#endif
-
 # these could use checks for some BR2_PACKAGE_foo,y
 BR2_PYTHON_DISABLED_MODULES=readline pyexpat dbm gdbm bsddb \
 	_curses _curses_panel _tkinter nis zipfile
@@ -58,7 +52,7 @@
 		--prefix=/usr \
 		--sysconfdir=/etc \
 		--with-cxx=no \
-		$(PYTHON_DISABLE_IPv6) \
+		$(DISABLE_IPV6) \
 		$(DISABLE_NLS) \
 	);
 	touch $@

Modified: trunk/buildroot/package/qtopia4/qtopia4.mk
===================================================================
--- trunk/buildroot/package/qtopia4/qtopia4.mk	2007-06-26 16:58:11 UTC (rev 18946)
+++ trunk/buildroot/package/qtopia4/qtopia4.mk	2007-06-26 17:45:08 UTC (rev 18947)
@@ -112,8 +112,10 @@
 	# Patching configure to get rid of some feature I dont want.
 	# (I don't want SQL either but there is no option for that at all. 
 	# the SQL library will be built even without the plugins/drivers.
+ifneq ($(BR2_INET_IPV6),y)
 	$(SED) 's/^CFG_IPV6=auto/CFG_IPV6=no/' $(QTOPIA4_TARGET_DIR)/configure
 	$(SED) 's/^CFG_IPV6IFNAME=auto/CFG_IPV6IFNAME=no/' $(QTOPIA4_TARGET_DIR)/configure
+endif
 	$(SED) 's/^CFG_XINERAMA=auto/CFG_XINERAMA=no/' $(QTOPIA4_TARGET_DIR)/configure
 	$(SED) 's/-O2/$(TARGET_CFLAGS)/' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
 	-[ -f $(QTOPIA4_QCONFIG_FILE) ] && cp $(QTOPIA4_QCONFIG_FILE) \
@@ -198,8 +200,10 @@
 	# Patching configure to get rid of some feature I dont want.
 	# (I don't want SQL either but there is no option for that at all. 
 	# the SQL library will be built even without the plugins/drivers.
+ifneq ($(BR2_INET_IPV6),y)
 	$(SED) 's/^CFG_IPV6=auto/CFG_IPV6=no/' $(QTOPIA4_HOST_DIR)/configure
 	$(SED) 's/^CFG_IPV6IFNAME=auto/CFG_IPV6IFNAME=no/' $(QTOPIA4_HOST_DIR)/configure
+endif
 	$(SED) 's/^CFG_XINERAMA=auto/CFG_XINERAMA=no/' $(QTOPIA4_HOST_DIR)/configure
 	$(SED) 's/-O2/$(TARGET_CFLAGS)/' $(QTOPIA4_HOST_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
 	-[ -f $(QTOPIA4_QCONFIG_FILE) ] && cp $(QTOPIA4_QCONFIG_FILE) \
