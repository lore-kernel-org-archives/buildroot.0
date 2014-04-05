From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Apr 2014 19:21:11 +0200
Subject: [Buildroot] [git commit] package/jpeg: convert to the
	virtual-package infrastructure
Message-ID: <20140405172339.3F7A99C5BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5e82185537209962a6d6283e2ea898eff8129271
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since this package is implemented via a choice rather than the usual
separate-package providers, we only need BR2_PACKAGE_HAS_JPEG to be
always defined when the 'jpeg' package is selected.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Mike Zick <minimod@morethan.org>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/jpeg/Config.in |    3 +++
 package/jpeg/jpeg.mk   |   12 +-----------
 2 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/package/jpeg/Config.in b/package/jpeg/Config.in
index b7cdfeb..3042d24 100644
--- a/package/jpeg/Config.in
+++ b/package/jpeg/Config.in
@@ -30,6 +30,9 @@ config BR2_PACKAGE_JPEG_TURBO
 
 endchoice
 
+config BR2_PACKAGE_HAS_JPEG
+	def_bool y
+
 config BR2_PACKAGE_PROVIDES_JPEG
 	string
 	default "libjpeg"    if BR2_PACKAGE_LIBJPEG
diff --git a/package/jpeg/jpeg.mk b/package/jpeg/jpeg.mk
index 3695bc8..2d56be6 100644
--- a/package/jpeg/jpeg.mk
+++ b/package/jpeg/jpeg.mk
@@ -4,14 +4,4 @@
 #
 ################################################################################
 
-JPEG_SOURCE =
-JPEG_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_JPEG))
-
-ifeq ($(JPEG_DEPENDENCIES),)
-define JPEG_CONFIGURE_CMDS
-	echo "No JPEG implementation defined. Configuration error"
-	exit 1
-endef
-endif
-
-$(eval $(generic-package))
+$(eval $(virtual-package))
