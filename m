From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 23 Sep 2020 19:54:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/clamav: needs dynamic library
Message-ID: <20200923175436.71450-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream commit
https://github.com/Cisco-Talos/clamav-devel/commit/9e20cdf6eaf545a66f55ce5ba85ef9a98dad3648
added dlopen() to others.c
https://github.com/Cisco-Talos/clamav-devel/blob/dev/0.104/libclamav/others.c#L199

"libclamav used to build in multiple stages where an earlier stage is
a static library containing utils required by the "shared" code.
Linking clamdscan and clamdtop with this libclamav utils static lib
allowed these two apps to function without libclamav. While this is
nice in theory, the practical gains are minimal and it complicates
the build system. As such, the autotools and CMake tooling was
simplified for improved maintainability and this feature was thrown
out. clamdtop and clamdscan now require libclamav to function."

Fixes:
http://autobuild.buildroot.net/results/e27/e276894781e3e37fbc03a0745738c61541e0a211/
http://autobuild.buildroot.net/results/552/552ee8d9e44152c9d7e315a5491542771264d466/
http://autobuild.buildroot.net/results/fde/fde4af47542f0eb0bd57b172c99bd086eb566b76/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/clamav/Config.in | 6 +++---
 package/clamav/clamav.mk | 3 ---
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/package/clamav/Config.in b/package/clamav/Config.in
index 08f3e47461..990a818b5c 100644
--- a/package/clamav/Config.in
+++ b/package/clamav/Config.in
@@ -3,10 +3,10 @@ config BR2_PACKAGE_CLAMAV
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
+	depends on !BR2_STATIC_LIBS # dlopen
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBMSPACK
-	select BR2_PACKAGE_LIBTOOL
 	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
@@ -16,7 +16,7 @@ config BR2_PACKAGE_CLAMAV
 
 	  http://www.clamav.net
 
-comment "clamav needs a toolchain w/ C++, threads, wchar"
-	depends on !BR2_INSTALL_LIBSTDCPP \
+comment "clamav needs a toolchain w/ C++, dynamic library, threads, wchar"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS \
 		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
 	depends on BR2_USE_MMU
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index fc979a74aa..45d62943a0 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -14,7 +14,6 @@ CLAMAV_DEPENDENCIES = \
 	host-pkgconf \
 	libcurl \
 	libmspack \
-	libtool \
 	openssl \
 	zlib \
 	$(TARGET_NLS_DEPENDENCIES)
@@ -38,8 +37,6 @@ CLAMAV_CONF_ENV += LIBS="$(CLAMAV_LIBS)"
 
 CLAMAV_CONF_OPTS = \
 	--with-dbdir=/var/lib/clamav \
-	--with-ltdl-include=$(STAGING_DIR)/usr/include \
-	--with-ltdl-lib=$(STAGING_DIR)/usr/lib \
 	--with-libcurl=$(STAGING_DIR)/usr \
 	--with-openssl=$(STAGING_DIR)/usr \
 	--with-system-libmspack=$(STAGING_DIR)/usr \
-- 
2.27.0
