From: Simon Rowe <simon.rowe@citrix.com>
Date: Thu, 25 Jul 2019 09:30:21 +0100
Subject: [Buildroot] [PATCH 1/1] package/openvmtools: use tirpc when no
 toolchain RPC
Message-ID: <1564043421-126710-1-git-send-email-simon.rowe@citrix.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

openvmtools detects an external RPC library, select package/libtirpc
when necessary.

Signed-off-by: Simon Rowe <simon.rowe@citrix.com>
---
 package/openvmtools/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openvmtools/Config.in b/package/openvmtools/Config.in
index 97860f8..2bd5c27 100644
--- a/package/openvmtools/Config.in
+++ b/package/openvmtools/Config.in
@@ -4,11 +4,11 @@ config BR2_PACKAGE_OPENVMTOOLS
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
-	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	depends on BR2_ENABLE_LOCALE
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBDNET
+	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	help
 	  Open Virtual Machine Tools for VMware guest OS
 
@@ -61,9 +61,9 @@ comment "resolutionkms needs udev, a toolchain w/ threads"
 
 endif
 
-comment "openvmtools needs a glibc or musl toolchain w/ wchar, threads, RPC, locale"
+comment "openvmtools needs a glibc or musl toolchain w/ wchar, threads, locale"
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_HAS_NATIVE_RPC || !BR2_ENABLE_LOCALE || \
+		!BR2_ENABLE_LOCALE || \
 		BR2_TOOLCHAIN_USES_UCLIBC
-- 
1.8.3.1
