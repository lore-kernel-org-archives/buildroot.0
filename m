From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  3 Aug 2016 00:19:40 +0200
Subject: [Buildroot] [PATCH 3/3] system: move locale purging options to the
	"System configuration" menu
In-Reply-To: <1470176380-11851-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1470176380-11851-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1470176380-11851-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The options to purge locales and to generate locale data are currently
located in the toolchain menu. However, these options are not really
related to the toolchain per-se, they are more system-level
configuration options, much like the timezone selection option we
already have in the "System configuration" menu.

Therefore, it makes more sense to have the locale-related options in
the "System configuration" menu as well.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 system/Config.in              | 34 ++++++++++++++++++++++++++++++++++
 toolchain/toolchain-common.in | 34 ----------------------------------
 2 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index 4c05186..4c7efac 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -382,6 +382,40 @@ comment "automatic network configuration via DHCP needs ifupdown or busybox"
 
 endif # BR2_ROOTFS_SKELETON_DEFAULT
 
+config BR2_ENABLE_LOCALE_PURGE
+	bool "Purge unwanted locales"
+	default y
+	help
+	  Explicitly specify what locales to install on target. If N
+	  then all locales supported by packages are installed.
+
+config BR2_ENABLE_LOCALE_WHITELIST
+	string "Locales to keep"
+	default "C en_US"
+	depends on BR2_ENABLE_LOCALE_PURGE
+	help
+	  Whitespace seperated list of locales to allow on target.
+	  Locales not listed here will be removed from the target.
+	  See 'locale -a' on your host for a list of locales available
+	  on your build host, or have a look in /usr/share/locale in
+	  the target file system for available locales.
+
+	  Notice that listing a locale here doesn't guarantee that it
+	  will be available on the target - That purely depends on the
+	  support for that locale in the selected packages.
+
+config BR2_GENERATE_LOCALE
+	string "Generate locale data"
+	default ""
+	depends on \
+		(BR2_TOOLCHAIN_BUILDROOT_UCLIBC && BR2_ENABLE_LOCALE) || \
+		BR2_TOOLCHAIN_USES_GLIBC
+	help
+	  Generate support for a list of locales. Locales can be
+	  specified with or without encoding, when no encoding is
+	  specified, UTF-8 is assumed. Examples of locales: en_US,
+	  fr_FR.UTF-8.
+
 config BR2_TARGET_TZ_INFO
 	bool "Install timezone info"
 	# No timezone for musl; only for uClibc or glibc.
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 77b4cb1..03fa880 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -42,40 +42,6 @@ config BR2_TOOLCHAIN_HAS_SSP
 config BR2_TOOLCHAIN_SUPPORTS_PIE
 	bool
 
-config BR2_ENABLE_LOCALE_PURGE
-	bool "Purge unwanted locales"
-	default y
-	help
-	  Explicitly specify what locales to install on target. If N
-	  then all locales supported by packages are installed.
-
-config BR2_ENABLE_LOCALE_WHITELIST
-	string "Locales to keep"
-	default "C en_US"
-	depends on BR2_ENABLE_LOCALE_PURGE
-	help
-	  Whitespace seperated list of locales to allow on target.
-	  Locales not listed here will be removed from the target.
-	  See 'locale -a' on your host for a list of locales available
-	  on your build host, or have a look in /usr/share/locale in
-	  the target file system for available locales.
-
-	  Notice that listing a locale here doesn't guarantee that it
-	  will be available on the target - That purely depends on the
-	  support for that locale in the selected packages.
-
-config BR2_GENERATE_LOCALE
-	string "Generate locale data"
-	default ""
-	depends on \
-		(BR2_TOOLCHAIN_BUILDROOT_UCLIBC && BR2_ENABLE_LOCALE) || \
-		BR2_TOOLCHAIN_USES_GLIBC
-	help
-	  Generate support for a list of locales. Locales can be
-	  specified with or without encoding, when no encoding is
-	  specified, UTF-8 is assumed. Examples of locales: en_US,
-	  fr_FR.UTF-8.
-
 config BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY
 	bool "Copy gconv libraries"
 	depends on BR2_TOOLCHAIN_USES_GLIBC
-- 
2.7.4
