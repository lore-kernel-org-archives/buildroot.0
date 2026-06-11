Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CFE1CD98CE
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4634610E5;
	Fri, 12 Jun 2026 11:24:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tCCNvhRfvtDO; Fri, 12 Jun 2026 11:24:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAC4E610DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781263464;
	bh=ECrHNAOFQM8Ly+QA1/z+gT+fzZMLScZ77pBIWlaSC5I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YvA/GtR2NIfqtaM6WzWsmQyhje2vpbPhOu18p0Pwyg9uBERMmaJSDBd354+RzhfP2
	 3+ci6hfSpamt1Nulau5CWdigG9btwEHBFTx7Mf7CD/3KcgbGemIozHhy5VJux2R4gb
	 IIZ5B44OGeuYBNeuKDFKU0tlwbSGBR/8vNqYFi8HOBJFx5x+MMDih1oFJxVitOMjTS
	 eXhzC8xPW3yoLZkYI9IyTq2zPo2xPDGoW5U6Xa/99FGX55KlfeaNZnt1LizYk+InYg
	 3X8+wNXWIL3+9BFTl6xAZfghOdMXrvsMnqvHMzqF8aF3yf3Z44zRoo8ZCoygEUTA6A
	 miixteWE3/wcw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAC4E610DE;
	Fri, 12 Jun 2026 11:24:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E240F4
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E995240667
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tk06Efjbsjng for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:24:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9998140664
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9998140664
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7342A880E9; Fri, 12 Jun 2026 11:23:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 10:30:40 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 40f10a484c636f2b551f1ed65e5b7b0a5193456b
X-Git-Newrev: c4a95526c051a4f2550028e28777e1b5994d8a29
X-Patchwork-Hint: ignore
Message-Id: <20260612112349.7342A880E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] support/testing: use
 larger runner to reduce the CI minute consumed per pipeline
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c4a95526c051a4f2550028e28777e1b5994d8a29
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Based on the first pipeline result [1], use larger runner for the
following tests:

  tests.fs.test_oci.TestOci.test_run (01:08:15)
  saas-linux-small-amd64 -> saas-linux-xlarge-amd64

  tests.package.test_dpdk.TestDPDK.test_run (01:08:36)
  saas-linux-small-amd64 -> saas-linux-xlarge-amd64

  tests.package.test_z3.TestZ3.test_run (01:11:41)
  saas-linux-small-amd64 -> saas-linux-xlarge-amd64

  tests.package.test_octave.TestOctave.test_run (01:21:57)
  saas-linux-small-amd64 -> saas-linux-xlarge-amd64

  tests.package.test_podman.TestPodmanSlirpNftables.test_run (01:21:15)
  saas-linux-small-amd64 -> saas-linux-xlarge-amd64

  tests.package.test_podman.TestPodmanSlirpIptables.test_run (01:21:25)
  saas-linux-small-amd64 -> saas-linux-xlarge-amd64

  tests.package.test_mariadb.TestMariaDB.test_run (01:26:15)
  saas-linux-small-amd64 -> saas-linux-xlarge-amd64

  tests.package.test_podman.TestPodmanIptables.test_run (01:28:51)
  saas-linux-small-amd64 -> saas-linux-xlarge-amd64

  tests.package.test_podman.TestPodmanTini.test_run (01:29:08)
  saas-linux-small-amd64 -> saas-linux-xlarge-amd64

  tests.package.test_podman.TestPodmanNftables.test_run (01:41:26)
  saas-linux-small-amd64 -> saas-linux-xlarge-amd64

  tests.package.test_weston.TestWeston.test_run (01:26:17)
  saas-linux-large-amd64 -> saas-linux-2xlarge-amd64

  tests.package.test_python_pyqt5.TestPythonPyQt5.test_run (01:41:33)
  saas-linux-large-amd64 -> saas-linux-2xlarge-amd64

  tests.package.test_nodejs.TestNodeJSModuleHostBin.test_run (01:21:06)
  saas-linux-large-amd64 -> saas-linux-2xlarge-amd64

  tests.package.test_flutter.TestFlutter.test_run (01:03:05)
  saas-linux-xlarge-amd64 -> saas-linux-2xlarge-amd64

For tests long that already use 2xlarge runner tag, we may have to run
them on Gitlab runners owned by the Buildroot project.

[1] https://gitlab.com/buildroot.org/buildroot/-/pipelines/2562421098

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 13a0129b0a5732f3b134737c6b70a349165580a2)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/tests/fs/test_oci.py               | 1 +
 support/testing/tests/package/test_dpdk.py         | 1 +
 support/testing/tests/package/test_flutter.py      | 2 +-
 support/testing/tests/package/test_mariadb.py      | 1 +
 support/testing/tests/package/test_nodejs.py       | 2 +-
 support/testing/tests/package/test_octave.py       | 1 +
 support/testing/tests/package/test_podman.py       | 5 +++++
 support/testing/tests/package/test_python_pyqt5.py | 2 +-
 support/testing/tests/package/test_weston.py       | 2 +-
 support/testing/tests/package/test_z3.py           | 1 +
 10 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/support/testing/tests/fs/test_oci.py b/support/testing/tests/fs/test_oci.py
index 0ecf58f626..99b0151fe4 100644
--- a/support/testing/tests/fs/test_oci.py
+++ b/support/testing/tests/fs/test_oci.py
@@ -3,6 +3,7 @@ import shutil
 import infra.basetest
 
 
+# gitlab-runner: xlarge
 class TestOci(infra.basetest.BRTest):
     config = \
         """
diff --git a/support/testing/tests/package/test_dpdk.py b/support/testing/tests/package/test_dpdk.py
index 6f55cddee8..0438fe3d4c 100644
--- a/support/testing/tests/package/test_dpdk.py
+++ b/support/testing/tests/package/test_dpdk.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# gitlab-runner: xlarge
 class TestDPDK(infra.basetest.BRTest):
     config = \
         """
