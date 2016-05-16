From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 16 May 2016 13:52:30 +0200
Subject: [Buildroot] [PATCH] package/samba4: create tempfile with systemd
Message-ID: <1463399550-4040-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With systemd, samba4 will need some special temporary files to be
created on each boot, as explained in:
    packaging/systemd/README

Install the provided template file as configuration.

However, this is not enough, as even the log directory is a tmpfs in
the default Buildroot configuration, so we must also create the log
directory on each boot. Hence we append this to the template installed
above.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/samba4/samba4.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 9ccc6a7..c097068 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -165,6 +165,9 @@ define SAMBA4_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/smb.service
 	ln -sf ../../../../usr/lib/systemd/system/winbind.service \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/winbind.service
+	$(INSTALL) -D -m 644 $(@D)/packaging/systemd/samba.conf.tmp \
+		$(TARGET_DIR)/etc/tmpfiles.d/samba.conf
+	printf "d /var/log/samba  755 root root\n" >>$(TARGET_DIR)/etc/tmpfiles.d/samba.conf
 endef
 
 $(eval $(generic-package))
-- 
2.7.4
