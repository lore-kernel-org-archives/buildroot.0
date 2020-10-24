From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Oct 2020 22:54:45 +0200
Subject: [Buildroot] [git commit] package/s390-tools: add zlib dependency
Message-ID: <20201024204313.36381836D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a5a9dfce5afad0e334a87df5d70a2cf593c80950
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

zlib is required to build s390-tools and cannot be disabled for now
due to libvmdump.

Fixes:

$BUILD_DIR/host/bin/s390x-buildroot-linux-gnu-g++ ... -c vmdump_convert.cpp -o vmdump_convert.o
lkcd_dump.cpp:15:10: fatal error: zlib.h: No such file or directory
   15 | #include <zlib.h>
      |          ^~~~~~~~
compilation terminated.

Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/s390-tools/Config.in     | 1 +
 package/s390-tools/s390-tools.mk | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/s390-tools/Config.in b/package/s390-tools/Config.in
index a553b5eeab..4aede4e265 100644
--- a/package/s390-tools/Config.in
+++ b/package/s390-tools/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_S390_TOOLS
 	depends on BR2_s390x
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_ZLIB
 	help
 	  Tools for use with the s390 Linux kernel and device drivers.
 
diff --git a/package/s390-tools/s390-tools.mk b/package/s390-tools/s390-tools.mk
index 4d4c8188fe..d186f85cd3 100644
--- a/package/s390-tools/s390-tools.mk
+++ b/package/s390-tools/s390-tools.mk
@@ -8,6 +8,7 @@ S390_TOOLS_VERSION = 2.14.0
 S390_TOOLS_SITE = $(call github,ibm-s390-tools,s390-tools,v$(S390_TOOLS_VERSION))
 S390_TOOLS_LICENSE = MIT
 S390_TOOLS_LICENSE_FILES = LICENSE
+S390_TOOLS_DEPENDENCIES = zlib
 
 S390_TOOLS_MAKE_OPTS = \
 	ARCH=$(BR2_ARCH) \
