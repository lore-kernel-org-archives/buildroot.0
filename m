From: spdawson at gmail.com <spdawson@gmail.com>
Date: Mon, 12 Nov 2012 09:18:12 +0000
Subject: [Buildroot] [PATCH] lcdproc: fix autobuilder failures
Message-ID: <1352711892-5593-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

The lcdproc version bump to 0.5.6 has resulted in autobuilder failures such as
the following.

  http://autobuild.buildroot.org/results/9967bc20a6094e836c4c18ff2cd30edef143bb8e/build-end.log

The 0.5.6 release added a new glcd driver, which requires the freetype and zlib
libraries. This patch makes the lcdproc package depend on freetype and zlib.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/lcdproc/Config.in  |    2 ++
 package/lcdproc/lcdproc.mk |    2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/lcdproc/Config.in b/package/lcdproc/Config.in
index 820f4ea..e0afc44 100644
--- a/package/lcdproc/Config.in
+++ b/package/lcdproc/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_LCDPROC
        bool "lcdproc"
+       select BR2_PACKAGE_FREETYPE
        select BR2_PACKAGE_NCURSES
+       select BR2_PACKAGE_ZLIB
        help
          LCD display driver daemon and clients
 
diff --git a/package/lcdproc/lcdproc.mk b/package/lcdproc/lcdproc.mk
index aa204f1..2a80289 100644
--- a/package/lcdproc/lcdproc.mk
+++ b/package/lcdproc/lcdproc.mk
@@ -16,6 +16,6 @@ ifeq ($(BR2_PACKAGE_LCDPROC_MENUS),y)
 LCDPROC_CONF_OPT += --enable-lcdproc-menus
 endif
 
-LCDPROC_DEPENDENCIES = ncurses
+LCDPROC_DEPENDENCIES = freetype ncurses zlib
 
 $(eval $(autotools-package))
-- 
1.7.10.4
