From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 13 Sep 2017 13:28:18 +0200
Subject: [Buildroot] gdb/binutils - two versions of libbfd installed
Message-ID: <trinity-43ed5438-6812-4ad2-a78d-3b069e067897-1505302098589@3c-app-gmx-bs48>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

with the following config fragment:

BR2_BINUTILS_VERSION_2_29_X=y
BR2_BINUTILS_VERSION="2.29"
BR2_BINUTILS_EXTRA_CONFIG_OPTIONS=""
BR2_PACKAGE_BINUTILS=y

BR2_GDB_VERSION_8_0=y
BR2_GDB_VERSION="8.0"
BR2_PACKAGE_GDB_ARCH_SUPPORTS=y
BR2_PACKAGE_GDB=y
BR2_PACKAGE_GDB_SERVER=y
BR2_PACKAGE_GDB_DEBUGGER=y

two versions of libbfd are installed into the target directory:

 ./target/usr/lib/libbfd-2.28.51.so
 ./target/usr/lib/libbfd-2.29.so
 ./target/usr/lib/libbfd.so -> libbfd-2.28.51.so

one from gdb-8.0 (2.28.51) and one from the binutils-2.29 package (and
I believe the link from libbfd.so points to the wrong one).

With the following patch (inspired by [1] found by search for
'gdb disable dynamic libbfd build'):

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 7e86ba0..8c4188b 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -111,7 +111,7 @@ GDB_CONF_OPTS = \
        --with-curses \
        --without-included-gettext \
        --disable-werror \
-       --enable-static
+       --enable-static --disable-shared
 
 # When gdb is built as C++ application for ARC it segfaults at runtime
 # So we pass --disable-build-with-cxx config option to force gdb not to

the installation of the gdb libbfd version is prevented...

Regards,
Peter

[1] https://patchwork.ozlabs.org/patch/449686/
