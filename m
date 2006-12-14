From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 14 Dec 2006 07:37:42 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libsysfs
Message-ID: <20061214153742.5D0FF4860C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-14 07:37:42 -0800 (Thu, 14 Dec 2006)
New Revision: 16927

Log:
- bump version


Modified:
   trunk/buildroot/package/libsysfs/libsysfs.mk


Changeset:
Modified: trunk/buildroot/package/libsysfs/libsysfs.mk
===================================================================
--- trunk/buildroot/package/libsysfs/libsysfs.mk	2006-12-14 15:37:12 UTC (rev 16926)
+++ trunk/buildroot/package/libsysfs/libsysfs.mk	2006-12-14 15:37:42 UTC (rev 16927)
@@ -21,7 +21,7 @@
 # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
 # USA
 
-LIBSYSFS_VER:=1.3.0
+LIBSYSFS_VER:=2.1.0
 LIBSYSFS_DIR:=$(BUILD_DIR)/sysfsutils-$(LIBSYSFS_VER)
 LIBSYSFS_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/linux-diag
 LIBSYSFS_SOURCE:=sysfsutils-$(LIBSYSFS_VER).tar.gz
@@ -36,10 +36,14 @@
 	$(LIBSYSFS_CAT) $(DL_DIR)/$(LIBSYSFS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	touch $(LIBSYSFS_DIR)/.unpacked
 
+ifeq ($(BR2_INSTALL_LIBSTDCPP),)
+LIBSYSFS_CXX:=CXX=""
+endif
 $(LIBSYSFS_DIR)/.configured: $(LIBSYSFS_DIR)/.unpacked
 	(cd $(LIBSYSFS_DIR); \
 	$(TARGET_CONFIGURE_OPTS) \
 	CFLAGS="$(TARGET_CFLAGS) " \
+	$(LIBSYSFS_CXX) \
 	./configure \
 	--target=$(GNU_TARGET_NAME) \
 	--host=$(GNU_TARGET_NAME) \
@@ -63,6 +67,7 @@
 
 libsysfs-clean:
 	-$(MAKE) -C $(LIBSYSFS_DIR) clean
+	rm -f $(TARGET_DIR)/usr/lib/libsysfs.so*
 
 libsysfs-dirclean:
 	rm -rf $(LIBSYSFS_DIR)
