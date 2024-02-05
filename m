Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8349DC48260
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 22:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4028F414C0;
	Mon,  5 Feb 2024 22:41:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4028F414C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zJl1jPcN1UiF; Mon,  5 Feb 2024 22:41:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E51C4161B;
	Mon,  5 Feb 2024 22:41:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E51C4161B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 16A051BF319
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 22:41:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3C8640589
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 22:41:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3C8640589
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6fU0a5Q76ZqG for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 22:41:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7FAF640550
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 22:41:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7FAF640550
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 696E386E92; Mon,  5 Feb 2024 22:41:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 23:38:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e03513c773a4b58b87abbe906d9ca29b0c50ae5c
X-Git-Newrev: b63c21379491461b5a910a171dcd7f4a6c06e9a4
X-Patchwork-Hint: ignore
Message-Id: <20240205224101.696E386E92@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: new sqlite runtime test
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b63c21379491461b5a910a171dcd7f4a6c06e9a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                   |   1 +
 support/testing/tests/package/test_sqlite.py | 101 +++++++++++++++++++++++++++
 2 files changed, 102 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 5467e465d6..2d3d2cdda8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1826,6 +1826,7 @@ F:	support/testing/tests/package/test_rdma_core.py
 F:	support/testing/tests/package/test_rdma_core/
 F:	support/testing/tests/package/test_screen.py
 F:	support/testing/tests/package/test_sed.py
+F:	support/testing/tests/package/test_sqlite.py
 F:	support/testing/tests/package/test_strace.py
 F:	support/testing/tests/package/test_stress_ng.py
 F:	support/testing/tests/package/test_tcl.py
diff --git a/support/testing/tests/package/test_sqlite.py b/support/testing/tests/package/test_sqlite.py
new file mode 100644
index 0000000000..215703d7f2
--- /dev/null
+++ b/support/testing/tests/package/test_sqlite.py
@@ -0,0 +1,101 @@
+import os
+
+import infra.basetest
+
+
+class TestSQLite(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_SQLITE=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    db_file = "buildroot.db"
+    db_backup = "db_dump.sql"
+
+    def run_sql_query(self, query):
+        cmd = f'sqlite3 "{self.db_file}" "{query}"'
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
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        # The sqlite3 binary can execute.
+        self.assertRunOk("sqlite3 --version")
+
+        self.create_tables()
+        self.insert_data()
+        self.query_database()
+
+        sql_query = "UPDATE fruits SET name = 'Lemon' WHERE id = 1;"
+        self.run_sql_query(sql_query)
+
+        # Dump the test database for a backup.
+        cmd = f'echo .dump | sqlite3 "{self.db_file}" > "{self.db_backup}"'
+        self.assertRunOk(cmd)
+
+        # Drop all the tables.
+        tables = ["fruit_colors", "fruits", "colors"]
+        for table in tables:
+            sql_query = f"DROP TABLE {table};"
+            self.run_sql_query(sql_query)
+
+        # Restore the backup.
+        cmd = f'sqlite3 "{self.db_file}" < "{self.db_backup}"'
+        self.assertRunOk(cmd)
+
+        # Query on last time our data, to check the backup restoration
+        # succeeded.
+        self.query_database()
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
