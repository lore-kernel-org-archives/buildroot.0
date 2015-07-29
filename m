From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 29 Jul 2015 23:04:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/minidlna: More fixes to static
	compile
Message-ID: <1438203871-8548-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libz is needed by libid3tag, fixes
http://autobuild.buildroot.net/results/85e/85e53f2b30f107f486be08549ce6df08953ea499/

libm is needed by libexif, changes

checking for exif_data_new_from_file in -lexif... no
checking for exif_data_new_from_file in -lexif... no

from the forementioned autobuilder config.log to

checking for exif_data_new_from_file in -lexif... yes

The pkgconfig file of libvorbis is called vorbis.pc, fix wrong naming. Also
we need to link against libsqlite3, so add that lib to the pkgconf call.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/minidlna/minidlna.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
index ab93484..2f75993 100644
--- a/package/minidlna/minidlna.mk
+++ b/package/minidlna/minidlna.mk
@@ -17,9 +17,9 @@ MINIDLNA_DEPENDENCIES = \
 ifeq ($(BR2_STATIC_LIBS),y)
 # the configure script / Makefile forgets to link with some of the dependent
 # libraries breaking static linking, so help it along
-MINIDLNA_STATIC_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs libavcodec libexif libvorbis`
+MINIDLNA_STATIC_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs libavcodec libexif vorbis sqlite3`
 MINIDLNA_STATIC_LIBS += $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),-lintl)
-MINIDLNA_CONF_ENV += LIBS="$(MINIDLNA_STATIC_LIBS)"
+MINIDLNA_CONF_ENV += LIBS="$(MINIDLNA_STATIC_LIBS) -lm -lz"
 else
 MINIDLNA_CONF_OPTS = \
 	--disable-static
-- 
2.1.4
