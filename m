From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 14 Oct 2010 20:32:34 +0200
Subject: [Buildroot] [git commit master 1/1] prboom: fix png support
Message-ID: <20101014183258.BBAA28C9AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c4e6bc74de5ac03e74b797bbcd088977f166d484
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Ensure libpng gets built before prboom so configure finds it, and fix
build with libpng 1.4.x (NULL defines removed).

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/games/prboom/prboom-2.5.0-libpng-1.4.patch |   32 ++++++++++++++++++++
 package/games/prboom/prboom.mk                     |    4 ++
 2 files changed, 36 insertions(+), 0 deletions(-)
 create mode 100644 package/games/prboom/prboom-2.5.0-libpng-1.4.patch

diff --git a/package/games/prboom/prboom-2.5.0-libpng-1.4.patch b/package/games/prboom/prboom-2.5.0-libpng-1.4.patch
new file mode 100644
index 0000000..0d2a3a5
--- /dev/null
+++ b/package/games/prboom/prboom-2.5.0-libpng-1.4.patch
@@ -0,0 +1,32 @@
+[PATCH] fix build with libpng 1.4.x
+
+In 1.4.x the png_*_NULL defines are gone. Replace them with a normal
+NULL instead.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ src/SDL/i_sshot.c |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+Index: prboom-2.5.0/src/SDL/i_sshot.c
+===================================================================
+--- prboom-2.5.0.orig/src/SDL/i_sshot.c
++++ prboom-2.5.0/src/SDL/i_sshot.c
+@@ -231,7 +231,7 @@ int I_ScreenShot (const char *fname)
+   if (fp)
+   {
+     png_struct *png_ptr = png_create_write_struct(
+-        PNG_LIBPNG_VER_STRING, png_error_ptr_NULL, error_fn, warning_fn);
++        PNG_LIBPNG_VER_STRING, NULL, error_fn, warning_fn);
+ 
+     if (png_ptr)
+     {
+@@ -279,7 +279,7 @@ int I_ScreenShot (const char *fname)
+             break;
+         }
+       }
+-      png_destroy_write_struct(&png_ptr,  png_infopp_NULL);
++      png_destroy_write_struct(&png_ptr, NULL);
+     }
+     fclose(fp);
+   }
diff --git a/package/games/prboom/prboom.mk b/package/games/prboom/prboom.mk
index 651118c..a8c7f65 100644
--- a/package/games/prboom/prboom.mk
+++ b/package/games/prboom/prboom.mk
@@ -7,6 +7,10 @@ PRBOOM_VERSION = 2.5.0
 PRBOOM_CONF_ENV = ac_cv_type_uid_t=yes
 PRBOOM_DEPENDENCIES = sdl SDL_net sdl_mixer
 
+ifeq ($(BR2_PACKAGE_LIBPNG),y)
+PRBOOM_DEPENDENCIES += libpng
+endif
+
 PRBOOM_CONF_OPT = \
 		--oldincludedir=$(STAGING_DIR)/usr/include \
 		--with-sdl-prefix=$(STAGING_DIR)/usr \
-- 
1.7.1
