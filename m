From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Dec 2018 23:22:53 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] php: intl support needs
 dynamic library
Message-ID: <20181203221923.2B1BB8A6BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=df2b72b67f97156c8711efdfa329ebcb5f70b895
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

getArgTypeList is defined both in ext/intl/msgformat/msgformat_helpers.cpp
and icu library so add a !BR2_STATIC_LIBS dependency to
BR2_PACKAGE_PHP_EXT_INTL

Fixes:
 - http://autobuild.buildroot.org/results/628b677d1ceb8b404265d89357225e0a1dce1407

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f108445a3dd791d961bc0063ab9ea8877081fe16)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/Config.ext | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/php/Config.ext b/package/php/Config.ext
index 51dcbbf4a4..8406fdb79c 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -187,14 +187,15 @@ config BR2_PACKAGE_PHP_EXT_INTL
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # icu
 	depends on !BR2_BINFMT_FLAT # icu
 	depends on BR2_TOOLCHAIN_HAS_THREADS # icu
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_ICU
 	help
 	  Internationalization support
 
-comment "intl support needs a toolchain w/ C++, wchar, threads, gcc >= 4.8, host gcc >= 4.8"
+comment "intl support needs a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 4.8, host gcc >= 4.8"
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
 		!BR2_HOST_GCC_AT_LEAST_4_8
 
