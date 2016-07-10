From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Jul 2016 23:56:21 +0200
Subject: [Buildroot] [PATCH] package/systemd: importd broken on Sourcery
	CodeBench ARM 2014.05
Message-ID: <1468187781-7497-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This toolchain uses glibc-2.18, which is tool old to provide O_TMPFILE,
which was added only in glibc-2.19.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/systemd/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 4a2aa33..48e6c45 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -145,6 +145,8 @@ config BR2_PACKAGE_SYSTEMD_IMPORTD
 	bool "enable import daemon"
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11 # O_TMPFILE
+	# This toolchain has glibc-2.18, too old to provide O_TMPFILE
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_BZIP2
@@ -160,8 +162,12 @@ config BR2_PACKAGE_SYSTEMD_IMPORTD
 
 comment "import daemon needs a toolchain w/ headers >= 3.11"
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11
 
+comment "import daemon broken on Sourcery CodeBench ARM 2014.05"
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM
+
 config BR2_PACKAGE_SYSTEMD_KDBUS
 	bool "enable kdbus support"
 	help
-- 
2.7.4
