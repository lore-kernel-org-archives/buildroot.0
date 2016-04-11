From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 11 Apr 2016 11:46:26 +0200
Subject: [Buildroot] [PATCH] flashrom: bump to version 0.9.9
Message-ID: <1460367986-22594-1-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Here are the release notes:
https://www.flashrom.org/Flashrom/0.9.9

Note that this version brings many cross-platform and
cross-architecture improvements like musl/uclibc support.

Therefore the patches can be removed as now fixed upstream.

Also remove the architecture limitation since MIPS, PPC, ARM,
PPC64, ARM64, SPARC, SH, M68K are all supported now.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
Hi all,

I've had to use flashrom and realized the current package was limited to x86 architectures. Looking into it, it seems that most architectures are now supported so I simply removed the limitation.

However I haven't tried to build against all the possible architectures. Is it possible to cherry-pick (without merging) that patch and make the build server try them all?

One thing is for sure, it works great on ARM.

Regards,
Gary
---
 package/flashrom/0001-spi.patch      | 25 -------------------------
 package/flashrom/0002-sys-io.h.patch | 27 ---------------------------
 package/flashrom/Config.in           |  2 --
 package/flashrom/flashrom.hash       |  2 +-
 package/flashrom/flashrom.mk         |  2 +-
 5 files changed, 2 insertions(+), 56 deletions(-)
 delete mode 100644 package/flashrom/0001-spi.patch
 delete mode 100644 package/flashrom/0002-sys-io.h.patch

diff --git a/package/flashrom/0001-spi.patch b/package/flashrom/0001-spi.patch
deleted file mode 100644
index 22ffcb5..0000000
--- a/package/flashrom/0001-spi.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-linux_spi: add missing include
-
-Some defines (e.g. _IOC_SIZEBITS) are defined in linux/ioctl.h,
-so it must be included before it is used, by SPI_IOC_MESSAGE
-from linux/spi/spidev.h
-
-Fixes build errors with the musl C library, as seen in these
-Buildroot autobuilder failures:
-
-    http://autobuild.buildroot.org/results/2a3/2a3744007c630c267575a638ebcd83a4b97644f5/build-end.log
-    http://autobuild.buildroot.org/results/3de/3de936d9be79e151e66af15193084d82a0f2c04a/build-end.log
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff -durN flashrom-0.9.8.orig/linux_spi.c flashrom-0.9.8/linux_spi.c
---- flashrom-0.9.8.orig/linux_spi.c	2015-10-28 19:42:38.480285847 +0100
-+++ flashrom-0.9.8/linux_spi.c	2015-10-28 19:43:15.492994613 +0100
-@@ -27,6 +27,7 @@
- #include <ctype.h>
- #include <unistd.h>
- #include <linux/types.h>
-+#include <linux/ioctl.h>
- #include <linux/spi/spidev.h>
- #include <sys/ioctl.h>
- #include "flash.h"
diff --git a/package/flashrom/0002-sys-io.h.patch b/package/flashrom/0002-sys-io.h.patch
deleted file mode 100644
index 8d990c6..0000000
--- a/package/flashrom/0002-sys-io.h.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-hwaccess: sys/io.h is not specific to glibc
-
-Under Linux, sys/io.h provides inb and outb, so we really need it.
-However, its inclusion is conditional to the _GLIBC_ define. This is
-usually OK under Linux, since both glibc and uClibc define it (uclibc
-fakes being glibc).
-
-But the musl C library does not impersonate glibc, so we're missing
-including sys/io.h in this case.
-
-Change the include from checking _GLIBC_ to checking whether this is
-Linux, looking for the __linux__ define.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff -durN flashrom-0.9.8.orig/hwaccess.h flashrom-0.9.8/hwaccess.h
---- flashrom-0.9.8.orig/hwaccess.h	2015-02-10 09:03:10.000000000 +0100
-+++ flashrom-0.9.8/hwaccess.h	2015-10-28 20:01:54.259202484 +0100
-@@ -27,7 +27,7 @@
- #include "platform.h"
- 
- #if IS_X86
--#if defined(__GLIBC__)
-+#if defined(__linux__)
- #include <sys/io.h>
- #endif
- #endif
diff --git a/package/flashrom/Config.in b/package/flashrom/Config.in
index adc068c..46fa641 100644
--- a/package/flashrom/Config.in
+++ b/package/flashrom/Config.in
@@ -6,7 +6,6 @@ config BR2_PACKAGE_FLASHROM
 	select BR2_PACKAGE_LIBFTDI
 	# dmidecode is only a runtime dependency
 	select BR2_PACKAGE_DMIDECODE
-	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_TOOLCHAIN_HAS_THREADS 	# libusb
 	help
 	  flashrom is a utility for identifying, reading, writing,
@@ -18,5 +17,4 @@ config BR2_PACKAGE_FLASHROM
 	  http://flashrom.org/
 
 comment "flashrom needs a toolchain w/ threads"
-	depends on BR2_i386 || BR2_x86_64
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/flashrom/flashrom.hash b/package/flashrom/flashrom.hash
index a216869..27328e4 100644
--- a/package/flashrom/flashrom.hash
+++ b/package/flashrom/flashrom.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 13dc7c895e583111ecca370363a3527d237d178a134a94b20db7df177c05f934 flashrom-0.9.8.tar.bz2
+sha256 cb3156b0f63eb192024b76c0814135930297aac41f80761a5d293de769783c45 flashrom-0.9.9.tar.bz2
diff --git a/package/flashrom/flashrom.mk b/package/flashrom/flashrom.mk
index 7e0fcf2..7ebda33 100644
--- a/package/flashrom/flashrom.mk
+++ b/package/flashrom/flashrom.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLASHROM_VERSION = 0.9.8
+FLASHROM_VERSION = 0.9.9
 FLASHROM_SOURCE = flashrom-$(FLASHROM_VERSION).tar.bz2
 FLASHROM_SITE = http://download.flashrom.org/releases
 FLASHROM_DEPENDENCIES = pciutils libusb libusb-compat libftdi host-pkgconf
-- 
2.7.0
