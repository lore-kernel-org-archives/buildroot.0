From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Nov 2014 15:44:27 +0100
Subject: [Buildroot] [PATCH] package/libv4l: needs headers >= 3.0
Message-ID: <1416149067-19925-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libv4l includes linux/media.h, which was introduced in v.2.6.39.

So, require at least 3.0 to be sure, since we have toolchains (like the
Code Sourcery Powerpc 2011.03) that still use 2.6.38 headers.

Fixes:
    http://autobuild.buildroot.net/results/ff7/ff7977c1cea0edfd230e12b74fc2c34bac7a0e4e/
    http://autobuild.buildroot.net/results/2bd/2bd30d942ec718e0a46ba2d1c043c9b6e2e6578b/
    http://autobuild.buildroot.net/results/c37/c371f4de7ec4b959310ca8e08cf289385fa0feae/
    ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/libv4l/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libv4l/Config.in b/package/libv4l/Config.in
index 04f0c6a..aca514a 100644
--- a/package/libv4l/Config.in
+++ b/package/libv4l/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_LIBV4L
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # media headers
 	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
@@ -28,6 +29,7 @@ config BR2_PACKAGE_LIBV4L_UTILS
 
 endif
 
-comment "libv4l needs a toolchain w/ largefile, threads and C++"
-	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
+comment "libv4l needs a toolchain w/ largefile, threads and C++, headers >= 3.0"
 	depends on BR2_USE_MMU
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
-- 
1.9.1
