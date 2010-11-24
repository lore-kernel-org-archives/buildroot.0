From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 24 Nov 2010 23:12:54 +0100
Subject: [Buildroot] [git commit master 1/1] php: add process control support
Message-ID: <20101124221326.159EF8E39E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=972cd4229b21f03183fe7b72a36ffc2be81d87e3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #2791

Signed-off-by: Thomas Rudin <thomas@rudin.li>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                |    4 +++-
 package/php/Config.ext |    5 +++++
 package/php/php.mk     |    4 ++++
 3 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index e533219..03e9513 100644
--- a/CHANGES
+++ b/CHANGES
@@ -4,7 +4,8 @@
 
 	Updated/fixed packages: bash, bind, busybox, gpsd, libglib2,
 	libcurl, libmad, lrzsz, midori, module-init-tools, mtd-utils,
-	openssh, openssl, pciutils, qt, sqlite, sysstat, webkit, zlib
+	openssh, openssl, pciutils, php, qt, sqlite, sysstat, webkit,
+	zlib
 
 	Issues resolved (http://bugs.uclibc.org):
 
@@ -12,6 +13,7 @@
 	#2479: host-module-init-tools 3.11 fails to build
 	#2725: Buildroot overrides kernel config
 	#2785: mtd-utils build fails due to missing libmtd
+	#2791: Added PHP-Process Control to the PHP-Package
 	#2797: pciutils dependencies on zlib not taken into account
 	#2809: failed to compile libglib2
 	#2821: [PATCH] Patch for JavaScriptCore in QtWebKit module
diff --git a/package/php/Config.ext b/package/php/Config.ext
index 0433abc..5c7f5ea 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -103,6 +103,11 @@ config BR2_PACKAGE_PHP_EXT_PCRE
 	help
 	  Perl Compatible Regular Expressions support
 
+config BR2_PACKAGE_PHP_EXT_PCNTL
+	bool "PCNTL"
+	help
+	  Process Control Support
+
 config BR2_PACKAGE_PHP_EXT_SYSVMSG
 	bool "sysvmsg - System V Message queue"
 	help
diff --git a/package/php/php.mk b/package/php/php.mk
index 68b0b5f..af4fa29 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -106,6 +106,10 @@ ifeq ($(BR2_PACKAGE_PHP_EXT_NCURSES),y)
 	PHP_DEPENDENCIES += ncurses
 endif
 
+ifeq ($(BR2_PACKAGE_PHP_EXT_PCNTL),y)
+	PHP_CONF_OPT += --enable-pcntl
+endif
+
 ifeq ($(BR2_PACKAGE_PHP_EXT_SYSVMSG),y)
 	PHP_CONF_OPT += --enable-sysvmsg
 endif
-- 
1.7.2.2
