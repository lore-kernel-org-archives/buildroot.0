Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D55CFCCF2C4
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:09:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82E8D60AC8;
	Fri, 16 Oct 2026 13:09:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ef2Si4XIMzJi; Fri, 16 Oct 2026 13:09:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 257BD60B98
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156154;
	b=jmpeIdVtjGdo8wJOHaWVOZXMipLw25fDLir/zhL9eUJ0BgJubZ5yGb3Gofe1c76Z0vno
	 OpdLe3O4beqvDB8Gu2QcFvOzCS5k0XdRMTf+8dt1LMF56kraSiHd5LeEgkYB1PcmSAuc7
	 EbLbR8y/wWq63vfBYXqDkUJwtgHd++qK6xWWwoGj1hVqpa8NlkN2I2vPS6WaG0yozzHmI
	 EiCy36xOBngQ15+l3tvxpIj7ymOrZ4NsrTVRnWERU6xc/GMSLpOi+gsNEX5Oke/FldaxT
	 WPz0rObcfCMpvMu0sJ7I7OT7Q/XTZpJrmiUzWVn7vKVESLhOmEMSleoTmNdRns7omWw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156154;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=/NIXdlDx4DeVWtVh7k5QT5qedLuuBNRNJ90mWUmiZ5E=;
	b=D53Mw+68Owh5xGaAico5ZU26AoGlJ42edZAo76PvIOiMjIcS6G67LOB/7MkoLlGn71R/
	 FL+F/2yAPcESzQxivjOWBh0/H/rg6xjIo1AUeQU98KZ/By3rsVfi5wZmGCZg1H4EckZMI
	 kjBPggFoSRFHv5r1Vjk0eGGVHsxzGZZGLknokhnbJVQbXnss0CJXxl5TpDdbVb1KzL8tP
	 /5/8M1QRP4nYcS+LFQg74iog49WCejtUKgNDdbxd2vFu9n+N7o67XrWXIvqKoAGOKsDoX
	 rsGgF1UTXIP8fQ2l/ki6gdOZTbBnOMsSirQNfHHCNS0cOJiY89DWac3l9FyPhceoIFQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156154;
	bh=/NIXdlDx4DeVWtVh7k5QT5qedLuuBNRNJ90mWUmiZ5E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=eKJ3QjkfO6z8147TEoOEuNmC6tzykfw824xpGTxsG8b/aDK7hX9fdrvav9BznHvuc
	 F01WINEu8N6zmx4IimL57mSkOcjAp1QG6jVL3bdrV02gzFVfOspxbx+QZKQZamQmAg
	 w4wmmzF2wcy8Qcku8PZP8fgoUTbQ7irCiSW18uDaV32cdzVWVKAMFji+N8y0ZKpFI1
	 kb1TEY7saJJXEVj0UTCmNfcUcY4Nv2Rf37FdpgMRZdsw0mO/ls5sJhyE0t2ZzZX5R9
	 IO3I6IeQcB1Ckr9PradkjSuhm3C3YWOuekOp1C1JsP4nKwdAXqa5dWn3WAwTGv4kom
	 PTIRHR9GEhWKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 257BD60B98;
	Fri, 16 Oct 2026 13:09:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E48681C64
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CEA84409F3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v_DLh41WLqPj for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7102E409FF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156107;
 b=qRvrhv07mVRSkOGct1zqhE9952g+Wp4oVc5UuwHuYhJBc6bAuUinW6etC1uSu46ggiYe
 NezxFBMfoqL7WGKEDv6wSxBTzfChdDzFIZn+yanymsD/6Q8IIPL9/kVh4xLHjHmnItSni
 JQrwt+essavGQM/DqGcrtbEu05VFuhvmMY1GerqdlYnZ1t30Ov+XbGEE6mstWVUjSO/Kh
 fQNgewqrs59k20+G6eeSlLr05m/PwCsNkwgYEtHvrWNPnzyJ68OkrB7fhN1rTo64x7Da9
 zhOHr7KJauswp09trilrA6yTSp8KM+Wd4Z3DzLvxRRTS123pm5DgpImBSBga/hw1yhA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156107;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=rgmcMxzi0sOn3PNaqg7cJ/RXwM5g4NfzPmPjO8tIV44=;
 b=Sc9H2OOnuEjxjvpCCLKepegWOF+PBc7hMXmZAb3vXJCETTFNQBukL4c+2gAAHoFRGDVD
 fgp7QJyA0pVdccW98xJDSXN+pYndM4sZ+9UetSJckLipekrQl/zL2ZPVM/qkokAMZBs6v
 E9I8jqHMjdkoW7gqgXaPCenjukaAq3S5KtacDFM93DbcO+azlbLpucj1xpARk43YSs0Sf
 Uw/XoPT5os2mxfvRhY9LcOEiFHpozd2eRnzwuff9QUplYZoeXew8LaPriVRsiBQ962xk6
 NIlIqNmGACdgh8M6LmG7zJ2xS0L65Slfvq7InKnhEvyP3pMM8tKYU+H6MX72KktpSNg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7102E409FF
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 62136960D8; Fri, 16 Oct 2026 13:07:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: bc27f5fd2fa67e6161ba8dec403527c2ddfeca4c
X-Git-Newrev: 922559fb5a152cf9cb6bfaffb0bfd0f2bed783e3
X-Patchwork-Hint: ignore
Message-Id: <20261016130706.62136960D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing:
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4601364859728071030=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4601364859728071030==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/922559fb5a152cf9cb6bfaffb0bfd0f2bed783e3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
index bebf875499..62cf36f614 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2347,6 +2347,8 @@ F:	package/protobuf/
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

--===============4601364859728071030==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4601364859728071030==--
