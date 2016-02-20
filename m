From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Feb 2016 00:40:25 +0100
Subject: [Buildroot] [PATCH 1/1] package/xerces: add optional support for icu
Message-ID: <1456011625-29254-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When icu was compiled before, xerces will use it as optional dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/lib/libxerces-c-3.1.so | grep NEEDED | sort
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libgcc_s.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libicudata.so.56]
 0x0000000000000001 (NEEDED)             Shared library: [libicui18n.so.56]
 0x0000000000000001 (NEEDED)             Shared library: [libicuuc.so.56]
 0x0000000000000001 (NEEDED)             Shared library: [libm.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libstdc++.so.6]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/xerces/xerces.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/xerces/xerces.mk b/package/xerces/xerces.mk
index cf36183..e57949a 100644
--- a/package/xerces/xerces.mk
+++ b/package/xerces/xerces.mk
@@ -21,6 +21,13 @@ endef
 
 XERCES_POST_PATCH_HOOKS += XERCES_DISABLE_SAMPLES
 
+ifeq ($(BR2_PACKAGE_ICU),y)
+XERCES_CONF_OPTS += --with-icu=$(STAGING_DIR)/usr
+XERCES_DEPENDENCIES += icu
+else
+XERCES_CONF_OPTS += --without-icu
+endif
+
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 XERCES_CONF_ENV += LIBS=-liconv
 XERCES_DEPENDENCIES += libiconv
-- 
2.7.0
