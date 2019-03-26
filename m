From: Esben Haabendal <esben.haabendal@gmail.com>
Date: Tue, 26 Mar 2019 15:24:11 +0100
Subject: [Buildroot] [PATCH v4] mtree: new package
Message-ID: <20190326142411.6943-1-esben.haabendal@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Esben Haabendal <esben@haabendal.dk>

Rebased against latest master, fixing merge conflict with DEVELOPERS file.

Signed-off-by: Esben Haabendal <esben@haabendal.dk>
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/mtree/Config.in  | 15 +++++++++++++++
 package/mtree/mtree.hash |  5 +++++
 package/mtree/mtree.mk   | 17 +++++++++++++++++
 5 files changed, 39 insertions(+)
 create mode 100644 package/mtree/Config.in
 create mode 100644 package/mtree/mtree.hash
 create mode 100644 package/mtree/mtree.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d21e494b1426..9496b30d3429 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -700,6 +700,7 @@ F:	package/szip/
 
 N:	Esben Haabendal <esben@haabendal.dk>
 F:	boot/gummiboot/
+F:	package/mtree/
 
 N:	Etienne Carriere <etienne.carriere@linaro.org>
 F:	boot/optee-os/
diff --git a/package/Config.in b/package/Config.in
index e372e0c43009..747eb39435f8 100644
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
index 000000000000..175d05d3bb0d
--- /dev/null
+++ b/package/mtree/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_MTREE
+	bool "mtree"
+	# mtree uses <fts.h> which is not included by default in uClibc
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	# fts.h does not support LFS (_FILE_OFFSET_BITS==64) in glibc versions
+	# older than 2.23, and codesourcery-arm is currently using glibc 2.18
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM
+	select BR2_PACKAGE_OPENSSL
+	help
+	  mtree - utility for creating and verifying file hierarchies.
+
+	  Port of the mtree utility, originally only available in BSD
+	  distributions, to Linux and other operating systems.
+
+	  https://github.com/archiecobbs/mtree-port
diff --git a/package/mtree/mtree.hash b/package/mtree/mtree.hash
new file mode 100644
index 000000000000..8dc54a201133
--- /dev/null
+++ b/package/mtree/mtree.hash
@@ -0,0 +1,5 @@
+# Locally computed
+sha256 fb5e99b28e270ab9a4622bd7142e9a7e9703fa08db3086398c52d33bb0505327  mtree-1.0.4.tar.gz
+
+# License file (locally computed as well)
+sha256 024360ed813a773260cee77ae84196da44a0842f45cd9bddad869de13d6c4bd2  COPYING
diff --git a/package/mtree/mtree.mk b/package/mtree/mtree.mk
new file mode 100644
index 000000000000..6227508106c7
--- /dev/null
+++ b/package/mtree/mtree.mk
@@ -0,0 +1,17 @@
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
+$(eval $(autotools-package))
-- 
2.21.0
