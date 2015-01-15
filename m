From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Jan 2015 09:36:01 +0100
Subject: [Buildroot] [git commit] gd: bump to version 2.1.1
Message-ID: <20150115083836.BEC4580DF4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=691fc0a1982294cf12fd3b3e9d1c3168429f83cf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash file.
Remove CVE patch since it's upstream.
Rename patches to new naming convention.
Kill some whitespace.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-gdlib-config.patch => 0001-gdlib-config.patch} |    0
 .../gd/{gd-02-no-zlib.patch => 0002-no-zlib.patch} |    0
 ...tch => 0003-gd_bmp-fix-build-with-uClibc.patch} |    0
 package/gd/gd-04-CVE-2014-2497.patch               |   33 --------------------
 package/gd/gd.hash                                 |    2 +
 package/gd/gd.mk                                   |    3 +-
 6 files changed, 3 insertions(+), 35 deletions(-)

diff --git a/package/gd/gd-01-gdlib-config.patch b/package/gd/0001-gdlib-config.patch
similarity index 100%
rename from package/gd/gd-01-gdlib-config.patch
rename to package/gd/0001-gdlib-config.patch
diff --git a/package/gd/gd-02-no-zlib.patch b/package/gd/0002-no-zlib.patch
similarity index 100%
rename from package/gd/gd-02-no-zlib.patch
rename to package/gd/0002-no-zlib.patch
diff --git a/package/gd/gd-03-gd_bmp-fix-build-with-uClibc.patch b/package/gd/0003-gd_bmp-fix-build-with-uClibc.patch
similarity index 100%
rename from package/gd/gd-03-gd_bmp-fix-build-with-uClibc.patch
rename to package/gd/0003-gd_bmp-fix-build-with-uClibc.patch
diff --git a/package/gd/gd-04-CVE-2014-2497.patch b/package/gd/gd-04-CVE-2014-2497.patch
deleted file mode 100644
index d30bfbb..0000000
--- a/package/gd/gd-04-CVE-2014-2497.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 463c3bd09bfe8e924e19acad7a2a6af16953a704 Mon Sep 17 00:00:00 2001
-From: Remi Collet <fedora@famillecollet.com>
-Date: Mon, 4 Aug 2014 10:31:25 +0200
-Subject: [PATCH] CVE-2014-2497, NULL pointer dereference, fix #126
-
----
- src/gdxpm.c | 10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/src/gdxpm.c b/src/gdxpm.c
-index ae6e336..15603a6 100644
---- a/src/gdxpm.c
-+++ b/src/gdxpm.c
-@@ -83,6 +83,16 @@ BGD_DECLARE(gdImagePtr) gdImageCreateFromXpm(char *filename)
- 	if(overflow2(sizeof(int), number)) {
- 		goto done;
- 	}
-+	for(i = 0; i < number; i++) {
-+		/*
-+		   avoid NULL pointer dereference
-+		   TODO better fix need to manage monochrome/monovisual
-+		   see m_color or g4_color or g_color
-+		*/
-+		if (!image.colorTable[i].c_color) {
-+			goto done;
-+		}
-+	}
- 
- 	colors = (int *)gdMalloc(sizeof(int) * number);
- 	if(colors == NULL) {
--- 
-1.8.5.2
-
diff --git a/package/gd/gd.hash b/package/gd/gd.hash
new file mode 100644
index 0000000..8edbb1a
--- /dev/null
+++ b/package/gd/gd.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	9ada1ed45594abc998ebc942cef12b032fbad672e73efc22bc9ff54f5df2b285	libgd-2.1.1.tar.xz
diff --git a/package/gd/gd.mk b/package/gd/gd.mk
index d7a6512..2991cd5 100644
--- a/package/gd/gd.mk
+++ b/package/gd/gd.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-GD_VERSION = 2.1.0
+GD_VERSION = 2.1.1
 GD_SOURCE = libgd-$(GD_VERSION).tar.xz
 GD_SITE = https://bitbucket.org/libgd/gd-libgd/downloads
 GD_INSTALL_STAGING = YES
 GD_LICENSE = GD license
 GD_LICENSE_FILES = COPYING
-
 GD_CONFIG_SCRIPTS = gdlib-config
 GD_CONF_OPTS = --without-x --disable-rpath
 GD_DEPENDENCIES = host-pkgconf
