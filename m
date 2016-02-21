From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Feb 2016 11:51:25 +0100
Subject: [Buildroot] [PATCH 4/7] package/libfm: add optional support for
	libexif
In-Reply-To: <1456051888-2047-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456051888-2047-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456051888-2047-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When libexif was compiled before, libfm will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/lib/libfm.so.4.0.3 | grep NEEDED | sort
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libdl.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libexif.so.12]
[...]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libfm/libfm.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libfm/libfm.mk b/package/libfm/libfm.mk
index f0888b7..e8410d0 100644
--- a/package/libfm/libfm.mk
+++ b/package/libfm/libfm.mk
@@ -12,4 +12,11 @@ LIBFM_LICENSE = GPLv2+, LGPLv2.1+
 LIBFM_LICENSE_FILES = COPYING src/extra/fm-xml-file.c
 LIBFM_INSTALL_STAGING = YES
 
+ifeq ($(BR2_PACKAGE_LIBEXIF),y)
+LIBFM_CONF_OPTS += --enable-exif
+LIBFM_DEPENDENCIES += libexif
+else
+LIBFM_CONF_OPTS += --disable-exif
+endif
+
 $(eval $(autotools-package))
-- 
2.7.0
