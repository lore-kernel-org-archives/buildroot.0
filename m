Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB98C83F27
	for <buildroot@archiver.kernel.org>; Wed, 16 Jul 2025 18:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25D4A61462;
	Wed, 16 Jul 2025 18:38:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FL3CUDeOi-Ur; Wed, 16 Jul 2025 18:38:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFACD61513
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFACD61513;
	Wed, 16 Jul 2025 18:38:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B2F11C62
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 18:38:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B35D40F2C
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 18:38:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ob6THFmmnXJ for <buildroot@buildroot.org>;
 Wed, 16 Jul 2025 18:38:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B4BD40CEF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B4BD40CEF
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 18:38:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 767B086662; Wed, 16 Jul 2025 18:38:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 15 Jul 2025 23:50:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ed99b77e5d276d62c2f4c9959b5c558a4f3c9e36
X-Git-Newrev: 34e44809505a64c045a79be185afd3d163d1fb7f
X-Patchwork-Hint: ignore
Message-Id: <20250716183802.767B086662@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add a crun-based runtime
 test for docker-compose
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=34e44809505a64c045a79be185afd3d163d1fb7f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Via the docker-compose runtime test, we can exercise the full suite of
the docker-related packages: docker-compose, of course, but also
docker-engine, which in turn allows exercising containerd. The latter
by defualt uses runc as the container runtime, but can alternatively use
crun.

Extend the docker-compose runtime test with a variant that enables crun.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_docker_compose.py | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_docker_compose.py b/support/testing/tests/package/test_docker_compose.py
index 16027c9c3a..6a8f6f4010 100644
--- a/support/testing/tests/package/test_docker_compose.py
+++ b/support/testing/tests/package/test_docker_compose.py
@@ -3,7 +3,7 @@ import os
 import infra.basetest
 
 
-class TestDockerCompose(infra.basetest.BRTest):
+class BaseTestDockerCompose(infra.basetest.BRTest):
     scripts = ["conf/docker-compose.yml",
                "tests/package/sample_python_docker.py"]
     config = \
@@ -53,7 +53,7 @@ class TestDockerCompose(infra.basetest.BRTest):
     def python_docker_test(self):
         self.assertRunOk('python3 ./sample_python_docker.py', 120)
 
-    def test_run(self):
+    def do_test(self):
         kernel = os.path.join(self.builddir, "images", "bzImage")
         rootfs = os.path.join(self.builddir, "images", "rootfs.ext2")
         self.emulator.boot(arch="x86_64",
@@ -70,3 +70,17 @@ class TestDockerCompose(infra.basetest.BRTest):
         self.docker_test()
         self.docker_compose_test()
         self.python_docker_test()
+
+
+class TestDockerComposeRunc(BaseTestDockerCompose):
+    def test_run(self):
+        self.do_test()
+
+
+class TestDockerComposeCrun(BaseTestDockerCompose):
+    config = BaseTestDockerCompose.config + """
+        BR2_PACKAGE_CRUN=y
+        """
+
+    def test_run(self):
+        self.do_test()
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
