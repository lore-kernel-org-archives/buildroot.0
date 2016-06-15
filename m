From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jun 2016 15:17:47 +0200
Subject: [Buildroot] [PATCH 2/3] rsyslog: bump version to 8.19.0
In-Reply-To: <1465996668-6444-1-git-send-email-peter@korsgaard.com>
References: <1465996668-6444-1-git-send-email-peter@korsgaard.com>
Message-ID: <1465996668-6444-2-git-send-email-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And drop patch now upstream. Rsyslog now uses libfastjson instead of json-c,
so adjust dependencies.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rsyslog/0001-musl-fcntl-h.patch | 30 ------------------------------
 package/rsyslog/Config.in               |  4 ++--
 package/rsyslog/rsyslog.hash            |  2 +-
 package/rsyslog/rsyslog.mk              |  4 ++--
 4 files changed, 5 insertions(+), 35 deletions(-)
 delete mode 100644 package/rsyslog/0001-musl-fcntl-h.patch

diff --git a/package/rsyslog/0001-musl-fcntl-h.patch b/package/rsyslog/0001-musl-fcntl-h.patch
deleted file mode 100644
index 5c2daee..0000000
--- a/package/rsyslog/0001-musl-fcntl-h.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 835571774dc519dd2cff7ab1020cf298cc953a8f Mon Sep 17 00:00:00 2001
-From: Thordur Bjornsson <thorduri@secnorth.net>
-Date: Tue, 7 Jul 2015 12:34:08 +0200
-Subject: [PATCH] omfile: unconditionally include fcntl.h.
-
-required for open() flags
-
-Signed-off-by: Thordur Bjornsson <thorduri@secnorth.net>
-[Bernd: downloaded from upstream commit:
- https://github.com/rsyslog/rsyslog/commit/835571774dc519dd2cff7ab1020cf298cc953a8f
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- tools/omfile.c | 4 +---
- 1 file changed, 1 insertion(+), 3 deletions(-)
-
-diff --git a/tools/omfile.c b/tools/omfile.c
-index 482e723..4444b97 100644
---- a/tools/omfile.c
-+++ b/tools/omfile.c
-@@ -48,9 +48,7 @@
- #include <libgen.h>
- #include <unistd.h>
- #include <sys/file.h>
--#ifdef OS_SOLARIS
--#	include <fcntl.h>
--#endif
-+#include <fcntl.h>
- #ifdef HAVE_ATOMIC_BUILTINS
- #	include <pthread.h>
- #endif
diff --git a/package/rsyslog/Config.in b/package/rsyslog/Config.in
index 3599207..241ee2e 100644
--- a/package/rsyslog/Config.in
+++ b/package/rsyslog/Config.in
@@ -3,11 +3,11 @@ config BR2_PACKAGE_RSYSLOG
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_LIBESTR
 	select BR2_PACKAGE_LIBLOGGING
-	select BR2_PACKAGE_JSON_C
+	select BR2_PACKAGE_LIBFASTJSON
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS # modules
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libfastjson
 	help
 	  Rsyslog is a powerful and flexible syslog implementation
 
diff --git a/package/rsyslog/rsyslog.hash b/package/rsyslog/rsyslog.hash
index 5f9e0ed..7dc341a 100644
--- a/package/rsyslog/rsyslog.hash
+++ b/package/rsyslog/rsyslog.hash
@@ -1,2 +1,2 @@
 # From http://www.rsyslog.com/downloads/download-v8-stable/
-sha256	eab00e8e758cd9dd33b3e2cf6af80297d1951dc7db37bd723a6488a35d577adc	rsyslog-8.9.0.tar.gz
+sha256	3379b30f2e6ef05a0f1c7327c73923fa5877a80b984506cdf48ed068c94a575e	rsyslog-8.19.0.tar.gz
diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index 5dde924..40e3b33 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-RSYSLOG_VERSION = 8.9.0
+RSYSLOG_VERSION = 8.19.0
 RSYSLOG_SITE = http://rsyslog.com/files/download/rsyslog
 RSYSLOG_LICENSE = GPLv3, LGPLv3, Apache-2.0
 RSYSLOG_LICENSE_FILES = COPYING COPYING.LESSER COPYING.ASL20
-RSYSLOG_DEPENDENCIES = zlib libestr liblogging json-c host-pkgconf
+RSYSLOG_DEPENDENCIES = zlib libestr liblogging libfastjson host-pkgconf
 RSYSLOG_CONF_ENV = ac_cv_prog_cc_c99='-std=c99'
 RSYSLOG_PLUGINS = imdiag imfile impstats imptcp \
 	mmanon mmaudit mmfields mmjsonparse mmpstrucdata mmsequence mmutf8fix \
-- 
2.7.0
