From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  5 Apr 2014 17:21:54 +0200
Subject: [Buildroot] [PATCH 17/21] package/jpeg: convert to the
	virtual-package infrastructure
In-Reply-To: <cover.1396711074.git.yann.morin.1998@free.fr>
References: <cover.1396711074.git.yann.morin.1998@free.fr>
Message-ID: <4ea63d1d9f7c99a15e7ec99ad1f928101c688303.1396711074.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Since this package is implemented via a choice rather than the usual
separate-package providers, we only need BR2_PACKAGE_HAS_JPEG to be
always defined when the 'jpeg' package is selected.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Mike Zick <minimod@morethan.org>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
---
 package/jpeg/Config.in |  3 +++
 package/jpeg/jpeg.mk   | 12 +-----------
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
-- 
1.8.3.2
