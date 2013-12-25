From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Dec 2013 18:21:44 +0100
Subject: [Buildroot] [git commit] package/libjpeg: switch to package-defined
	providers
Message-ID: <20131225172209.39A2B9C1D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=17a0165a2a605ca46fea5721674fee2f0b985dbc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For the underlying reasons, see previous patch, titled:
    package/opengl/libegl: switch to package-defined providers

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/jpeg/Config.in |    5 +++++
 package/jpeg/jpeg.mk   |    9 +--------
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
