From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 19 Jan 2016 23:43:38 +0100
Subject: [Buildroot] [PATCH] mpd: disable for sparcv8
Message-ID: <20160119224338.GA16884@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Even the main source code in mpd requires some missing
atomic ops. So only disable some failing plugins, does not
solve the following autobuild error:
http://autobuild.buildroot.net/results/e2207280f3a177e12dba502b1c01f5aeb431d04c/

Leon3 works fine.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/mpd/Config.in |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index be0843f..b88c0ca 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -6,6 +6,7 @@ menuconfig BR2_PACKAGE_MPD
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
 	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
+	depends on !BR2_sparc_v8 # feature need atomic ops
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
@@ -303,6 +304,7 @@ config BR2_PACKAGE_MPD_UPNP
 endif
 
 comment "mpd needs a toolchain w/ C++, threads, wchar, gcc >= 4.6"
+	depends on !BR2_sparc_v8 # feature need atomic ops
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-- 
1.7.10.4
