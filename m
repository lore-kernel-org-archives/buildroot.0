Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C359BCCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:12:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74433612B1;
	Fri, 16 Oct 2026 13:12:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hvltg9jRt7Bk; Fri, 16 Oct 2026 13:12:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2CFC8612B3
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156373;
	b=lVHiY0QmKMZSmMXNVR4A/6l2hb7/lb+dkk97u/2Y8sXrEljqQ+V+dA+a/Aa1JcYDbh4X
	 mqVrxU17dZpGEPR/JfzPoMjU1H6LmwHAKW0JX3eImeTNkMMZqDUG0mFO+ignrTHc9FRDt
	 mIL9txC60OAIzlFkNOhEToFn0hqH1ogtBq3jB7M+IXmq5VQcKchkmsZDrxFpOXWzBlGTR
	 5ih4AZ3TqtJMh07ApCOD0QzpQi9A22LTtRMqzrDvdJwRAW8+av8kWeuKRbEy6dm/Fxpq8
	 poNAfSeicev6bTPXzo9IE/rYDuTfX3zWU84i103m7fzRJm45UNj5oQJOzvf47GT8k1A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156373;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=RdXYJqHcYbpz8zEjaAEo2zzLvfbMMhOoa3XCzLM6AEQ=;
	b=ODVFQqwq/d4iMFg5eAiEmYRnEAWH8v5HsCNZZtdCEs8JEreOwgUs/iucgMqlv3c1AOQt
	 j5H5ZLBF9DJxvpdQBPbVMRVooohDbxEjbYHMziiuGi+/c8lOjbT695da5YhKUOZ638+95
	 uXLt4exeV9XgDk1OV+ByzfO72bo/P10yKDKNN8wxLs56/bWGneokM6MUXhUuBGpu4jvvG
	 GfSsJ/2Q7TEPSeFYYXPVDGTc9OpApGWhvRCRgf76613LU4dMvxB7aJdmCZjSiwlCtGMV+
	 L0kk2SL1Oib5Bkv/iiJzJEolbgruHjl6TpdcsfnffUU8r73/76fdxPeBKkAQA4c0f7w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156373;
	bh=RdXYJqHcYbpz8zEjaAEo2zzLvfbMMhOoa3XCzLM6AEQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FsTf7egRWx3Bs1C6OUgXiAHEDbjhAQPAX9UwQG6miXaDWYs42uk9kuEoCJd9k6Jpt
	 2mO5b1aXGJgdfQro4joK6dwYJq6610EKL2XRV9+LdvATSNmSPYBJ75xSSmTqMlegUH
	 xVeYQ6oF5iyvHn1MNTROxgYmZRRFD5JIIHjE1YOTzm6bpDO5nWesK8ROJyAqbqBZXG
	 5Tb5qxxuxVx+m7j8UwaewSQFU4E4+opy1pyCT2CYbt7OQl/xNgYdbKw0U8nb+VRUEX
	 y/NhNWRWNwWfyORDIApbV1zRdNdUoW7IxqwR8EbVswN7os16njL/FJ0rtfLJDMXd8N
	 TZe2Exw8mX+aQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CFC8612B3;
	Fri, 16 Oct 2026 13:12:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 24D07920
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 167CF60F01
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B5hKIkkawrDm for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:09:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DA72760F2A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156191;
 b=ovcG2ZRYCZxozwwWp9q1qeiJI3X+z6aFKiF+5j6jIzhOwDxHpGhJlWxX7cd7/k8xcdh/
 4V3KeAADjLIfUx7esK01+7afR0lukWr7YxXI0ykfBbyAvDJVkYtU1wUPD6w3wYGkzrpBE
 APWNPAfv0bm8BwSZ2R8iFsvQXBCfVDriNb5h+aU8tEuOdxMsGE4P+tHKwd50uO2tSrQ+p
 l7G/QB6tGR9t+QV3HIf6pd1ZYkoTWTdYo4nWek+2ZTB4t8rFdbK/c+X96Xhn0AvEA0DyF
 ZWb1OHKJpsaGKwQ0980JGp5V/EVt4S7D1LZW1nTKJv3PkojSLD0a4w4+St1WWPozwtA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156191;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=boFEkKEHDso6ATboul6XHxhasBevQNIbbwV7PKbfqlU=;
 b=qywkcEeOjooKFQPuHMFkVLgBxPCVBkNrXscHDBsSInRtp11Yp/Z0iXjm4D6YpHAsBz8U
 nqMX2C/Xg0Ex5N2/LChwlXVI4qeoGFpLOeNJJtxPm4pqzRP6mURhE3J5NBhkIb1lSCz9G
 GRSS0EBvwx6SD5c+yZHTw+WPLk8shDxeF0SuZXk0hvFEaxY0SW6bljtFUstG1dOz3Cofr
 eZy9a4JkWLuvSGlE5XEjEHsUDKEFCCiKDeaUaRuq0kgnz36g2MQQuqMBW2luIUz9Zaxcs
 M3c/I4IMO0Pf3UYh3Wpr7bjHVBX/OugeiPX8eBQtxqRfNgtpg+dI/Tg8esAqC+/fDPQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA72760F2A
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CB186960D7; Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 14:11:39 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 95f448c51164bef07a1743c8cbd5a1ff65d0fe92
X-Git-Newrev: 9d96d396ec4db0ae4166d29bc081ba37a0d6e5fe
X-Patchwork-Hint: ignore
Message-Id: <20261016130830.CB186960D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] support/testing:
 sqlitecpp: new runtime test
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0589949769535999943=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0589949769535999943==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9d96d396ec4db0ae4166d29bc081ba37a0d6e5fe
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

