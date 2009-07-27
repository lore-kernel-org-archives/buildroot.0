From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 27 Jul 2009 10:41:56 +0200
Subject: [Buildroot] [git commit] toolchain: Clean up locale support menu
Message-ID: <20090727084224.2C809777DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=27ce942e6536174a9fa6f5dd13f87d52bca0950c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #421.

This patch cleans up and fixes some minor issues with the locale support
section of the toolchain menu.

1. uClibc requires wchar support if locales are enabled, make locale
   support select wchar support.

2.  Allow purging of locale information even if there is no locale
    support in the C library.  This cleans up after packages that
    install things into /usr/share/locale on the target.

Signed-off-by: Will Newton <will.newton@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES               |    1 +
 toolchain/Config.in.2 |    8 ++++----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/CHANGES b/CHANGES
index ebea17b..3b97df9 100644
--- a/CHANGES
+++ b/CHANGES
@@ -27,6 +27,7 @@
 	#411: ipsec-tools: Bump version to 0.7.2
 	#417: New package spawn-fcgi
 	#419: Bump lighttpd package to 1.4.23
+	#421: toolchain: Clean up toolchain locale support menu
 	#467: DirectFB 1.4.1
 	#473: memstat_0.5.tar.gz has install with -D and that fails "make"
 
diff --git a/toolchain/Config.in.2 b/toolchain/Config.in.2
index e9fe852..5df04e0 100644
--- a/toolchain/Config.in.2
+++ b/toolchain/Config.in.2
@@ -27,12 +27,13 @@ config BR2_INET_RPC
 	  built with RPC support then enable this option.
 
 config BR2_ENABLE_LOCALE
-	bool "Enable locale/gettext/i18n support?"
+	bool "Enable toolchain locale/i18n support?"
+	select BR2_USE_WCHAR
 	help
 	  If you are building your own toolchain and you want to 
-	  enable locale/gettext/i18n support then enable this option.
+	  enable locale/i18n support then enable this option.
 	  If you have an external binary toolchain that has been 
-	  built with locale/gettext/i18n support then enable this option.
+	  built with locale/i18n support then enable this option.
 
 config BR2_ENABLE_LOCALE_PREGENERATED
 	bool "Use pregenerated locale data?"
@@ -46,7 +47,6 @@ config BR2_ENABLE_LOCALE_PREGENERATED
 
 config BR2_ENABLE_LOCALE_PURGE
 	bool "Purge unwanted locales"
-	depends on BR2_ENABLE_LOCALE
 	help
 	  Explicitly specify what locales to install on target. If N
 	  then all locales supported by packages are installed.
-- 
1.6.3.3
