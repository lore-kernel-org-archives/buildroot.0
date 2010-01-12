From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Jan 2010 00:27:20 +0100
Subject: [Buildroot] [PATCH 1/6] Move locale purge option to a more logical
	location
In-Reply-To: <cover.1263338839.git.thomas.petazzoni@free-electrons.com>
References: <cover.1263338839.git.thomas.petazzoni@free-electrons.com>
Message-ID: <6d52b84496e5285b5934b525f396ac8438c67be1.1263338839.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The options to purge unwanted locale was currently part of the
toolchain options. However, this option has nothing to do with the
toolchain itself, but is rather an optional cleanup that can be
performed after cleaning the target filesystem.

Therefore, this option is moved to the "Build options" part, together
with the options to keep or not development files, documentation and
so forth.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in             |   21 +++++++++++++++++++++
 toolchain/Config.in.2 |   21 ---------------------
 2 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/Config.in b/Config.in
index e4edaae..c33701a 100644
--- a/Config.in
+++ b/Config.in
@@ -338,6 +338,27 @@ config BR2_HAVE_DEVFILES
 	  Install headers and static libraries in the
 	  target filesystem
 
+config BR2_ENABLE_LOCALE_PURGE
+	bool "Purge unwanted locales"
+	help
+	  Explicitly specify what locales to install on target. If N
+	  then all locales supported by packages are installed.
+
+config BR2_ENABLE_LOCALE_WHITELIST
+	string "Locales to keep"
+	default "C en_US de fr"
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
 source package/gnuconfig/Config.in
 
 endmenu
diff --git a/toolchain/Config.in.2 b/toolchain/Config.in.2
index 6317ff4..0fb90ce 100644
--- a/toolchain/Config.in.2
+++ b/toolchain/Config.in.2
@@ -45,27 +45,6 @@ config BR2_ENABLE_LOCALE_PREGENERATED
 	  Say N here unless your buildhost lacks locale support and you
 	  desparately want to use internationalization on your target.
 
-config BR2_ENABLE_LOCALE_PURGE
-	bool "Purge unwanted locales"
-	help
-	  Explicitly specify what locales to install on target. If N
-	  then all locales supported by packages are installed.
-
-config BR2_ENABLE_LOCALE_WHITELIST
-	string "Locales to keep"
-	default "C en_US de fr"
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
 config BR2_USE_WCHAR
 	bool "Enable WCHAR support"
 	help
-- 
1.6.3.3
