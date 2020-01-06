From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 6 Jan 2020 21:24:44 +0100
Subject: [Buildroot] [git commit] package/erlang-p1-iconv: remove package
Message-ID: <20200106201550.CCD9D8EE4B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=48daa29c8ac16bb72a7d16a2188fe05dc645428d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package was a dependency to ejabberd-18.09. It is not anymore
use by any package nor maintain upstream, so remove it.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                             |  7 +++++++
 package/Config.in                            |  1 -
 package/erlang-p1-iconv/Config.in            |  8 --------
 package/erlang-p1-iconv/erlang-p1-iconv.hash |  2 --
 package/erlang-p1-iconv/erlang-p1-iconv.mk   | 19 -------------------
 5 files changed, 7 insertions(+), 30 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index d049839e2d..9f552ad386 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2020.02"
 
+config BR2_PACKAGE_ERLANG_P1_ICONV
+	bool "erlang-p1-iconv has been removed"
+	select BR2_LEGACY
+	help
+	  The erlang-p1-iconv package was no longer used by ejabberd,
+	  and was no longer maintained upstream, so it was removed.
+
 config BR2_KERNEL_HEADERS_5_3
 	bool "kernel headers version 5.3.x are no longer supported"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 436216338a..296dbe49d5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -585,7 +585,6 @@ menu "Erlang libraries/modules"
 	source "package/erlang-lager/Config.in"
 	source "package/erlang-p1-acme/Config.in"
 	source "package/erlang-p1-cache-tab/Config.in"
-	source "package/erlang-p1-iconv/Config.in"
 	source "package/erlang-p1-mqtree/Config.in"
 	source "package/erlang-p1-oauth2/Config.in"
 	source "package/erlang-p1-pkix/Config.in"
diff --git a/package/erlang-p1-iconv/Config.in b/package/erlang-p1-iconv/Config.in
deleted file mode 100644
index cec17d0605..0000000000
--- a/package/erlang-p1-iconv/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_ERLANG_P1_ICONV
-	bool "erlang-p1-iconv"
-	select BR2_PACKAGE_ERLANG_P1_UTILS
-	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
-	help
-	  Erlang interface to libiconv
-
-	  https://github.com/processone/eiconv
diff --git a/package/erlang-p1-iconv/erlang-p1-iconv.hash b/package/erlang-p1-iconv/erlang-p1-iconv.hash
deleted file mode 100644
index 31bcf40731..0000000000
--- a/package/erlang-p1-iconv/erlang-p1-iconv.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256 8a9ff8a3dd983284caa964f118b5782ef1c0c662995608b2ca4f4a5f285605a9 erlang-p1-iconv-1.0.10.tar.gz
diff --git a/package/erlang-p1-iconv/erlang-p1-iconv.mk b/package/erlang-p1-iconv/erlang-p1-iconv.mk
deleted file mode 100644
index 79d8efe16f..0000000000
--- a/package/erlang-p1-iconv/erlang-p1-iconv.mk
+++ /dev/null
@@ -1,19 +0,0 @@
-################################################################################
-#
-# erlang-p1-iconv
-#
-################################################################################
-
-ERLANG_P1_ICONV_VERSION = 1.0.10
-ERLANG_P1_ICONV_SITE = $(call github,processone,iconv,$(ERLANG_P1_ICONV_VERSION))
-ERLANG_P1_ICONV_LICENSE = Apache-2.0
-ERLANG_P1_ICONV_LICENSE_FILES = LICENSE.txt
-ERLANG_P1_ICONV_DEPENDENCIES = erlang-p1-utils
-
-ifeq ($(BR2_PACKAGE_LIBICONV),y)
-ERLANG_P1_ICONV_DEPENDENCIES += libiconv
-endif
-
-ERLANG_P1_ICONV_USE_AUTOCONF = YES
-
-$(eval $(rebar-package))
