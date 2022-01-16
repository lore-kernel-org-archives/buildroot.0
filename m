Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE61C433EF
	for <buildroot@archiver.kernel.org>; Sun, 16 Jan 2022 10:41:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A0D0C4031D;
	Sun, 16 Jan 2022 10:41:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yjkp72ibLCUw; Sun, 16 Jan 2022 10:41:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9045240167;
	Sun, 16 Jan 2022 10:41:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BD0A71BF426
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 10:41:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A70294024A
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 10:41:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0dGGtak7IK3Q for <buildroot@lists.busybox.net>;
 Sun, 16 Jan 2022 10:41:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 828904023E
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 10:41:41 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.173.27.224])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E77BCB00583;
 Sun, 16 Jan 2022 11:41:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642329698;
 bh=ihoGnxg5m3MbL0axbYlCN4odMaMFeTienuP6H1VzPh0=;
 h=From:To:Cc:Subject:Date:From;
 b=HeCv0liy4WRKgypuElDGXUssVefBjcOddqE6yTzMphx/qq/OCuG177fnQ2+filgA/
 3Qx7HIdYWiyj7I3LTQtfRCLeqwqVkXf1Hv+pjMO8JP1wQ2+hTVbyQcb1j5QeXq3AB0
 1s9XeF6wanohr4wxZgsOwGrVKVIhUsvFbd7LP578ASbkgxlvJ873sjip3hN2Nfs2rH
 77KT3qPLdt1ubbfl+uiDdmNfLGUIMBwjFnQmjMsvBbdNv0jbsM3cjM2vujXMBwMNTl
 Dac7RAMO95zN19lJlFwUd1mxw0ys9Prh6IEJGqJTBRjSLKWvvgJLiKsxYH8BUQnDFR
 wGHlK/wDeYrfw==
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 16 Jan 2022 11:41:14 +0100
Message-Id: <20220116104114.103601-1-ju.o@free.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] support/testing: add test for python-gnupg
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
Cc: Julien Olivain <ju.o@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit add a simple test doing symmetric encryption/decryption
to check this python interface with the gpg binary is working fine.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                    |  2 ++
 .../tests/package/sample_python_gnupg.py      | 24 +++++++++++++++++++
 .../tests/package/test_python_gnupg.py        | 21 ++++++++++++++++
 3 files changed, 47 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_gnupg.py
 create mode 100644 support/testing/tests/package/test_python_gnupg.py

diff --git a/DEVELOPERS b/DEVELOPERS
index a91e2dfcde..e038941b3b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1611,6 +1611,8 @@ F:	package/python-distro/
 F:	package/python-gnupg/
 F:	package/python-pyalsa/
 F:	package/riscv-isa-sim/
+F:	support/testing/tests/package/sample_python_gnupg.py
+F:	support/testing/tests/package/test_python_gnupg.py
 
 N:	Julien Viard de Galbert <julien@vdg.name>
 F:	package/dieharder/
diff --git a/support/testing/tests/package/sample_python_gnupg.py b/support/testing/tests/package/sample_python_gnupg.py
new file mode 100644
index 0000000000..b5b718a8cb
--- /dev/null
+++ b/support/testing/tests/package/sample_python_gnupg.py
@@ -0,0 +1,24 @@
+import gnupg
+
+gpg = gnupg.GPG(verbose=True)
+
+plain_data = "Some plain text data"
+good_passphrase = "Good Passphrase"
+
+# Test Encrypt
+result = gpg.encrypt(plain_data, None, passphrase=good_passphrase, symmetric=True)
+assert(result.returncode == 0)
+enc_data = str(result)
+assert(enc_data != plain_data)
+
+# Test Good Decrypt
+result = gpg.decrypt(enc_data, passphrase=good_passphrase)
+assert(result.returncode == 0)
+dec_data = str(result)
+assert(dec_data == plain_data)
+
+# Test Bad Decrypt
+result = gpg.decrypt(enc_data, passphrase='A Wrong Passphrase')
+assert(result.returncode != 0)
+dec_data = str(result)
+assert(dec_data != plain_data)
diff --git a/support/testing/tests/package/test_python_gnupg.py b/support/testing/tests/package/test_python_gnupg.py
new file mode 100644
index 0000000000..0c71f6b6d0
--- /dev/null
+++ b/support/testing/tests/package/test_python_gnupg.py
@@ -0,0 +1,21 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy2GnuPG(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON=y
+        BR2_PACKAGE_PYTHON_GNUPG=y
+        """
+    sample_scripts = ["tests/package/sample_python_gnupg.py"]
+
+
+class TestPythonPy3GnuPG(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_GNUPG=y
+        """
+    sample_scripts = ["tests/package/sample_python_gnupg.py"]
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
