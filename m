From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Feb 2016 23:14:07 +0100
Subject: [Buildroot] [git commit] package/gdb: add optional support for xz
Message-ID: <20160216221411.4849680439@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=18ce7f11ff3481308d911c362f0c2ef44b9492bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When xz was compiled before, gdb will use it as optional dependency:

$ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/bin/gdb | grep NEEDED
 0x00000001 (NEEDED)                     Shared library: [libdl.so.1]
 0x00000001 (NEEDED)                     Shared library: [libncurses.so.5]
 0x00000001 (NEEDED)                     Shared library: [libz.so.1]
 0x00000001 (NEEDED)                     Shared library: [libm.so.1]
 0x00000001 (NEEDED)                     Shared library: [liblzma.so.5]
 0x00000001 (NEEDED)                     Shared library: [libc.so.1]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
