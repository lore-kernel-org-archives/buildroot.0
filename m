From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:42 -0000
Subject: [Buildroot] [git commit branch/next] mysql: systemd support
Message-ID: <20150808105631.8C42E7FB5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=40f8062ad0f8be911ba067faf99e4081d0a5a05d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Service startup follows sysv initscript and includes db init.

[Thomas: use a relative symlink rather than an absolute symlink.]

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mysql/mysql.mk       |    8 ++++++++
 package/mysql/mysqld.service |   10 ++++++++++
 2 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/package/mysql/mysql.mk b/package/mysql/mysql.mk
index 8718193..c6d9f3a 100644
--- a/package/mysql/mysql.mk
+++ b/package/mysql/mysql.mk
@@ -103,6 +103,14 @@ define MYSQL_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S97mysqld
 endef
 
+define MYSQL_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/mysql/mysqld.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/mysqld.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../../../../usr/lib/systemd/system/mysqld.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/mysqld.service
+endef
+
 else
 MYSQL_CONF_OPTS += \
 	--without-server
diff --git a/package/mysql/mysqld.service b/package/mysql/mysqld.service
new file mode 100644
index 0000000..2ded9c2
--- /dev/null
+++ b/package/mysql/mysqld.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=MySQL database server
+
+[Service]
+ExecStartPre=/bin/sh -c 'test -d /var/mysql/mysql || mysql_install_db --user=mysql --ldata=/var/mysql'
+ExecStart=/usr/bin/mysqld_safe
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
