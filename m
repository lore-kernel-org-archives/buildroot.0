From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jan 2016 21:33:07 +0100
Subject: [Buildroot] [git commit] openocd: remove BR2_ARCH_HAS_ATOMICS
	dependency
Message-ID: <20160201224659.A91A77FB26@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a148e2da7b0eba04cc8777f6dc7e3df782512f5f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For some reason, since when openocd was introduced, it was using a
BR2_ARCH_HAS_ATOMICS dependency for all sub-options that selected
BR2_PACKAGE_LIBFTDI1, even if the libftdi1 package did not have any
atomics dependency. Maybe it was confused with the libftdi package,
which did have a BR2_ARCH_HAS_ATOMICS dependency ?

Regardless, openocd with all four sub-options that currently depend on
BR2_ARCH_HAS_ATOMICS builds perfectly fine with a toolchain that does
not implement any of the __sync atomic built-ins, so we can remove the
BR2_ARCH_HAS_ATOMICS dependency.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openocd/Config.in | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/openocd/Config.in b/package/openocd/Config.in
index a35bd27..2313671 100644
--- a/package/openocd/Config.in
+++ b/package/openocd/Config.in
@@ -127,7 +127,6 @@ config BR2_PACKAGE_OPENOCD_FT2XXX
 	bool "FT2232 based devices (DEPRECATED)"
 	select BR2_PACKAGE_LIBFTDI1
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libftdi -> libusb
-	depends on BR2_ARCH_HAS_ATOMICS
 	help
 	  (DEPRECATED) Enable building support for FT2232
 	  based devices using the libftdi library
@@ -141,7 +140,6 @@ config BR2_PACKAGE_OPENOCD_UBLASTER
 	bool "Altera USB-Blaster"
 	select BR2_PACKAGE_LIBFTDI1
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libftdi -> libusb
-	depends on BR2_ARCH_HAS_ATOMICS
 	help
 	  Enable building support for the Altera USB-Blaster
 	  using the libftdi driver, opensource alternate of
@@ -182,7 +180,6 @@ config BR2_PACKAGE_OPENOCD_PRESTO
 	bool "ASIX Presto Programmer"
 	select BR2_PACKAGE_LIBFTDI1
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libftdi -> libusb
-	depends on BR2_ARCH_HAS_ATOMICS
 	help
 	  Enable building support for ASIX Presto Programmer
 	  using the libftdi driver
@@ -193,7 +190,6 @@ config BR2_PACKAGE_OPENOCD_OPENJTAG
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT # needs usb.h
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libftdi -> libusb
-	depends on BR2_ARCH_HAS_ATOMICS
 	help
 	  Enable building support for the OpenJTAG Programmer
 	  with ftdi driver
