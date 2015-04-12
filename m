From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Apr 2015 13:30:35 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/gdb: Add optional dependencies
Message-ID: <1428838235-1369-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To allow reproducable builds of target gdb add some optional dependencies

$ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/bin/gdb | grep NEEDED
 0x00000001 (NEEDED)                     Shared library: [libdl.so.0]
 0x00000001 (NEEDED)                     Shared library: [libncurses.so.5]
 0x00000001 (NEEDED)                     Shared library: [libz.so.1]
 0x00000001 (NEEDED)                     Shared library: [libm.so.0]
 0x00000001 (NEEDED)                     Shared library: [libiconv.so.2]
 0x00000001 (NEEDED)                     Shared library: [libpthread.so.0]
 0x00000001 (NEEDED)                     Shared library: [libutil.so.0]
 0x00000001 (NEEDED)                     Shared library: [libpython2.7.so.1.0]
 0x00000001 (NEEDED)                     Shared library: [libexpat.so.1]
 0x00000001 (NEEDED)                     Shared library: [libc.so.0]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: Dependencies are only needed for target gdb (Yann)

 package/gdb/gdb.mk |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 9818320..2dd63ca 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -33,7 +33,10 @@ ifeq ($(BR2_PACKAGE_GDB_DEBUGGER),)
 GDB_SUBDIR = gdb/gdbserver
 HOST_GDB_SUBDIR = .
 else
-GDB_DEPENDENCIES = ncurses
+GDB_DEPENDENCIES = ncurses \
+	$(if $(BR2_PACKAGE_EXPAT),expat) \
+	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
+	$(if $(BR2_PACKAGE_ZLIB),zlib)
 endif
 
 # For the host variant, we really want to build with XML support,
-- 
1.7.10.4
