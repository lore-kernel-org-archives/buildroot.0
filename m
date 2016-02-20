From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Feb 2016 15:29:54 +0100
Subject: [Buildroot] [PATCH v3 1/1] package/libarchive: add optional support
	for bzip2
Message-ID: <1455978594-6454-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When bzip2 was compiled before, libarchive will use it as optional
dependency:

$ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/lib/libarchive.so.13.1.2 | grep NEEDED
 0x00000001 (NEEDED)                     Shared library: [liblzma.so.5]
 0x00000001 (NEEDED)                     Shared library: [libbz2.so.1.0]
 0x00000001 (NEEDED)                     Shared library: [libz.so.1]
 0x00000001 (NEEDED)                     Shared library: [libc.so.1]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v3: Added --with-bz2lib (Thomas)
v2: Added note why --with-bz2lib is not needed (Arnout)

 package/libarchive/libarchive.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 206de3f..726142b 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -42,6 +42,13 @@ else
 LIBARCHIVE_CONF_OPTS += --disable-xattr
 endif
 
+ifeq ($(BR2_PACKAGE_BZIP2),y)
+LIBARCHIVE_CONF_OPTS += --with-bz2lib
+LIBARCHIVE_DEPENDENCIES += bzip2
+else
+LIBARCHIVE_CONF_OPTS += --without-bz2lib
+endif
+
 ifeq ($(BR2_PACKAGE_EXPAT),y)
 LIBARCHIVE_DEPENDENCIES += expat
 else
-- 
2.7.0
