From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 30 Oct 2016 10:42:26 +0100
Subject: [Buildroot] [PATCH 1/1] package/python: Remove runtime library paths
Message-ID: <20161030094226.32070-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch re-adds the rebased version of python-2.7-011-no-rpath.patch
which was removed with the 2.7.6 bump:
https://git.busybox.net/buildroot/commit/package/python?id=7e960dc9da56d4a484b5480746aaf617ca491274

Without this patch usr/lib/python2.7/lib-dynload/_bsddb.so contains

$ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/lib/python2.7/lib-dynload/_bsddb.so | grep RPATH
 0x0000000f (RPATH)                      Library rpath: [/home/buildroot/br2/output/host/usr/i586-buildroot-linux-uclibc/sysroot/usr/lib]

With this patch:

$ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/lib/python2.7/lib-dynload/_bsddb.so | grep RPATH
$

Tested using a minimal defconfig

BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_PACKAGE_PYTHON=y
BR2_PACKAGE_PYTHON_BSDDB=y
BR2_PACKAGE_PYTHON_SQLITE=y

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python/116-no-rpath.patch | 76 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 package/python/116-no-rpath.patch

diff --git a/package/python/116-no-rpath.patch b/package/python/116-no-rpath.patch
new file mode 100644
index 0000000..acb862b
--- /dev/null
+++ b/package/python/116-no-rpath.patch
@@ -0,0 +1,76 @@
+Remove runtime library paths
+
+For some extensions (bsddb, sqlite and dbm), Python setup.py script
+hardcode a runtime path (rpath) into the extension. However, this
+runtime path is incorrect (because it points to the location of the
+library directory on the development machine) and useless (because on
+the target, all useful libraries are in a standard directory searched
+by the dynamic loader). For those reasons, we just get rid of the
+runtime paths in cross-compilation mode.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+(rebased against python 2.7.12)
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ setup.py |   21 ++++++++++++++++++---
+ 1 file changed, 18 insertions(+), 3 deletions(-)
+
+Index: Python-2.7.2/setup.py
+===================================================================
+--- Python-2.7.12.org/setup.py
++++ Python-2.7.12/setup.py
+@@ -1092,6 +1092,12 @@
+                 print "bsddb lib dir:", dblib_dir, " inc dir:", db_incdir
+             db_incs = [db_incdir]
+             dblibs = [dblib]
++
++            if cross_compiling:
++                bsddb_runtime_library_dir = None
++            else:
++                bsddb_runtime_library_dir = dblib_dir
++
+             # We add the runtime_library_dirs argument because the
+             # BerkeleyDB lib we're linking against often isn't in the
+             # system dynamic library search path.  This is usually
+@@ -1101,7 +1107,7 @@
+             exts.append(Extension('_bsddb', ['_bsddb.c'],
+                                   depends = ['bsddb.h'],
+                                   library_dirs=dblib_dir,
+-                                  runtime_library_dirs=dblib_dir,
++                                  runtime_library_dirs=bsddb_runtime_library_dir,
+                                   include_dirs=db_incs,
+                                   libraries=dblibs))
+         else:
+@@ -1206,11 +1212,16 @@
+             else:
+                 sqlite_extra_link_args = ()
+ 
++            if cross_compiling:
++                sqlite_runtime_library_dirs = None
++            else:
++                sqlite_runtime_library_dirs = sqlite_libdir
++
+             exts.append(Extension('_sqlite3', sqlite_srcs,
+                                   define_macros=sqlite_defines,
+                                   include_dirs=["Modules/_sqlite",
+                                                 sqlite_incdir],
+-                                  library_dirs=sqlite_libdir,
++                                  library_dirs=sqlite_runtime_library_dirs,
+                                   extra_link_args=sqlite_extra_link_args,
+                                   libraries=["sqlite3",]))
+         else:
+@@ -1313,9 +1324,13 @@
+                 elif cand == "bdb":
+                     if db_incs is not None:
+                         print "building dbm using bdb"
++                        if cross_compiling:
++                            db_runtime_library_dir = None
++                        else:
++                            db_runtime_library_dir = dblib_dir
+                         dbmext = Extension('dbm', ['dbmmodule.c'],
+                                            library_dirs=dblib_dir,
+-                                           runtime_library_dirs=dblib_dir,
++                                           runtime_library_dirs=db_runtime_library_dir,
+                                            include_dirs=db_incs,
+                                            define_macros=[
+                                                ('HAVE_BERKDB_H', None),
-- 
2.10.1
