From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 31 Jan 2020 20:40:57 +0100
Subject: [Buildroot] [PATCH 1/2] package/file: add libmagic.pc
Message-ID: <20200131194058.1161216-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/37b1ef54dc41100689f311fbc31fc9300dc6ae63

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/file/0001-Add-libmagic.pc.patch | 76 +++++++++++++++++++++++++
 package/file/file.mk                    |  2 +
 2 files changed, 78 insertions(+)
 create mode 100644 package/file/0001-Add-libmagic.pc.patch

diff --git a/package/file/0001-Add-libmagic.pc.patch b/package/file/0001-Add-libmagic.pc.patch
new file mode 100644
index 0000000000..b26d16224d
--- /dev/null
+++ b/package/file/0001-Add-libmagic.pc.patch
@@ -0,0 +1,76 @@
+From d079cac1110cc2761417f0dcb0a142b217eb1eda Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 31 Jan 2020 20:26:29 +0100
+Subject: [PATCH] Add libmagic.pc
+
+libmagic can optionally depends on xz (for lzma) or bzip2 since version
+5.38 and
+https://github.com/file/file/commit/b259a07ea95827f565faa20f0316e5b2704064f7
+so add libmagic.pc so package (such as gerbera) that links with libmagic
+will be able to use pkg-config to retrieve those static dependencies
+For example, this will avoid the following build failure:
+
+[100%] Linking CXX executable gerbera
+/home/br-user/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/br-user/autobuild/run/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libmagic.a(compress.o): in function `uncompressbuf':
+compress.c:(.text+0x69c): undefined reference to `BZ2_bzDecompressInit'
+/home/br-user/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: compress.c:(.text+0x710): undefined reference to `BZ2_bzDecompress'
+/home/br-user/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: compress.c:(.text+0x730): undefined reference to `BZ2_bzDecompressEnd'
+/home/br-user/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: compress.c:(.text+0x7bc): undefined reference to `lzma_auto_decoder'
+/home/br-user/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: compress.c:(.text+0x828): undefined reference to `lzma_code'
+/home/br-user/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: compress.c:(.text+0x848): undefined reference to `lzma_end'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/37b1ef54dc41100689f311fbc31fc9300dc6ae63
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://bugs.astron.com/view.php?id=136]
+---
+ Makefile.am    |  5 +++++
+ configure.ac   |  2 +-
+ libmagic.pc.in | 10 ++++++++++
+ 3 files changed, 16 insertions(+), 1 deletion(-)
+ create mode 100644 libmagic.pc.in
+
+diff --git a/Makefile.am b/Makefile.am
+index 8bd927d9..2ab67ed7 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -3,3 +3,8 @@ ACLOCAL_AMFLAGS = -I m4
+ EXTRA_DIST = MAINT
+ 
+ SUBDIRS = src magic tests doc python
++
++# This variable must have 'exec' in its name, in order to be installed
++# by 'install-exec' target (instead of default 'install-data')
++pkgconfigexecdir = $(libdir)/pkgconfig
++pkgconfigexec_DATA = libmagic.pc
+diff --git a/configure.ac b/configure.ac
+index ac37fccd..b2e2e5b8 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -217,5 +217,5 @@ if  test "$ac_cv_header_lzma_h$ac_cv_lib_lzma_lzma_stream_decoder" = "yesyes"; t
+   AC_DEFINE([XZLIBSUPPORT], 1, [Enable xzlib compression support])
+ fi
+ 
+-AC_CONFIG_FILES([Makefile src/Makefile magic/Makefile tests/Makefile doc/Makefile python/Makefile])
++AC_CONFIG_FILES([Makefile src/Makefile magic/Makefile tests/Makefile doc/Makefile python/Makefile libmagic.pc])
+ AC_OUTPUT
+diff --git a/libmagic.pc.in b/libmagic.pc.in
+new file mode 100644
+index 00000000..3ad1290b
+--- /dev/null
++++ b/libmagic.pc.in
+@@ -0,0 +1,10 @@
++prefix=@prefix@
++exec_prefix=@exec_prefix@
++libdir=@libdir@
++includedir=@includedir@
++
++Name: libmagic
++Description: Magic number recognition library
++Version: @VERSION@
++Libs: -L${libdir} -lmagic
++Libs.private: @LIBS@
+-- 
+2.24.1
+
diff --git a/package/file/file.mk b/package/file/file.mk
index ffa8b8b905..cff59c86ad 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -12,6 +12,8 @@ FILE_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 FILE_INSTALL_STAGING = YES
 FILE_LICENSE = BSD-2-Clause, BSD-4-Clause (one file), BSD-3-Clause (one file)
 FILE_LICENSE_FILES = COPYING src/mygetopt.h src/vasprintf.c
+# We're patching configure.ac
+FILE_AUTORECONF = YES
 HOST_FILE_CONF_OPTS = --disable-libseccomp
 
 ifeq ($(BR2_PACKAGE_BZIP2),y)
-- 
2.24.1
