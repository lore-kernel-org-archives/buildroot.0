Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA5CC2BA4C
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 17:42:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53B0C81DAB;
	Wed, 26 Jan 2022 17:42:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yC_PVYsUmGFf; Wed, 26 Jan 2022 17:42:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F1E381D18;
	Wed, 26 Jan 2022 17:42:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8FF0B1BF417
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 17:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C78D40923
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 17:41:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oYNce7cwOQ7w for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 17:41:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA7A5408E3
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 17:41:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id B4714812BF; Wed, 26 Jan 2022 17:35:05 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 18:01:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ee228403e9741b6c799ce1ef34c15993086f266d
X-Git-Newrev: 9a79397fc5f6eb82805dbdff173d7f8cbfaea186
X-Patchwork-Hint: ignore
Message-Id: <20220126173505.B4714812BF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add test for python-gnupg
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

commit: https://git.buildroot.net/buildroot/commit/?id=9a79397fc5f6eb82805dbdff173d7f8cbfaea186
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit add a simple test doing symmetric encryption/decryption
to check this python interface with the gpg binary is working fine.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                         |  2 ++
 .../testing/tests/package/sample_python_gnupg.py   | 24 ++++++++++++++++++++++
 support/testing/tests/package/test_python_gnupg.py | 21 +++++++++++++++++++
 3 files changed, 47 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index dc810b6fe1..1d729e5ce4 100644
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
