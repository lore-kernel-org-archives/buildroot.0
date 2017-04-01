From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 15:48:05 +0200
Subject: [Buildroot] [git commit] package/sdl_sound: fix build with physfs
Message-ID: <20170401134814.4C60C825F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5d05319c1b6931e81c4aa07ffe2f2f11699227fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A buildroot package for physfs has recently been added, and if it is
detected by sdl_sound's configure it enables code in the simple
player which fails to build (if the player is enabled).

(The build problem is due to physfs renaming a macro which has not been
reflected in sdl_sound.)

So, add the physfs dependency to the package information and correct
the build problem with a patch taken from Arch Linux, where they seem
to have already found and fixed this issue.

Fixes:
http://autobuild.buildroot.net/results/ae5839b978244c434dd86d49b672c437a7b19a66

Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sdl_sound/0003-renamed-physfs-export.patch | 32 ++++++++++++++++++++++
 package/sdl_sound/sdl_sound.mk                     |  7 +++++
 2 files changed, 39 insertions(+)

diff --git a/package/sdl_sound/0003-renamed-physfs-export.patch b/package/sdl_sound/0003-renamed-physfs-export.patch
new file mode 100644
index 0000000..3aeded3
--- /dev/null
+++ b/package/sdl_sound/0003-renamed-physfs-export.patch
@@ -0,0 +1,32 @@
+This patch is taken from the Arch Linux User Repository, see:
+https://aur.archlinux.org/packages/sdl_sound-patched-hg/
+
+Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
+
+diff -ru SDL_sound.orig/playsound/physfsrwops.h SDL_sound/playsound/physfsrwops.h
+--- SDL_sound.orig/playsound/physfsrwops.h	2014-01-11 06:28:35.494936000 +0100
++++ SDL_sound/playsound/physfsrwops.h	2014-01-11 06:31:38.315675483 +0100
+@@ -29,6 +29,11 @@
+ extern "C" {
+ #endif
+ 
++/* renamed in physfs dev, add alias */
++#ifdef PHYSFS_DECL
++#define __EXPORT__ PHYSFS_DECL
++#endif
++
+ /**
+  * Open a platform-independent filename for reading, and make it accessible
+  *  via an SDL_RWops structure. The file will be closed in PhysicsFS when the
+@@ -77,6 +82,11 @@
+  */
+ __EXPORT__ SDL_RWops *PHYSFSRWOPS_makeRWops(PHYSFS_file *handle);
+ 
++/* renamed in physfs dev, remove alias */
++#ifdef PHYSFS_DECL
++#undef __EXPORT__
++#endif
++
+ #ifdef __cplusplus
+ }
+ #endif
diff --git a/package/sdl_sound/sdl_sound.mk b/package/sdl_sound/sdl_sound.mk
index 6c4f959..2544b59 100644
--- a/package/sdl_sound/sdl_sound.mk
+++ b/package/sdl_sound/sdl_sound.mk
@@ -45,6 +45,13 @@ else
 SDL_SOUND_CONF_OPTS += --disable-speex
 endif
 
+ifeq ($(BR2_PACKAGE_PHYSFS),y)
+SDL_SOUND_CONF_OPTS += --enable-physfs
+SDL_SOUND_DEPENDENCIES += physfs
+else
+SDL_SOUND_CONF_OPTS += --disable-physfs
+endif
+
 SDL_SOUND_CONF_OPTS = \
 	--with-sdl-prefix=$(STAGING_DIR)/usr \
 	--with-sdl-exec-prefix=$(STAGING_DIR)/usr \
