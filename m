From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Aug 2016 15:52:13 +0200
Subject: [Buildroot] [git commit] libiio: do not install systemd service
	file, no longer available
Message-ID: <20160828135224.4F9648212B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=83ca53ba30ba7ba291f12ea69447de7209aa2258
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the bump to libiio 0.7, the systemd service file that used to be
in debian/iiod.service no longer exists. The entire debian/ directory
has been removed from the upstream project:

  https://github.com/analogdevicesinc/libiio/commit/5d49f58982b0c15545bc70724304fbc580e6523c

Due to this, the installation of this service file fails, and causes
build failures. To address this, we simply remove the installation of
the systemd service file.

Fixes:

  http://autobuild.buildroot.net/results/ce2fc81466abd9619aa104c96234d1455de3480d/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libiio/libiio.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/libiio/libiio.mk b/package/libiio/libiio.mk
index 3cbfdd6..e8fb6b2 100644
--- a/package/libiio/libiio.mk
+++ b/package/libiio/libiio.mk
@@ -79,13 +79,6 @@ define LIBIIO_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/libiio/S99iiod \
 		$(TARGET_DIR)/etc/init.d/S99iiod
 endef
-define LIBIIO_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -d $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	$(INSTALL) -D -m 0644 $(@D)/debian/iiod.service \
-		$(TARGET_DIR)/usr/lib/systemd/system/iiod.service
-	ln -fs ../../../../usr/lib/systemd/system/iiod.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/iiod.service
-endef
 endif
 
 $(eval $(cmake-package))
