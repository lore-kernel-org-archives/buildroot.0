From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 11 Jul 2013 15:09:33 +0200
Subject: [Buildroot] [git commit] minidlna: fix linking with libintl if
	present
Message-ID: <20130711131228.370129A29F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2b10ef9f09220b6cea3fb53acb3f61c66a58b6cb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/3b7/3b71243716dc193a11508a69265cdd0120bd13ed

There's unfortunately not any easy way of adding extra libraries to LIBS,
so we need to list them all here.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/minidlna/minidlna.mk |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
index 1dd65fa..10e3b33 100644
--- a/package/minidlna/minidlna.mk
+++ b/package/minidlna/minidlna.mk
@@ -19,12 +19,18 @@ MINIDLNA_CFLAGS=$(TARGET_CFLAGS) \
 	-I"$(STAGING_DIR)/usr/include/libavcodec" \
 	-I"$(STAGING_DIR)/usr/include/libavformat"
 
+ifeq ($(BR2_PACKAGE_GETTEXT),y)
+MINIDLNA_DEPENDENCIES += gettext
+# we need to link with libintl
+MINIDLNA_MAKE_OPTS += LIBS='-lpthread -lexif -ljpeg -lsqlite3 -lavformat -lavutil -lavcodec -lid3tag -lFLAC -logg -lvorbis -lintl'
+endif
+
 define MINIDLNA_BUILD_CMDS
 	PREFIX=$(STAGING_DIR)/usr \
 		$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(MINIDLNA_CFLAGS)" -C $(@D) depend
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
-		CFLAGS="$(MINIDLNA_CFLAGS)" -C $(@D) all
+		CFLAGS="$(MINIDLNA_CFLAGS)" $(MINIDLNA_MAKE_OPTS) -C $(@D) all
 endef
 
 define MINIDLNA_INSTALL_TARGET_CMDS
