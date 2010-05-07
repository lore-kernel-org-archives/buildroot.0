From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 May 2010 00:11:46 +0200
Subject: [Buildroot] [git commit master] xfonts: fix dependencies and build
	process
Message-ID: <20100507223515.D0C0B8F341@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=803967499fb362d2fe394647d4a4a59932f6a708
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of assuming that mkfontdir and mkfontscale are available on
the development system, use the one installed in $(HOST_DIR).

The FCCACHE variable is removed, because, for some reason, the
installation process of xfonts disables the call to fc-cache when a
DESTDIR is passed. See the definition of XORG_FONT_FCCACHE in
aclocal.m4 in font packages:

AC_DEFUN([XORG_FONT_FCCACHE],[
        AC_PATH_PROG(FCCACHE, fc-cache)
        FCCACHE_WARN='echo "** Warning: fonts.cache not built" ; echo "** Generate this file manually on host system using fc-cache"'
        if test x"$FCCACHE" = x ; then
                RUN_FCCACHE="${FCCACHE_WARN}"
        else
                RUN_FCCACHE='@(if test -z "$(DESTDIR)"; then echo $(FCCACHE) $(fontdir); $(FCCACHE) $(fontdir); else'
                RUN_FCCACHE="${RUN_FCCACHE} ${FCCACHE_WARN} ; fi)"
        fi
        AC_SUBST([RUN_FCCACHE])
])

In addition to this, we update the font dependencies to include
font-utils for the host, mkfontdir for the host, mkfontscale for the
host and bdftopcf for the host.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../xfont_font-adobe-100dpi.mk                     |    6 +++---
 .../xfont_font-adobe-75dpi.mk                      |    6 +++---
 .../xfont_font-adobe-utopia-100dpi.mk              |    6 +++---
 .../xfont_font-adobe-utopia-75dpi.mk               |    6 +++---
 .../xfont_font-adobe-utopia-type1.mk               |    6 +++---
 package/x11r7/xfont_font-alias/xfont_font-alias.mk |    6 +++---
 .../xfont_font-arabic-misc.mk                      |    6 +++---
 .../xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk   |    6 +++---
 .../xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk     |    6 +++---
 .../xfont_font-bh-lucidatypewriter-100dpi.mk       |    6 +++---
 .../xfont_font-bh-lucidatypewriter-75dpi.mk        |    6 +++---
 .../x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk   |    6 +++---
 .../xfont_font-bh-type1/xfont_font-bh-type1.mk     |    6 +++---
 .../xfont_font-bitstream-100dpi.mk                 |    6 +++---
 .../xfont_font-bitstream-75dpi.mk                  |    6 +++---
 .../xfont_font-bitstream-speedo.mk                 |    6 +++---
 .../xfont_font-bitstream-type1.mk                  |    6 +++---
 .../xfont_font-cronyx-cyrillic.mk                  |    6 +++---
 .../xfont_font-cursor-misc.mk                      |    6 +++---
 .../xfont_font-daewoo-misc.mk                      |    6 +++---
 .../xfont_font-dec-misc/xfont_font-dec-misc.mk     |    6 +++---
 .../xfont_font-ibm-type1/xfont_font-ibm-type1.mk   |    6 +++---
 .../xfont_font-isas-misc/xfont_font-isas-misc.mk   |    6 +++---
 .../xfont_font-jis-misc/xfont_font-jis-misc.mk     |    6 +++---
 .../xfont_font-micro-misc/xfont_font-micro-misc.mk |    6 +++---
 .../xfont_font-misc-cyrillic.mk                    |    6 +++---
 .../xfont_font-misc-ethiopic.mk                    |    6 +++---
 .../xfont_font-misc-meltho.mk                      |    6 +++---
 .../xfont_font-misc-misc/xfont_font-misc-misc.mk   |    6 +++---
 .../xfont_font-mutt-misc/xfont_font-mutt-misc.mk   |    6 +++---
 .../xfont_font-schumacher-misc.mk                  |    6 +++---
 .../xfont_font-screen-cyrillic.mk                  |    6 +++---
 .../xfont_font-sony-misc/xfont_font-sony-misc.mk   |    6 +++---
 .../xfont_font-sun-misc/xfont_font-sun-misc.mk     |    6 +++---
 .../xfont_font-winitzki-cyrillic.mk                |    6 +++---
 .../xfont_font-xfree86-type1.mk                    |    6 +++---
 36 files changed, 108 insertions(+), 108 deletions(-)

diff --git a/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk b/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk
index 6705f67..2b9c50c 100644
--- a/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk
+++ b/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk
@@ -8,9 +8,9 @@ XFONT_FONT_ADOBE_100DPI_VERSION = 1.0.1
 XFONT_FONT_ADOBE_100DPI_SOURCE = font-adobe-100dpi-$(XFONT_FONT_ADOBE_100DPI_VERSION).tar.bz2
 XFONT_FONT_ADOBE_100DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_ADOBE_100DPI_AUTORECONF = NO
