From: Alex Suykov <alex.suykov@gmail.com>
Date: Sat, 23 May 2015 13:15:18 +0300
Subject: [Buildroot] [PATCH 38/38] mysql: systemd support
In-Reply-To: <cover.1432332802.git.alex.suykov@gmail.com>
References: <cover.1432332802.git.alex.suykov@gmail.com>
Message-ID: <796ccf072e7328c9837e4aca449012b62238e8e8.1432332802.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Service startup follows sysv initscript and includes db init.

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 package/mysql/mysql.mk       |  8 ++++++++
 package/mysql/mysqld.service | 10 ++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 package/mysql/mysqld.service

diff --git a/package/mysql/mysql.mk b/package/mysql/mysql.mk
index 8718193..55f62c2 100644
--- a/package/mysql/mysql.mk
+++ b/package/mysql/mysql.mk
@@ -103,6 +103,14 @@ define MYSQL_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S97mysqld
 endef
 
+define MYSQL_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/mysql/mysqld.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/mysqld.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf /usr/lib/systemd/system/mysqld.service \
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
-- 
2.0.3
