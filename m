From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 18 Dec 2019 18:33:22 +0100
Subject: [Buildroot] [git commit] package/linuxptp adapt to systemctl
 preset-all
Message-ID: <20191218172934.787C0812A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c561bcbf5f752d258dc08ec8e3d8160f894d592a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

linuxptp has two services
* linuxptp.service : the actual daemon
* linuxptp-system-clock.service : sync the linux clock to the phc clock

The first was enabled, the second was not, we now enable both

The second has an incorrect (though harmless) WantedBy : there is an
explicit Wants= in linuxptp.service

Signed-off-by: J??r??my Rosen <jeremy.rosen@smile.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/linuxptp/linuxptp-system-clock.service | 1 -
 package/linuxptp/linuxptp.mk                   | 3 ---
 2 files changed, 4 deletions(-)

diff --git a/package/linuxptp/linuxptp-system-clock.service b/package/linuxptp/linuxptp-system-clock.service
index a4436a34a7..57beec4579 100644
--- a/package/linuxptp/linuxptp-system-clock.service
+++ b/package/linuxptp/linuxptp-system-clock.service
@@ -8,4 +8,3 @@ Restart=always
 
 [Install]
 WantedBy=multi-user.target
-WantedBy=linuxptp.service
diff --git a/package/linuxptp/linuxptp.mk b/package/linuxptp/linuxptp.mk
index c304ff6d6e..97e4af7be7 100644
--- a/package/linuxptp/linuxptp.mk
+++ b/package/linuxptp/linuxptp.mk
@@ -42,9 +42,6 @@ define LINUXPTP_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/usr/lib/systemd/system/linuxptp.service
 	$(INSTALL) -D -m 644 $(LINUXPTP_PKGDIR)/linuxptp-system-clock.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/linuxptp-system-clock.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf ../../../../usr/lib/systemd/system/linuxptp.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/linuxptp.service
 endef
 
 $(eval $(generic-package))
