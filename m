From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri,  4 Jul 2008 02:48:26 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libdaemon
Message-ID: <20080704094827.025283C642@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-07-04 02:48:25 -0700 (Fri, 04 Jul 2008)
New Revision: 22625

Log:
Make libdaemon use the config files from Buildroot (previously replaced by libtoolize)

Modified:
   trunk/buildroot/package/libdaemon/libdaemon.mk


Changeset:
Modified: trunk/buildroot/package/libdaemon/libdaemon.mk
===================================================================
--- trunk/buildroot/package/libdaemon/libdaemon.mk	2008-07-04 08:39:35 UTC (rev 22624)
+++ trunk/buildroot/package/libdaemon/libdaemon.mk	2008-07-04 09:48:25 UTC (rev 22625)
@@ -24,14 +24,16 @@
 
 libdaemon-source: $(DL_DIR)/$(LIBDAEMON_SOURCE)
 
+libdaemon-unpacked: $(LIBDAEMON_DIR)/.unpacked
 $(LIBDAEMON_DIR)/.unpacked: $(DL_DIR)/$(LIBDAEMON_SOURCE)
 	$(LIBDAEMON_CAT) $(DL_DIR)/$(LIBDAEMON_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(LIBDAEMON_DIR) package/libdaemon/ \*.patch
-	$(CONFIG_UPDATE) $(LIBDAEMON_DIR)
 	touch $@
 
+libdaemon-configured: $(LIBDAEMON_DIR)/.configured
 $(LIBDAEMON_DIR)/.configured: $(LIBDAEMON_DIR)/.unpacked
 	(cd $(LIBDAEMON_DIR) && rm -rf config.cache && libtoolize --copy --force && autoreconf)
+	$(CONFIG_UPDATE) $(LIBDAEMON_DIR)
 	(cd $(LIBDAEMON_DIR) && \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
