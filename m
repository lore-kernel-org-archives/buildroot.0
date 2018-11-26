From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 19:01:39 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/samba4: fix
 install of systemd files
Message-ID: <20181126175829.699E788867@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e718e4241fe59ddf65038c833e2a60b275bbdeea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Since version 4.8.0 and
https://github.com/samba-team/samba/commit/080d590de1ff9f8ebc55aeffaea8d41991466549,
the systemd files (nmd.service, ...) are not available in packaging/systemd

Indeed, they are built in bin/default/packaging/systemd

So use the new --systemd-install-services configure option to install
these files

Fixes:
 - http://autobuild.buildroot.org/results/a09a065c523931c1892e81a99c57521fbe095d8b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ea5280b889782e28b6bdf43e28b0e6a3a610f921)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/samba4.mk | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 03ef6eeeb0..83a02d54e6 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -150,13 +150,12 @@ define SAMBA4_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S91smb
 endef
 
+ifeq ($(BR2_INIT_SYSTEMD),y)
+SAMBA4_CONF_OPTS += --systemd-install-services
+SAMBA4_DEPENDENCIES += systemd
+endif
+
 define SAMBA4_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 644 $(@D)/packaging/systemd/nmb.service \
-		$(TARGET_DIR)/usr/lib/systemd/system/nmb.service
-	$(INSTALL) -D -m 644 $(@D)/packaging/systemd/smb.service \
-		$(TARGET_DIR)/usr/lib/systemd/system/smb.service
-	$(INSTALL) -D -m 644 $(@D)/packaging/systemd/winbind.service \
-		$(TARGET_DIR)/usr/lib/systemd/system/winbind.service
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
 	ln -sf ../../../../usr/lib/systemd/system/nmb.service \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/nmb.service
