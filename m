Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DCCDC4332F
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 13:13:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3EAB4039D;
	Sat, 12 Feb 2022 13:13:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S0jvrS1kQspM; Sat, 12 Feb 2022 13:13:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9CF0740574;
	Sat, 12 Feb 2022 13:13:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6CF531BF283
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 13:13:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69B4680D9D
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 13:13:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yokXor0EAs4Y for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 13:13:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB04380C1E
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 13:13:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id B9FDD82ACC; Sat, 12 Feb 2022 13:06:02 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 12 Feb 2022 13:55:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 59d3a1a9994c337207cd0bfdfbd79f01ff8739e6
X-Git-Newrev: ebde11d29f5ceb7f7398d24cbf71909c1e08a073
X-Patchwork-Hint: ignore
Message-Id: <20220212130602.B9FDD82ACC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add test for python-distro
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

commit: https://git.buildroot.net/buildroot/commit/?id=ebde11d29f5ceb7f7398d24cbf71909c1e08a073
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit add a simple test checking the reported distro name and
id are Buildroot (as reported by /etc/os-release).

Signed-off-by: Julien Olivain <ju.o@free.fr>
[Arnout: drop python2 variant]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                                            |  2 ++
 support/testing/tests/package/sample_python_distro.py |  4 ++++
 support/testing/tests/package/test_python_distro.py   | 11 +++++++++++
 3 files changed, 17 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 689673fce7..e89149cea0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1604,7 +1604,9 @@ F:	package/python-gnupg/
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
index 0000000000..c26f9c499e
--- /dev/null
+++ b/support/testing/tests/package/test_python_distro.py
@@ -0,0 +1,11 @@
+from tests.package.test_python import TestPythonPackageBase
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