diff --git a/support/testing/tests/package/test_flutter.py b/support/testing/tests/package/test_flutter.py
index 95cccb529d..30c6a430fa 100644
--- a/support/testing/tests/package/test_flutter.py
+++ b/support/testing/tests/package/test_flutter.py
@@ -5,7 +5,7 @@ import infra.basetest
 from ..graphics_base import GraphicsBase
 
 
-# gitlab-runner: xlarge
+# gitlab-runner: 2xlarge
 class TestFlutter(infra.basetest.BRTest, GraphicsBase):
     config = f"""
         BR2_aarch64=y
diff --git a/support/testing/tests/package/test_mariadb.py b/support/testing/tests/package/test_mariadb.py
index d40ffdba96..67ae61c3e1 100644
--- a/support/testing/tests/package/test_mariadb.py
+++ b/support/testing/tests/package/test_mariadb.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# gitlab-runner: xlarge
 class TestMariaDB(infra.basetest.BRTest):
     # We use a specific configuration for:
     # - using Aarch64, to have more than 256MB memory,
diff --git a/support/testing/tests/package/test_nodejs.py b/support/testing/tests/package/test_nodejs.py
index 0e679a0ddd..5f3d41a28c 100644
--- a/support/testing/tests/package/test_nodejs.py
+++ b/support/testing/tests/package/test_nodejs.py
@@ -29,7 +29,7 @@ class TestNodeJSBasic(infra.basetest.BRTest):
         self.assertRunOk("node sample_nodejs_basic.js")
 
 
-# gitlab-runner: large
+# gitlab-runner: 2xlarge
 class TestNodeJSModuleHostBin(infra.basetest.BRTest):
     config = \
         """
diff --git a/support/testing/tests/package/test_octave.py b/support/testing/tests/package/test_octave.py
index cdbe2688df..92e30c4671 100644
--- a/support/testing/tests/package/test_octave.py
+++ b/support/testing/tests/package/test_octave.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# gitlab-runner: xlarge
 class TestOctave(infra.basetest.BRTest):
     # infra.basetest.BASIC_TOOLCHAIN_CONFIG cannot be used as it does
     # not include gfortran.
diff --git a/support/testing/tests/package/test_podman.py b/support/testing/tests/package/test_podman.py
index 9d86a06129..bd16bd99ac 100644
--- a/support/testing/tests/package/test_podman.py
+++ b/support/testing/tests/package/test_podman.py
@@ -211,11 +211,13 @@ class PodmanBase(infra.basetest.BRTest):
         self.assertEqual(len(img_info), 0, f"{len(img_info)} image(s) still present, expecting 0")
 
 
+# gitlab-runner: xlarge
 class TestPodmanIptables(PodmanBase):
     def test_run(self):
         self.do_test()
 
 
+# gitlab-runner: xlarge
 class TestPodmanNftables(PodmanBase):
     config = PodmanBase.config + """
     BR2_PACKAGE_NFTABLES=y
@@ -225,6 +227,7 @@ class TestPodmanNftables(PodmanBase):
         self.do_test()
 
 
+# gitlab-runner: xlarge
 class TestPodmanTini(PodmanBase):
     config = PodmanBase.config + """
     BR2_PACKAGE_PODMAN_INIT_TINI=y
@@ -234,6 +237,7 @@ class TestPodmanTini(PodmanBase):
         self.do_test()
 
 
+# gitlab-runner: xlarge
 class TestPodmanSlirpIptables(PodmanBase):
     config = PodmanBase.config + """
     BR2_PACKAGE_PODMAN_NET_SLIRP4NETNS=y
@@ -243,6 +247,7 @@ class TestPodmanSlirpIptables(PodmanBase):
         self.do_test()
 
 
+# gitlab-runner: xlarge
 class TestPodmanSlirpNftables(PodmanBase):
     config = PodmanBase.config + """
     BR2_PACKAGE_NFTABLES=y
diff --git a/support/testing/tests/package/test_python_pyqt5.py b/support/testing/tests/package/test_python_pyqt5.py
index fd933ba560..571012ed7c 100644
--- a/support/testing/tests/package/test_python_pyqt5.py
+++ b/support/testing/tests/package/test_python_pyqt5.py
@@ -3,7 +3,7 @@ import os
 import infra.basetest
 
 
-# gitlab-runner: large
+# gitlab-runner: 2xlarge
 class TestPythonPyQt5(infra.basetest.BRTest):
     # We use a specific configuration for:
     # - using Aarch64, to have more than 256MB memory,
diff --git a/support/testing/tests/package/test_weston.py b/support/testing/tests/package/test_weston.py
index 1b25d5ac5e..c8b243a6a7 100644
--- a/support/testing/tests/package/test_weston.py
+++ b/support/testing/tests/package/test_weston.py
@@ -5,7 +5,7 @@ import infra.basetest
 from ..graphics_base import GraphicsBase
 
 
-# gitlab-runner: large
+# gitlab-runner: 2xlarge
 class TestWeston(infra.basetest.BRTest, GraphicsBase):
     config = \
         """
diff --git a/support/testing/tests/package/test_z3.py b/support/testing/tests/package/test_z3.py
index 30794a250b..851dcfab1a 100644
--- a/support/testing/tests/package/test_z3.py
+++ b/support/testing/tests/package/test_z3.py
@@ -3,6 +3,7 @@ import os
 import infra.basetest
 
 
+# gitlab-runner: xlarge
 class TestZ3(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
