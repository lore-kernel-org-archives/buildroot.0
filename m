Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D64CA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 14:29:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6902960670;
	Sat, 10 Oct 2026 14:29:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HoepWT2Y2IXv; Sat, 10 Oct 2026 14:29:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 31DA860673
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791642566;
	b=NQT1FeZkuLlxlYwyLs5SRZPiqHOf/435UVsqZ7s56dMITk4gx7ZmTYi4haVZ+xijT1DA
	 Mytyr1IjNGcedninc9WDfCYW3ClaPtwQvH8necfXDnpIk9/ySBzOGibSLKnO+cLnlSZeY
	 VdLx20Dzssk1T9O4JNN6UZn4sV8pQNr6u2leEqdz2N3oLl5jUsQWzgHNZIuTPE6fjNeWs
	 fTkL4jdoTAzjIvb12NMYO4FanRotlOW+K1Zcrs+jjFZej/ugyUkGjXR6WoGw+7k99z0Sd
	 5fxZRW5s4RTpOSMn3IBS15OPUDF0cN8dAo9gCTmvQnux5saqzBszao4C8GYLUeuCYDg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791642566;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=aJsG4RHZ4K1PwLjNFGnXJFXYTx5by7G2GTJhgaihKSE=;
	b=NBI/18/wilJja4rPBMp16d+QOWo5jMy5RL8iEAZnQWHEMynt3E6IZKpkXhulDUtYOX4p
	 1Si3SrCyZI2uykqWeudjQM8pZ0VfftoG8GHtJC2gxHdV1hvoEeUIr7YwC3z8Jxv0g2f/J
	 B5D3GK+xw/N1pOh45Aqyt1SuLN/RI7aU5RkZrir05eu8GUSOZagSw8SonRQCzrl9hvQdf
	 NOUsJ6cpb+Pa+iyF0dcnycvHhfCISawkqw77ubguTrQ8+m+MgVJovMpft6qXj4kkpdehc
	 0df3GwM00kCAcxPPHSvdZRkZ7gLi743DqMTqE9dG/D6bKQbvPcHAmW6sJJH61AyvWLQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791642566;
	bh=aJsG4RHZ4K1PwLjNFGnXJFXYTx5by7G2GTJhgaihKSE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VTkNtVF8nXzm3eElyNzzNKE+orJnAkGptuJnm0W/px8DndeDTIUyryVh+OIwDe56H
	 IMC6MSqonmscx+c/3XQUXM5byZAuGRmc+y8f9/PKtoMVgbnV7aRwgxMvqYOglrIjwH
	 ZBtCGaYvOfGAMvQ1XXKLWC95kN9DKI8WVF9FCnl1pGmjsI+gOlkII6dCTseb4OiTGD
	 DjMzgGWUtxB7TDoTzvioXhM3D2nKFzmrp1ITYZXp0NagiQGLVEFLKOiXmB/pAnwAkY
	 9lYNF/+LoQdAH+OQh36tDR3j+M0ACLxWANC0oDcqe4gDrQ/IsyGU+mMa4Rrjw8sLPy
	 tO6xzp85KQ1hg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31DA860673;
	Sat, 10 Oct 2026 14:29:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 79553317
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 14:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E79E81215
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 14:29:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7zPFpbmSSozJ for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 14:29:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C4E7681212
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791642558;
 b=LQIxdBbuSxbB3XOvjC8XeAYGQ3viQDhfUM2kB/5sTdRkH2jnplfeHZ+zDRjcIlpP+fvQ
 zy4twXwcPCaNsIC1ahOfNrjTDyICmkv4R0sBFhdfUbIJetl8m6v8U+7zThhRrpwMUjM+o
 /jgSmXpUJAEjcRUSCUCnH3Tevfl1TtTtyW8ZoJSoOMH/hXnnp8wa00ugTwdzEGoGEaECW
 5rJQkATsSDWZbFfQ8cwyUioBFMpbaIPKVEZ8IRKCnOaPJjEmLQXGZhmsjwPNs6ya2Y6Gu
 NwofLVYT9Y4TKV0J9b+SXxwON1+ZM6geqPYC+gwQp/LvM7KbUCAkE3YxBQgJSz1aQ9g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791642558;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=gxUQKAuwq3xgg9DbAMfVJxSOjUIzr8b1M65/9Ga3Xpk=;
 b=Edvkfc6WZq8eay2bKX07jDGMKFY0/+YopenylV6rCHYtA3rQ+ehWg7RXwQURGHewY48y
 /5pl3EFcLlLhiPruyn/4Z7xdjuTJfAWsCYcPo0WjsvPo+xPpfoE3kKRpWKaLAbr2oW4P/
 L/nyuUzO9YuJvvR5IFOCPWXJIPpQGGDRdlIkmqlE5R/CtS5vLNlEeJk4Pk3GWrpyIxIXc
 /Vx7VV7sY40jYmIWDZfBpgKNFuJ3nWdxjspef7FfzNjsCl/9VS9UkrrloK4deBfnvDTuh
 JIHkJLF0S2MhjO85LPA/DS/t4oOU1fSWYbBq/v+zMvHTlwxLb6Uk/YNIdqQfvjfI0gg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4E7681212
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 14:29:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 839D69205D; Sat, 10 Oct 2026 14:28:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 16:28:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d6f816facc4371a0bc4ae351e90584e585258864
X-Git-Newrev: 93c6c91955de390f435de6e484b0b06f46e97128
X-Patchwork-Hint: ignore
Message-Id: <20261010142800.839D69205D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: sqlitecpp: new runtime
 test
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/93c6c91955de390f435de6e484b0b06f46e97128
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

build and run an SQLiteCpp example to check database writes and queries.

Assisted-by: GitHub Copilot:GPT-6 Sol
Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
index dca5ecc5c0..26e0d66a26 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2466,6 +2466,8 @@ F:	package/protobuf/
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
