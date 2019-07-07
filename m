From: Paul Cercueil <paul@crapouillou.net>
Date: Sun,  7 Jul 2019 12:52:24 -0400
Subject: [Buildroot] [PATCH 1/1] package/libpng: allow selection of older
 libpng versions
Message-ID: <20190707165224.31438-1-paul@crapouillou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

By allowing building an older version of libpng, we can create Buildroot
systems that are still binary-compatible with applications compiled with
older Buildroot toolchains.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 .../0001-Disable-pngfix-and-png-fix-itxt.patch    |  0
 package/libpng/Config.in                          | 15 +++++++++++++++
 package/libpng/libpng.hash                        |  2 ++
 package/libpng/libpng.mk                          | 11 +++++++++++
 4 files changed, 28 insertions(+)
 rename package/libpng/{ => 1.6.37}/0001-Disable-pngfix-and-png-fix-itxt.patch (100%)

diff --git a/package/libpng/0001-Disable-pngfix-and-png-fix-itxt.patch b/package/libpng/1.6.37/0001-Disable-pngfix-and-png-fix-itxt.patch
similarity index 100%
rename from package/libpng/0001-Disable-pngfix-and-png-fix-itxt.patch
rename to package/libpng/1.6.37/0001-Disable-pngfix-and-png-fix-itxt.patch
diff --git a/package/libpng/Config.in b/package/libpng/Config.in
index b0a3646078..099492c07c 100644
--- a/package/libpng/Config.in
+++ b/package/libpng/Config.in
@@ -6,3 +6,18 @@ config BR2_PACKAGE_LIBPNG
 	  images.
 
 	  http://www.libpng.org/
+
+choice
+	prompt "libpng version series"
+	default BR2_PACKAGE_LIBPNG_16
+
+config BR2_PACKAGE_LIBPNG_16
+	bool "libpng 1.6"
+
+config BR2_PACKAGE_LIBPNG_14
+	bool "libpng 1.4"
+
+config BR2_PACKAGE_LIBPNG_12
+	bool "libpng 1.2"
+
+endchoice
diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
index e86b8c65ce..c4bfc812cb 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -2,5 +2,7 @@
 md5 015e8e15db1eecde5f2eb9eb5b6e59e9  libpng-1.6.37.tar.xz
 sha1 3ab93fabbf4c27e1c4724371df408d9a1bd3f656  libpng-1.6.37.tar.xz
 # Locally computed:
+sha256 b4635f15b8adccc8ad0934eea485ef59cc4cae24d0f0300a9a941e51974ffcc7  libpng-1.2.59.tar.xz
+sha256 8d419a8b2a5edddda5cbcb897ded92205344a3249fa7a00d6384ea23ac3ccbd8  libpng-1.4.22.tar.xz
 sha256 505e70834d35383537b6491e7ae8641f1a4bed1876dbfe361201fc80868d88ca  libpng-1.6.37.tar.xz
 sha256 bf5e22b9dce8464064ae17a48ea1133c3369ac9e1d80ef9e320e5219aa14ea9b  LICENSE
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 5c30a4f9ad..2a89595006 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,8 +4,19 @@
 #
 ################################################################################
 
+ifeq ($(BR2_PACKAGE_LIBPNG_16),y)
 LIBPNG_VERSION = 1.6.37
 LIBPNG_SERIES = 16
+else
+ifeq ($(BR2_PACKAGE_LIBPNG_14),y)
+LIBPNG_VERSION = 1.4.22
+LIBPNG_SERIES = 14
+else
+LIBPNG_VERSION = 1.2.59
+LIBPNG_SERIES = 12
+endif
+endif
+
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
 LIBPNG_LICENSE = Libpng-2.0
-- 
2.21.0.593.g511ec345e18
