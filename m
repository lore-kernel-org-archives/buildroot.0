From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Aug 2020 19:00:58 +0200
Subject: [Buildroot] [git commit] package/php: ffi needs dynamic library
Message-ID: <20200823165655.23BCC81F7D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3004d540345695dd35f0e047f9467ffc41be37c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

FFI support in php has been added with commit
e16f05c0f00081d446ebee56d9f3ad3cf41da1ae, it depends on dynamic library
otherwise the build will fail on:

/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/5.5.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: ext/ffi/ffi.o: in function `zim_FFI_cdef':
ffi.c:(.text+0xe78): undefined reference to `DL_LOAD'

Fixes:
 - http://autobuild.buildroot.org/results/3380b7b6777d1c5fcb53c855b003466fa3bf2079

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/php/Config.ext | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/php/Config.ext b/package/php/Config.ext
index b628291f78..556276da97 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -429,12 +429,13 @@ config BR2_PACKAGE_PHP_EXT_XSL
 
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
