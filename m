From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 10 Feb 2016 21:59:08 +0100
Subject: [Buildroot] [PATCH 1/1] package/gdb: add optional support for xz
Message-ID: <1455137950-18164-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When xz was compiled before, gdb will use it as optional dependency:

$ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/bin/gdb | grep NEEDED
 0x00000001 (NEEDED)                     Shared library: [libdl.so.1]
 0x00000001 (NEEDED)                     Shared library: [libncurses.so.5]
 0x00000001 (NEEDED)                     Shared library: [libz.so.1]
 0x00000001 (NEEDED)                     Shared library: [libm.so.1]
 0x00000001 (NEEDED)                     Shared library: [liblzma.so.5]
 0x00000001 (NEEDED)                     Shared library: [libc.so.1]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/gdb/gdb.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 3b0f501..32d52eb 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -118,6 +118,13 @@ else
 GDB_CONF_OPTS += --without-expat
 endif
 
+ifeq ($(BR2_PACKAGE_XZ),y)
+GDB_CONF_OPTS += --with-lzma
+GDB_DEPENDENCIES += xz
+else
+GDB_CONF_OPTS += --without-lzma
+endif
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 GDB_CONF_OPTS += --with-zlib
 GDB_DEPENDENCIES += zlib
-- 
2.7.0
