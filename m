From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jan 2016 00:07:48 +0100
Subject: [Buildroot] [PATCH 02/21] libftdi: remove BR2_ARCH_HAS_ATOMICS
	dependency
In-Reply-To: <1453676887-31236-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1453676887-31236-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1453676887-31236-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In commit 669ce8c75eb4c76cef81f279fb6b4f95d1472f51 ("libftdi: add
dependency on atomic operations"), a dependency on
BR2_ARCH_HAS_ATOMICS was added to the libftdi package to fix a build
failure occuring on the ARC architecture due to the missing
__sync_fetch_and_add_4 function:

../ftdipp/.libs/libftdipp.so: undefined reference to `__sync_fetch_and_add_4'

However, today, even on the SPARC architecture that does not implement
any of the __sync built-ins, libftdi and its C++ binding libftdipp
build fine. ARC was also tested and builds fine.

Therefore, we remove the BR2_ARCH_HAS_ATOMICS dependency from libftdi,
and also from flashrom, in which it was only present due to the
selection of libftdi. Note that anyway flashrom is available only for
i386 and x86_64, both of which implement all the __sync built-ins.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/flashrom/Config.in | 2 --
 package/libftdi/Config.in  | 2 --
 2 files changed, 4 deletions(-)

diff --git a/package/flashrom/Config.in b/package/flashrom/Config.in
index 9420cc6..adc068c 100644
--- a/package/flashrom/Config.in
+++ b/package/flashrom/Config.in
@@ -8,7 +8,6 @@ config BR2_PACKAGE_FLASHROM
 	select BR2_PACKAGE_DMIDECODE
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_TOOLCHAIN_HAS_THREADS 	# libusb
-	depends on BR2_ARCH_HAS_ATOMICS 	# libftdi
 	help
 	  flashrom is a utility for identifying, reading, writing,
 	  verifying and erasing flash chips. It is designed to flash
@@ -20,5 +19,4 @@ config BR2_PACKAGE_FLASHROM
 
 comment "flashrom needs a toolchain w/ threads"
 	depends on BR2_i386 || BR2_x86_64
-	depends on BR2_ARCH_HAS_ATOMICS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libftdi/Config.in b/package/libftdi/Config.in
index c0ab0f2..8e02cb9 100644
--- a/package/libftdi/Config.in
+++ b/package/libftdi/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_LIBFTDI
 	bool "libftdi"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
-	depends on BR2_ARCH_HAS_ATOMICS
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
 	help
@@ -27,5 +26,4 @@ comment "libftdi C++ bindings need a toolchain w/ wchar, C++"
 endif # BR2_PACKAGE_LIBFTDI
 
 comment "libftdi needs a toolchain w/ threads"
-	depends on BR2_ARCH_HAS_ATOMICS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.6.4
