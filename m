From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 30 Nov 2018 09:43:41 +0100
Subject: [Buildroot] [git commit] package/libtool: reduce target package to
 libltdl only
Message-ID: <20181202071601.9E48781829@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf5d869a9f7951ff81cb9ed6c61a3176d17e3e72
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This will save 1700K on target filesystem (as tested on ARM, i686).

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libtool/libtool.mk | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/package/libtool/libtool.mk b/package/libtool/libtool.mk
index bf97ee12b5..10af8cf715 100644
--- a/package/libtool/libtool.mk
+++ b/package/libtool/libtool.mk
@@ -7,12 +7,22 @@
 LIBTOOL_VERSION = 2.4.6
 LIBTOOL_SOURCE = libtool-$(LIBTOOL_VERSION).tar.xz
 LIBTOOL_SITE = $(BR2_GNU_MIRROR)/libtool
+
+# For the target variant, we only want to build/install libltdl
+LIBTOOL_SUBDIR = libltdl
+HOST_LIBTOOL_SUBDIR = .
+
 LIBTOOL_INSTALL_STAGING = YES
-LIBTOOL_CONF_ENV = HELP2MAN=true
+
+LIBTOOL_CONF_OPTS = --enable-ltdl-install
+
 LIBTOOL_DEPENDENCIES = host-m4
 HOST_LIBTOOL_DEPENDENCIES = host-m4
-LIBTOOL_LICENSE = GPL-2.0+
-LIBTOOL_LICENSE_FILES = COPYING
+
+LIBTOOL_LICENSE = LGPL-2.1+
+LIBTOOL_LICENSE_FILES = $(LIBTOOL_SUBDIR)/COPYING.LIB
+HOST_LIBTOOL_LICENSE = GPL-2.0+ (libtool), LGPL-2.1+ (libltdl)
+HOST_LIBTOOL_LICENSE_FILES = COPYING $(LIBTOOL_SUBDIR)/COPYING.LIB
 
 HOST_LIBTOOL_CONF_ENV = MAKEINFO=true
 HOST_LIBTOOL_LIBTOOL_PATCH = NO
