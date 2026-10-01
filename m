Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A7BCA5FD2
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 12:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 042AB812FD;
	Thu,  1 Oct 2026 12:56:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YllMMTwCXnT8; Thu,  1 Oct 2026 12:56:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org F073B81316
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790859390;
	b=WHaHoiOnAkZTt/m8aeBqqopcf2YoqniqDwTCmafiZ+Sbbip0IvpSe23el++Lh5nMhu0n
	 pqwX4wV/sw2W/5tgPqP+QkGMmjafKAgfiyH8yaRQ4aCmDjLZUXFJrh3GhL/fui6vT0K2A
	 mSZAUX3cAV280s+wU/cLHJR3WXMkd/k3Eaxnk4/pils2oDr04x3+7stjHoqe03OQW0ywZ
	 34TrfrKIcO5SY+uZP7nugRYTV6LRXDPt4ORx8KhS9LCtS8kE368VN1By7tz/zKfzX7H47
	 x7jYhmdoYC6SLUSHckxG03jaCTzpddPlaF2D/SgM5qerrU21IrVmzO9aOx8zm9hUjHA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790859390;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Date:Message-ID:X-Mailer:MIME-Version:X-Last-TLS-Session-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=76I0QFB/FSW2+lDFaT3iu7vLaLClOz2uJBxwVDw6vKI=;
	b=IpPUNbxtBgFRgwK58+4n/JyHIkE9+u4uXbFS7WvwKG87hO+N0iX8cnUJ9bppunt0Juf8
	 wtYBdrWJeu9k/HVhH5SyunYryyYn/r1bnBR/rQXtGeuQf0hRU6Hg5CATuvLGOiXdEHmhH
	 fmi9UwJnsT0ay79dPQ2Ygy60HrrtHRlEbZl7y1To6txbKM4/PnYJYlpplnUNlRu+N8jTV
	 AXAgUmqRic4rnd9Jnvj0n1M4tpyqjfDTC3iw6n4N3+q0ytdcT7VcECysBJiPk+k0FUqDF
	 bzsVeaIGhhNjn9krELfegc3NNY2zcUEvdCdzhMRyjeLBPPMe3sFnHXyHIDoGdnrXWWw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790859390;
	bh=76I0QFB/FSW2+lDFaT3iu7vLaLClOz2uJBxwVDw6vKI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=P+7ecPLUFBciPRVqH4OPLvaiW6/go+DT5G6FPOY4YqT9HAPhAGXX3r7Ky9XJoLcYF
	 idy3HPgsGoOReqppXPvbmk1NIDBD1kzeA9RErYoLiddQWAUufE4xABpKFuI2klF28+
	 AkSFnmbhu9rgFyxXL5phDtqbpsrziYd4QjIx/hruI40tkERcwsRTaJYzmJ294klpUs
	 cR+NR/NzolsXLvnApuokimKj3FfWuBopAmsUUbxIek2Xyrfe2xyW/8CkSMRh7nJjaV
	 Ddk6xWIP5QZtocGQDAWtUKxwl7QW9+wZkqfsEq4NS8RunqZFosj/T6B4mUmJdczVec
	 e+hX8MylO0Ufw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F073B81316;
	Thu,  1 Oct 2026 12:56:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C41F5263
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 12:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C1B2940CC3
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 12:56:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hn8YVf7yc5EQ for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 12:56:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D335840BEC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790859386;
 b=A3NQefqQFaLdGi2Qz8R+RpEFlK1btWsO+Xl673M6Y8WDKi182BlhvH1I+HrECkhGMKcY
 2FrZAi6W5jjcnTC1rgp1lXXbFSQ47ACulZhK+H0t7v7y+i+s5XrIZeVXgX2Z1Btq7cWQ2
 V3bxNNYxz4dhBukFpWwXjfTsJgf0jJ+1Oogp4oZto3ENlfw2WqnEvvc/kB/5caaazIQpW
 GypJKSEFP4KSyjVT+WvwAqqIAOXdxhix423zt9Sh2aRn4mBpuvQdJOte+NizmNu6xbGKh
 Jqi2BTu0vT1q7td1/UYdu9dWeZMtzL+RNeG9uRtwCn1X14wosPw+Z0IqbRHf3TPI1lA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790859386;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Last-TLS-Session-Version;
 bh=XTBoDUOBI/WVZBWA1Itoir9mpc5h3jwYoGNStJGQMQE=;
 b=JsuljzhfYk/wXz1dCV3UVA3wUUolTPTxxX3MF/Dv+YaGXbBOElivYtSlYI+JTREUz1jp
 uafDWnxzfQhJLTEVMDlVlTssw5KZoErCJK3fWJC1wrREccM3J+OMTSULYM6PrtomWmW6F
 0+A+JYA9Mb90+mx0IO0jgmWMPI8wkN+ra20ijtukw76dN5JSPnNp6eTFlE39wfP8EmaT2
 MH4K9AC38F+riUZOfWF+Vip/e+LHGevbbO8JLiZKHH32BZqscHsIhKa2E1y5xyZIS2hmY
 4fq+xq/yC3o5q/Lf25Vyj4q2H7SfegtmRv1Sio2eCpSqpp7HIe/9h26bTGIqm9NrO8w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=heine.tech; 
 dkim=pass header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=WNPkfw5D; 
 arc=none smtp.remote-ip="2a01:4f8:1c0c:5073::1"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D335840BEC
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 12:56:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E08801814BC; Thu, 01 Oct 2026 14:56:21 +0200 (CEST)
To: buildroot@buildroot.org
Date: Thu,  1 Oct 2026 14:56:03 +0200
Message-ID: <20261001125613.2347873-1-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 1/4] support/testing: sqlitecpp: new runtime test
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

