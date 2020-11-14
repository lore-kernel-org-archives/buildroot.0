From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 14 Nov 2020 17:51:00 +0100
Subject: [Buildroot] [PATCH/RFC 1/1] package/clamav: disable on riscv64
Message-ID: <20201114165100.2220981-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/6ad/6adc1ff74be4848c057aaf7bd02cc4b7d3610b1c/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
The real fix is to add

    "#define __ARCH_WANT_RENAMEAT"

to the kernel headers in arch/riscv/include/uapi/asm/unistd.h
Inspired by https://lore.kernel.org/patchwork/patch/856923/#1053531

But patching kernel headers/image seems to be complicated.
Because I did not find a way to do so I am sending this patch as RFC
combined with a request for help.

 package/clamav/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/clamav/Config.in b/package/clamav/Config.in
index 990a818b5c..21add35c91 100644
--- a/package/clamav/Config.in
+++ b/package/clamav/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_CLAMAV
 	bool "clamav"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_RISCV_64 # renameat
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS # dlopen
@@ -20,3 +21,4 @@ comment "clamav needs a toolchain w/ C++, dynamic library, threads, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS \
 		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
 	depends on BR2_USE_MMU
+	depends on !BR2_RISCV_64
-- 
2.27.0
