From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 29 Mar 2021 23:19:57 +0200
Subject: [Buildroot] [PATCH 2/2] package/libqmi: needs headers >= 4.14
In-Reply-To: <20210329211957.321612-1-fontaine.fabrice@gmail.com>
References: <20210329211957.321612-1-fontaine.fabrice@gmail.com>
Message-ID: <20210329211957.321612-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libqmi unconditionnally uses ARPHRD_RAWIP since version 1.28.0 and
https://github.com/freedesktop/libqmi/commit/4085a2d6b771a40fb637433ed6a05b9d5d4d94b9
https://github.com/freedesktop/libqmi/commit/19f4b39ee85500e7e868b8a100fba19c04fb3c30

However, ARPHRD_RAWIP is only available since kernel 4.14 and
https://github.com/torvalds/linux/commit/cdf4969c42a6c1a376dd03a9e846cf638d3cd4b1

Fixes:
 - http://autobuild.buildroot.org/results/c8853b7161bd85d46c1282c6c097e7ef4042ae68

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libqmi/Config.in        | 6 ++++--
 package/modem-manager/Config.in | 5 +++++
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/libqmi/Config.in b/package/libqmi/Config.in
index f1d111b7c9..53400acb0a 100644
--- a/package/libqmi/Config.in
+++ b/package/libqmi/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_LIBQMI
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  libqmi is a glib-based library for talking to WWAN modems and
@@ -10,6 +11,7 @@ config BR2_PACKAGE_LIBQMI
 
 	  http://www.freedesktop.org/wiki/Software/libqmi/
 
-comment "libqmi needs a toolchain w/ wchar, threads"
+comment "libqmi needs a toolchain w/ wchar, threads, headers >= 4.14"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
diff --git a/package/modem-manager/Config.in b/package/modem-manager/Config.in
index c4c723776d..688fcc4c3b 100644
--- a/package/modem-manager/Config.in
+++ b/package/modem-manager/Config.in
@@ -22,9 +22,14 @@ config BR2_PACKAGE_MODEM_MANAGER_LIBMBIM
 
 config BR2_PACKAGE_MODEM_MANAGER_LIBQMI
 	bool "QMI support"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
 	select BR2_PACKAGE_LIBQMI
 	help
 	  This option enables support for QMI protocol
+
+comment "QMI support needs a toolchain w/ headers >= 4.14"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
+
 endif
 
 comment "modemmanager needs a toolchain w/ wchar, threads"
-- 
2.30.2
