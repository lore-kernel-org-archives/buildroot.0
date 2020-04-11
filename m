From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Apr 2020 10:49:15 +0200
Subject: [Buildroot] [git commit] package/python3: add optional dependency
 to gettext
Message-ID: <20200411083739.8B32B8E4E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2a36dad00823ec3bcefdd3f82cfe75d55c0caeb2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
