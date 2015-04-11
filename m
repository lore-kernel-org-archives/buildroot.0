From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 11 Apr 2015 20:31:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/gdb: Add optional dependencies
Message-ID: <1428777116-24382-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To allow reproducable builds add some optional dependencies

$ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/bin/gdb | grep NEEDED | sort
 0x00000001 (NEEDED)                     Shared library: [libc.so.0]
 0x00000001 (NEEDED)                     Shared library: [libdl.so.0]
 0x00000001 (NEEDED)                     Shared library: [libexpat.so.1]
 0x00000001 (NEEDED)                     Shared library: [libiconv.so.2]
 0x00000001 (NEEDED)                     Shared library: [libm.so.0]
 0x00000001 (NEEDED)                     Shared library: [libncurses.so.5]
 0x00000001 (NEEDED)                     Shared library: [libpthread.so.0]
 0x00000001 (NEEDED)                     Shared library: [libpython2.7.so.1.0]
 0x00000001 (NEEDED)                     Shared library: [libutil.so.0]
 0x00000001 (NEEDED)                     Shared library: [libz.so.1]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/gdb/gdb.mk |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 9818320..34f7b5c 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -36,6 +36,11 @@ else
 GDB_DEPENDENCIES = ncurses
 endif
 
+GDB_DEPENDENCIES += \
+	$(if $(BR2_PACKAGE_EXPAT),expat) \
+	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
+	$(if $(BR2_PACKAGE_ZLIB),zlib)
+
 # For the host variant, we really want to build with XML support,
 # which is needed to read XML descriptions of target architectures. We
 # also need ncurses.
-- 
1.7.10.4
