From: Esben Haabendal <esben.haabendal@gmail.com>
Date: Wed, 20 Mar 2019 21:45:51 +0100
Subject: [Buildroot] [PATCH v2] mtree: new package
Message-ID: <20190320204551.16245-1-esben.haabendal@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Esben Haabendal <esben@haabendal.dk>

Signed-off-by: Esben Haabendal <esben@haabendal.dk>
---
 DEVELOPERS              |  3 +++
 package/Config.in       |  1 +
 package/mtree/Config.in | 12 ++++++++++++
 package/mtree/mtree.mk  | 23 +++++++++++++++++++++++
 4 files changed, 39 insertions(+)
 create mode 100644 package/mtree/Config.in
 create mode 100644 package/mtree/mtree.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 3e0ac08e1136..4b827ae4d276 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -697,6 +697,9 @@ F:	package/mxsldr/
 N:	Ernesto L. Williams Jr <realcontrols@gmail.com>
 F:	package/szip/
 
+N:	Esben Haabendal <esben@haabendal.dk>
+F:	package/mtree/
+
 N:	Etienne Carriere <etienne.carriere@linaro.org>
 F:	boot/optee-os/
 F:	package/optee-benchmark/
diff --git a/package/Config.in b/package/Config.in
index b5321aeb49c9..13f7fae09df6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -197,6 +197,7 @@ menu "Filesystem and flash utilities"
 	source "package/mmc-utils/Config.in"
 	source "package/mtd/Config.in"
 	source "package/mtools/Config.in"
+	source "package/mtree/Config.in"
 	source "package/nfs-utils/Config.in"
 	source "package/nilfs-utils/Config.in"
 	source "package/ntfs-3g/Config.in"
diff --git a/package/mtree/Config.in b/package/mtree/Config.in
new file mode 100644
index 000000000000..38375f012e28
--- /dev/null
+++ b/package/mtree/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_MTREE
+	bool "mtree"
+	# mtree uses <fts.h> which is not included by default in uClibc
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_OPENSSL
+	help
+	  mtree - utility for creating and verifying file hierarchies.
+
+	  Port of the mtree utility, originally only available in BSD
+	  distributions, to Linux and other operating systems.
+
+	  https://github.com/archiecobbs/mtree-port
diff --git a/package/mtree/mtree.mk b/package/mtree/mtree.mk
new file mode 100644
index 000000000000..9c5fa2d44d19
--- /dev/null
+++ b/package/mtree/mtree.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# mtree
+#
+################################################################################
+
+MTREE_VERSION = 1.0.4
+MTREE_SOURCE = mtree-$(MTREE_VERSION).tar.gz
+MTREE_SITE = https://s3.amazonaws.com/archie-public/mtree-port
+MTREE_LICENSE = BSD-3-Clause
+MTREE_LICENSE_FILES = COPYING
+
+MTREE_DEPENDENCIES = openssl
+
+MTREE_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-exec
+
+MTREE_TARGET_CFLAGS="$(filter-out -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))"
+MTREE_TARGET_CPPFLAGS="$(filter-out -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64,$(TARGET_CPPFLAGS))"
+MTREE_CONF_ENV = \
+	CPPFLAGS="$(MTREE_TARGET_CPPFLAGS)" \
+	CFLAGS="$(MTREE_TARGET_CFLAGS)"
+
+$(eval $(autotools-package))
-- 
2.21.0
