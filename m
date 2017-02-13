From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Feb 2017 10:35:02 +0100
Subject: [Buildroot] [PATCH] kmsxx: not available on m68k
Message-ID: <20170213093502.26507-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/273/2738e5fd446467b105f6dcca391500e3734e5a9b/
http://autobuild.buildroot.net/results/7eb/7ebaa00b2d14131fadd15df6db32632828c1de33/
http://autobuild.buildroot.net/results/42c/42c2aa4b58de3ab84a27f53a696fa60d087c178b/

GCC dies with an internal compiler error when building kmsxx on m68k, so disable it.

These autobuilder issues are with a 2016.11 toolchain (gcc 5.x), but also
verified with gcc 6.3.0 / binutils 2.27.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kmsxx/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/kmsxx/Config.in b/package/kmsxx/Config.in
index 1d174c18b..3750897bb 100644
--- a/package/kmsxx/Config.in
+++ b/package/kmsxx/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_KMSXX
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
+	depends on !BR2_m68k # gcc ice
 	select BR2_PACKAGE_LIBDRM
 	help
 	  libkms++ is a C++11 library for kernel mode setting.
@@ -24,3 +25,4 @@ endif
 comment "kms++ needs a toolchain w/ threads, C++, gcc >= 4.8, headers >= 3.8"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8
+	depends on !BR2_m68k
-- 
2.11.0
