From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 23 Aug 2020 16:53:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/php: ffi needs dynamic library
Message-ID: <20200823145320.3967619-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

FFI support in php has been added with commit
e16f05c0f00081d446ebee56d9f3ad3cf41da1ae, it depends on dynamic library
otherwise the build will fail on:

/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/5.5.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: ext/ffi/ffi.o: in function `zim_FFI_cdef':
ffi.c:(.text+0xe78): undefined reference to `DL_LOAD'

Fixes:
 - http://autobuild.buildroot.org/results/3380b7b6777d1c5fcb53c855b003466fa3bf2079

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/php/Config.ext | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/php/Config.ext b/package/php/Config.ext
index 33a6455366..3a86bf95b7 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -424,12 +424,13 @@ config BR2_PACKAGE_PHP_EXT_XSL
 
 config BR2_PACKAGE_PHP_EXT_FFI
 	bool "FFI"
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBFFI
 	help
 	  Foreign Function Interface support
 
-comment "PHP FFI extension needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "PHP FFI extension needs a toolchain w/ threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
 endmenu
-- 
2.28.0
