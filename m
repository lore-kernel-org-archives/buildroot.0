From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 18 Oct 2015 22:29:26 +0200
Subject: [Buildroot] [PATCH v4 10/35] package/efl/libefl: add webp dependency
In-Reply-To: <1445200191-18404-1-git-send-email-romain.naour@openwide.fr>
References: <1445200191-18404-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1445200191-18404-11-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

WebP is a new image format that provides lossless and lossy
compression for images on the web. So enabling webp support
in efl libraries allow to loads images using WebP.

Also, it one of the "highly recommended" dependecies [1]
according to the README but disabling it doesn't need
the --enable-i-really-know-what-i-am-doing... option.
That's why BR2_PACKAGE_LIBEFL_WEBP is not added to
BR2_PACKAGE_LIBEFL_RECOMMENDED_CONFIG.

[1] https://git.enlightenment.org/core/efl.git/tree/README?id=v1.15.2#n486

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
v4: rename to libefl
    improve commit log
---
 package/efl/libefl/Config.in | 5 +++++
 package/efl/libefl/libefl.mk | 7 +++++++
 2 files changed, 12 insertions(+)

diff --git a/package/efl/libefl/Config.in b/package/efl/libefl/Config.in
index 5c65744..c72ea7e 100644
--- a/package/efl/libefl/Config.in
+++ b/package/efl/libefl/Config.in
@@ -65,4 +65,9 @@ config BR2_PACKAGE_LIBEFL_TIFF
 	help
 	  This enables the loader code that loads tiff files.
 
+config BR2_PACKAGE_LIBEFL_WEBP
+	bool "libevas webp image loader"
+	help
+	  This enables the loader code that loads images using WebP.
+
 endif # BR2_PACKAGE_LIBEFL
diff --git a/package/efl/libefl/libefl.mk b/package/efl/libefl/libefl.mk
index c7ecf51..9633630 100644
--- a/package/efl/libefl/libefl.mk
+++ b/package/efl/libefl/libefl.mk
@@ -195,6 +195,13 @@ else
 LIBEFL_CONF_OPTS += --enable-image-loader-tiff=no
 endif
 
+ifeq ($(BR2_PACKAGE_LIBEFL_WEBP),y)
+LIBEFL_CONF_OPTS += --enable-image-loader-webp=yes
+LIBEFL_DEPENDENCIES += webp
+else
+LIBEFL_CONF_OPTS += --enable-image-loader-webp=no
+endif
+
 $(eval $(autotools-package))
 
 ################################################################################
-- 
2.4.3
