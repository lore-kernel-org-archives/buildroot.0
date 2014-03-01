From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 21:01:11 +0100
Subject: [Buildroot] [git commit] lzip: new package
Message-ID: <20140301200223.C951B99374@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=46416950caac37a16f2c34c77be3ac2b046f266c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The host variant is in preparation for possibly some gnu packages
shipping tar.lz versions only.
At least ed 1.10 did it (still needed to add extraction support for it).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in      |    1 +
 package/lzip/Config.in |   15 +++++++++++++++
 package/lzip/lzip.mk   |   40 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 56 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 730f7da..f390268 100644
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
