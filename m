Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 381E7C433F5
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 17:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C7D2A40643;
	Sun, 30 Jan 2022 17:22:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a8rqoqKmXjjB; Sun, 30 Jan 2022 17:22:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ADD1740160;
	Sun, 30 Jan 2022 17:22:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 161081BF57B
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 17:22:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 039D34093D
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 17:22:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G7nFaalxorFy for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 17:22:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 06536402B2
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 17:22:00 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.166.202.136])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 214D9200385;
 Sun, 30 Jan 2022 18:21:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1643563317;
 bh=y15tvHSUykIuOG0kJFENKaL15Pjh/llc6y6OGjYT4J4=;
 h=From:To:Cc:Subject:Date:From;
 b=q2F+F3tsBtP10tkKyRCd6AcEPBKftIRW+eehFCjcEacE4lG6QajmkTY6CpLLduj7O
 53+LaCQcV2EpYTf4m1yDj5eqZ+wHqhNgXxA8wD2mGUUDQtb65SAtJIMKblKSqAgQDB
 BgKdbCf6XcFChZYwzfJpQI8CEMXlJ3n7oOEUvkSsxz4QLRpaoUTC7LxWIiUJ2YASAW
 COu9NZqG6+MqX46cDWcX12OMBqQ4hDbvVOUeIWXlruepyhTCDBZmy3VqVsIRnP2vyR
 O/v997aT4fM38yBkzUll8VtU3Z1ufiiU0NskqT9lidAgvMCsDog3vc+mkRjshM1qmS
 8DJcxPhjo7feg==
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 30 Jan 2022 18:21:45 +0100
Message-Id: <20220130172145.888946-1-ju.o@free.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] support/testing: add test for python-distro
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

This commit add a simple test checking the reported distro name and
id are Buildroot (as reported by /etc/os-release).

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                    |  2 ++
 .../tests/package/sample_python_distro.py     |  4 ++++
 .../tests/package/test_python_distro.py       | 21 +++++++++++++++++++
 3 files changed, 27 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_distro.py
 create mode 100644 support/testing/tests/package/test_python_distro.py

diff --git a/DEVELOPERS b/DEVELOPERS
index e17803f38a..368f95796b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1612,7 +1612,9 @@ F:	package/python-gnupg/
 F:	package/python-pyalsa/
 F:	package/riscv-isa-sim/
 F:	package/zynaddsubfx/
+F:	support/testing/tests/package/sample_python_distro.py
 F:	support/testing/tests/package/sample_python_gnupg.py
+F:	support/testing/tests/package/test_python_distro.py
 F:	support/testing/tests/package/test_python_gnupg.py
 
 N:	Julien Viard de Galbert <julien@vdg.name>
diff --git a/support/testing/tests/package/sample_python_distro.py b/support/testing/tests/package/sample_python_distro.py
new file mode 100644
index 0000000000..b31f129718
--- /dev/null
+++ b/support/testing/tests/package/sample_python_distro.py
@@ -0,0 +1,4 @@
+import distro
+
+assert(distro.name() == 'Buildroot')
+assert(distro.id() == 'buildroot')
diff --git a/support/testing/tests/package/test_python_distro.py b/support/testing/tests/package/test_python_distro.py
new file mode 100644
index 0000000000..943b29e47e
--- /dev/null
+++ b/support/testing/tests/package/test_python_distro.py
@@ -0,0 +1,21 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy2Distro(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON=y
+        BR2_PACKAGE_PYTHON_DISTRO=y
+        """
+    sample_scripts = ["tests/package/sample_python_distro.py"]
+
+
+class TestPythonPy3Distro(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_DISTRO=y
+        """
+    sample_scripts = ["tests/package/sample_python_distro.py"]
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
