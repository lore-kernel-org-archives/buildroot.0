From: Veronika Kremneva <Veronika.Kremneva@synopsys.com>
Date: Tue,  9 Feb 2021 13:47:26 +0300
Subject: [Buildroot] [PATCH] package/dmalloc: Fix for ARC with enabled
 BR2_SSP_ALL
Message-ID: <20210209104726.20132-1-kremneva@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When building dmalloc for ARC while having "-fstack-protector-all" option on,
we are getting the following error:
------------------------------->8---------------------------
>>> dmalloc 5.5.2 Installing to target
cp -dpf $HOME/buildroot/output/host/arc-buildroot-linux-gnu/sysroot/usr/lib/libdmalloc*.so
$HOME/buildroot/output/target/usr/lib
cp -dpf $HOME/buildroot/output/host/arc-buildroot-linux-gnu/sysroot/usr/bin/dmalloc
$HOME/buildroot/output/target/usr/bin/dmalloc
ERROR: architecture for "/usr/lib/libdmallocthcxx.so" is "ARCompact", should be "ARCv2"
ERROR: architecture for "/usr/lib/libdmallocth.so" is "ARCompact", should be "ARCv2"
ERROR: architecture for "/usr/lib/libdmalloc.so" is "ARCompact", should be "ARCv2"
ERROR: architecture for "/usr/lib/libdmallocxx.so" is "ARCompact", should be "ARCv2"
make: *** [$HOME/buildroot/output/build/dmalloc-5.5.2/.stamp_installed] Error 1
------------------------------->8---------------------------

You can observe this error in following builds:
http://autobuild.buildroot.net/results/57f/57fc51cee4ec9339ea3be23f8c8c9f7ecca1a857/
http://autobuild.buildroot.net/results/b4d/b4d457369f35e1942c294b0ea3b3cab4cae0d7a3/
http://autobuild.buildroot.net/results/cfc/cfc111076c955dd5c1125c6e34a161121ea11200/
http://autobuild.buildroot.net/results/1d0/1d0ffcefbf545d1748e928603fd07c0a8de98eb5/

In all of those builds architecture "ARCv2" was explicitly chosen during configuration
yet we are getting this error. As we go deeper we find that the object file that linker
is trying to process contains no target code thus the default "ARCompact" is being used.
But why the object file is empty? Went to check link args:
------------------------------->8---------------------------
$HOME/buildroot/output/host/bin/arc-buildroot-linux-gnu-ld: conftest.a(conftest.o):
relocation R_ARC_32_ME against `__stack_chk_guard' can not be used when making a shared
object; recompile with -fPIC
$HOME/buildrootc/output/host/bin/arc-buildroot-linux-gnu-ld: BFD (GNU Binutils) 2.34.50.20200611
assertion fail elf32-arc.c:1802
$HOME/buildroot/output/host/bin/arc-buildroot-linux-gnu-ld: unrecognized option '-all'
$HOME/buildroot/output/host/bin/arc-buildroot-linux-gnu-ld: use the --help option for usage information
configure:4475: result: $HOME/buildroot/output/host/bin/arc-buildroot-linux-gnu-ld -G -o $@.t
------------------------------->8---------------------------

Looks like we are missing the -fPIC flag in DMALLOC_CFLAGS. As shared libraries should always
be compiled with "-fPIC" following patch adds this flag to the dmalloc.mk.

Signed-off-by: Veronika Kremneva <kremneva@synopsys.com>
---
 package/dmalloc/dmalloc.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/dmalloc/dmalloc.mk b/package/dmalloc/dmalloc.mk
index 38b2c02027..638fe0fcda 100644
--- a/package/dmalloc/dmalloc.mk
+++ b/package/dmalloc/dmalloc.mk
@@ -16,6 +16,10 @@ DMALLOC_INSTALL_STAGING = YES
 DMALLOC_CONF_OPTS = --enable-shlib
 DMALLOC_CFLAGS = $(TARGET_CFLAGS)
 
+ifeq ($(BR2_STATIC_LIBS),)
+DMALLOC_CFLAGS += -fPIC
+endif
+
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 DMALLOC_CONF_OPTS += --enable-cxx
 else
-- 
2.16.2