-XFONT_FONT_ADOBE_100DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install
-XFONT_FONT_ADOBE_100DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install-data
-XFONT_FONT_ADOBE_100DPI_DEPENDENCIES = xfont_font-util
+XFONT_FONT_ADOBE_100DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_ADOBE_100DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_ADOBE_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(call AUTOTARGETS,package/x11r7,xfont_font-adobe-100dpi))
 
diff --git a/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk b/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk
index fe8a306..2d7791a 100644
--- a/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk
+++ b/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk
@@ -8,9 +8,9 @@ XFONT_FONT_ADOBE_75DPI_VERSION = 1.0.1
 XFONT_FONT_ADOBE_75DPI_SOURCE = font-adobe-75dpi-$(XFONT_FONT_ADOBE_75DPI_VERSION).tar.bz2
 XFONT_FONT_ADOBE_75DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_ADOBE_75DPI_AUTORECONF = NO
-XFONT_FONT_ADOBE_75DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install
-XFONT_FONT_ADOBE_75DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install-data
-XFONT_FONT_ADOBE_75DPI_DEPENDENCIES = xfont_font-util
+XFONT_FONT_ADOBE_75DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_ADOBE_75DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_ADOBE_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(call AUTOTARGETS,package/x11r7,xfont_font-adobe-75dpi))
 
diff --git a/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk b/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk
index 9bf704f..2ed27f4 100644
--- a/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk
+++ b/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk
@@ -8,9 +8,9 @@ XFONT_FONT_ADOBE_UTOPIA_100DPI_VERSION = 1.0.2
 XFONT_FONT_ADOBE_UTOPIA_100DPI_SOURCE = font-adobe-utopia-100dpi-$(XFONT_FONT_ADOBE_UTOPIA_100DPI_VERSION).tar.bz2
 XFONT_FONT_ADOBE_UTOPIA_100DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_ADOBE_UTOPIA_100DPI_AUTORECONF = NO
-XFONT_FONT_ADOBE_UTOPIA_100DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install
-XFONT_FONT_ADOBE_UTOPIA_100DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install-data
-XFONT_FONT_ADOBE_UTOPIA_100DPI_DEPENDENCIES = xfont_font-util
+XFONT_FONT_ADOBE_UTOPIA_100DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_ADOBE_UTOPIA_100DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_ADOBE_UTOPIA_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(call AUTOTARGETS,package/x11r7,xfont_font-adobe-utopia-100dpi))
 
diff --git a/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk b/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk
index 412eb99..ead4196 100644
--- a/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk
+++ b/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk
@@ -8,9 +8,9 @@ XFONT_FONT_ADOBE_UTOPIA_75DPI_VERSION = 1.0.2
 XFONT_FONT_ADOBE_UTOPIA_75DPI_SOURCE = font-adobe-utopia-75dpi-$(XFONT_FONT_ADOBE_UTOPIA_75DPI_VERSION).tar.bz2
 XFONT_FONT_ADOBE_UTOPIA_75DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_ADOBE_UTOPIA_75DPI_AUTORECONF = NO
-XFONT_FONT_ADOBE_UTOPIA_75DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install
-XFONT_FONT_ADOBE_UTOPIA_75DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install-data
-XFONT_FONT_ADOBE_UTOPIA_75DPI_DEPENDENCIES = xfont_font-util
+XFONT_FONT_ADOBE_UTOPIA_75DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_ADOBE_UTOPIA_75DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_ADOBE_UTOPIA_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(call AUTOTARGETS,package/x11r7,xfont_font-adobe-utopia-75dpi))
 
diff --git a/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk b/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk
index daa5f37..983bab6 100644
--- a/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk
+++ b/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk
@@ -8,9 +8,9 @@ XFONT_FONT_ADOBE_UTOPIA_TYPE1_VERSION = 1.0.2
 XFONT_FONT_ADOBE_UTOPIA_TYPE1_SOURCE = font-adobe-utopia-type1-$(XFONT_FONT_ADOBE_UTOPIA_TYPE1_VERSION).tar.bz2
 XFONT_FONT_ADOBE_UTOPIA_TYPE1_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_ADOBE_UTOPIA_TYPE1_AUTORECONF = NO
-XFONT_FONT_ADOBE_UTOPIA_TYPE1_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install
-XFONT_FONT_ADOBE_UTOPIA_TYPE1_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install-data
-XFONT_FONT_ADOBE_UTOPIA_TYPE1_DEPENDENCIES = xfont_font-util
+XFONT_FONT_ADOBE_UTOPIA_TYPE1_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_ADOBE_UTOPIA_TYPE1_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_ADOBE_UTOPIA_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(call AUTOTARGETS,package/x11r7,xfont_font-adobe-utopia-type1))
 
