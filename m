From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 17 Mar 2009 13:48:16 +0000 (UTC)
Subject: [Buildroot] svn commit: [25703] trunk/buildroot/package: dbus expat
	libglib2
Message-ID: <20090317134816.35DF876419@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-17 13:48:15 +0000 (Tue, 17 Mar 2009)
New Revision: 25703

Log:
package: fix host path

And generate dbus introspect xml for dbus-glib.

Modified:
   trunk/buildroot/package/Makefile.in
   trunk/buildroot/package/dbus/dbus.mk
   trunk/buildroot/package/expat/expat.mk
   trunk/buildroot/package/libglib2/libglib2.mk


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2009-03-17 13:03:06 UTC (rev 25702)
+++ trunk/buildroot/package/Makefile.in	2009-03-17 13:48:15 UTC (rev 25703)
@@ -188,8 +188,8 @@
 HOST_CFLAGS   += -I$(HOST_DIR)/include -I$(HOST_DIR)/usr/include
 HOST_CXXFLAGS += -I$(HOST_DIR)/include -I$(HOST_DIR)/usr/include
 HOST_LDFLAGS  += -L$(HOST_DIR)/lib -L$(HOST_DIR)/usr/lib
+HOST_PATH=$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(PATH)
 
-
 # hostcc version as an integer - E.G. 4.3.2 => 432
 HOSTCC_VERSION:=$(shell $(HOSTCC) --version | \
 	sed -n 's/^.* \([0-9]*\)\.\([0-9]*\)\.\([0-9]*\)[ ]*.*$$/\1\2\3/p')
@@ -261,7 +261,7 @@
 	LDFLAGS="$(TARGET_LDFLAGS)" \
 	FCFLAGS="$(TARGET_FCFLAGS)" \
 
-HOST_CONFIGURE_OPTS=PATH=$(TARGET_PATH) \
+HOST_CONFIGURE_OPTS=PATH=$(HOST_PATH) \
 		AR="$(HOSTAR)" \
 		AS="$(HOSTAS)" \
 		LD="$(HOSTLD) $(HOST_LDFLAGS)" \
@@ -299,6 +299,8 @@
 		PKG_CONFIG="$(STAGING_DIR)/usr/bin/pkg-config" \
 		PKG_CONFIG_PATH="$(HOST_DIR)/usr/lib/pkgconfig:$(PKG_CONFIG_PATH)"
 
+HOST_MAKE_ENV=PATH=$(HOST_PATH)
+
 #######################################################################
 # settings we need to pass to configure
 

Modified: trunk/buildroot/package/dbus/dbus.mk
===================================================================
--- trunk/buildroot/package/dbus/dbus.mk	2009-03-17 13:03:06 UTC (rev 25702)
+++ trunk/buildroot/package/dbus/dbus.mk	2009-03-17 13:48:15 UTC (rev 25703)
@@ -57,6 +57,7 @@
 # dbus for the host
 DBUS_HOST_DIR:=$(BUILD_DIR)/dbus-$(DBUS_VERSION)-host
 DBUS_HOST_BINARY:=$(HOST_DIR)/usr/bin/dbus-daemon
+DBUS_HOST_INTROSPECT:=$(DBUS_HOST_DIR)/introspect.xml
 
 $(DBUS_HOST_DIR)/.unpacked: $(DL_DIR)/$(DBUS_SOURCE)
 	mkdir -p $(@D)
@@ -87,18 +88,22 @@
 	touch $@
 
 $(DBUS_HOST_DIR)/.compiled: $(DBUS_HOST_DIR)/.configured
-	$(MAKE) -C $(@D)
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
 	touch $@
 
 $(DBUS_HOST_BINARY): $(DBUS_HOST_DIR)/.compiled
 	$(MAKE) -C $(<D) install
 
-host-dbus: $(DBUS_HOST_BINARY)
+$(DBUS_HOST_INTROSPECT): $(DBUS_HOST_BINARY)
+	$(DBUS_HOST_BINARY) --introspect > $@
 
+host-dbus: $(DBUS_HOST_INTROSPECT)
+
 host-dbus-source: dbus-source
 
 host-dbus-clean:
 	rm -f $(addprefix $(DBUS_HOST_DIR)/,.unpacked .configured .compiled)
+	rm -f $(DBUS_HOST_INTROSPECT)
 	$(MAKE) -C $(DBUS_HOST_DIR) uninstall
 	$(MAKE) -C $(DBUS_HOST_DIR) clean
 

Modified: trunk/buildroot/package/expat/expat.mk
===================================================================
--- trunk/buildroot/package/expat/expat.mk	2009-03-17 13:03:06 UTC (rev 25702)
+++ trunk/buildroot/package/expat/expat.mk	2009-03-17 13:48:15 UTC (rev 25703)
@@ -46,7 +46,7 @@
 	touch $@
 
 $(EXPAT_HOST_DIR)/.compiled: $(EXPAT_HOST_DIR)/.configured
-	$(MAKE) -C $(@D)
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
 	touch $@
 
 $(EXPAT_HOST_BINARY): $(EXPAT_HOST_DIR)/.compiled

Modified: trunk/buildroot/package/libglib2/libglib2.mk
===================================================================
--- trunk/buildroot/package/libglib2/libglib2.mk	2009-03-17 13:03:06 UTC (rev 25702)
+++ trunk/buildroot/package/libglib2/libglib2.mk	2009-03-17 13:48:15 UTC (rev 25703)
@@ -99,7 +99,7 @@
 	touch $@
 
 $(LIBGLIB2_HOST_BINARY): $(LIBGLIB2_HOST_DIR)/.compiled
-	$(MAKE) -C $(<D) install
+	$(HOST_MAKE_ENV) $(MAKE) -C $(<D) install
 
 host-libglib2: $(LIBGLIB2_HOST_BINARY)
 
