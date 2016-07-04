From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Jul 2016 17:50:43 +0200
Subject: [Buildroot] [git commit] imagemagick: explicitly specify
	ghostscript font directory
Message-ID: <20160704155049.7149A807CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=983408937531a08551232bd1d236c86fa0544a95
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It appears that Imagemagick needs to be configured with
 --with-gs-font-dir=/usr/share/fonts/gs else it will not find
the ghostscript fonts and /etc/ImageMagick-6/type-ghostscript.xml
will contain the wrong font paths. You end up with messages like:
Magick: unable to read font `(null)' @ error/annotate.c/RenderFreetype/1153
They are non-fatal but could get annoying fast if you are using 'convert'
on a lot of files.

Without patch we end up with (depending on what is available on the host):

  Font Configuration:
  Apple fonts       --with-apple-font-dir=default
  Dejavu fonts      --with-dejavu-font-dir=default      none
  Ghostscript fonts --with-gs-font-dir=default  /usr/share/fonts/type1/gsfonts/
  Windows fonts     --with-windows-font-dir=default     none

And with the patch:

  Font Configuration:
  Apple fonts       --with-apple-font-dir=default
  Dejavu fonts      --with-dejavu-font-dir=default      none
  Ghostscript fonts --with-gs-font-dir=/usr/share/fonts/gs      /usr/share/fonts/gs/
  Windows fonts     --with-windows-font-dir=default     none

[Peter: reworked/extended commit message]
Signed-off-by: Robert Sohn <grepper@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imagemagick/imagemagick.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 94c9647..864e033 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -36,7 +36,8 @@ IMAGEMAGICK_CONF_OPTS = \
 	--without-perl \
 	--without-raqm \
 	--without-wmf \
-	--without-x
+	--without-x \
+	--with-gs-font-dir=/usr/share/fonts/gs
 
 IMAGEMAGICK_DEPENDENCIES = host-pkgconf
 
