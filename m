From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Feb 2016 19:09:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/binutils: add optional support for
	zlib
Message-ID: <1456078152-18432-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When zlib was compiled before, binutils will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/lib/libbfd-2.24.so | grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [libz.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.1]

Apparantly the build system offers no support to control the
dependency, --without-system-zlib with zlib installed still provides
libbfd-2.24.so linked to libz.so.1.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/binutils/binutils.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index a96a9a8..0f75c1d 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -61,6 +61,10 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 BINUTILS_DEPENDENCIES += busybox
 endif
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+BINUTILS_DEPENDENCIES += zlib
+endif
+
 # "host" binutils should actually be "cross"
 # We just keep the convention of "host utility" for now
 HOST_BINUTILS_CONF_OPTS = \
-- 
2.7.0
