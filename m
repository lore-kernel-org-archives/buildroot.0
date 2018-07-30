From: Laurent Hartanerot <laurent.hartanerot@gmail.com>
Date: Mon, 30 Jul 2018 12:24:16 +0200
Subject: [Buildroot] [PATCH v2 1/1] lighttpd: Add systemd tmpfile to fix
 lighttpd systemd boot
In-Reply-To: <20180727213514.19361-1-laurent.hartanerot@gmail.com>
References: <20180727213514.19361-1-laurent.hartanerot@gmail.com>
Message-ID: <20180730102416.20507-1-laurent.hartanerot@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Laurent Hartanerot <laurent.hartanerot@atos.net>

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
---
 package/lighttpd/lighttpd.mk            | 3 +++
 package/lighttpd/lighttpd_tmpfiles.conf | 2 ++
 2 files changed, 5 insertions(+)
 create mode 100644 package/lighttpd/lighttpd_tmpfiles.conf

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
index 0000000000..41a248b900
--- /dev/null
+++ b/package/lighttpd/lighttpd_tmpfiles.conf
@@ -0,0 +1,2 @@
+f /var/log/lighttpd-access.log 0640 www-data www-data -
+f /var/log/lighttpd-error.log 0640 www-data www-data -
\ No newline at end of file
--
2.11.0
