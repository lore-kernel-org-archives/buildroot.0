From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 22 Sep 2018 21:43:05 +0200
Subject: [Buildroot] [PATCH 1/1] libnfs: fix build of applications like mpd
 on musl
Message-ID: <20180922194305.27608-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Include sys/time.h if __linux__ is defined otherwise applications
including libnfs.h (such as mpd) will fail to build on musl:

/home/rclinux/rc-buildroot-test/scripts/instance-1/output/host/bin/x86_64-linux-g++ -DHAVE_CONFIG_H -I.  -DNDEBUG -I./src  -DSYSTEM_CONFIG_FILE_LOCATION='"/etc/mpd.conf"'  -I/home/rclinux/rc-buildroot-test/scripts/instance-1/output/host/bin/../x86_64-buildroot-linux-musl/sysroot/usr/include   -I/home/rclinux/rc-buildroot-test/scripts/instance-1/output/host/bin/../x86_64-buildroot-linux-musl/sysroot/usr/include    -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -pthread -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -fvisibility=hidden -fno-threadsafe-statics -fmerge-all-constants -ffast-math -ftree-vectorize -ffunction-sections -fdata-sections -Wall -Wextra -Wmissing-declarations -Wshadow -Wpointer-arith -Wcast-qual -Wwrite-strings -Wsign-compare -Wno-noexcept-type -c -o src/lib/nfs/libstorage_a-Error.o `test -f 'src/lib/nfs/Error.cxx' || echo './'`src/lib/nfs/Error.cxx
In file included from src/lib/nfs/Error.cxx:37:0:
/home/rclinux/rc-buildroot-test/scripts/instance-1/output/host/x86_64-buildroot-linux-musl/sysroot/usr/include/nfsc/libnfs.h:965:23: error: field 'atime' has incomplete type 'timeval'
        struct timeval atime;
                       ^~~~~
/home/rclinux/rc-buildroot-test/scripts/instance-1/output/host/x86_64-buildroot-linux-musl/sysroot/usr/include/nfsc/libnfs.h:965:15: note: forward declaration of 'struct timeval'
        struct timeval atime;

Fixes:
 - http://autobuild.buildroot.org/results/892469e34cb2f7e8fac4a79f8c51ca8e7235aef3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...nally-include-sys-time.h-in-libnfs.h.patch | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/libnfs/0001-conditionally-include-sys-time.h-in-libnfs.h.patch

diff --git a/package/libnfs/0001-conditionally-include-sys-time.h-in-libnfs.h.patch b/package/libnfs/0001-conditionally-include-sys-time.h-in-libnfs.h.patch
new file mode 100644
index 0000000000..80b4fdca70
--- /dev/null
+++ b/package/libnfs/0001-conditionally-include-sys-time.h-in-libnfs.h.patch
@@ -0,0 +1,40 @@
+From e2b7bcfbc38336d12dfdd4e36af87be4352a16a9 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 22 Sep 2018 13:27:18 +0200
+Subject: [PATCH] conditionally include sys/time.h in libnfs.h
+
+Include sys/time.h if __linux__ is defined otherwise applications
+including libnfs.h (such as mpd) will fail to build on musl:
+
+/home/rclinux/rc-buildroot-test/scripts/instance-1/output/host/bin/x86_64-linux-g++ -DHAVE_CONFIG_H -I.  -DNDEBUG -I./src  -DSYSTEM_CONFIG_FILE_LOCATION='"/etc/mpd.conf"'  -I/home/rclinux/rc-buildroot-test/scripts/instance-1/output/host/bin/../x86_64-buildroot-linux-musl/sysroot/usr/include   -I/home/rclinux/rc-buildroot-test/scripts/instance-1/output/host/bin/../x86_64-buildroot-linux-musl/sysroot/usr/include    -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -pthread -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -fvisibility=hidden -fno-threadsafe-statics -fmerge-all-constants -ffast-math -ftree-vectorize -ffunction-sections -fdata-sections -Wall -Wextra -Wmissing-declarations -Wshadow -Wpointer-arith -Wcast-qual -Wwrite-strings -Wsign-compare -Wno-noexcept-type -c -o src/lib/nfs/libstorage_a-Error.o `test -f 'src/lib/nfs/Error.cxx' || echo './'`src/lib/nfs/Error.cxx
+In file included from src/lib/nfs/Error.cxx:37:0:
+/home/rclinux/rc-buildroot-test/scripts/instance-1/output/host/x86_64-buildroot-linux-musl/sysroot/usr/include/nfsc/libnfs.h:965:23: error: field 'atime' has incomplete type 'timeval'
+        struct timeval atime;
+                       ^~~~~
+/home/rclinux/rc-buildroot-test/scripts/instance-1/output/host/x86_64-buildroot-linux-musl/sysroot/usr/include/nfsc/libnfs.h:965:15: note: forward declaration of 'struct timeval'
+        struct timeval atime;
+
+Fixes:
+ - http://autobuild.buildroot.org/results/892469e34cb2f7e8fac4a79f8c51ca8e7235aef3
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ include/nfsc/libnfs.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/nfsc/libnfs.h b/include/nfsc/libnfs.h
+index 09dcf1c..23dcc98 100755
+--- a/include/nfsc/libnfs.h
++++ b/include/nfsc/libnfs.h
+@@ -24,7 +24,7 @@
+ #define _LIBNFS_H_
+ 
+ #include <stdint.h>
+-#if defined(__ANDROID__) || defined(AROS) \
++#if defined(__ANDROID__) || defined(AROS) || defined(__linux__) \
+  || ( defined(__APPLE__) && defined(__MACH__) )
+ #include <sys/time.h>
+ #else
+-- 
+2.17.1
+
-- 
2.17.1