diff --git a/package/x11r7/xfont_font-alias/xfont_font-alias.mk b/package/x11r7/xfont_font-alias/xfont_font-alias.mk
index 9da4772..1e85f3e 100644
--- a/package/x11r7/xfont_font-alias/xfont_font-alias.mk
+++ b/package/x11r7/xfont_font-alias/xfont_font-alias.mk
@@ -8,9 +8,9 @@ XFONT_FONT_ALIAS_VERSION = 1.0.2
 XFONT_FONT_ALIAS_SOURCE = font-alias-$(XFONT_FONT_ALIAS_VERSION).tar.bz2
 XFONT_FONT_ALIAS_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_ALIAS_AUTORECONF = NO
-XFONT_FONT_ALIAS_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install
-XFONT_FONT_ALIAS_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install-data
-XFONT_FONT_ALIAS_DEPENDENCIES = xfont_font-util
+XFONT_FONT_ALIAS_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_ALIAS_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_ALIAS_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(call AUTOTARGETS,package/x11r7,xfont_font-alias))
 
diff --git a/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk b/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk
index 0e2aeb6..5a1253a 100644
--- a/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk
+++ b/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk
@@ -8,9 +8,9 @@ XFONT_FONT_ARABIC_MISC_VERSION = 1.0.1
 XFONT_FONT_ARABIC_MISC_SOURCE = font-arabic-misc-$(XFONT_FONT_ARABIC_MISC_VERSION).tar.bz2
 XFONT_FONT_ARABIC_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_ARABIC_MISC_AUTORECONF = NO
-XFONT_FONT_ARABIC_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install
-XFONT_FONT_ARABIC_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install-data
-XFONT_FONT_ARABIC_MISC_DEPENDENCIES = xfont_font-util
+XFONT_FONT_ARABIC_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_ARABIC_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_ARABIC_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(call AUTOTARGETS,package/x11r7,xfont_font-arabic-misc))
 
diff --git a/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk b/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk
index 752df37..f2f796a 100644
--- a/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk
+++ b/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk
@@ -8,9 +8,9 @@ XFONT_FONT_BH_100DPI_VERSION = 1.0.1
 XFONT_FONT_BH_100DPI_SOURCE = font-bh-100dpi-$(XFONT_FONT_BH_100DPI_VERSION).tar.bz2
 XFONT_FONT_BH_100DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_BH_100DPI_AUTORECONF = NO
-XFONT_FONT_BH_100DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install
-XFONT_FONT_BH_100DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install-data
-XFONT_FONT_BH_100DPI_DEPENDENCIES = xfont_font-util
+XFONT_FONT_BH_100DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_BH_100DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_BH_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(call AUTOTARGETS,package/x11r7,xfont_font-bh-100dpi))
 
diff --git a/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk b/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk
index 1f3b609..4d08be4 100644
--- a/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk
+++ b/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk
@@ -8,9 +8,9 @@ XFONT_FONT_BH_75DPI_VERSION = 1.0.1
 XFONT_FONT_BH_75DPI_SOURCE = font-bh-75dpi-$(XFONT_FONT_BH_75DPI_VERSION).tar.bz2
 XFONT_FONT_BH_75DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_BH_75DPI_AUTORECONF = NO
-XFONT_FONT_BH_75DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install
-XFONT_FONT_BH_75DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install-data
-XFONT_FONT_BH_75DPI_DEPENDENCIES = xfont_font-util
+XFONT_FONT_BH_75DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_BH_75DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_BH_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(call AUTOTARGETS,package/x11r7,xfont_font-bh-75dpi))
 
diff --git a/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk b/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk
index ee001c7..a7897c2 100644
--- a/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk
+++ b/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk
@@ -8,9 +8,9 @@ XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_VERSION = 1.0.1
 XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_SOURCE = font-bh-lucidatypewriter-100dpi-$(XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_VERSION).tar.bz2
 XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_AUTORECONF = NO
-XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install
-XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install-data
-XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_DEPENDENCIES = xfont_font-util
+XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(call AUTOTARGETS,package/x11r7,xfont_font-bh-lucidatypewriter-100dpi))
 
diff --git a/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk b/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk
index a327015..04a3246 100644
--- a/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk
+++ b/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk
@@ -8,9 +8,9 @@ XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_VERSION = 1.0.1
 XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_SOURCE = font-bh-lucidatypewriter-75dpi-$(XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_VERSION).tar.bz2
 XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_AUTORECONF = NO
-XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install
-XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install-data
-XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_DEPENDENCIES = xfont_font-util
+XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(call AUTOTARGETS,package/x11r7,xfont_font-bh-lucidatypewriter-75dpi))
 
diff --git a/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk b/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk
index 2e6d7fe..ea2c82a 100644
--- a/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk
+++ b/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk
@@ -8,9 +8,9 @@ XFONT_FONT_BH_TTF_VERSION = 1.0.1
 XFONT_FONT_BH_TTF_SOURCE = font-bh-ttf-$(XFONT_FONT_BH_TTF_VERSION).tar.bz2
 XFONT_FONT_BH_TTF_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_BH_TTF_AUTORECONF = NO
-XFONT_FONT_BH_TTF_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install
-XFONT_FONT_BH_TTF_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install-data
-XFONT_FONT_BH_TTF_DEPENDENCIES = xfont_font-util
+XFONT_FONT_BH_TTF_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_BH_TTF_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_BH_TTF_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(call AUTOTARGETS,package/x11r7,xfont_font-bh-ttf))
 
diff --git a/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk b/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk
index 9611a76..3f5a025 100644
--- a/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk
+++ b/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk
@@ -8,9 +8,9 @@ XFONT_FONT_BH_TYPE1_VERSION = 1.0.1
 XFONT_FONT_BH_TYPE1_SOURCE = font-bh-type1-$(XFONT_FONT_BH_TYPE1_VERSION).tar.bz2
 XFONT_FONT_BH_TYPE1_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_BH_TYPE1_AUTORECONF = NO
-XFONT_FONT_BH_TYPE1_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install
-XFONT_FONT_BH_TYPE1_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install-data
-XFONT_FONT_BH_TYPE1_DEPENDENCIES = xfont_font-util
+XFONT_FONT_BH_TYPE1_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_BH_TYPE1_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_BH_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(call AUTOTARGETS,package/x11r7,xfont_font-bh-type1))
 
diff --git a/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk b/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk
index a0dec17..a89db53 100644
--- a/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk
+++ b/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk
@@ -8,9 +8,9 @@ XFONT_FONT_BITSTREAM_100DPI_VERSION = 1.0.1
 XFONT_FONT_BITSTREAM_100DPI_SOURCE = font-bitstream-100dpi-$(XFONT_FONT_BITSTREAM_100DPI_VERSION).tar.bz2
 XFONT_FONT_BITSTREAM_100DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_BITSTREAM_100DPI_AUTORECONF = NO
-XFONT_FONT_BITSTREAM_100DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install
-XFONT_FONT_BITSTREAM_100DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install-data
-XFONT_FONT_BITSTREAM_100DPI_DEPENDENCIES = xfont_font-util
+XFONT_FONT_BITSTREAM_100DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_BITSTREAM_100DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_BITSTREAM_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(call AUTOTARGETS,package/x11r7,xfont_font-bitstream-100dpi))
 
diff --git a/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk b/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk
index a646b7a..ea2fd41 100644
--- a/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk
+++ b/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk
@@ -8,9 +8,9 @@ XFONT_FONT_BITSTREAM_75DPI_VERSION = 1.0.1
 XFONT_FONT_BITSTREAM_75DPI_SOURCE = font-bitstream-75dpi-$(XFONT_FONT_BITSTREAM_75DPI_VERSION).tar.bz2
 XFONT_FONT_BITSTREAM_75DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_BITSTREAM_75DPI_AUTORECONF = NO
-XFONT_FONT_BITSTREAM_75DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install
-XFONT_FONT_BITSTREAM_75DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install-data
-XFONT_FONT_BITSTREAM_75DPI_DEPENDENCIES = xfont_font-util
+XFONT_FONT_BITSTREAM_75DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_BITSTREAM_75DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_BITSTREAM_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(call AUTOTARGETS,package/x11r7,xfont_font-bitstream-75dpi))
 
diff --git a/package/x11r7/xfont_font-bitstream-speedo/xfont_font-bitstream-speedo.mk b/package/x11r7/xfont_font-bitstream-speedo/xfont_font-bitstream-speedo.mk
index f534c94..f867c7e 100644
--- a/package/x11r7/xfont_font-bitstream-speedo/xfont_font-bitstream-speedo.mk
+++ b/package/x11r7/xfont_font-bitstream-speedo/xfont_font-bitstream-speedo.mk
@@ -8,9 +8,9 @@ XFONT_FONT_BITSTREAM_SPEEDO_VERSION = 1.0.1
 XFONT_FONT_BITSTREAM_SPEEDO_SOURCE = font-bitstream-speedo-$(XFONT_FONT_BITSTREAM_SPEEDO_VERSION).tar.bz2
 XFONT_FONT_BITSTREAM_SPEEDO_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_BITSTREAM_SPEEDO_AUTORECONF = NO
