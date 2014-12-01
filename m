From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Dec 2014 00:27:15 +0100
Subject: [Buildroot] [git commit] stunnel: install configuration file
	unconditionally
Message-ID: <20141201233009.65ED380051@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c51ec898127767a28d366ab69a230dd382f361fc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As discussed, users should use a rootfs overlay or a post-build script
instead of a custom skeleton to override files installed by Buildroot,
so there is no point in having conditions when installing init scripts
or configuration files.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/stunnel/stunnel.mk |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index ac2963e..3d0596d 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -19,9 +19,8 @@ STUNNEL_CONF_OPTS += --disable-systemd
 endif
 
 define STUNNEL_INSTALL_CONF
-	[ -f $(TARGET_DIR)/etc/stunnel/stunnel.conf ] || \
-		$(INSTALL) -m 0644 -D $(@D)/tools/stunnel.conf \
-			$(TARGET_DIR)/etc/stunnel/stunnel.conf
+	$(INSTALL) -m 0644 -D $(@D)/tools/stunnel.conf \
+		$(TARGET_DIR)/etc/stunnel/stunnel.conf
 	rm -f $(TARGET_DIR)/etc/stunnel/stunnel.conf-sample
 endef
 
