From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 11 Jun 2017 15:13:17 +0200
Subject: [Buildroot] [PATCH 2/2] package lcdproc: override libpng-config path
In-Reply-To: <20170611131317.16345-1-romain.naour@gmail.com>
References: <20170611131317.16345-1-romain.naour@gmail.com>
Message-ID: <20170611131317.16345-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Like for freetype-config, override libpng-config path otherwise
the one from the host system may be used when installed.
Make sure that the one from HOST_DIR is used.

configure:7480: checking for libpng-config
configure:7498: found /usr/bin/libpng-config
configure:7510: result: /usr/bin/libpng-config
configure:7529: checking whether libpng is present and sane
[...]
nios2-linux-gnu-gcc: ERROR: unsafe header/library path used in cross-compilation: '-I/usr/include/libpng12'

Fixes
http://autobuild.buildroot.net/results/b68/b68f54404a7d412d639ebb6d052412eea6ee3bf1/lcdproc-0.5.7/config.log

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/lcdproc/lcdproc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lcdproc/lcdproc.mk b/package/lcdproc/lcdproc.mk
index 5196368..e602088 100644
--- a/package/lcdproc/lcdproc.mk
+++ b/package/lcdproc/lcdproc.mk
@@ -22,6 +22,7 @@ LCDPROC_CONF_ENV += ac_cv_path_FT2_CONFIG=$(STAGING_DIR)/usr/bin/freetype-config
 
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 LCDPROC_DEPENDENCIES += libpng
+LCDPROC_CONF_ENV += ac_cv_path__png_config=$(STAGING_DIR)/usr/bin/libpng-config
 LCDPROC_CONF_OPTS += --enable-libpng
 else
 LCDPROC_CONF_OPTS += --disable-libpng
-- 
2.9.4