-XFONT_FONT_BITSTREAM_SPEEDO_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install
-XFONT_FONT_BITSTREAM_SPEEDO_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install-data
-XFONT_FONT_BITSTREAM_SPEEDO_DEPENDENCIES = xfont_font-util
+XFONT_FONT_BITSTREAM_SPEEDO_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_BITSTREAM_SPEEDO_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_BITSTREAM_SPEEDO_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(call AUTOTARGETS,package/x11r7,xfont_font-bitstream-speedo))
 
diff --git a/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk b/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk
index 9481eff..75a60de 100644
--- a/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk
+++ b/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk
@@ -8,9 +8,9 @@ XFONT_FONT_BITSTREAM_TYPE1_VERSION = 1.0.1
 XFONT_FONT_BITSTREAM_TYPE1_SOURCE = font-bitstream-type1-$(XFONT_FONT_BITSTREAM_TYPE1_VERSION).tar.bz2
 XFONT_FONT_BITSTREAM_TYPE1_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_BITSTREAM_TYPE1_AUTORECONF = NO
-XFONT_FONT_BITSTREAM_TYPE1_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install
-XFONT_FONT_BITSTREAM_TYPE1_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install-data
-XFONT_FONT_BITSTREAM_TYPE1_DEPENDENCIES = xfont_font-util
+XFONT_FONT_BITSTREAM_TYPE1_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_BITSTREAM_TYPE1_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_BITSTREAM_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(call AUTOTARGETS,package/x11r7,xfont_font-bitstream-type1))
 
diff --git a/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk b/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk
index 3ed415f..484bf4b 100644
--- a/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk
+++ b/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk
@@ -8,9 +8,9 @@ XFONT_FONT_CRONYX_CYRILLIC_VERSION = 1.0.1
 XFONT_FONT_CRONYX_CYRILLIC_SOURCE = font-cronyx-cyrillic-$(XFONT_FONT_CRONYX_CYRILLIC_VERSION).tar.bz2
 XFONT_FONT_CRONYX_CYRILLIC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_CRONYX_CYRILLIC_AUTORECONF = NO
-XFONT_FONT_CRONYX_CYRILLIC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install
-XFONT_FONT_CRONYX_CYRILLIC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install-data
-XFONT_FONT_CRONYX_CYRILLIC_DEPENDENCIES = xfont_font-util
+XFONT_FONT_CRONYX_CYRILLIC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_CRONYX_CYRILLIC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_CRONYX_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(call AUTOTARGETS,package/x11r7,xfont_font-cronyx-cyrillic))
 
diff --git a/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk b/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk
index 86990b8..755f6ec 100644
--- a/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk
+++ b/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk
@@ -8,9 +8,9 @@ XFONT_FONT_CURSOR_MISC_VERSION = 1.0.1
 XFONT_FONT_CURSOR_MISC_SOURCE = font-cursor-misc-$(XFONT_FONT_CURSOR_MISC_VERSION).tar.bz2
 XFONT_FONT_CURSOR_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_CURSOR_MISC_AUTORECONF = NO
-XFONT_FONT_CURSOR_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install
-XFONT_FONT_CURSOR_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install-data
-XFONT_FONT_CURSOR_MISC_DEPENDENCIES = xfont_font-util
+XFONT_FONT_CURSOR_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_CURSOR_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_CURSOR_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(call AUTOTARGETS,package/x11r7,xfont_font-cursor-misc))
 
diff --git a/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk b/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk
index f26ddd5..c66bbbb 100644
--- a/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk
+++ b/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk
@@ -8,9 +8,9 @@ XFONT_FONT_DAEWOO_MISC_VERSION = 1.0.1
 XFONT_FONT_DAEWOO_MISC_SOURCE = font-daewoo-misc-$(XFONT_FONT_DAEWOO_MISC_VERSION).tar.bz2
 XFONT_FONT_DAEWOO_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_DAEWOO_MISC_AUTORECONF = NO
-XFONT_FONT_DAEWOO_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install
-XFONT_FONT_DAEWOO_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install-data
-XFONT_FONT_DAEWOO_MISC_DEPENDENCIES = xfont_font-util
+XFONT_FONT_DAEWOO_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_DAEWOO_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_DAEWOO_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(call AUTOTARGETS,package/x11r7,xfont_font-daewoo-misc))
 
diff --git a/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk b/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk
index bfe624b..9c510a1 100644
--- a/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk
+++ b/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk
@@ -8,9 +8,9 @@ XFONT_FONT_DEC_MISC_VERSION = 1.0.1
 XFONT_FONT_DEC_MISC_SOURCE = font-dec-misc-$(XFONT_FONT_DEC_MISC_VERSION).tar.bz2
 XFONT_FONT_DEC_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_DEC_MISC_AUTORECONF = NO
