From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jan 2016 18:12:22 +0100
Subject: [Buildroot] [git commit] bluez5_utils: not available with uClibc
Message-ID: <20160116171449.01B0F7F9E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d7c54cb0c0cf8cb013d88ad3c2989ec323323235
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the bump from 5.27 to 5.37 of bluez5_utils, the bluez code has
started using <wordexp.h> functionality. Unfortunately, our current
uClibc configuration does not have the wordexp functionality enabled,
so bluez5_utils cannot be built anymore.

In order to address this, we make bluez5_utils unavailable on
uClibc. This could be changed later by either removing the dependency
of bluez5_utils on wordexp support, or by deciding to add wordexp
support to our uClibc configuration.

Fixes:

  http://autobuild.buildroot.org/results/831/83112559d84dc156141339a31e3e02f1a2af5155/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bluez5_utils/Config.in | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
index 80c3830..57f8c45 100644
--- a/package/bluez5_utils/Config.in
+++ b/package/bluez5_utils/Config.in
@@ -6,6 +6,8 @@ config BR2_PACKAGE_BLUEZ5_UTILS
 	depends on !BR2_STATIC_LIBS # uses dlfcn
 	depends on !BR2_PACKAGE_BLUEZ_UTILS # conflicts with 4.x version
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
+	# wordexp support not in our uClibc configuration
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
 	help
@@ -74,9 +76,10 @@ config BR2_PACKAGE_BLUEZ5_UTILS_TEST
 
 endif
 
-comment "bluez5-utils needs a toolchain w/ wchar, threads, headers >= 3.4, dynamic library"
+comment "bluez5-utils needs a glibc or musl toolchain w/ wchar, threads, headers >= 3.4, dynamic library"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 || BR2_STATIC_LIBS
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 || BR2_STATIC_LIBS || \
+		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
 	depends on BR2_USE_MMU
 
 comment "bluez5-utils conflicts with older bluez-utils version"
