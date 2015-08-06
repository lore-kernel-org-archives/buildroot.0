From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Aug 2015 08:54:52 +0200
Subject: [Buildroot] [git commit] package/poco: disable for static build
Message-ID: <20150806065536.04CAF81E66@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=073a89196a22f995c142cd11640d3cfb7cef691d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

poco requires dlopen(). There is a --no-sharedlibs option that is
supposed to support building in a statically linked environment, but
it doesn't do anything.

Fixes:

  http://autobuild.buildroot.net/results/952/952f05efd245ba59991f3c5be02a0572e8b9e544/

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/poco/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/poco/Config.in b/package/poco/Config.in
index 155f098..dfdc8d1 100644
--- a/package/poco/Config.in
+++ b/package/poco/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_POCO
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS # dlopen()
 	depends on !(BR2_arc || BR2_bfin || BR2_microblaze || BR2_mipsel \
 		|| BR2_xtensa)
 	select BR2_PACKAGE_ZLIB
@@ -60,8 +61,8 @@ config BR2_PACKAGE_POCO_DATA_MYSQL
 
 endif # BR2_PACKAGE_POCO
 
-comment "poco needs a toolchain w/ wchar, threads, C++"
+comment "poco needs a toolchain w/ wchar, threads, C++, dynamic library"
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_TOOLCHAIN_HAS_THREADS
+		|| !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 	depends on !(BR2_arc || BR2_bfin || BR2_microblaze || BR2_mipsel \
 		|| BR2_xtensa)
