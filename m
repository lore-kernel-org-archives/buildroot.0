From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Thu,  5 Jul 2007 10:54:39 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package: autoconf m4
Message-ID: <20070705175439.35BD1A6047@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-07-05 10:54:38 -0700 (Thu, 05 Jul 2007)
New Revision: 19005

Log:
Add building of m4 for host and fix autoconf dependency. Submitted by Julien Letessier <julien.letessier@technosens.fr>.


Modified:
   trunk/buildroot/package/autoconf/autoconf.mk
   trunk/buildroot/package/m4/m4.mk


Changeset:
Modified: trunk/buildroot/package/autoconf/autoconf.mk
===================================================================
--- trunk/buildroot/package/autoconf/autoconf.mk	2007-07-05 17:52:31 UTC (rev 19004)
+++ trunk/buildroot/package/autoconf/autoconf.mk	2007-07-05 17:54:38 UTC (rev 19005)
@@ -111,7 +111,7 @@
 $(AUTOCONF): $(AUTOCONF_HOST_DIR)/bin/$(AUTOCONF_BINARY)
 	$(MAKE) -C $(AUTOCONF_HOST_DIR) install;
 
-host-autoconf: m4-host host-libtool $(AUTOCONF)
+host-autoconf: host-m4 host-libtool $(AUTOCONF)
 
 host-autoconf-clean:
 	$(MAKE) CC=$(HOST_CC) -C $(AUTOCONF_HOST_DIR) uninstall

Modified: trunk/buildroot/package/m4/m4.mk
===================================================================
--- trunk/buildroot/package/m4/m4.mk	2007-07-05 17:52:31 UTC (rev 19004)
+++ trunk/buildroot/package/m4/m4.mk	2007-07-05 17:54:38 UTC (rev 19005)
@@ -8,6 +8,7 @@
 M4_CAT:=$(BZCAT)
 M4_SITE:=http://ftp.gnu.org/pub/gnu/m4
 M4_DIR:=$(BUILD_DIR)/m4-$(M4_VER)
+M4_HOST_DIR:=$(TOOL_BUILD_DIR)/m4-$(M4_VER)
 M4_BINARY:=m4
 M4_TARGET_BINARY:=usr/bin/m4
 
@@ -24,7 +25,7 @@
 	$(M4_CAT) $(DL_DIR)/$(M4_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(M4_DIR) package/m4 m4\*.patch
 	$(CONFIG_UPDATE) $(@D)
-	touch $(M4_DIR)/.unpacked
+	touch $@
 
 $(M4_DIR)/.configured: $(M4_DIR)/.unpacked
 	(cd $(M4_DIR); rm -rf config.cache; \
@@ -40,7 +41,7 @@
 		--exec-prefix=/usr \
 		$(DISABLE_LARGEFILE) \
 	);
-	touch $(M4_DIR)/.configured
+	touch $@
 
 $(M4_DIR)/src/$(M4_BINARY): $(M4_DIR)/.configured
 	$(MAKE) CC=$(TARGET_CC) -C $(M4_DIR)
@@ -63,6 +64,7 @@
 	$(STRIP) $(TARGET_DIR)/$(M4_TARGET_BINARY) > /dev/null 2>&1
 	rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
 		$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
+	touch -c $@
 
 m4: uclibc $(TARGET_DIR)/$(M4_TARGET_BINARY)
 
@@ -75,6 +77,46 @@
 
 #############################################################
 #
+# m4 for the host
+#
+#############################################################
+
+$(M4_HOST_DIR)/.unpacked: $(DL_DIR)/$(M4_SOURCE)
+	$(M4_CAT) $(DL_DIR)/$(M4_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(M4_HOST_DIR) package/m4 m4\*.patch
+	$(CONFIG_UPDATE) $(@D)
+	touch $@
+
+$(M4_HOST_DIR)/.configured: $(M4_HOST_DIR)/.unpacked
+	(cd $(M4_HOST_DIR); rm -rf config.cache; \
+		$(HOST_CONFIGURE_OPTS) \
+		CFLAGS="$(HOST_CFLAGS)" \
+		LDFLAGS="$(HOST_LDFLAGS)" \
+		gl_cv_func_gettimeofday_clobber=no \
+		$(gl_cv_func_re_compile_pattern_working) \
+		./configure \
+		--prefix=$(STAGING_DIR)/usr \
+		$(DISABLE_LARGEFILE) \
+	);
+	touch $@
+
+$(M4_HOST_DIR)/src/$(M4_BINARY): $(M4_HOST_DIR)/.configured
+	$(MAKE) -C $(M4_HOST_DIR)
+
+$(STAGING_DIR)/$(M4_TARGET_BINARY): $(M4_HOST_DIR)/src/$(M4_BINARY)
+	$(MAKE) -C $(M4_HOST_DIR) install;
+
+host-m4: uclibc $(STAGING_DIR)/$(M4_TARGET_BINARY)
+
+host-m4-clean:
+	$(MAKE) -C $(M4_HOST_DIR) uninstall
+	-$(MAKE) -C $(M4_HOST_DIR) clean
+
+host-m4-dirclean:
+	rm -rf $(M4_HOST_DIR)
+
+#############################################################
+#
 # Toplevel Makefile options
 #
 #############################################################
