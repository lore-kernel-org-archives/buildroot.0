From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>
Date: Sat,  7 Dec 2019 19:00:47 +0100
Subject: [Buildroot] [PATCH v3 11/13] package/syslog-ng: implement default
 using DefaultInstance
In-Reply-To: <20191207180049.3245578-1-jeremy.rosen@smile.fr>
References: <20191207180049.3245578-1-jeremy.rosen@smile.fr>
Message-ID: <20191207180049.3245578-12-jeremy.rosen@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of using a manual symlink we use add a DefaultInstance= to the
config file

This is how upstream wants us to do it and allows systemctl preset to
correctly restore it if needed

Signed-off-by: J?r?my Rosen <jeremy.rosen@smile.fr>
---
 package/syslog-ng/syslog-ng.mk | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index fc44777d16..98b5a38deb 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -105,11 +105,8 @@ endef
 # By default syslog-ng installs a .service that requires a config file at
 # /etc/default, so provide one with the default values.
 define SYSLOG_NG_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -m 0644 -D package/syslog-ng/syslog-ng at default \
-		$(TARGET_DIR)/etc/default/syslog-ng at default
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -sf ../../../../usr/lib/systemd/system/syslog-ng at .service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/syslog-ng at default.service
+	mkdir $(TARGET_DIR)/usr/lib/systemd/system/syslog-ng at .service.d;\
+	printf '[Install]\nDefaultInstance=default\n' > $(TARGET_DIR)/usr/lib/systemd/system/syslog-ng at .service.d/buildroot-default-instance.conf;
 endef
 
 # By default syslog-ng installs a number of sample configuration
-- 
2.24.0
