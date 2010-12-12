From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 13 Dec 2010 00:42:03 +0100
Subject: [Buildroot] [git commit master 1/1] bzip2: ensure target
	directories exist before copying into
Message-ID: <20101212234311.A59508E0D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=dd15877acef78b36b6bc84467167ae86da577380
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also simply installation rules a little

[Peter: leave in busybox install fix]
Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                |    2 +-
 package/bzip2/bzip2.mk |    4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index ac5b8cf..1179ac5 100644
--- a/CHANGES
+++ b/CHANGES
@@ -3,7 +3,7 @@
 	Ccache support reworked. Now used for both host and target
 	compilation, and cache is stored in ~/.buildroot-ccache.
 
-	Updated/fixed packages: at, busybox, dbus, cloop, cups,
+	Updated/fixed packages: at, busybox, bzip2, dbus, cloop, cups,
 	gdk-pixbuf, hostapd, i2c-tools, libconfig, m4, openssh,
 	openssl, pango, qt, rsync, sdl_gfx, sdl_sound, udev, usbutils,
 	xz, zlib
diff --git a/package/bzip2/bzip2.mk b/package/bzip2/bzip2.mk
index 3f341ee..123e579 100644
--- a/package/bzip2/bzip2.mk
+++ b/package/bzip2/bzip2.mk
@@ -39,7 +39,9 @@ define BZIP2_BUILD_CMDS
 endef
 
 define BZIP2_INSTALL_STAGING_CMDS
-	cp $(@D)/bzlib.h $(STAGING_DIR)/usr/include/
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
+	$(MAKE) PREFIX=$(STAGING_DIR)/usr -C $(@D) install
+	$(INSTALL) -m 0755 -d $(STAGING_DIR)/usr/lib
 	cp $(@D)/libbz2.so.$(BZIP2_SONAME) $(STAGING_DIR)/usr/lib/
 	cp $(@D)/libbz2.a $(STAGING_DIR)/usr/lib/
 	(cd $(STAGING_DIR)/usr/lib/; \
-- 
1.7.2.2