-XFONT_FONT_DEC_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install
-XFONT_FONT_DEC_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install-data
-XFONT_FONT_DEC_MISC_DEPENDENCIES = xfont_font-util
+XFONT_FONT_DEC_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_DEC_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_DEC_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(call AUTOTARGETS,package/x11r7,xfont_font-dec-misc))
 
diff --git a/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk b/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk
index 85dd7f2..075f4ba 100644
--- a/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk
+++ b/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk
@@ -8,9 +8,9 @@ XFONT_FONT_IBM_TYPE1_VERSION = 1.0.1
 XFONT_FONT_IBM_TYPE1_SOURCE = font-ibm-type1-$(XFONT_FONT_IBM_TYPE1_VERSION).tar.bz2
 XFONT_FONT_IBM_TYPE1_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_IBM_TYPE1_AUTORECONF = NO
-XFONT_FONT_IBM_TYPE1_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install
-XFONT_FONT_IBM_TYPE1_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install-data
-XFONT_FONT_IBM_TYPE1_DEPENDENCIES = xfont_font-util
+XFONT_FONT_IBM_TYPE1_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_IBM_TYPE1_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_IBM_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(call AUTOTARGETS,package/x11r7,xfont_font-ibm-type1))
 
diff --git a/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk b/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk
index 5519b7d..5635ff6 100644
--- a/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk
+++ b/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk
@@ -8,9 +8,9 @@ XFONT_FONT_ISAS_MISC_VERSION = 1.0.1
 XFONT_FONT_ISAS_MISC_SOURCE = font-isas-misc-$(XFONT_FONT_ISAS_MISC_VERSION).tar.bz2
 XFONT_FONT_ISAS_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_ISAS_MISC_AUTORECONF = NO
-XFONT_FONT_ISAS_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install
-XFONT_FONT_ISAS_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install-data
-XFONT_FONT_ISAS_MISC_DEPENDENCIES = xfont_font-util
+XFONT_FONT_ISAS_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_ISAS_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_ISAS_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(call AUTOTARGETS,package/x11r7,xfont_font-isas-misc))
 
diff --git a/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk b/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk
index 7f73894..4f1a74e 100644
--- a/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk
+++ b/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk
@@ -8,9 +8,9 @@ XFONT_FONT_JIS_MISC_VERSION = 1.0.1
 XFONT_FONT_JIS_MISC_SOURCE = font-jis-misc-$(XFONT_FONT_JIS_MISC_VERSION).tar.bz2
 XFONT_FONT_JIS_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_JIS_MISC_AUTORECONF = NO
-XFONT_FONT_JIS_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install
-XFONT_FONT_JIS_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install-data
-XFONT_FONT_JIS_MISC_DEPENDENCIES = xfont_font-util
+XFONT_FONT_JIS_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_JIS_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_JIS_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(call AUTOTARGETS,package/x11r7,xfont_font-jis-misc))
 
diff --git a/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk b/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk
index c2efb87..0b1f35c 100644
--- a/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk
+++ b/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk
@@ -8,9 +8,9 @@ XFONT_FONT_MICRO_MISC_VERSION = 1.0.1
 XFONT_FONT_MICRO_MISC_SOURCE = font-micro-misc-$(XFONT_FONT_MICRO_MISC_VERSION).tar.bz2
 XFONT_FONT_MICRO_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_MICRO_MISC_AUTORECONF = NO
-XFONT_FONT_MICRO_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install
-XFONT_FONT_MICRO_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install-data
-XFONT_FONT_MICRO_MISC_DEPENDENCIES = xfont_font-util
+XFONT_FONT_MICRO_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_MICRO_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_MICRO_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(call AUTOTARGETS,package/x11r7,xfont_font-micro-misc))
 
diff --git a/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk b/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk
index 0750cf6..3ae408d 100644
--- a/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk
+++ b/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk
@@ -8,9 +8,9 @@ XFONT_FONT_MISC_CYRILLIC_VERSION = 1.0.1
 XFONT_FONT_MISC_CYRILLIC_SOURCE = font-misc-cyrillic-$(XFONT_FONT_MISC_CYRILLIC_VERSION).tar.bz2
 XFONT_FONT_MISC_CYRILLIC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_MISC_CYRILLIC_AUTORECONF = NO
-XFONT_FONT_MISC_CYRILLIC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install
-XFONT_FONT_MISC_CYRILLIC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install-data
-XFONT_FONT_MISC_CYRILLIC_DEPENDENCIES = xfont_font-util
+XFONT_FONT_MISC_CYRILLIC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_MISC_CYRILLIC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_MISC_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(call AUTOTARGETS,package/x11r7,xfont_font-misc-cyrillic))
 
