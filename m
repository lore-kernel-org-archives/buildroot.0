From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 2 Jan 2020 09:16:52 +0100
Subject: [Buildroot] [git commit] package/stella: needs exception_ptr
Message-ID: <20200102080722.739DE8EB55@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=00c65a04fa505fafb47cf20a930b650e4ed40700
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

exception_ptr is needed since version 6.0 and
https://github.com/stella-emu/stella/commit/afb1e1d1e1bc5afdb79860d2e33af3abc761303c

Fixes:
 - http://autobuild.buildroot.org/results/b231de3d233481f11e6cd6a4df9bb6a9da685b9f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/stella/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/stella/Config.in b/package/stella/Config.in
index 326b3f75eb..709da98159 100644
--- a/package/stella/Config.in
+++ b/package/stella/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_STELLA
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
 	select BR2_PACKAGE_SDL2
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_ZLIB
@@ -16,3 +17,6 @@ comment "stella needs a toolchain w/ dynamic library, C++, threads, gcc >= 5"
 	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
+
+comment "stella needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
