From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 May 2016 20:55:50 +0200
Subject: [Buildroot] [git commit] package/kodi: Fix crash in pictureviewer
	when opening directories with many files
Message-ID: <20160517185650.9047C7FA0C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a23235ac89f7064df191170b8231e3a6c7e71eda
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

backported upstream commit:
https://github.com/xbmc/xbmc/commit/f63563615e357b7d794a38e1d37276c325d1466f

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...r-out-of-memory-errors-with-large-numbers.patch | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/package/kodi/0007-exif-Fix-for-out-of-memory-errors-with-large-numbers.patch b/package/kodi/0007-exif-Fix-for-out-of-memory-errors-with-large-numbers.patch
new file mode 100644
index 0000000..9b0e47d
--- /dev/null
+++ b/package/kodi/0007-exif-Fix-for-out-of-memory-errors-with-large-numbers.patch
@@ -0,0 +1,45 @@
+From f63563615e357b7d794a38e1d37276c325d1466f Mon Sep 17 00:00:00 2001
+From: popcornmix <popcornmix@gmail.com>
+Date: Sat, 7 May 2016 13:47:42 +0100
+Subject: [PATCH] [exif] Fix for out-of-memory errors with large numbers
+ of jpegs
+
+This reverts part of https://github.com/xbmc/xbmc/pull/7472
+
+Basically the commit made the 4 comments in the exif block increase
+from 2K to 64K each, so you now need 256K per photo.
+
+When opening a folder exif information for all photos is extracted.
+So, for a folder of 5000 jpegs, 1.2GB of RAM is needed just for
+the comments.
+
+As a 64K comment string is of no use to kodi, just truncate them to 2K
+like we used to.
+
+See:
+http://trac.kodi.tv/ticket/16193
+http://forum.kodi.tv/showthread.php?tid=251908
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+(backported from upstream commit in master branch:
+ https://github.com/xbmc/xbmc/commit/f63563615e357b7d794a38e1d37276c325d1466f)
+---
+ lib/libexif/libexif.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/libexif/libexif.h b/lib/libexif/libexif.h
+index aa8da07..519ac30 100644
+--- a/lib/libexif/libexif.h
++++ b/lib/libexif/libexif.h
+@@ -81,7 +81,7 @@ typedef struct {
+ #define EXIF_COMMENT_CHARSET_UNICODE    3 // Exif: Unicode (UTF-16)
+ #define EXIF_COMMENT_CHARSET_JIS        4 // Exif: JIS X208-1990
+ 
+-#define MAX_COMMENT 65533 // 2 bytes - 2 for the length param
++#define MAX_COMMENT 2000
+ #define MAX_DATE_COPIES 10
+ 
+ typedef struct {
+-- 
+2.8.1
+
