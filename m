From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Mar 2016 15:59:25 +0100
Subject: [Buildroot] [git commit] sdl_mixer: add patch to fix SDL_mixer.pc
	for static linking
Message-ID: <20160306145933.E5B7E8055C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=770965edfcf0463e681b0a5fb48757d16dc37751
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A 'Libs.private' field needs to be present and properly defined in the
pkg-config file in order for static linking against SDL_mixer to work.

Besides adding the mentioned field, the included patch also modifies
configure.in so that EXTRA_LDFLAGS (which is now also used as the value
of 'Libs.private') no longer includes SDL_LIBS. This is done so as to
prevent libraries required by SDL from being listed twice when
'pkg-config --libs --static SDL_mixer' is run (they're already shown
because of the 'Requires: sdl' line in SDL_mixer.pc). Makefile.in is
adjusted accordingly as well.

Also enable autoreconf for this package since we're patching
configure.in.

Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...Add-Libs.private-field-to-pkg-config-file.patch | 64 ++++++++++++++++++++++
 package/sdl_mixer/sdl_mixer.mk                     |  5 ++
 2 files changed, 69 insertions(+)

diff --git a/package/sdl_mixer/0001-Add-Libs.private-field-to-pkg-config-file.patch b/package/sdl_mixer/0001-Add-Libs.private-field-to-pkg-config-file.patch
new file mode 100644
index 0000000..e0e8571
--- /dev/null
+++ b/package/sdl_mixer/0001-Add-Libs.private-field-to-pkg-config-file.patch
@@ -0,0 +1,64 @@
+From abf3a1b9c9cdacb574c2b9cdbf3f2a5e18c39ab9 Mon Sep 17 00:00:00 2001
+From: Rodrigo Rebello <rprebello@gmail.com>
+Date: Mon, 29 Feb 2016 22:53:49 -0300
+Subject: [PATCH 1/1] Add 'Libs.private' field to pkg-config file
+
+In order to support static linking, SDL_mixer.pc should include a
+'Libs.private' field listing all the libraries that SDL_mixer requires.
+
+This patch adds such a field and also modifies configure.in so that
+EXTRA_LDFLAGS (which is now also used as the value of 'Libs.private')
+no longer includes SDL_LIBS. This is done so as to prevent libraries
+required by SDL from being listed twice when 'pkg-config --libs --static
+SDL_mixer' is run (they're already shown because of the 'Requires: sdl'
+line in SDL_mixer.pc). Makefile.in is also adjusted accordingly.
+
+Upstream status: submitted
+https://bugzilla.libsdl.org/show_bug.cgi?id=3278
+
+Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
+---
+ Makefile.in     | 2 +-
+ SDL_mixer.pc.in | 1 +
+ configure.in    | 1 -
+ 3 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 3d10565..ce4efd4 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -63,7 +63,7 @@ $(objects):
+ .PHONY: all install install-hdrs install-lib install-bin uninstall uninstall-hdrs uninstall-lib uninstall-bin clean distclean dist
+ 
+ $(objects)/$(TARGET): $(OBJECTS) $(VERSION_OBJECTS)
+-	$(LIBTOOL) --mode=link $(CC) -o $@ $(OBJECTS) $(VERSION_OBJECTS) $(LDFLAGS) $(EXTRA_LDFLAGS) $(LT_LDFLAGS)
++	$(LIBTOOL) --mode=link $(CC) -o $@ $(OBJECTS) $(VERSION_OBJECTS) $(LDFLAGS) $(SDL_LIBS) $(EXTRA_LDFLAGS) $(LT_LDFLAGS)
+ 
+ $(objects)/playwave$(EXE): $(objects)/playwave.lo $(objects)/$(TARGET)
+ 	$(LIBTOOL) --mode=link $(CC) -o $@ $(objects)/playwave.lo $(SDL_CFLAGS) $(SDL_LIBS) $(objects)/$(TARGET)
+diff --git a/SDL_mixer.pc.in b/SDL_mixer.pc.in
+index 1c4965d..d793521 100644
+--- a/SDL_mixer.pc.in
++++ b/SDL_mixer.pc.in
+@@ -8,5 +8,6 @@ Description: mixer library for Simple DirectMedia Layer
+ Version: @VERSION@
+ Requires: sdl >= @SDL_VERSION@
+ Libs: -L${libdir} -lSDL_mixer
++Libs.private: @EXTRA_LDFLAGS@
+ Cflags: -I${includedir}/SDL
+ 
+diff --git a/configure.in b/configure.in
+index 2272b29..442eca6 100644
+--- a/configure.in
++++ b/configure.in
+@@ -202,7 +202,6 @@ AM_PATH_SDL($SDL_VERSION,
+             AC_MSG_ERROR([*** SDL version $SDL_VERSION not found!])
+ )
+ EXTRA_CFLAGS="$EXTRA_CFLAGS $SDL_CFLAGS"
+-EXTRA_LDFLAGS="$EXTRA_LDFLAGS $SDL_LIBS"
+ 
+ dnl Check for math library
+ AC_CHECK_LIB(m, pow, [LIBM="-lm"])
+-- 
+2.1.4
+
diff --git a/package/sdl_mixer/sdl_mixer.mk b/package/sdl_mixer/sdl_mixer.mk
index a602b6e..897b308 100644
--- a/package/sdl_mixer/sdl_mixer.mk
+++ b/package/sdl_mixer/sdl_mixer.mk
@@ -12,6 +12,11 @@ SDL_MIXER_LICENSE_FILES = COPYING
 
 SDL_MIXER_INSTALL_STAGING = YES
 SDL_MIXER_DEPENDENCIES = sdl
+
+# We're patching configure.in, so we need to autoreconf
+SDL_MIXER_AUTORECONF = YES
+SDL_MIXER_AUTORECONF_OPTS = -Iacinclude
+
 SDL_MIXER_CONF_OPTS = \
 	--without-x \
 	--with-sdl-prefix=$(STAGING_DIR)/usr \
