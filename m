From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Mar 2017 23:07:30 +0100
Subject: [Buildroot] [git commit] ghostscript: drop the ijs subfolder to fix
	build
Message-ID: <20170321220735.5F3F1825DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c30347492b5f14865134ba8bcb2145e20d84447d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ijs/ subfolder contains a bogus ltmain.sh file, which is actually a
broken symbolic link. Due to this, our logic to patch ltmain.sh files
fail with some patch versions:

  >>> ghostscript 9.21 Patching libtool
  File /home/buildroot/build/instance-0/output/build/ghostscript-9.21/ijs/ltmain.sh is not a regular file -- refusing to patch

Since we are anyway not using the ijs support (--without-ijs is passed),
do like we do for all other sub-components of ghostscript: get rid of
the ijs/ subfolder completely.

Fixes:

  http://autobuild.buildroot.net/results/ca683d69b7fb564788c8877c3bb6466390e976a8/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ghostscript/ghostscript.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index d563e77..e568b20 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -26,7 +26,7 @@ GHOSTSCRIPT_DEPENDENCIES = \
 # Inspired by linuxfromscratch:
 # http://www.linuxfromscratch.org/blfs/view/svn/pst/gs.html
 define GHOSTSCRIPT_REMOVE_LIBS
-	rm -rf $(@D)/freetype $(@D)/jpeg $(@D)/lcms2 $(@D)/libpng $(@D)/tiff $(@D)/zlib
+	rm -rf $(@D)/freetype $(@D)/ijs $(@D)/jpeg $(@D)/lcms2 $(@D)/libpng $(@D)/tiff $(@D)/zlib
 endef
 GHOSTSCRIPT_POST_PATCH_HOOKS += GHOSTSCRIPT_REMOVE_LIBS
 
