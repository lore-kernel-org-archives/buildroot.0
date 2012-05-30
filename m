From: spdawson at gmail.com <spdawson@gmail.com>
Date: Wed, 30 May 2012 10:58:52 +0100
Subject: [Buildroot] [PATCH] nanocom: new package
Message-ID: <1338371933-10465-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/Config.in                                  |    1 +
 package/nanocom/Config.in                          |   11 ++++++++
 .../nanocom-dont-clobber-CC-definition.patch       |   23 +++++++++++++++++
 package/nanocom/nanocom.mk                         |   27 ++++++++++++++++++++
 4 files changed, 62 insertions(+)
 create mode 100644 package/nanocom/Config.in
 create mode 100644 package/nanocom/nanocom-dont-clobber-CC-definition.patch
 create mode 100644 package/nanocom/nanocom.mk

diff --git a/package/Config.in b/package/Config.in
index fb1b08f..b062210 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -205,6 +205,7 @@ source "package/mdadm/Config.in"
 source "package/memtester/Config.in"
 source "package/minicom/Config.in"
 source "package/mtd/Config.in"
+source "package/nanocom/Config.in"
 source "package/ntfs-3g/Config.in"
 source "package/open2300/Config.in"
 source "package/openocd/Config.in"
diff --git a/package/nanocom/Config.in b/package/nanocom/Config.in
new file mode 100644
index 0000000..51d628a
--- /dev/null
+++ b/package/nanocom/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_NANOCOM
+	bool "nanocom"
+	help
+	  Nanocom is based upon microcom (http://microcom.port5.com/) but
+	  removes the scripting and logging features while introducing support
+	  for setting local/remote echo, parity and stop bits. It also follows
+	  a more standard command line style using the getopt function.
+	  Internally much of the code has been rewritten and reformatted, the
+	  menu system in particular is almost entirely different.
+
+	  http://nanocom.sourceforge.net/
diff --git a/package/nanocom/nanocom-dont-clobber-CC-definition.patch b/package/nanocom/nanocom-dont-clobber-CC-definition.patch
new file mode 100644
index 0000000..a7bddd1
--- /dev/null
+++ b/package/nanocom/nanocom-dont-clobber-CC-definition.patch
@@ -0,0 +1,23 @@
+Fix the nanocom Makefile so that it doesn't clobber an existing CC definition.
+
+Signed-off-by: Simon Dawson <spdawson@gmail.com>
+
+diff -Nurp a/Makefile b/Makefile
+--- a/Makefile	2005-08-05 23:06:48.000000000 +0100
++++ b/Makefile	2012-05-30 10:46:11.378152722 +0100
+@@ -12,7 +12,7 @@
+ #** GNU General Public License for more details at www.gnu.org
+ #****************************************************************************/
+ 
+-CC=gcc
++CC?=gcc
+ 
+ all: clean nanocom
+ 
+@@ -21,4 +21,4 @@ nanocom:
+     
+ clean:
+ 	rm -rf *.o nanocom
+-    
+\ No newline at end of file
++    
diff --git a/package/nanocom/nanocom.mk b/package/nanocom/nanocom.mk
new file mode 100644
index 0000000..e53f1b4
--- /dev/null
+++ b/package/nanocom/nanocom.mk
@@ -0,1 +1,27 @@
+#############################################################
+#
+# nanocom
+#
+#############################################################
+NANOCOM_VERSION = 2.6.1
+NANOCOM_SOURCE = nanocom.tar.gz
+NANOCOM_SITE = http://prdownloads.sourceforge.net/nanocom/$(NANOCOM_SOURCE)?download
+
+# N.B. Don't strip any path components during extraction.
+define NANOCOM_EXTRACT_CMDS
+	gzip -d -c $(DL_DIR)/$(NANOCOM_SOURCE) | tar --strip-components=0 -C $(NANOCOM_DIR) -xf -
+endef
+
+define NANOCOM_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define NANOCOM_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/nanocom $(TARGET_DIR)/usr/bin/nanocom
+endef
+
+define NANOCOM_UNINSTALL_TARGET_CMDS
+	$(RM) $(TARGET_DIR)/usr/bin/nanocom
+endef
+
+$(eval $(call GENTARGETS))
-- 
1.7.9.5
