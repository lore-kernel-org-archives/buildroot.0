Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13A0EC48BC4
	for <buildroot@archiver.kernel.org>; Sat, 17 Feb 2024 18:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B91F960896;
	Sat, 17 Feb 2024 18:45:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9L8uKAkhbrc6; Sat, 17 Feb 2024 18:45:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C61A06089C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C61A06089C;
	Sat, 17 Feb 2024 18:45:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 258161BF3E0
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 18:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 109A6401B1
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 18:45:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yNKrHdSZ1mji for <buildroot@lists.busybox.net>;
 Sat, 17 Feb 2024 18:45:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 61F7E400C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61F7E400C7
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 61F7E400C7
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 18:45:36 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 8791C13F899;
 Sat, 17 Feb 2024 19:45:32 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 17 Feb 2024 19:45:20 +0100
Message-ID: <20240217184521.298639-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1708195533;
 bh=rUcdVgyWvSCIaCWr0zc9mc1mkbbNst8cTf2pgvT4Wec=;
 h=From:To:Cc:Subject:Date:From;
 b=Nk3y2W/zRjO2U1uDJ/IWhjDQggVn0OuKPnjiFY0KH+3x0X75z+AtIqwCstHj/W9lA
 tJdpplpjSCB6WzdNQD2vS3vVesSZYzMyyGm3fqnE9fi+uUqg52Oa+yYDLUCC13uJAG
 JIfl1LyGum66jNCddqx88iC2jJwqnVdpzZe8ESpASBsugnRcMHLODaB2sbs9f0Wjdq
 BchepZLUGOhLlWfy7wxi11h9n1roGeZT0QxmOEQJbF/jAf0NCsNfSdeFmu9DHeNeBD
 Th67Qk6RDOVCnKGhzwnJk2A7/cwhxEh337sczyEG0MNjOi2RhN0Lw2ulljDBEZnU0B
 ik0/l5V5EqV8Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Nk3y2W/z
Subject: [Buildroot] [PATCH 1/1] support/testing: add mariadb runtime test
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                    |   1 +
 support/testing/tests/package/test_mariadb.py | 195 ++++++++++++++++++
 2 files changed, 196 insertions(+)
 create mode 100644 support/testing/tests/package/test_mariadb.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 0d12c3abcb..cf6e4c51d4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1814,6 +1814,7 @@ F:	support/testing/tests/package/test_lzip.py
 F:	support/testing/tests/package/test_lsof.py
 F:	support/testing/tests/package/test_lz4.py
 F:	support/testing/tests/package/test_lzop.py
+F:	support/testing/tests/package/test_mariadb.py
 F:	support/testing/tests/package/test_mdadm.py
 F:	support/testing/tests/package/test_mdadm/
 F:	support/testing/tests/package/test_micropython.py
