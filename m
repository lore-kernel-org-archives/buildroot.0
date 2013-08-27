From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 28 Aug 2013 00:16:25 +0200
Subject: [Buildroot] [git commit] minidlna: Fix automagic dependency to
	libiconv
Message-ID: <20130827221856.D9C3C9A870@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=86116e4f252d47fbbb71fb8d59591c2b87da3ba2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

minidlna will detect and use the libiconv library if
the package is selected. In that case, we need to link
against -liconv.

Fixes the following linking problem:

tagutils/tagutils.o: In function `do_iconv.constprop.6':
tagutils.c:(.text+0x4d5c): undefined reference to `libiconv_open'
tagutils.c:(.text+0x4da0): undefined reference to `libiconv'
tagutils.c:(.text+0x4e08): undefined reference to `libiconv_close'

[Peter: wrap COMMON_LIBS line]
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/minidlna/minidlna.mk |   13 ++++++++++++-
 1 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
index 10e3b33..077e257 100644
--- a/package/minidlna/minidlna.mk
+++ b/package/minidlna/minidlna.mk
@@ -19,12 +19,23 @@ MINIDLNA_CFLAGS=$(TARGET_CFLAGS) \
 	-I"$(STAGING_DIR)/usr/include/libavcodec" \
 	-I"$(STAGING_DIR)/usr/include/libavformat"
 
+MINIDLNA_COMMON_LIBS = \
+	-lpthread -lexif -ljpeg -lsqlite3 -lavformat -lavutil -lavcodec \
+	-lid3tag -lFLAC -logg -lvorbis
+
 ifeq ($(BR2_PACKAGE_GETTEXT),y)
 MINIDLNA_DEPENDENCIES += gettext
 # we need to link with libintl
-MINIDLNA_MAKE_OPTS += LIBS='-lpthread -lexif -ljpeg -lsqlite3 -lavformat -lavutil -lavcodec -lid3tag -lFLAC -logg -lvorbis -lintl'
+MINIDLNA_COMMON_LIBS += -lintl
+endif
+
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+MINIDLNA_DEPENDENCIES += libiconv
+MINIDLNA_COMMON_LIBS += -liconv
 endif
 
+MINIDLNA_MAKE_OPTS += LIBS='$(MINIDLNA_COMMON_LIBS)'
+
 define MINIDLNA_BUILD_CMDS
 	PREFIX=$(STAGING_DIR)/usr \
 		$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
