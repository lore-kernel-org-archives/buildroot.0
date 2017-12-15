From: Kees van Unen <keesvanunen@hotmail.com>
Date: Fri, 15 Dec 2017 15:38:42 +0000
Subject: [Buildroot] FW:  [PATCH v2 1/2] iqvlinux: bump to version 1.2.0.3
In-Reply-To: <20171215153830.4864-1-casantos@datacom.ind.br>
References: <20171215153830.4864-1-casantos@datacom.ind.br>
Message-ID: <2f881da3eb484040a8fca1b93374e9f1@AM5PR0801MB1394.eurprd08.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net




________________________________________
Van: buildrootNamensCarlos Santos
Verzonden: vrijdag 15 december 2017 16:38:29 (UTC+01:00) Amsterdam, Berlijn, Bern, Rome, Stockholm, Wenen
Aan: buildroot at buildroot.org
CC: Romain Naour
Onderwerp: [Buildroot] [PATCH v2 1/2] iqvlinux: bump to version 1.2.0.3

This package is really annoying since the archive name doesn't contain
the version. Use a small trick to save it with a better name. Also add
hashes for license files.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
Changes v1->v2:
  - Move comment about the patch, in package/iqvlinux/Config.in, to the
    next commit.
  - Use a small trick to save the source file with a better name.
---
 package/iqvlinux/Config.in     |  2 +-
 package/iqvlinux/iqvlinux.hash |  9 +++++----
 package/iqvlinux/iqvlinux.mk   | 17 ++++++++++++++---
 3 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/package/iqvlinux/Config.in b/package/iqvlinux/Config.in
index 8959955745..09502d141e 100644
--- a/package/iqvlinux/Config.in
+++ b/package/iqvlinux/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_IQVLINUX
          Note: This driver requires PCI support to be enabled
          (i.e. CONFIG_PCI).

-         http://sourceforge.net/projects/e1000/files/iqvlinux/
+         https://sourceforge.net/projects/e1000/files/iqvlinux/

 comment "iqvlinux needs a Linux kernel to be built"
        depends on !BR2_LINUX_KERNEL
diff --git a/package/iqvlinux/iqvlinux.hash b/package/iqvlinux/iqvlinux.hash
index ddf57b712c..20d612ddc5 100644
--- a/package/iqvlinux/iqvlinux.hash
+++ b/package/iqvlinux/iqvlinux.hash
@@ -1,5 +1,6 @@
-# From http://sourceforge.net/projects/e1000/files/iqvlinux/1.1.5.3/
-sha1   bd94416e4364015dbbd78a22e51080bf7ea81fac        iqvlinux.tar.gz
-md5    fb6a2a4dc122d39070fcb06985c97a05        iqvlinux.tar.gz
 # locally computed
-sha256 8cb19f3bfe040100a13bb2d05cb2b54f2b259e55cef23f8cc5aa6f2f31e98bec        iqvlinux.tar.gz
+sha256 4020a661940ba6d50f24654b90a41280eb8eccf00061fe6d105c654d3d97d551  iqvlinux-1.2.0.3.tar.gz
+sha256 386086e232db4708770f717595d4f83188f776aa6e7313cd12fb039e869f494b  COPYING
+sha256 beded926a8f18aad5d911daf581759e2b25697588034d2b29033ae1a929506ff  src/linux/driver/files.txt
+sha256 ecf93b9b739fc82f7b87b34f8c6411dfdd271234af2fe45212293d9df2b654b3  inc/linux/files.txt
+sha256 0a309350c1b32be72479e8fe08f7f6bbbad2e8c3d9a1cbcad3d482ea48a236ad  inc/files.txt
diff --git a/package/iqvlinux/iqvlinux.mk b/package/iqvlinux/iqvlinux.mk
index 165c7c4687..a00f85c0bc 100644
--- a/package/iqvlinux/iqvlinux.mk
+++ b/package/iqvlinux/iqvlinux.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################

-IQVLINUX_VERSION = 1.1.5.3
-IQVLINUX_SITE = http://sourceforge.net/projects/e1000/files/iqvlinux/$(IQVLINUX_VERSION)
-IQVLINUX_SOURCE = iqvlinux.tar.gz
+IQVLINUX_VERSION = 1.2.0.3
+IQVLINUX_SITE = https://downloads.sourceforge.net/project/e1000/iqvlinux/$(IQVLINUX_VERSION)

 IQVLINUX_LICENSE = GPL-2.0, BSD-3-Clause
 IQVLINUX_LICENSE_FILES = \
@@ -17,5 +16,17 @@ IQVLINUX_MODULE_MAKE_OPTS = NALDIR=$(@D) KSRC=$(LINUX_DIR) CC=$(TARGET_CC)

 IQVLINUX_MODULE_SUBDIRS = src/linux/driver

+# This package is really annoying since the archive name doesn't contain the
+# version. Use a small trick to save it with a better name.
+define IQVLINUX_DOWNLOAD
+       $(EXTRA_ENV) $(DL_WRAPPER) -b wget \
+               -o $(DL_DIR)/$(IQVLINUX_SOURCE) \
+               -H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
+               -- \
+               $(IQVLINUX_SITE)/iqvlinux.tar.gz
+endef
+
+IQVLINUX_PRE_DOWNLOAD_HOOKS = IQVLINUX_DOWNLOAD
+
 $(eval $(kernel-module))
 $(eval $(generic-package))
--
2.14.3

_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
