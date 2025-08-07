Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E23F3CA0EC1
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 17:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B19C64038E;
	Thu,  7 Aug 2025 17:00:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xgKEfyF-ZOQW; Thu,  7 Aug 2025 17:00:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C322740387
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C322740387;
	Thu,  7 Aug 2025 17:00:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1447E767
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DEF6D60606
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZdJOSlHDbplt for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 17:00:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CF5E605FC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1CF5E605FC
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 19C6B86709; Thu,  7 Aug 2025 17:00:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 7 Aug 2025 11:05:58 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 2a2c00eb182da73fea5d29e98194803efd3e6829
X-Git-Newrev: 85fa9e14945e676dd4fd44a47e8b1afdfbe438c2
X-Patchwork-Hint: ignore
Message-Id: <20250807170020.19C6B86709@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing: add a
 crun-based runtime test for docker-compose
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

commit: https://git.buildroot.net/buildroot/commit/?id=85fa9e14945e676dd4fd44a47e8b1afdfbe438c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Via the docker-compose runtime test, we can exercise the full suite of
the docker-related packages: docker-compose, of course, but also
docker-engine, which in turn allows exercising containerd. The latter
by defualt uses runc as the container runtime, but can alternatively use
crun.

Extend the docker-compose runtime test with a variant that enables crun.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 34e44809505a64c045a79be185afd3d163d1fb7f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
