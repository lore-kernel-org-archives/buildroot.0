From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 22 Jan 2007 07:56:43 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/nfs-utils
Message-ID: <20070122155643.3A6BB4857D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-22 07:56:42 -0800 (Mon, 22 Jan 2007)
New Revision: 17463

Log:
- make it compile if LFS is turned off and add a warning to the help-text.
  LFS is _not_ turned on by this automagically _on_ _purpose_


Modified:
   trunk/buildroot/package/nfs-utils/Config.in
   trunk/buildroot/package/nfs-utils/nfs-utils.mk


Changeset:
Modified: trunk/buildroot/package/nfs-utils/Config.in
===================================================================
--- trunk/buildroot/package/nfs-utils/Config.in	2007-01-22 14:59:06 UTC (rev 17462)
+++ trunk/buildroot/package/nfs-utils/Config.in	2007-01-22 15:56:42 UTC (rev 17463)
@@ -3,6 +3,8 @@
 	default n
 	help
 	  The NFS Linux kernel server.
+	  Warning: We do not force largefile support on here on purpose.
+	  Enable it yourself if you want to access big exports!
 
 	  http://sourceforge.net/projects/nfs
 

Modified: trunk/buildroot/package/nfs-utils/nfs-utils.mk
===================================================================
--- trunk/buildroot/package/nfs-utils/nfs-utils.mk	2007-01-22 14:59:06 UTC (rev 17462)
+++ trunk/buildroot/package/nfs-utils/nfs-utils.mk	2007-01-22 15:56:42 UTC (rev 17463)
@@ -11,6 +11,13 @@
 NFS_UTILS_BINARY:=utils/nfsd/nfsd
 NFS_UTILS_TARGET_BINARY:=usr/sbin/rpc.nfsd
 
+BR2_NFS_UTILS_CFLAGS=
+ifeq ($(BR2_LARGEFILE),)
+BR2_NFS_UTILS_CFLAGS+=-U_LARGEFILE64_SOURCE -U_FILE_OFFSET_BITS
+endif
+BR2_NFS_UTILS_CFLAGS+=-DUTS_RELEASE='\"$(LINUX_HEADERS_VERSION)\"'
+
+
 $(DL_DIR)/$(NFS_UTILS_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(NFS_UTILS_SITE)/$(NFS_UTILS_SOURCE)
 
@@ -25,7 +32,7 @@
 $(NFS_UTILS_DIR)/.configured: $(NFS_UTILS_DIR)/.unpacked
 	(cd $(NFS_UTILS_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
-		CFLAGS="$(TARGET_CFLAGS)" \
+		CFLAGS="$(TARGET_CFLAGS) $(BR2_NFS_UTILS_CFLAGS)" \
 		LDFLAGS="$(TARGET_LDFLAGS)" \
 		knfsd_cv_bsd_signals=no \
 		./configure \
