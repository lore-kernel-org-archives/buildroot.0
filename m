Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F887C47077
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 22:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C600D83F14;
	Thu, 11 Jan 2024 22:40:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C600D83F14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R6kHjbluwObF; Thu, 11 Jan 2024 22:40:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D29AD83F1D;
	Thu, 11 Jan 2024 22:40:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D29AD83F1D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A76D91BF34A
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 22:40:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8BEAA40273
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 22:40:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BEAA40273
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id udrdJY2vya4v for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 22:40:13 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2E7FF400FD
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 22:40:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E7FF400FD
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id D87A413F8B8;
 Thu, 11 Jan 2024 23:40:09 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 11 Jan 2024 23:40:03 +0100
Message-ID: <20240111224003.243443-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705012811;
 bh=4ognF9SAvCHi8OpfT/OCc1Lj41C3tuRwNLiqFDolYrE=;
 h=From:To:Cc:Subject:Date:From;
 b=IIRcTlze2kTykPVJi7rgCvVOxcHWvnIUymGkjNKWt1f5f2qktbfSowxPjR+oBJjkJ
 MXdMfOWcbpHaJXb78/Zjb7YNRE7FJNIBFnNfKm3LjQ6pqxz2oqpYjGkQACfxcvJ2nF
 WOjMvu1uQlcHJSdO74PrORgvRaQivOhWuoy2akILz1LlJrdpPFbvhZSJCO9W62/wKx
 ruRs23lKq5wIHFPcyAyPFnx3wi9ZiprEj0DZdynqBz3P0sxJe4OiBDOCnUOUrLHGz5
 ZucwSRcLm+3gN0RuKak2p9cpgAeaL7GEra72J9SjE6DIoeukHa4UcbB9+jTogUpafE
 hdGjxcltDi0ZA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IIRcTlze
Subject: [Buildroot] [PATCH 1/1] support/testing: add a postgresql runtime
 test
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
Since commit 2a8065e "package/postgresql: bump version to 16.1", the
postgresql service fail to start at runtime with an error:

    FATAL:  could not load library "/usr/lib/postgresql/dict_snowball.so": /usr/lib/postgresql/dict_snowball.so: undefined symbol: CurrentMemoryContext

See: https://www.postgresql.org/message-id/flat/1266022.1701958693%40sss.pgh.pa.us

This runtime test works with postgresql 15.5, when this commit is
reverted.

Patch tested on branch master at commit 66414ed with commands:

    make check-package
    ...
    0 warnings generated

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_postgresql
    ...
    OK
---
 DEVELOPERS                                    |   1 +
 .../testing/tests/package/test_postgresql.py  | 197 ++++++++++++++++++
 2 files changed, 198 insertions(+)
 create mode 100644 support/testing/tests/package/test_postgresql.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 94a89c63d5..e5d3e1f094 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1799,6 +1799,7 @@ F:	support/testing/tests/package/test_ola/
 F:	support/testing/tests/package/test_openblas.py
 F:	support/testing/tests/package/test_perftest.py
 F:	support/testing/tests/package/test_pigz.py
+F:	support/testing/tests/package/test_postgresql.py
 F:	support/testing/tests/package/test_python_distro.py
 F:	support/testing/tests/package/test_python_gnupg.py
 F:	support/testing/tests/package/test_python_hkdf.py
diff --git a/support/testing/tests/package/test_postgresql.py b/support/testing/tests/package/test_postgresql.py
new file mode 100644
index 0000000000..bd41fc3f1b
--- /dev/null
+++ b/support/testing/tests/package/test_postgresql.py
@@ -0,0 +1,197 @@
+import os
+
+import infra.basetest
+
+
+class TestPostgreSQL(infra.basetest.BRTest):
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
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.72"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_PACKAGE_POSTGRESQL=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_4=y
+        BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def __init__(self, names):
+        super(TestPostgreSQL, self).__init__(names)
+        self.db_admin = "postgres"
+        self.db_user = "br_user"
+        self.db_name = "br_database"
+        self.backup_file = "dump.sql"
+        self.pgdata_dir = "/var/lib/pgsql"
+
+    def run_user_db_query(self, user, database, query, opts=None):
+        cmd = f"psql --username={user} --dbname={database}"
+        cmd += f' --command="{query}"'
+        if opts is not None:
+            cmd += " " + opts
+        self.assertRunOk(cmd)
+
+    def run_admin_sql_query(self, query, opts=None):
+        self.run_user_db_query(self.db_admin, self.db_admin, query, opts)
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
+        cmd = f"dropdb --username={self.db_admin} "
+        cmd += f"--if-exists {self.db_name}"
+        self.assertRunOk(cmd)
+
+        # Drop the test user, if it exists.
+        cmd = f"dropuser --username={self.db_admin} "
+        cmd += f"--if-exists {self.db_user}"
+        self.assertRunOk(cmd)
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
+                                    "-m", "512M",
+                                    "-smp", "2",
+                                    "-drive", f"file={drive},if=virtio,format=raw"])
+        self.emulator.login()
+
+        # Check the server binary can execute.
+        self.assertRunOk("postgres --version")
+
+        # Check the client binary can execute.
+        self.assertRunOk("psql --version")
+
+        # Check the server is ready.
+        self.assertRunOk("pg_isready")
+
+        # Query the server version from the client.
+        sql_query = "SELECT version();"
+        self.run_admin_sql_query(sql_query,
+                                 opts="--tuples-only --no-align")
+
+        self.cleanup_database()
+
+        # Create a new user.
+        cmd = f"createuser --username={self.db_admin} "
+        cmd += "--no-superuser --no-createdb --no-createrole "
+        cmd += self.db_user
+        self.assertRunOk(cmd)
+
+        # Create a new database.
+        cmd = f"createdb --username={self.db_admin} "
+        cmd += f"--owner={self.db_user} "
+        cmd += f'{self.db_name} "Test Database for Buildroot Test"'
+        self.assertRunOk(cmd)
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
+        cmd = f"pg_dump --username={self.db_user} --dbname={self.db_name} "
+        cmd += f"--file={self.backup_file} --inserts"
+        self.assertRunOk(cmd)
+
+        # Drop all the tables.
+        sql_query = "DROP TABLE fruit_colors, fruits, colors;"
+        self.run_sql_query(sql_query)
+
+        # Query the server status.
+        cmd = f"su - {self.db_admin} -c 'pg_ctl status -D {self.pgdata_dir}'"
+        self.assertRunOk(cmd)
+
+        # Stop the server.
+        cmd = f"su - {self.db_admin} -c 'pg_ctl stop -D {self.pgdata_dir}'"
+        self.assertRunOk(cmd)
+
+        # Check the server is no longer ready.
+        _, exit_code = self.emulator.run("pg_isready")
+        self.assertNotEqual(exit_code, 0)
+
+        # Restart the server.
+        cmd = f"su - {self.db_admin} -c 'pg_ctl start -D {self.pgdata_dir}'"
+        self.assertRunOk(cmd)
+
+        # Restore the backup.
+        cmd = f"psql --username={self.db_user} --dbname={self.db_name} "
+        cmd += f"--file={self.backup_file}"
+        self.assertRunOk(cmd)
+
+        # Query on last time our data, to check the backup restoration
+        # succeeded.
+        self.query_database()
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