diff --git a/support/testing/tests/package/test_mariadb.py b/support/testing/tests/package/test_mariadb.py
new file mode 100644
index 0000000000..523f075db1
--- /dev/null
+++ b/support/testing/tests/package/test_mariadb.py
@@ -0,0 +1,195 @@
+import os
+
+import infra.basetest
+
+
+class TestMariaDB(infra.basetest.BRTest):
+    # We use a specific configuration for:
+    # - using Aarch64, to have more than 256MB memory,
+    # - to have an ext4 rootfs image exposed as a virtio storage
+    #   (rather than cpio initrd). This will save some memory, as the
+    #   rootfs image is big.
+    config = \
+        """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.78"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_PACKAGE_MYSQL=y
+        BR2_PACKAGE_MARIADB=y
+        BR2_PACKAGE_MARIADB_SERVER=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_4=y
+        BR2_TARGET_ROOTFS_EXT2_SIZE="512M"
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    # Configuration for the test
+    db_adminuser = "root"
+    db_admin = "mysql"
+    db_user = "br_user"
+    db_name = "br_database"
+    backup_file = "dump.sql"
+
+    def run_user_db_query(self, user, database, query, opts=None):
+        cmd = f"mariadb --user={user} --database={database}"
+        cmd += f' --execute="{query}"'
+        if opts is not None:
+            cmd += " " + opts
+        self.assertRunOk(cmd)
+
+    def run_admin_sql_query(self, query, opts=None):
+        self.run_user_db_query(self.db_adminuser, self.db_admin, query, opts)
+
+    def run_sql_query(self, query, opts=None):
+        self.run_user_db_query(self.db_user, self.db_name, query, opts)
+
+    def cleanup_database(self):
+        # This cleanup is useful when run-test -k is used. It makes
+        # this test idempotent. Since the drive storage is preserved
+        # between reboots, this cleanup will prevent errors during the
+        # user/db creation.
+
+        # Drop the test database, if it exists.
+        sql_query = f"DROP USER IF EXISTS {self.db_user}@localhost;"
+        self.run_admin_sql_query(sql_query)
+
+        # Drop the test user, if it exists.
+        sql_query = f"DROP DATABASE IF EXISTS {self.db_name};"
+        self.run_admin_sql_query(sql_query)
+
+    def create_tables(self):
+        sql_query = "CREATE TABLE fruits ("
+        sql_query += "id integer PRIMARY KEY, name varchar(16) NOT NULL);"
+        self.run_sql_query(sql_query)
+
+        sql_query = "CREATE TABLE colors ("
+        sql_query += "id integer PRIMARY KEY, name varchar(16) NOT NULL);"
+        self.run_sql_query(sql_query)
+
+        sql_query = "CREATE TABLE fruit_colors ("
+        sql_query += "fruit_id integer REFERENCES fruits(id), "
+        sql_query += "color_id integer REFERENCES colors(id), "
+        sql_query += "UNIQUE (fruit_id, color_id));"
+        self.run_sql_query(sql_query)
+
+    def insert_data(self):
+        fruits = ["Banana", "Blueberry", "Orange", "Raspberry"]
+        fruit_id = 1
+        for fruit in fruits:
+            sql_query = "INSERT INTO fruits (id, name) "
+            sql_query += f"VALUES ({fruit_id}, '{fruit}');"
+            self.run_sql_query(sql_query)
+            fruit_id += 1
+
+        colors = ["Blue", "Orange", "Red", "Yellow"]
+        color_id = 1
+        for color in colors:
+            sql_query = "INSERT INTO colors (id, name) "
+            sql_query += f"VALUES ({color_id}, '{color}');"
+            self.run_sql_query(sql_query)
+            color_id += 1
+
+        fruit_colors = [(1, 4), (2, 1), (3, 2), (4, 3)]
+        for fruit_color in fruit_colors:
+            fruit_id, color_id = fruit_color
+            sql_query = "INSERT INTO fruit_colors (fruit_id, color_id) "
+            sql_query += f"VALUES ({fruit_id}, {color_id});"
+            self.run_sql_query(sql_query)
+
+    def query_database(self):
+        sql_query = "SELECT "
+        sql_query += "fruits.name AS fruit, colors.name AS color "
+        sql_query += "FROM fruits, colors, fruit_colors "
+        sql_query += "WHERE fruits.id = fruit_colors.fruit_id "
+        sql_query += "AND colors.id = fruit_colors.color_id "
+        sql_query += "ORDER BY fruit;"
+        self.run_sql_query(sql_query)
+
+    def test_run(self):
+        drive = os.path.join(self.builddir, "images", "rootfs.ext4")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["root=/dev/vda console=ttyAMA0"],
+                           options=["-M", "virt",
+                                    "-cpu", "cortex-a57",
+                                    "-m", "2G",
+                                    "-smp", "2",
+                                    "-drive", f"file={drive},if=virtio,format=raw"])
+        self.emulator.login()
+
+        # Check the server binary can execute.
+        self.assertRunOk("mariadbd --version")
+
+        # Check the client binary can execute.
+        self.assertRunOk("mariadb --version")
+
+        # Check the server is ready.
+        self.assertRunOk("mariadb-admin ping")
+
+        # Query the server version from the client.
+        sql_query = "SELECT version();"
+        self.run_admin_sql_query(sql_query, opts="-N -s")
+
+        self.cleanup_database()
+
+        # Create a new user.
+        sql_query = f"CREATE USER {self.db_user}@localhost;"
+        self.run_admin_sql_query(sql_query)
+
+        # Create a new database.
+        sql_query = f"CREATE DATABASE {self.db_name}"
+        sql_query += " COMMENT = 'Test Database for Buildroot Test';"
+        self.run_admin_sql_query(sql_query)
+
+        # Grant all permission on this new database to our test user.
+        sql_query = "GRANT ALL PRIVILEGES"
+        sql_query += f" ON {self.db_name}.*"
+        sql_query += f" TO {self.db_user}@localhost;"
+        self.run_admin_sql_query(sql_query)
+
+        self.create_tables()
+
+        self.insert_data()
+
+        self.query_database()
+
+        # Update a table.
+        sql_query = "UPDATE fruits SET name = 'Lemon' WHERE id = 1;"
+        self.run_sql_query(sql_query)
+
+        # Backup the test database.
+        cmd = f"mariadb-dump --user={self.db_user}"
+        cmd += f" {self.db_name} > {self.backup_file}"
+        self.assertRunOk(cmd)
+
+        # Drop all the tables.
+        sql_query = "DROP TABLE fruit_colors, fruits, colors;"
+        self.run_sql_query(sql_query)
+
+        # Query the server status.
+        self.assertRunOk("mariadb-admin status")
+
+        # Stop the server.
+        self.assertRunOk("/etc/init.d/S97mysqld stop")
+
+        # Check the server is stopped.
+        _, exit_code = self.emulator.run("mariadb-admin ping")
+        self.assertNotEqual(exit_code, 0)
+
+        # Restart the server.
+        self.assertRunOk("/etc/init.d/S97mysqld start")
+
+        # Restore the backup.
+        cmd = f"mariadb --user={self.db_user} --database={self.db_name}"
+        cmd += f" < {self.backup_file}"
+        self.assertRunOk(cmd)
+
+        # Query one last time our data, to check the backup
+        # restoration succeeded.
+        self.query_database()
-- 
2.43.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
