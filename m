From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat,  1 Mar 2014 16:04:15 -0300
Subject: [Buildroot] [PATCHv2] lzip: new package
Message-ID: <1393700655-14223-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The host variant is in preparation for possibly some gnu packages
shipping tar.lz versions only.
At least ed 1.10 did it (still needed to add extraction support for it).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in      |  1 +
 package/lzip/Config.in | 15 +++++++++++++++
 package/lzip/lzip.mk   | 40 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 56 insertions(+)
 create mode 100644 package/lzip/Config.in
 create mode 100644 package/lzip/lzip.mk

diff --git a/package/Config.in b/package/Config.in
index 33a68f0..5b5dc6d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -35,6 +35,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/gzip/Config.in"
 endif
 source "package/infozip/Config.in"
+source "package/lzip/Config.in"
 source "package/lzop/Config.in"
 source "package/xz/Config.in"
 endmenu
diff --git a/package/lzip/Config.in b/package/lzip/Config.in
new file mode 100644
index 0000000..b72ac78
--- /dev/null
+++ b/package/lzip/Config.in
@@ -0,0 +1,15 @@
+comment "lzip needs a toolchain w/ C++, largefile"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_LARGEFILE)
+
+config BR2_PACKAGE_LZIP
+	bool "lzip"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_LARGEFILE
+	help
+	  Lzip is a lossless data compressor with a user interface similar
+	  to the one of gzip or bzip2.
+	  Lzip is about as fast as gzip, compresses most files more than
+	  bzip2, and is better than both from a data recovery perspective.
+	  Lzip is a clean implementation of the LZMA algorithm.
+
+	  http://savannah.nongnu.org/projects/lzip
diff --git a/package/lzip/lzip.mk b/package/lzip/lzip.mk
new file mode 100644
index 0000000..0aa7051
--- /dev/null
+++ b/package/lzip/lzip.mk
@@ -0,0 +1,40 @@
+################################################################################
+#
+# lzip
+#
+################################################################################
+
+LZIP_VERSION = 1.15
+LZIP_SITE = http://download.savannah.gnu.org/releases/lzip/
+LZIP_LICENSE = GPLv3+
+LZIP_LICENSE_FILES = COPYING
+
+define LZIP_CONFIGURE_CMDS
+	(cd $(@D); ./configure --prefix=/usr \
+		$(TARGET_CONFIGURE_OPTS) )
+endef
+
+define HOST_LZIP_CONFIGURE_CMDS
+	(cd $(@D); ./configure --prefix=/usr \
+		$(HOST_CONFIGURE_OPTS) )
+endef
+
+define LZIP_BUILD_CMDS
+	$(MAKE) -C $(@D)
+endef
+
+define HOST_LZIP_BUILD_CMDS
+	$(MAKE) -C $(@D)
+endef
+
+define LZIP_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
+define HOST_LZIP_INSTALL_CMDS
+	$(MAKE) -C $(@D) DESTDIR=$(HOST_DIR) install
+endef
+
+# It's not autotools-based
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
1.8.3.2
