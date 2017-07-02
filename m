From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Jul 2017 00:05:18 +0200
Subject: [Buildroot] [git commit] poco: don't download patch from Github
Message-ID: <20170702220304.A911281EDC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e9b614ad3ad6bdeb48179dfa622dc7e3134806e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patches downloaded from Github are not stable, so bring them in the
tree.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...rsion-of-strerror_r-not-available-on-musl.patch | 33 ++++++++++++++++++++++
 ...poco-add-the-staging-path-to-search-path.patch} |  0
 ...atch => 0003-fix-m68k-double-conv-detect.patch} |  0
 package/poco/poco.hash                             |  1 -
 package/poco/poco.mk                               |  1 -
 5 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/package/poco/0001-GNU-version-of-strerror_r-not-available-on-musl.patch b/package/poco/0001-GNU-version-of-strerror_r-not-available-on-musl.patch
new file mode 100644
index 0000000..c2f297f
--- /dev/null
+++ b/package/poco/0001-GNU-version-of-strerror_r-not-available-on-musl.patch
@@ -0,0 +1,33 @@
+From 30159aea4b3f6421da9d74a8bf22aad6d3bf26b4 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Mon, 4 Apr 2016 20:48:43 +0200
+Subject: [PATCH] GNU version of strerror_r not available on musl
+
+The GNU version of glibc' `strerror_r` is non-portable.
+
+When the POSIX and GNU API collides musl always provides the POSIX API. That
+being the case for `strerror_r` musl does only support the POSIX version,
+despite of `_GNU_SOURCE`.
+
+[Upstream commit: https://github.com/pocoproject/poco/commit/30159aea4b3f6421da9d74a8bf22aad6d3bf26b4]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ Foundation/src/Error.cpp | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/Foundation/src/Error.cpp b/Foundation/src/Error.cpp
+index 6a8afb705f..00991fc0be 100644
+--- a/Foundation/src/Error.cpp
++++ b/Foundation/src/Error.cpp
+@@ -69,7 +69,10 @@ namespace Poco {
+ 		   without -D_GNU_SOURCE is needed, otherwise the GNU version is
+ 		   preferred.
+ 		*/
+-#if defined _GNU_SOURCE && !POCO_ANDROID
++		/* The GNU version of strerror_r is non-portable and not
++		   available on the musl C library.
++		 */
++#if (defined __GLIBC__ || defined __UCLIBC__) && defined _GNU_SOURCE && !POCO_ANDROID
+ 		char errmsg[256] = "";
+ 		return std::string(strerror_r(errorCode, errmsg, 256));
+ #elif (_XOPEN_SOURCE >= 600) || POCO_ANDROID
diff --git a/package/poco/0001-poco-add-the-staging-path-to-search-path.patch b/package/poco/0002-poco-add-the-staging-path-to-search-path.patch
similarity index 100%
rename from package/poco/0001-poco-add-the-staging-path-to-search-path.patch
rename to package/poco/0002-poco-add-the-staging-path-to-search-path.patch
diff --git a/package/poco/0002-fix-m68k-double-conv-detect.patch b/package/poco/0003-fix-m68k-double-conv-detect.patch
similarity index 100%
rename from package/poco/0002-fix-m68k-double-conv-detect.patch
rename to package/poco/0003-fix-m68k-double-conv-detect.patch
diff --git a/package/poco/poco.hash b/package/poco/poco.hash
index 1730f1c..c3b490e 100644
--- a/package/poco/poco.hash
+++ b/package/poco/poco.hash
@@ -1,3 +1,2 @@
 # Locally computed
 sha256  cfd311ecbc9e58accf1c4ea70170af88f92f88e73dd14944e528e7f6229e6cab  poco-poco-1.7.2-release.tar.gz
-sha256  32182791e7eac00ba367d2f22dd1dd5bfce0b6d6f76fd52f853364f98402dda3  30159aea4b3f6421da9d74a8bf22aad6d3bf26b4.patch
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index 3b27ddb..c9ddeae 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -9,7 +9,6 @@ POCO_SITE = $(call github,pocoproject,poco,$(POCO_VERSION))
 POCO_LICENSE = BSL-1.0
 POCO_LICENSE_FILES = LICENSE
 POCO_INSTALL_STAGING = YES
-POCO_PATCH = https://github.com/pocoproject/poco/commit/30159aea4b3f6421da9d74a8bf22aad6d3bf26b4.patch
 
 POCO_DEPENDENCIES = zlib pcre \
 	$(if $(BR2_PACKAGE_POCO_XML),expat) \
