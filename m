From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Jan 2021 22:29:35 +0100
Subject: [Buildroot] [git commit] package/nano: fix tiny build
Message-ID: <20210124211901.7C54B7FC23@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3c4fa30f7abff344261f1faa3166577addb30b89
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since upstream commit
https://git.savannah.gnu.org/cgit/nano.git/commit/configure.ac?id=235f92ce093099cd81f14827ab842bd331132790

--enable-color --enable-nanorc are needed for libmagic support in tiny
builds however as --enable-color needs fork() and tiny is selected when
!BR2_USE_MMU, it is easier to just disable libmagic with tiny builds

Add explicit options to enable tiny, libmagic, color, and nanorc, rather
than relying on defaults.

Fixes:
 - http://autobuild.buildroot.net/results/24894e62d6cf89d078959b12e67596c821d64696

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr: add explicit options]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/nano/nano.mk | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index c688ff216c..d47c749ef5 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -19,18 +19,23 @@ NANO_CONF_ENV += ac_cv_prog_NCURSESW_CONFIG=false
 NANO_MAKE_ENV += CURSES_LIB="-lncurses"
 endif
 
-ifeq ($(BR2_PACKAGE_FILE),y)
-NANO_DEPENDENCIES += file
-NANO_CONF_OPTS += --enable-libmagic
-else
-NANO_CONF_OPTS += --disable-libmagic
-endif
-
 ifeq ($(BR2_PACKAGE_NANO_TINY),y)
-NANO_CONF_OPTS += --enable-tiny
+NANO_CONF_OPTS += \
+	--enable-tiny \
+	--disable-libmagic \
+	--disable-color \
+	--disable-nanorc
 define NANO_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 $(@D)/src/nano $(TARGET_DIR)/usr/bin/nano
 endef
-endif
+else
+NANO_CONF_OPTS += --disable-tiny
+ifeq ($(BR2_PACKAGE_FILE),y)
+NANO_DEPENDENCIES += file
+NANO_CONF_OPTS += --enable-libmagic --enable-color --enable-nanorc
+else
+NANO_CONF_OPTS += --disable-libmagic --disable-libmagic --disable-color
+endif # BR2_PACKAGE_FILE
+endif # BR2_PACKAGE_NANO_TINY
 
 $(eval $(autotools-package))
