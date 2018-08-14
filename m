From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Aug 2018 16:27:58 +0200
Subject: [Buildroot] [git commit] lighttpd: Add systemd tmpfile to fix
 lighttpd systemd boot
Message-ID: <20180814142137.1EAFE8D2C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7c2eb68cac14ea1281cfaca6ab81f63e72bc8016
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Problem starting lighttpd application with systemd.

/usr/sbin/lighttpd -D -f /etc/lighttpd/lighttpd.conf
2018-06-22 11:21:34: (server.c.733) opening errorlog '/var/log/lighttpd-error.log' failed: Permission denied
2018-06-22 11:21:34: (server.c.1420) Opening errorlog failed. Going down.

Lighttpd can not write the 'lighttpd-access.log' and 'lighttpd-error.log' files
to the directory '/var/log/'.

When using systemd the directory '/var/log' does not allow the user www-data to
write.

To correct the problem, we add /usr/lib/tmpfiles.d/lighttpd.conf.
This file create the 'lighttpd-access.log' and 'lighttpd-error.log' files  with
the permission

Signed-off-by: Laurent Hartanerot <laurent.hartanerot@atos.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lighttpd/lighttpd.mk            | 3 +++
 package/lighttpd/lighttpd_tmpfiles.conf | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index c565fed4ff..06561e9f55 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -96,6 +96,9 @@ define LIGHTTPD_INSTALL_INIT_SYSTEMD
 
 	ln -fs ../../../../usr/lib/systemd/system/lighttpd.service \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/lighttpd.service
+
+	$(INSTALL) -D -m 644 package/lighttpd/lighttpd_tmpfiles.conf \
+		$(TARGET_DIR)/usr/lib/tmpfiles.d/lighttpd.conf
 endef
 
 $(eval $(autotools-package))
diff --git a/package/lighttpd/lighttpd_tmpfiles.conf b/package/lighttpd/lighttpd_tmpfiles.conf
new file mode 100644
index 0000000000..a24f3f7fbf
--- /dev/null
+++ b/package/lighttpd/lighttpd_tmpfiles.conf
@@ -0,0 +1,2 @@
+f /var/log/lighttpd-access.log 0640 www-data www-data -
+f /var/log/lighttpd-error.log 0640 www-data www-data -
