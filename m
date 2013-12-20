From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 20 Dec 2013 23:27:58 +0100
Subject: [Buildroot] [PATCH 6/7] package/libjpeg: switch to package-defined
	providers
In-Reply-To: <cover.1387578401.git.yann.morin.1998@free.fr>
References: <cover.1387578401.git.yann.morin.1998@free.fr>
Message-ID: <26656058e990e8a02023bc172459f26c07c47b6d.1387578401.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

For the underlying reasons, see previous patch, titled:
    package/opengl/libegl: switch to package-defined providers

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/jpeg/Config.in | 5 +++++
 package/jpeg/jpeg.mk   | 9 +--------
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/jpeg/Config.in b/package/jpeg/Config.in
index 9508faf..b7cdfeb 100644
--- a/package/jpeg/Config.in
+++ b/package/jpeg/Config.in
@@ -30,4 +30,9 @@ config BR2_PACKAGE_JPEG_TURBO
 
 endchoice
 
+config BR2_PACKAGE_PROVIDES_JPEG
+	string
+	default "libjpeg"    if BR2_PACKAGE_LIBJPEG
+	default "jpeg-turbo" if BR2_PACKAGE_JPEG_TURBO
+
 endif
diff --git a/package/jpeg/jpeg.mk b/package/jpeg/jpeg.mk
index eaa2394..3695bc8 100644
--- a/package/jpeg/jpeg.mk
+++ b/package/jpeg/jpeg.mk
@@ -5,14 +5,7 @@
 ################################################################################
 
 JPEG_SOURCE =
-
-ifeq ($(BR2_PACKAGE_JPEG_TURBO),y)
-JPEG_DEPENDENCIES += jpeg-turbo
-endif
-
-ifeq ($(BR2_PACKAGE_LIBJPEG),y)
-JPEG_DEPENDENCIES += libjpeg
-endif
+JPEG_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_JPEG))
 
 ifeq ($(JPEG_DEPENDENCIES),)
 define JPEG_CONFIGURE_CMDS
-- 
1.8.1.2
