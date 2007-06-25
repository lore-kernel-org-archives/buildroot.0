From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 25 Jun 2007 03:29:48 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package: ltp-testsuite
	nfs-utils
Message-ID: <20070625102948.85366A45C3@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-25 03:29:47 -0700 (Mon, 25 Jun 2007)
New Revision: 18918

Log:
- preserve quotes


Modified:
   trunk/buildroot/package/ltp-testsuite/ltp-testsuite.mk
   trunk/buildroot/package/nfs-utils/nfs-utils.mk


Changeset:
Modified: trunk/buildroot/package/ltp-testsuite/ltp-testsuite.mk
===================================================================
--- trunk/buildroot/package/ltp-testsuite/ltp-testsuite.mk	2007-06-25 10:23:24 UTC (rev 18917)
+++ trunk/buildroot/package/ltp-testsuite/ltp-testsuite.mk	2007-06-25 10:29:47 UTC (rev 18918)
@@ -47,8 +47,8 @@
 
 $(LTP_TESTSUITE_DIR)/.installed: $(LTP_TESTSUITE_DIR)/.compiled
 	# Use fakeroot to pretend to do 'make install' as root
-	echo "$(MAKE1) $(TARGET_CONFIGURE_OPTS) CROSS_COMPILER=$(TARGET_CROSS) " \
-			"-C $(LTP_TESTSUITE_DIR) install" \
+	echo '$(MAKE1) $(TARGET_CONFIGURE_OPTS) CROSS_COMPILER=$(TARGET_CROSS) ' \
+			'-C $(LTP_TESTSUITE_DIR) install' \
 			> $(STAGING_DIR)/.fakeroot.ltp
 	touch $@
 

Modified: trunk/buildroot/package/nfs-utils/nfs-utils.mk
===================================================================
--- trunk/buildroot/package/nfs-utils/nfs-utils.mk	2007-06-25 10:23:24 UTC (rev 18917)
+++ trunk/buildroot/package/nfs-utils/nfs-utils.mk	2007-06-25 10:29:47 UTC (rev 18918)
@@ -43,13 +43,13 @@
 		--prefix=/usr \
 		--disable-nfsv4 \
 		--disable-gss \
-	);
+	)
 	touch $@
 
 $(NFS_UTILS_DIR)/$(NFS_UTILS_BINARY): $(NFS_UTILS_DIR)/.configured
 	$(MAKE) CC=$(TARGET_CC) CC_FOR_BUILD="$(HOSTCC)" \
 		RPCGEN=/usr/bin/rpcgen -C $(NFS_UTILS_DIR)
-	touch -c $(NFS_UTILS_DIR)/$(NFS_UTILS_BINARY)
+	touch -c $@
 
 NFS_UTILS_TARGETS_  :=
 NFS_UTILS_TARGETS_y :=	usr/sbin/exportfs usr/sbin/rpc.mountd	\
@@ -61,17 +61,17 @@
 
 $(STAGING_DIR)/.fakeroot.nfs-utils: $(NFS_UTILS_DIR)/$(NFS_UTILS_BINARY)
 	# Use fakeroot to pretend to do 'make install' as root
-	echo "$(MAKE) prefix=$(TARGET_DIR)/usr statedir=$(TARGET_DIR)/var/lib/nfs CC=$(TARGET_CC) -C $(NFS_UTILS_DIR) install" > $@
-	echo "rm -f $(TARGET_DIR)/usr/bin/event_rpcgen.py $(TARGET_DIR)/usr/sbin/nhfs* $(TARGET_DIR)/usr/sbin/nfsstat $(TARGET_DIR)/usr/sbin/showmount" >> $@
-	echo "rm -rf $(TARGET_DIR)/usr/share/man" >> $@
-	echo "$(INSTALL) -m 0755 package/nfs-utils/S60nfs $(TARGET_DIR)/etc/init.d" >> $@
-	echo -n "for file in $(NFS_UTILS_TARGETS_) ; do rm -f $(TARGET_DIR)/" >> $@
+	echo '$(MAKE) prefix=$(TARGET_DIR)/usr statedir=$(TARGET_DIR)/var/lib/nfs $(TARGET_CONFIGURE_OPTS) -C $(NFS_UTILS_DIR) install' > $@
+	echo 'rm -f $(TARGET_DIR)/usr/bin/event_rpcgen.py $(TARGET_DIR)/usr/sbin/nhfs* $(TARGET_DIR)/usr/sbin/nfsstat $(TARGET_DIR)/usr/sbin/showmount' >> $@
+	echo 'rm -rf $(TARGET_DIR)/usr/share/man' >> $@
+	echo '$(INSTALL) -m 0755 package/nfs-utils/S60nfs $(TARGET_DIR)/etc/init.d' >> $@
+	echo -n 'for file in $(NFS_UTILS_TARGETS_) ; do rm -f $(TARGET_DIR)/' >> $@
 	echo -n "\$$" >> $@
 	echo "file; done" >> $@
-	echo "rm -rf $(TARGET_DIR)/var/lib/nfs" >> $@
+	echo 'rm -rf $(TARGET_DIR)/var/lib/nfs' >> $@
 
 $(TARGET_DIR)/$(NFS_UTILS_TARGET_BINARY): $(STAGING_DIR)/.fakeroot.nfs-utils
-	touch -c $(TARGET_DIR)/$(NFS_UTILS_TARGET_BINARY)
+	touch -c $@
 
 nfs-utils: uclibc host-fakeroot $(TARGET_DIR)/$(NFS_UTILS_TARGET_BINARY)
 
