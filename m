From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 30 Mar 2020 20:44:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/python3: add optional dependency to
 gettext
Message-ID: <20200330184415.1803258-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tested using this defconfig:

BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_SYSTEM_ENABLE_NLS=y
BR2_PACKAGE_PYTHON3=y

Without this patch:
$ readelf -a output/target/usr/lib/libpython3.8.so.1.0 | grep NEEDED
 0x00000001 (NEEDED)                     Shared library: [libc.so.0]

With this patch:
$ readelf -a output/target/usr/lib/libpython3.8.so.1.0 | grep NEEDED
 0x00000001 (NEEDED)                     Shared library: [libintl.so.8]
 0x00000001 (NEEDED)                     Shared library: [libc.so.0]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python3/python3.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index d12237300d..2656037efd 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -146,6 +146,10 @@ ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 PYTHON3_CONF_ENV += ac_cv_func_wcsftime=no
 endif
 
+ifeq ($(BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL),y)
+PYTHON3_DEPENDENCIES += gettext
+endif
+
 PYTHON3_CONF_OPTS += \
 	--without-ensurepip \
 	--without-cxx-main \
-- 
2.25.0
