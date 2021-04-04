From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Apr 2021 16:45:19 +0200
Subject: [Buildroot] [git commit] package/qhull: bump to version 8.0.2
Message-ID: <20210404142017.C27928C564@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c9012ac8e60ce6580d2ce9821237375ca790d511
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Static libs are supported since version 8.0.2 and
  https://github.com/qhull/qhull/commit/613debeaea72ee66626dace9ba1a2eff11b5d37d
- Update hash of COPYING, update year and authors with
  https://github.com/qhull/qhull/commit/4733a95be0298919a646a1d6044c1bee7a552880
- Update indentation in hash file (two spaces)

https://github.com/qhull/qhull/releases/tag/v8.0.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qhull/Config.in  |  6 +++---
 package/qhull/qhull.hash |  8 ++++----
 package/qhull/qhull.mk   | 15 +++++++++++++--
 3 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/package/qhull/Config.in b/package/qhull/Config.in
index 0a4b60ffbe..cfd67b0d38 100644
--- a/package/qhull/Config.in
+++ b/package/qhull/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_QHULL
 	bool "qhull"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_4 # needs gcc >= 4.4
 	help
 	  Qhull computes the convex hull, Delaunay triangulation,
@@ -15,5 +14,6 @@ config BR2_PACKAGE_QHULL
 
 	  http://www.qhull.org
 
-comment "qhull needs a toolchain w/ C++, dynamic library, gcc >= 4.4"
-	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_4
+comment "qhull needs a toolchain w/ C++, gcc >= 4.4"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_4
diff --git a/package/qhull/qhull.hash b/package/qhull/qhull.hash
index b97c25a3f7..f7d8c9e729 100644
--- a/package/qhull/qhull.hash
+++ b/package/qhull/qhull.hash
@@ -1,5 +1,5 @@
-# From http://www.qhull.org/download/qhull-2019.1.md5sum
-md5	53c04f9c89b491b17b10c7ea1eaa4cc8	qhull-2019-src-7.3.2.tgz
+# From http://www.qhull.org/download/qhull-2020-src-8.0.2-tgz.md5sum
+md5  ed767244864488d5e9a22dfa788663a9  qhull-2020-src-8.0.2-tgz
 # Locally computed
-sha256	2b7990558c363076261564f61b74db4d0d73b71869755108a469038c07dc43fb	qhull-2019-src-7.3.2.tgz
-sha256	34db0c0c4f931861d720555c9cd7a2e228d1290ba29af0f2ee80c41bb2038afb	COPYING.txt
+sha256  b5c2d7eb833278881b952c8a52d20179eab87766b00b865000469a45c1838b7e  qhull-2020-src-8.0.2.tgz
+sha256  106d55c931fd6a84822e5345d900273d059f1c27310d02567ccb313c5d18c55d  COPYING.txt
diff --git a/package/qhull/qhull.mk b/package/qhull/qhull.mk
index fcf517634b..c11bed0373 100644
--- a/package/qhull/qhull.mk
+++ b/package/qhull/qhull.mk
@@ -4,11 +4,22 @@
 #
 ################################################################################
 
-QHULL_VERSION = 7.3.2
+QHULL_VERSION = 8.0.2
 QHULL_SITE = http://www.qhull.org/download
-QHULL_SOURCE = qhull-2019-src-$(QHULL_VERSION).tgz
+QHULL_SOURCE = qhull-2020-src-$(QHULL_VERSION).tgz
 QHULL_INSTALL_STAGING = YES
 QHULL_LICENSE = BSD-Style
 QHULL_LICENSE_FILES = COPYING.txt
 
+# BUILD_SHARED_LIBS is handled in pkg-cmake.mk as it is a generic cmake variable
+# although BUILD_STATIC_LIBS=ON is default, make it explicit,
+# cmake and static/shared libs is confusing enough already.
+ifeq ($(BR2_STATIC_LIBS),y)
+QHULL_CONF_OPTS += -DBUILD_STATIC_LIBS=ON
+else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+QHULL_CONF_OPTS += -DBUILD_STATIC_LIBS=ON
+else ifeq ($(BR2_SHARED_LIBS),y)
+QHULL_CONF_OPTS += -DBUILD_STATIC_LIBS=OFF
+endif
+
 $(eval $(cmake-package))