build and run an SQLiteCpp example to check database writes and queries.

Assisted-by: GitHub Copilot:GPT-6 Sol
Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 DEVELOPERS                                    |  1 +
 .../package/br2-external/sqlitecpp/Config.in  |  1 +
 .../br2-external/sqlitecpp/external.desc      |  1 +
 .../br2-external/sqlitecpp/external.mk        |  1 +
 .../package/sqlitecpp-test/Config.in          |  5 ++++
 .../package/sqlitecpp-test/sqlitecpp-test.cpp | 27 +++++++++++++++++++
 .../package/sqlitecpp-test/sqlitecpp-test.mk  | 19 +++++++++++++
 .../testing/tests/package/test_sqlitecpp.py   | 25 +++++++++++++++++
 8 files changed, 80 insertions(+)
 create mode 100644 support/testing/tests/package/br2-external/sqlitecpp/Config.in
 create mode 100644 support/testing/tests/package/br2-external/sqlitecpp/external.desc
 create mode 100644 support/testing/tests/package/br2-external/sqlitecpp/external.mk
 create mode 100644 support/testing/tests/package/br2-external/sqlitecpp/package/sqlitecpp-test/Config.in
 create mode 100644 support/testing/tests/package/br2-external/sqlitecpp/package/sqlitecpp-test/sqlitecpp-test.cpp
 create mode 100644 support/testing/tests/package/br2-external/sqlitecpp/package/sqlitecpp-test/sqlitecpp-test.mk
 create mode 100644 support/testing/tests/package/test_sqlitecpp.py

diff --git a/DEVELOPERS b/DEVELOPERS
index d62bfaafb3..c1ec5a8253 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2464,6 +2464,7 @@ F:	package/protobuf/
 F:	package/sdbus-cpp/
 F:	package/spdlog/
 F:	package/sqlitecpp/
+F:	support/testing/tests/package/sqlitecpp/
 
 N:	Michael Trimarchi <michael@amarulasolutions.com>
 F:	board/bsh/
diff --git a/support/testing/tests/package/br2-external/sqlitecpp/Config.in b/support/testing/tests/package/br2-external/sqlitecpp/Config.in
new file mode 100644
index 0000000000..586f1dfa5a
--- /dev/null
+++ b/support/testing/tests/package/br2-external/sqlitecpp/Config.in
@@ -0,0 +1 @@
+source "$BR2_EXTERNAL_SQLITECPP_PATH/package/sqlitecpp-test/Config.in"
\ No newline at end of file
diff --git a/support/testing/tests/package/br2-external/sqlitecpp/external.desc b/support/testing/tests/package/br2-external/sqlitecpp/external.desc
new file mode 100644
index 0000000000..003e033127
--- /dev/null
+++ b/support/testing/tests/package/br2-external/sqlitecpp/external.desc
@@ -0,0 +1 @@
+name: SQLITECPP
\ No newline at end of file
diff --git a/support/testing/tests/package/br2-external/sqlitecpp/external.mk b/support/testing/tests/package/br2-external/sqlitecpp/external.mk
new file mode 100644
index 0000000000..b5db18b281
--- /dev/null
+++ b/support/testing/tests/package/br2-external/sqlitecpp/external.mk
@@ -0,0 +1 @@
+include $(sort $(wildcard $(BR2_EXTERNAL_SQLITECPP_PATH)/package/*/*.mk))
\ No newline at end of file
diff --git a/support/testing/tests/package/br2-external/sqlitecpp/package/sqlitecpp-test/Config.in b/support/testing/tests/package/br2-external/sqlitecpp/package/sqlitecpp-test/Config.in
new file mode 100644
index 0000000000..d83b99bad8
--- /dev/null
+++ b/support/testing/tests/package/br2-external/sqlitecpp/package/sqlitecpp-test/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_SQLITECPP_TEST
+	bool "sqlitecpp-test"
+	depends on BR2_PACKAGE_SQLITECPP
+	help
+	  Test program for the SQLiteCpp library.
\ No newline at end of file
diff --git a/support/testing/tests/package/br2-external/sqlitecpp/package/sqlitecpp-test/sqlitecpp-test.cpp b/support/testing/tests/package/br2-external/sqlitecpp/package/sqlitecpp-test/sqlitecpp-test.cpp
new file mode 100644
index 0000000000..d888a9a392
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
\ No newline at end of file
diff --git a/support/testing/tests/package/br2-external/sqlitecpp/package/sqlitecpp-test/sqlitecpp-test.mk b/support/testing/tests/package/br2-external/sqlitecpp/package/sqlitecpp-test/sqlitecpp-test.mk
new file mode 100644
index 0000000000..da557ad874
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
\ No newline at end of file
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
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
