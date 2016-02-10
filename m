From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 10 Feb 2016 21:59:09 +0100
Subject: [Buildroot] [PATCH 1/1] package/libarchive: add optional support
	for bzip2
In-Reply-To: <1455137950-18164-1-git-send-email-bernd.kuhls@t-online.de>
References: <1455137950-18164-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1455137950-18164-2-git-send-email-bernd.kuhls@t-online.de>
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
 package/libarchive/libarchive.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 206de3f..f438d6e 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -42,6 +42,12 @@ else
 LIBARCHIVE_CONF_OPTS += --disable-xattr
 endif
 
+ifeq ($(BR2_PACKAGE_BZIP2),y)
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
