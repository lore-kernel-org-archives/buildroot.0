From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Jun 2020 22:48:04 +0200
Subject: [Buildroot] [git commit] package/pciutils: bump to version 3.7.0
Message-ID: <20200604204735.06D548379E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3bc5df8cb158fdb877f4935b29946f1bc69981da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use CROSS_COMPILE for toolchain prefix. Makefile derives CC, AR, and
RANLIB from that.

Remove sed manipulation of the lib/configure script. Host uname is not
used when the HOST variable is set as we do.

Remove sed manipulation of Makefile. Set STRIP to an empty string
instead.

Format hash file with two space separators.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pciutils/pciutils.hash |  4 ++--
 package/pciutils/pciutils.mk   | 13 ++++---------
 2 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/package/pciutils/pciutils.hash b/package/pciutils/pciutils.hash
index da0358cacd..4b13c7484e 100644
--- a/package/pciutils/pciutils.hash
+++ b/package/pciutils/pciutils.hash
@@ -1,3 +1,3 @@
 # From https://www.kernel.org/pub/software/utils/pciutils/sha256sums.asc
-sha256	1d62f8fa192f90e61c35a6fc15ff3cb9a7a792f782407acc42ef67817c5939f5	pciutils-3.5.5.tar.xz
-sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6	COPYING
+sha256  9d40b97be8b6a2cdf96aead5a61881d1f7e4e0da9544a9bac4fba1ae9dcd40eb  pciutils-3.7.0.tar.xz
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index 30d429e75a..9b83b62b55 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -4,20 +4,19 @@
 #
 ################################################################################
 
-PCIUTILS_VERSION = 3.5.5
+PCIUTILS_VERSION = 3.7.0
 PCIUTILS_SITE = $(BR2_KERNEL_MIRROR)/software/utils/pciutils
 PCIUTILS_SOURCE = pciutils-$(PCIUTILS_VERSION).tar.xz
 PCIUTILS_INSTALL_STAGING = YES
 PCIUTILS_LICENSE = GPL-2.0+
 PCIUTILS_LICENSE_FILES = COPYING
 PCIUTILS_MAKE_OPTS = \
-	CC="$(TARGET_CC)" \
+	CROSS_COMPILE="$(TARGET_CROSS)" \
 	HOST="$(KERNEL_ARCH)-linux" \
 	OPT="$(TARGET_CFLAGS)" \
 	LDFLAGS="$(TARGET_LDFLAGS)" \
-	RANLIB=$(TARGET_RANLIB) \
-	AR=$(TARGET_AR) \
-	DNS=no
+	DNS=no \
+	STRIP=
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 PCIUTILS_DEPENDENCIES += udev
@@ -48,10 +47,6 @@ endif
 
 define PCIUTILS_CONFIGURE_CMDS
 	$(SED) 's/wget --no-timestamping/wget/' $(PCIUTILS_DIR)/update-pciids.sh
-	$(SED) 's/uname -s/echo Linux/' \
-		-e 's/uname -r/echo $(LINUX_HEADERS_VERSION)/' \
-		$(PCIUTILS_DIR)/lib/configure
-	$(SED) 's/^STRIP/#STRIP/' $(PCIUTILS_DIR)/Makefile
 endef
 
 define PCIUTILS_BUILD_CMDS