build and run an SQLiteCpp example to check database writes and queries.

Assisted-by: GitHub Copilot:GPT-6 Sol
Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 93c6c91955de390f435de6e484b0b06f46e97128)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 DEVELOPERS                                         |  2 ++
 .../tests/package/br2-external/sqlitecpp/Config.in |  1 +
 .../package/br2-external/sqlitecpp/external.desc   |  1 +
 .../package/br2-external/sqlitecpp/external.mk     |  1 +
 .../sqlitecpp/package/sqlitecpp-test/Config.in     |  5 ++++
 .../package/sqlitecpp-test/sqlitecpp-test.cpp      | 27 ++++++++++++++++++++++
 .../package/sqlitecpp-test/sqlitecpp-test.mk       | 19 +++++++++++++++
 support/testing/tests/package/test_sqlitecpp.py    | 25 ++++++++++++++++++++
 8 files changed, 81 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c63c855997..baba0dc4bb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2459,6 +2459,8 @@ F:	package/protobuf/
 F:	package/sdbus-cpp/
 F:	package/spdlog/
 F:	package/sqlitecpp/
+F:	support/testing/tests/package/br2-external/sqlitecpp/
+F:	support/testing/tests/package/test_sqlitecpp.py
 
 N:	Michael Trimarchi <michael@amarulasolutions.com>
 F:	board/bsh/
