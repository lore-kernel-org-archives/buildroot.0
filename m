From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 18 Dec 2019 18:33:22 +0100
Subject: [Buildroot] [git commit] package/syslog-ng: implement systemd
 enablement using DefaultInstance
Message-ID: <20191218172934.937508806D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=54ea03ccd7d68bcf846a7cb8fa58b9fb3ac0b914
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of using a manual symlink we use add a DefaultInstance= to the
config file

This is how upstream wants us to do it and allows systemctl preset to
correctly restore it if needed

Signed-off-by: J??r??my Rosen <jeremy.rosen@smile.fr>
[yann.morin.1998 at free.fr:
  - split long line
  - no need for continued line (no use for ';\' )
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/syslog-ng/syslog-ng.mk | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index fc44777d16..68260172a2 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -105,11 +105,9 @@ endef
 # By default syslog-ng installs a .service that requires a config file at
 # /etc/default, so provide one with the default values.
 define SYSLOG_NG_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -m 0644 -D package/syslog-ng/syslog-ng at default \
-		$(TARGET_DIR)/etc/default/syslog-ng at default
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf ../../../../usr/lib/systemd/system/syslog-ng at .service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/syslog-ng at default.service
+	mkdir $(TARGET_DIR)/usr/lib/systemd/system/syslog-ng at .service.d
+	printf '[Install]\nDefaultInstance=default\n' \
+		>$(TARGET_DIR)/usr/lib/systemd/system/syslog-ng at .service.d/buildroot-default-instance.conf
 endef
 
 # By default syslog-ng installs a number of sample configuration
