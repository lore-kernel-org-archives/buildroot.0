From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Jan 2021 20:52:36 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/openvpn: use make
 install instead of custom install step
Message-ID: <20210105194053.C1A9286528@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eb4ce04c19246fe17ec4c1c7723b6d98f7c9ff17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Commit 7105e65cd6b8f857bab54e4c0a8c57da776b0564 ("package/openvpn:
adds target install of systemd unit files") added the installation of
systemd unit files. But in fact, they can be installed by openvpn's
build system. It was simply not working due to the custom install step
implemented in openvpn.mk.

So instead, let's have the autotools-package infra call "make
install", which properly installs everything that's needed for
openvpn, including systemd units, but also plugins, etc.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 30bc58d3766b240017120a25d843da0a2c5cf501)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openvpn/openvpn.mk | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 45acf335e3..d3d174686c 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -58,21 +58,9 @@ else
 OPENVPN_CONF_OPTS += --disable-systemd
 endif
 
-define OPENVPN_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 755 $(@D)/src/openvpn/openvpn \
-		$(TARGET_DIR)/usr/sbin/openvpn
-endef
-
 define OPENVPN_INSTALL_INIT_SYSV
 	$(INSTALL) -m 755 -D package/openvpn/S60openvpn \
 		$(TARGET_DIR)/etc/init.d/S60openvpn
 endef
 
-define OPENVPN_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 0644 $(@D)/distro/systemd/openvpn-client at .service \
-		$(TARGET_DIR)/usr/lib/systemd/system/openvpn-client at .service
-	$(INSTALL) -D -m 0644 $(@D)/distro/systemd/openvpn-server at .service \
-		$(TARGET_DIR)/usr/lib/systemd/system/openvpn-server at .service
-endef
-
 $(eval $(autotools-package))
