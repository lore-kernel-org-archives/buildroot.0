From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 20 Aug 2020 22:41:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/openfpgaloader: needs gcc >= 4.9
Message-ID: <20200820204158.1237689-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

openfpgaloader needs C++11 as specified in CMakeLists.txt:
set(CMAKE_CXX_STANDARD 11)

The build on gcc 4.8 fails on:

/home/buildroot/autobuild/instance-1/output-1/build/openfpgaloader-849e5751e06d4d00f323205d5f02ee01f9f59a61/src/spiFlash.cpp: In member function 'void SPIFlash::jtag_write_read(uint8_t, uint8_t*, uint8_t*, uint16_t)':
/home/buildroot/autobuild/instance-1/output-1/build/openfpgaloader-849e5751e06d4d00f323205d5f02ee01f9f59a61/src/spiFlash.cpp:92:43: error: variable-sized object 'jtx' may not be initialized
  uint8_t jtx[xfer_len] = {reverseByte(cmd)};
                                           ^

Fixes:
 - http://autobuild.buildroot.org/results/f3f3cc216ae42bb8a8925b0df7c1a3cc79b027d7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/openfpgaloader/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/openfpgaloader/Config.in b/package/openfpgaloader/Config.in
index 9835b84b64..493fa09c84 100644
--- a/package/openfpgaloader/Config.in
+++ b/package/openfpgaloader/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_OPENFPGALOADER
 	depends on BR2_PACKAGE_HAS_UDEV
 	depends on BR2_INSTALL_LIBSTDCPP # libftdipp1
 	depends on BR2_USE_WCHAR # libftdipp1
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
 	select BR2_PACKAGE_ARGP_STANDALONE \
 	       if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL # argp
 	select BR2_PACKAGE_LIBFTDI1
@@ -13,6 +14,7 @@ config BR2_PACKAGE_OPENFPGALOADER
 
 	  https://github.com/trabucayre/openFPGALoader/
 
-comment "openfpgaloader needs udev, a toolchain w/ threads, wchar, C++"
+comment "openfpgaloader needs udev, a toolchain w/ threads, wchar, C++, gcc >= 4.9"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
-		!BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_HAS_UDEV
+		!BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_HAS_UDEV || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-- 
2.27.0
