From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Tue, 21 May 2019 18:18:32 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/libubootenv: fix build with
 musl and static lib
Message-ID: <1558455512-31444-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libubootenv is a shared library, so add missing dependency on !BR2_STATIC_LIBS.

Also add BR2_TOOLCHAIN_USES_MUSL dependency to avoid 'unknown type name 'loff_t''.

Fixes:
 - http://autobuild.buildroot.net/results/206/206f1eba0dec39de1c02d760fa8f961d5a3879d0/
 - http://autobuild.buildroot.net/results/8a6/8a6b3087a4c2cb53f4e9b80183c7f4b0ea6ffd3b/

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/libubootenv/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libubootenv/Config.in b/package/libubootenv/Config.in
index 9be52c4..bad5aee 100644
--- a/package/libubootenv/Config.in
+++ b/package/libubootenv/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_LIBUBOOTENV
 	bool "libubootenv"
+	depends on !BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_USES_MUSL # loff_t
 	select BR2_PACKAGE_ZLIB
 	help
 	  libubootenv is a library that provides a hardware independent
@@ -9,3 +11,6 @@ config BR2_PACKAGE_LIBUBOOTENV
 	  new tools build from the library and not from U-Boot.
 
 	  https://github.com/sbabic/libubootenv/
+
+comment "libubootenv application library needs a glibc or uClibc toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
-- 
2.7.4
