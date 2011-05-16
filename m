From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Mon, 16 May 2011 18:10:49 +0300
Subject: [Buildroot] [PATCH 2/3] font-misc-misc: Don't pull fonts encodings
	from host system
In-Reply-To: <1305558650-15826-1-git-send-email-anarsoul@gmail.com>
References: <1305558650-15826-1-git-send-email-anarsoul@gmail.com>
Message-ID: <1305558650-15826-2-git-send-email-anarsoul@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use encodings from staging dir.

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 .../xfont_font-misc-misc/xfont_font-misc-misc.mk   |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk b/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
index f6a5564..884f6f9 100644
--- a/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
+++ b/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
@@ -12,5 +12,11 @@ XFONT_FONT_MISC_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(
 XFONT_FONT_MISC_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_MISC_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
+define XFONT_FONT_MISC_MISC_MAPFILES_PATH_FIX
+	$(SED) 's|UTIL_DIR = |UTIL_DIR = ${STAGING_DIR}|;' $(@D)/Makefile
+endef
+
+XFONT_FONT_MISC_MISC_POST_CONFIGURE_HOOKS += XFONT_FONT_MISC_MISC_MAPFILES_PATH_FIX
+
 $(eval $(call AUTOTARGETS,package/x11r7,xfont_font-misc-misc))
 
-- 
1.7.5.rc1