diff --git a/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk b/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk
index 494fbfe..e093781 100644
--- a/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk
+++ b/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk
@@ -8,9 +8,9 @@ XFONT_FONT_MISC_ETHIOPIC_VERSION = 1.0.1
 XFONT_FONT_MISC_ETHIOPIC_SOURCE = font-misc-ethiopic-$(XFONT_FONT_MISC_ETHIOPIC_VERSION).tar.bz2
 XFONT_FONT_MISC_ETHIOPIC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_MISC_ETHIOPIC_AUTORECONF = NO
-XFONT_FONT_MISC_ETHIOPIC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install
-XFONT_FONT_MISC_ETHIOPIC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install-data
-XFONT_FONT_MISC_ETHIOPIC_DEPENDENCIES = xfont_font-util
+XFONT_FONT_MISC_ETHIOPIC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_MISC_ETHIOPIC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_MISC_ETHIOPIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(call AUTOTARGETS,package/x11r7,xfont_font-misc-ethiopic))
 
diff --git a/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk b/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk
index 67c5ecd..e04f01d 100644
--- a/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk
+++ b/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk
@@ -8,9 +8,9 @@ XFONT_FONT_MISC_MELTHO_VERSION = 1.0.1
 XFONT_FONT_MISC_MELTHO_SOURCE = font-misc-meltho-$(XFONT_FONT_MISC_MELTHO_VERSION).tar.bz2
 XFONT_FONT_MISC_MELTHO_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_MISC_MELTHO_AUTORECONF = NO
-XFONT_FONT_MISC_MELTHO_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install
-XFONT_FONT_MISC_MELTHO_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install-data
-XFONT_FONT_MISC_MELTHO_DEPENDENCIES = xfont_font-util
+XFONT_FONT_MISC_MELTHO_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_MISC_MELTHO_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_MISC_MELTHO_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(call AUTOTARGETS,package/x11r7,xfont_font-misc-meltho))
 
diff --git a/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk b/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
index de9ca24..f6a5564 100644
--- a/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
+++ b/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
@@ -8,9 +8,9 @@ XFONT_FONT_MISC_MISC_VERSION = 1.1.0
 XFONT_FONT_MISC_MISC_SOURCE = font-misc-misc-$(XFONT_FONT_MISC_MISC_VERSION).tar.bz2
 XFONT_FONT_MISC_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_MISC_MISC_AUTORECONF = NO
-XFONT_FONT_MISC_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install
-XFONT_FONT_MISC_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install-data
-XFONT_FONT_MISC_MISC_DEPENDENCIES = xfont_font-util
+XFONT_FONT_MISC_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_MISC_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_MISC_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(call AUTOTARGETS,package/x11r7,xfont_font-misc-misc))
 
diff --git a/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk b/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk
index 163b3ba..28995ef 100644
--- a/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk
+++ b/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk
@@ -8,9 +8,9 @@ XFONT_FONT_MUTT_MISC_VERSION = 1.0.1
 XFONT_FONT_MUTT_MISC_SOURCE = font-mutt-misc-$(XFONT_FONT_MUTT_MISC_VERSION).tar.bz2
 XFONT_FONT_MUTT_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_MUTT_MISC_AUTORECONF = NO
-XFONT_FONT_MUTT_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install
-XFONT_FONT_MUTT_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install-data
-XFONT_FONT_MUTT_MISC_DEPENDENCIES = xfont_font-util
+XFONT_FONT_MUTT_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_MUTT_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_MUTT_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(call AUTOTARGETS,package/x11r7,xfont_font-mutt-misc))
 
diff --git a/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk b/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk
index 6c8af16..86dc54b 100644
--- a/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk
+++ b/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk
@@ -8,9 +8,9 @@ XFONT_FONT_SCHUMACHER_MISC_VERSION = 1.1.0
 XFONT_FONT_SCHUMACHER_MISC_SOURCE = font-schumacher-misc-$(XFONT_FONT_SCHUMACHER_MISC_VERSION).tar.bz2
 XFONT_FONT_SCHUMACHER_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_SCHUMACHER_MISC_AUTORECONF = NO
-XFONT_FONT_SCHUMACHER_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install
-XFONT_FONT_SCHUMACHER_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install-data
-XFONT_FONT_SCHUMACHER_MISC_DEPENDENCIES = xfont_font-util
+XFONT_FONT_SCHUMACHER_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_SCHUMACHER_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_SCHUMACHER_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(call AUTOTARGETS,package/x11r7,xfont_font-schumacher-misc))
 
