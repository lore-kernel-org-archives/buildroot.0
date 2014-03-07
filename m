From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Fri,  7 Mar 2014 14:22:14 +0100
Subject: [Buildroot] [PATCH v3 3/3] jpeg: convert to new virtual package
	management.
In-Reply-To: <1394198534-16379-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1394198534-16379-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1394198534-16379-4-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The dependency check in 'jpeg' has been updated to match the new virtual
package management.

Since this package is implemented via a choice rather than the usual
separate-package providers, BR2_PACKAGE_HAS_JPEG is always defined
when the 'jpeg' package is selected.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/jpeg/Config.in |    3 +++
 package/jpeg/jpeg.mk   |    7 +++----
 2 files changed, 6 insertions(+), 4 deletions(-)

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
index 3695bc8..5ddc43f 100644
--- a/package/jpeg/jpeg.mk
+++ b/package/jpeg/jpeg.mk
@@ -7,11 +7,10 @@
 JPEG_SOURCE =
 JPEG_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_JPEG))
 
+ifeq ($(BR2_PACKAGE_HAS_JPEG),y)
 ifeq ($(JPEG_DEPENDENCIES),)
-define JPEG_CONFIGURE_CMDS
-	echo "No JPEG implementation defined. Configuration error"
-	exit 1
-endef
+$(error No JPEG implementation defined. Configuration error.)
+endif
 endif
 
 $(eval $(generic-package))
-- 
1.7.9.5
