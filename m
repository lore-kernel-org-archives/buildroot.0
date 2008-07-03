From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu,  3 Jul 2008 01:12:54 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/samba
Message-ID: <20080703081254.838FB3C647@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-07-03 01:12:51 -0700 (Thu, 03 Jul 2008)
New Revision: 22615

Log:
install SAMBA SWAT correctly, add hint for autoconf, courtesy HC Egtvedt

Modified:
   trunk/buildroot/package/samba/samba.mk


Changeset:
Modified: trunk/buildroot/package/samba/samba.mk
===================================================================
--- trunk/buildroot/package/samba/samba.mk	2008-07-03 08:11:04 UTC (rev 22614)
+++ trunk/buildroot/package/samba/samba.mk	2008-07-03 08:12:51 UTC (rev 22615)
@@ -28,10 +28,13 @@
 		samba_cv_HAVE_GETTIMEOFDAY_TZ=yes \
 		samba_cv_USE_SETREUID=yes \
 		samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=yes \
+		samba_cv_HAVE_IFACE_IFCONF=yes \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--localstatedir=/var \
 		--with-lockdir=/var/cache/samba \
 		--with-piddir=/var/run \
 		--with-privatedir=/etc/samba \
@@ -96,6 +99,9 @@
 	for file in $(SAMBA_TARGETS_y); do \
 		$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/$$file; \
 	done
+ifeq ($(strip $(BR2_PACKAGE_SAMBA_SWAT)),y)
+	cp -dpfr $(SAMBA_DIR)/../swat $(TARGET_DIR)/usr/
+endif
 	$(INSTALL) -m 0755 package/samba/S91smb $(TARGET_DIR)/etc/init.d
 	@if [ ! -f $(TARGET_DIR)/etc/samba/smb.conf ]; then \
 		$(INSTALL) -m 0755 -D package/samba/simple.conf $(TARGET_DIR)/etc/samba/smb.conf; \
