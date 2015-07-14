From: =?UTF-8?Q?Aur=c3=a9lien_Chabot?= <aurelien.chabot@gmail.com>
Date: Tue, 14 Jul 2015 02:51:14 +0200
Subject: [Buildroot] [PATCH 2/2] at: add systemd support
In-Reply-To: <f3aa3efc49568ce60fa774f02c3f031ccbf40da2.1432332802.git.alex.suykov@gmail.com>
Message-ID: <55A45D02.2030001@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Aur?lien Chabot <aurelien@chabot.fr>
---
  package/at/at.mk | 12 ++++++++++++
  1 file changed, 12 insertions(+)

diff --git a/package/at/at.mk b/package/at/at.mk
index 8865360..e0ea3a4 100644
--- a/package/at/at.mk
+++ b/package/at/at.mk
@@ -21,8 +21,20 @@ AT_CONF_OPTS = \
  	--with-daemon_groupname=root \
  	SENDMAIL=/usr/sbin/sendmail
  +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+AT_CONF_OPTS += --with-systemdsystemunitdir=/usr/lib/systemd/system
+else
+AT_CONF_OPTS += --with-systemdsystemunitdir=no
+endif
+
  define AT_INSTALL_INIT_SYSV
  	$(INSTALL) -m 0755 -D package/at/S99at $(TARGET_DIR)/etc/init.d/S99at
  endef
  +define AT_INSTALL_INIT_SYSTEMD
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../../../../usr/lib/systemd/system/atd.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/atd.service
+endef
+
  $(eval $(autotools-package))
-- 
2.4.5
