From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Feb 2016 10:50:06 +0100
Subject: [Buildroot] [PATCH 02/14] package/libglib2: add optional support
	for elfutils
In-Reply-To: <1456048218-4061-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456048218-4061-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456048218-4061-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When elfutils was compiled before, libglib2 will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/bin/gresource | grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [libgio-2.0.so.0]
 0x0000000000000001 (NEEDED)             Shared library: [libgobject-2.0.so.0]
 0x0000000000000001 (NEEDED)             Shared library: [libgmodule-2.0.so.0]
 0x0000000000000001 (NEEDED)             Shared library: [libglib-2.0.so.0]
 0x0000000000000001 (NEEDED)             Shared library: [libelf.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libintl.so.8]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.1]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libglib2/libglib2.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 881c5ce..ea45f4a 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -107,6 +107,13 @@ ifneq ($(BR2_ENABLE_LOCALE),y)
 LIBGLIB2_DEPENDENCIES += libiconv
 endif
 
+ifeq ($(BR2_PACKAGE_ELFUTILS),y)
+LIBGLIB2_CONF_OPTS += --enable-libelf
+LIBGLIB2_DEPENDENCIES += elfutils
+else
+LIBGLIB2_CONF_OPTS += --disable-libelf
+endif
+
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 LIBGLIB2_CONF_OPTS += --with-libiconv=gnu
 LIBGLIB2_DEPENDENCIES += libiconv
-- 
2.7.0
