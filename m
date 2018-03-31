From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri, 30 Mar 2018 23:22:48 -0300
Subject: [Buildroot] [PATCH 23/36] package/*/Config.in: fix attributes order
In-Reply-To: <20180331022301.27501-1-ricardo.martincoski@gmail.com>
References: <20180331022301.27501-1-ricardo.martincoski@gmail.com>
Message-ID: <20180331022301.27501-24-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

... to follow the convention: type, default, depends on, select, help.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 package/mono/Config.in    | 2 +-
 package/php/Config.in     | 8 ++++----
 package/systemd/Config.in | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/mono/Config.in b/package/mono/Config.in
index d162237086..63208fef49 100644
--- a/package/mono/Config.in
+++ b/package/mono/Config.in
@@ -5,9 +5,9 @@ config BR2_PACKAGE_HOST_MONO_ARCH_SUPPORTS
 
 config BR2_PACKAGE_MONO_ARCH_SUPPORTS
 	bool
-	depends on BR2_PACKAGE_HOST_MONO_ARCH_SUPPORTS
 	default y if (BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || \
 		      BR2_mipsel || BR2_powerpc || BR2_x86_64)
+	depends on BR2_PACKAGE_HOST_MONO_ARCH_SUPPORTS
 
 config BR2_PACKAGE_MONO
 	bool "mono"
diff --git a/package/php/Config.in b/package/php/Config.in
index 11514e04b1..2469573541 100644
--- a/package/php/Config.in
+++ b/package/php/Config.in
@@ -1,15 +1,15 @@
 config BR2_PACKAGE_PHP
 	bool "php"
+	# PHP uses -export-dynamic, which breaks with elf2flt with a
+	# message like "ld.real: section .junk LMA [...,...] overlaps
+	# section .text LMA [...,...]"
+	depends on !BR2_BINFMT_FLAT
 	select BR2_PACKAGE_PHP_SAPI_CGI if \
 	       !BR2_PACKAGE_PHP_SAPI_APACHE && \
 	       !BR2_PACKAGE_PHP_SAPI_CLI && \
 	       !BR2_PACKAGE_PHP_SAPI_FPM &&  \
 	       BR2_USE_MMU
 	select BR2_PACKAGE_PHP_SAPI_CLI if !BR2_USE_MMU
-	# PHP uses -export-dynamic, which breaks with elf2flt with a
-	# message like "ld.real: section .junk LMA [...,...] overlaps
-	# section .text LMA [...,...]"
-	depends on !BR2_BINFMT_FLAT
 	help
 	  PHP  is a widely-used general-purpose scripting
 	  language that is especially suited for Web development
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 420c78493d..c5a109675c 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -191,8 +191,8 @@ config BR2_PACKAGE_SYSTEMD_MACHINED
 
 config BR2_PACKAGE_SYSTEMD_MYHOSTNAME
 	bool "enable myhostname NSS plugin"
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC # needs nss.h
 	default y
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # needs nss.h
 	help
 	  nss-myhostname is a plug-in module for the GNU Name Service
 	  Switch (NSS) functionality of the GNU C Library (glibc),
@@ -247,8 +247,8 @@ config BR2_PACKAGE_SYSTEMD_RANDOMSEED
 
 config BR2_PACKAGE_SYSTEMD_RESOLVED
 	bool "enable resolve daemon"
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC # needs nss.h
 	default y
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # needs nss.h
 	help
 	  systemd-resolved is a system service that provides network
 	  name resolution to local applications. It implements a
-- 
2.14.1
