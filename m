From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 18 Dec 2019 18:33:22 +0100
Subject: [Buildroot] [git commit] package/rauc: add a WantedBy section to
 the systemd unit file
Message-ID: <20191218172934.A0178812A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=583cb5b6e6864a4daddee48d6ddbf0a04a265cfd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

upstream-provided service has no WantedBy, which means that rauc won't
be enabled by default

Add a WantedBy instead of manually creating the symlink so the user can
enable/disable the unit properly

Signed-off-by: J??r??my Rosen <jeremy.rosen@smile.fr>
[yann.morin.1998 at free.fr:
  - split long line
  - no need for continued line (no use for ';\' )
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/rauc/rauc.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index f3434e9c9a..5a208e07ae 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -31,9 +31,9 @@ RAUC_DEPENDENCIES += systemd
 endif
 
 define RAUC_INSTALL_INIT_SYSTEMD
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf ../../../../lib/systemd/system/rauc.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/rauc.service
+	mkdir $(TARGET_DIR)/usr/lib/systemd/system/rauc.service.d
+	printf '[Install]\nWantedBy=multi-user.target\n' \
+		>$(TARGET_DIR)/usr/lib/systemd/system/rauc.service.d/buildroot-enable.conf
 endef
 
 HOST_RAUC_DEPENDENCIES = \