diff --git a/support/testing/tests/package/br2-external/sqlitecpp/Config.in b/support/testing/tests/package/br2-external/sqlitecpp/Config.in
new file mode 100644
index 0000000000..040dfde871
--- /dev/null
+++ b/support/testing/tests/package/br2-external/sqlitecpp/Config.in
@@ -0,0 +1 @@
+source "$BR2_EXTERNAL_SQLITECPP_PATH/package/sqlitecpp-test/Config.in"
diff --git a/support/testing/tests/package/br2-external/sqlitecpp/external.desc b/support/testing/tests/package/br2-external/sqlitecpp/external.desc
new file mode 100644
index 0000000000..d11d7db86a
--- /dev/null
+++ b/support/testing/tests/package/br2-external/sqlitecpp/external.desc
@@ -0,0 +1 @@
+name: SQLITECPP
diff --git a/support/testing/tests/package/br2-external/sqlitecpp/external.mk b/support/testing/tests/package/br2-external/sqlitecpp/external.mk
new file mode 100644
index 0000000000..17ed34592b
--- /dev/null
+++ b/support/testing/tests/package/br2-external/sqlitecpp/external.mk
@@ -0,0 +1 @@
+include $(sort $(wildcard $(BR2_EXTERNAL_SQLITECPP_PATH)/package/*/*.mk))
diff --git a/support/testing/tests/package/br2-external/sqlitecpp/package/sqlitecpp-test/Config.in b/support/testing/tests/package/br2-external/sqlitecpp/package/sqlitecpp-test/Config.in
new file mode 100644
index 0000000000..c02db0a304
--- /dev/null
+++ b/support/testing/tests/package/br2-external/sqlitecpp/package/sqlitecpp-test/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_SQLITECPP_TEST
+	bool "sqlitecpp-test"
+	depends on BR2_PACKAGE_SQLITECPP
+	help
+	  Test program for the SQLiteCpp library.
diff --git a/support/testing/tests/package/br2-external/sqlitecpp/package/sqlitecpp-test/sqlitecpp-test.cpp b/support/testing/tests/package/br2-external/sqlitecpp/package/sqlitecpp-test/sqlitecpp-test.cpp
new file mode 100644
index 0000000000..c1f2b41dba
--- /dev/null
+++ b/support/testing/tests/package/br2-external/sqlitecpp/package/sqlitecpp-test/sqlitecpp-test.cpp
@@ -0,0 +1,27 @@
+#include <SQLiteCpp/SQLiteCpp.h>
+
+#include <iostream>
+#include <string>
+
+int main()
+{
+    SQLite::Database db(":memory:", SQLite::OPEN_READWRITE | SQLite::OPEN_CREATE);
+    db.exec("CREATE TABLE fruits (name TEXT, color TEXT)");
+
+    SQLite::Statement insert(db, "INSERT INTO fruits VALUES (?, ?)");
+    insert.bind(1, "Banana");
+    insert.bind(2, "Yellow");
+    insert.exec();
+
+    SQLite::Statement query(db, "SELECT name, color FROM fruits");
+    if (!query.executeStep()) {
+        return 1;
+    }
+    const std::string name = query.getColumn(0).getString();
+    const std::string color = query.getColumn(1).getString();
+    if (name != "Banana" || color != "Yellow" || query.executeStep()) {
+        return 1;
+    }
+    std::cout << name << ": " << color << std::endl;
+    return 0;
+}
diff --git a/support/testing/tests/package/br2-external/sqlitecpp/package/sqlitecpp-test/sqlitecpp-test.mk b/support/testing/tests/package/br2-external/sqlitecpp/package/sqlitecpp-test/sqlitecpp-test.mk
new file mode 100644
index 0000000000..a0ef906f92
--- /dev/null
+++ b/support/testing/tests/package/br2-external/sqlitecpp/package/sqlitecpp-test/sqlitecpp-test.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# sqlitecpp-test
+#
+################################################################################
+
+SQLITECPP_TEST_DEPENDENCIES = sqlitecpp
+
+define SQLITECPP_TEST_BUILD_CMDS
+	$(TARGET_CXX) $(TARGET_CXXFLAGS) -o $(@D)/sqlitecpp-test \
+		$(SQLITECPP_TEST_PKGDIR)/sqlitecpp-test.cpp \
+		$(TARGET_LDFLAGS) -lSQLiteCpp -lsqlite3
+endef
+
+define SQLITECPP_TEST_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/sqlitecpp-test $(TARGET_DIR)/usr/bin/sqlitecpp-test
+endef
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/package/test_sqlitecpp.py b/support/testing/tests/package/test_sqlitecpp.py
new file mode 100644
index 0000000000..59844d4628
--- /dev/null
+++ b/support/testing/tests/package/test_sqlitecpp.py
@@ -0,0 +1,25 @@
+import os
+
+import infra.basetest
+
+
+class TestSQLiteCpp(infra.basetest.BRTest):
+    br2_external = [infra.filepath("tests/package/br2-external/sqlitecpp")]
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_SQLITECPP=y
+        BR2_PACKAGE_SQLITECPP_TEST=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        output, exit_code = self.emulator.run("/usr/bin/sqlitecpp-test")
+        self.assertEqual(exit_code, 0, output)
+        self.assertIn("Banana: Yellow", output)

--===============0589949769535999943==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0589949769535999943==--