diff --git a/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk b/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk
index 14fcd70..d0db502 100644
--- a/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk
+++ b/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk
@@ -8,9 +8,9 @@ XFONT_FONT_SCREEN_CYRILLIC_VERSION = 1.0.2
 XFONT_FONT_SCREEN_CYRILLIC_SOURCE = font-screen-cyrillic-$(XFONT_FONT_SCREEN_CYRILLIC_VERSION).tar.bz2
 XFONT_FONT_SCREEN_CYRILLIC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_SCREEN_CYRILLIC_AUTORECONF = NO
-XFONT_FONT_SCREEN_CYRILLIC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install
-XFONT_FONT_SCREEN_CYRILLIC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install-data
-XFONT_FONT_SCREEN_CYRILLIC_DEPENDENCIES = xfont_font-util
+XFONT_FONT_SCREEN_CYRILLIC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_SCREEN_CYRILLIC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_SCREEN_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(call AUTOTARGETS,package/x11r7,xfont_font-screen-cyrillic))
 
diff --git a/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk b/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk
index 7f825c8..7fc9cbf 100644
--- a/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk
+++ b/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk
@@ -8,9 +8,9 @@ XFONT_FONT_SONY_MISC_VERSION = 1.0.1
 XFONT_FONT_SONY_MISC_SOURCE = font-sony-misc-$(XFONT_FONT_SONY_MISC_VERSION).tar.bz2
 XFONT_FONT_SONY_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_SONY_MISC_AUTORECONF = NO
-XFONT_FONT_SONY_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install
-XFONT_FONT_SONY_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install-data
-XFONT_FONT_SONY_MISC_DEPENDENCIES = xfont_font-util
+XFONT_FONT_SONY_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_SONY_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_SONY_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(call AUTOTARGETS,package/x11r7,xfont_font-sony-misc))
 
diff --git a/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk b/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk
index f06ecf7..9364e4a 100644
--- a/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk
+++ b/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk
@@ -8,9 +8,9 @@ XFONT_FONT_SUN_MISC_VERSION = 1.0.1
 XFONT_FONT_SUN_MISC_SOURCE = font-sun-misc-$(XFONT_FONT_SUN_MISC_VERSION).tar.bz2
 XFONT_FONT_SUN_MISC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_SUN_MISC_AUTORECONF = NO
-XFONT_FONT_SUN_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install
-XFONT_FONT_SUN_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install-data
-XFONT_FONT_SUN_MISC_DEPENDENCIES = xfont_font-util
+XFONT_FONT_SUN_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_SUN_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_SUN_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(call AUTOTARGETS,package/x11r7,xfont_font-sun-misc))
 
diff --git a/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk b/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk
index 4578236..377f281 100644
--- a/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk
+++ b/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk
@@ -8,9 +8,9 @@ XFONT_FONT_WINITZKI_CYRILLIC_VERSION = 1.0.1
 XFONT_FONT_WINITZKI_CYRILLIC_SOURCE = font-winitzki-cyrillic-$(XFONT_FONT_WINITZKI_CYRILLIC_VERSION).tar.bz2
 XFONT_FONT_WINITZKI_CYRILLIC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_WINITZKI_CYRILLIC_AUTORECONF = NO
-XFONT_FONT_WINITZKI_CYRILLIC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install
-XFONT_FONT_WINITZKI_CYRILLIC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install-data
-XFONT_FONT_WINITZKI_CYRILLIC_DEPENDENCIES = xfont_font-util
+XFONT_FONT_WINITZKI_CYRILLIC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_WINITZKI_CYRILLIC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_WINITZKI_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(call AUTOTARGETS,package/x11r7,xfont_font-winitzki-cyrillic))
 
diff --git a/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk b/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk
index d05554c..6e3e564 100644
--- a/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk
+++ b/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk
@@ -8,9 +8,9 @@ XFONT_FONT_XFREE86_TYPE1_VERSION = 1.0.2
 XFONT_FONT_XFREE86_TYPE1_SOURCE = font-xfree86-type1-$(XFONT_FONT_XFREE86_TYPE1_VERSION).tar.bz2
 XFONT_FONT_XFREE86_TYPE1_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_XFREE86_TYPE1_AUTORECONF = NO
-XFONT_FONT_XFREE86_TYPE1_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install
-XFONT_FONT_XFREE86_TYPE1_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=/usr/bin/mkfontscale MKFONTDIR=/usr/bin/mkfontdir FCCACHE=/usr/bin/fc-cache install-data
-XFONT_FONT_XFREE86_TYPE1_DEPENDENCIES = xfont_font-util
+XFONT_FONT_XFREE86_TYPE1_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
+XFONT_FONT_XFREE86_TYPE1_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
+XFONT_FONT_XFREE86_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
 $(eval $(call AUTOTARGETS,package/x11r7,xfont_font-xfree86-type1))
 
-- 
1.6.3.3
