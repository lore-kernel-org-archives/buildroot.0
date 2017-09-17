From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 17 Sep 2017 19:58:17 +0200
Subject: [Buildroot] [PATCH 1/2] package/poco: bump version to 1.7.9
Message-ID: <20170917175818.10621-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch applied upstream:
https://github.com/pocoproject/poco/commit/30159aea4b3f6421da9d74a8bf22aad6d3bf26b4

Renumbered remaining patches.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...rsion-of-strerror_r-not-available-on-musl.patch | 33 ----------------------
 ...poco-add-the-staging-path-to-search-path.patch} |  0
 ...atch => 0002-fix-m68k-double-conv-detect.patch} |  0
 package/poco/poco.hash                             |  2 +-
 package/poco/poco.mk                               |  2 +-
 5 files changed, 2 insertions(+), 35 deletions(-)
 delete mode 100644 package/poco/0001-GNU-version-of-strerror_r-not-available-on-musl.patch
 rename package/poco/{0002-poco-add-the-staging-path-to-search-path.patch => 0001-poco-add-the-staging-path-to-search-path.patch} (100%)
 rename package/poco/{0003-fix-m68k-double-conv-detect.patch => 0002-fix-m68k-double-conv-detect.patch} (100%)

diff --git a/package/poco/0001-GNU-version-of-strerror_r-not-available-on-musl.patch b/package/poco/0001-GNU-version-of-strerror_r-not-available-on-musl.patch
deleted file mode 100644
index c2f297f0ff..0000000000
--- a/package/poco/0001-GNU-version-of-strerror_r-not-available-on-musl.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 30159aea4b3f6421da9d74a8bf22aad6d3bf26b4 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
-Date: Mon, 4 Apr 2016 20:48:43 +0200
-Subject: [PATCH] GNU version of strerror_r not available on musl
-
-The GNU version of glibc' `strerror_r` is non-portable.
-
-When the POSIX and GNU API collides musl always provides the POSIX API. That
-being the case for `strerror_r` musl does only support the POSIX version,
-despite of `_GNU_SOURCE`.
-
-[Upstream commit: https://github.com/pocoproject/poco/commit/30159aea4b3f6421da9d74a8bf22aad6d3bf26b4]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- Foundation/src/Error.cpp | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/Foundation/src/Error.cpp b/Foundation/src/Error.cpp
-index 6a8afb705f..00991fc0be 100644
---- a/Foundation/src/Error.cpp
-+++ b/Foundation/src/Error.cpp
-@@ -69,7 +69,10 @@ namespace Poco {
- 		   without -D_GNU_SOURCE is needed, otherwise the GNU version is
- 		   preferred.
- 		*/
--#if defined _GNU_SOURCE && !POCO_ANDROID
-+		/* The GNU version of strerror_r is non-portable and not
-+		   available on the musl C library.
-+		 */
-+#if (defined __GLIBC__ || defined __UCLIBC__) && defined _GNU_SOURCE && !POCO_ANDROID
- 		char errmsg[256] = "";
- 		return std::string(strerror_r(errorCode, errmsg, 256));
- #elif (_XOPEN_SOURCE >= 600) || POCO_ANDROID
diff --git a/package/poco/0002-poco-add-the-staging-path-to-search-path.patch b/package/poco/0001-poco-add-the-staging-path-to-search-path.patch
similarity index 100%
rename from package/poco/0002-poco-add-the-staging-path-to-search-path.patch
rename to package/poco/0001-poco-add-the-staging-path-to-search-path.patch
diff --git a/package/poco/0003-fix-m68k-double-conv-detect.patch b/package/poco/0002-fix-m68k-double-conv-detect.patch
similarity index 100%
rename from package/poco/0003-fix-m68k-double-conv-detect.patch
rename to package/poco/0002-fix-m68k-double-conv-detect.patch
diff --git a/package/poco/poco.hash b/package/poco/poco.hash
index c3b490ee07..7f96f04d78 100644
--- a/package/poco/poco.hash
+++ b/package/poco/poco.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  cfd311ecbc9e58accf1c4ea70170af88f92f88e73dd14944e528e7f6229e6cab  poco-poco-1.7.2-release.tar.gz
+sha256  150b8d8486fbd01f4bbe359a56439ccf14b62fb9994991baa9663a2656acee27  poco-poco-1.7.9-release.tar.gz
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index c9ddeae3a9..673b93a4f9 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POCO_VERSION = poco-1.7.2-release
+POCO_VERSION = poco-1.7.9-release
 POCO_SITE = $(call github,pocoproject,poco,$(POCO_VERSION))
 POCO_LICENSE = BSL-1.0
 POCO_LICENSE_FILES = LICENSE
-- 
2.11.0
