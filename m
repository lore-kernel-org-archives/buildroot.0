Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B6FCCD195
	for <buildroot@archiver.kernel.org>; Sat, 18 Oct 2025 14:38:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D25B60D92;
	Sat, 18 Oct 2025 14:38:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8nsTUxOkTwyb; Sat, 18 Oct 2025 14:38:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 652A860D7E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 652A860D7E;
	Sat, 18 Oct 2025 14:38:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DAD143F
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 14:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3BD94082C
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 14:38:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7du8ah2UPJZc for <buildroot@buildroot.org>;
 Sat, 18 Oct 2025 14:38:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A374D407B1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A374D407B1
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 14:38:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9374487429; Sat, 18 Oct 2025 14:38:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 18 Oct 2025 16:38:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3963c3c06e3a4161e0ebb570db80ab0b297c9a6a
X-Git-Newrev: 7470587cfa9a24d3c49adc0fb6cc60512907f31a
X-Patchwork-Hint: ignore
Message-Id: <20251018143836.9374487429@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add runtime tests for
 python-scp
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0071179171449377810=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0071179171449377810==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=7470587cfa9a24d3c49adc0fb6cc60512907f31a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a basic test involving a local SSH connection (based on dropbear
server). The test validates that we are able, through python-scp, to
fetch the /etc/hostname file.

The test needs some basic key initialization to allow connecting to the
dropbear server, hence the custom run_sample_scripts method.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
[Julien:
 - remove unneeded os import in test script
 - execute setup commands with assertRunOk()
 - create /root/.ssh with 0700 mode
 - run sample scripts using super()
 - check in the sample file that copied files are the same
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/sample_python_scp.py | 15 +++++++++++++++
 support/testing/tests/package/test_python_scp.py   | 21 +++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/support/testing/tests/package/sample_python_scp.py b/support/testing/tests/package/sample_python_scp.py
new file mode 100644
index 0000000000..c986a27f0b
--- /dev/null
+++ b/support/testing/tests/package/sample_python_scp.py
@@ -0,0 +1,15 @@
+import filecmp
+
+from paramiko import SSHClient
+from paramiko.client import AutoAddPolicy
+
+from scp import SCPClient
+
+ssh_client = SSHClient()
+ssh_client.load_system_host_keys()
+ssh_client.set_missing_host_key_policy(AutoAddPolicy)
+ssh_client.connect('127.0.0.1', username='root')
+scp_client = SCPClient(ssh_client.get_transport())
+scp_client.get("/etc/hostname", "/tmp/hostname")
+
+assert filecmp("/etc/hostname", "/tmp/hostname")
diff --git a/support/testing/tests/package/test_python_scp.py b/support/testing/tests/package/test_python_scp.py
new file mode 100644
index 0000000000..be04c5684c
--- /dev/null
+++ b/support/testing/tests/package/test_python_scp.py
@@ -0,0 +1,21 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonSCP(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_DROPBEAR=y
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_SCP=y
+        """
+    sample_scripts = ["tests/package/sample_python_scp.py"]
+
+    def run_sample_scripts(self):
+        # Allow passwordless root login in SSH server
+        self.assertRunOk("mkdir -m 0700 /root/.ssh")
+        self.assertRunOk("dropbearkey -t ed25519 -f .ssh/id_dropbear")
+        self.assertRunOk("dropbearkey -y -f .ssh/id_dropbear | grep '^ssh-ed25519' > .ssh/authorized_keys")
+        self.assertRunOk("dropbearconvert dropbear openssh .ssh/id_dropbear .ssh/id_ed25519")
+
+        super().run_sample_scripts()

--===============0071179171449377810==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0071179171449377810==--
