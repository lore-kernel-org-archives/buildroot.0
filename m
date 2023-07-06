Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AECE4EB64D9
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 08:58:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FD2440237;
	Thu,  6 Jul 2023 08:58:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FD2440237
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eyAOtJ9T2JyT; Thu,  6 Jul 2023 08:58:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41965400C1;
	Thu,  6 Jul 2023 08:58:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41965400C1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F27611BF97E
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 08:56:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA39B8188B
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 08:56:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA39B8188B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 67UT6sEzwedj for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 08:56:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B9ACF817A8
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 08:56:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9ACF817A8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A9AF6867CB; Thu,  6 Jul 2023 08:56:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 6 Jul 2023 10:33:42 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: d918568a15cc00a0c718a475b6c755fcdc8e0d1e
X-Git-Newrev: 584d553f39090f78ce74ac21bb843cb422b48c49
X-Patchwork-Hint: ignore
Message-Id: <20230706085635.A9AF6867CB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] support/testing: add
 python-docker test
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

commit: https://git.buildroot.net/buildroot/commit/?id=584d553f39090f78ce74ac21bb843cb422b48c49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Python-docker needs a working docker setup to do anything useful, so add it
to the existing docker_compose (which tests docker and docker-compose)
rather than adding a completely new test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0bb63c6f5adc07532da494d1118dd7b6f061fb00)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/sample_python_docker.py | 12 ++++++++++++
 support/testing/tests/package/test_docker_compose.py  | 10 +++++++++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/support/testing/tests/package/sample_python_docker.py b/support/testing/tests/package/sample_python_docker.py
new file mode 100644
index 0000000000..a69097b412
--- /dev/null
+++ b/support/testing/tests/package/sample_python_docker.py
@@ -0,0 +1,12 @@
+import docker
+
+client = docker.from_env()
+info = client.info()
+images = client.images.list()
+
+assert len(images) > 0
+
+print('Version:', info['ServerVersion'])
+print('Images:')
+for i in images:
+    print(i.tags[0])
diff --git a/support/testing/tests/package/test_docker_compose.py b/support/testing/tests/package/test_docker_compose.py
index 38b669fc6d..16027c9c3a 100644
--- a/support/testing/tests/package/test_docker_compose.py
+++ b/support/testing/tests/package/test_docker_compose.py
@@ -4,6 +4,8 @@ import infra.basetest
 
 
 class TestDockerCompose(infra.basetest.BRTest):
+    scripts = ["conf/docker-compose.yml",
+               "tests/package/sample_python_docker.py"]
     config = \
         """
         BR2_x86_64=y
@@ -18,6 +20,8 @@ class TestDockerCompose(infra.basetest.BRTest):
         BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.262"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="{}"
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_DOCKER=y
         BR2_PACKAGE_CA_CERTIFICATES=y
         BR2_PACKAGE_DOCKER_CLI=y
         BR2_PACKAGE_DOCKER_COMPOSE=y
@@ -27,7 +31,7 @@ class TestDockerCompose(infra.basetest.BRTest):
         # BR2_TARGET_ROOTFS_TAR is not set
         """.format(
             infra.filepath("tests/package/copy-sample-script-to-target.sh"),
-            infra.filepath("conf/docker-compose.yml"),
+            " ".join([infra.filepath(i) for i in scripts]),
             infra.filepath("conf/docker-compose-kernel.config"))
 
     def wait_for_dockerd(self):
@@ -46,6 +50,9 @@ class TestDockerCompose(infra.basetest.BRTest):
         self.assertRunOk('wget -q -O /tmp/busybox http://127.0.0.1/busybox', 120)
         self.assertRunOk('cmp /bin/busybox /tmp/busybox', 120)
 
+    def python_docker_test(self):
+        self.assertRunOk('python3 ./sample_python_docker.py', 120)
+
     def test_run(self):
         kernel = os.path.join(self.builddir, "images", "bzImage")
         rootfs = os.path.join(self.builddir, "images", "rootfs.ext2")
@@ -62,3 +69,4 @@ class TestDockerCompose(infra.basetest.BRTest):
         self.wait_for_dockerd()
         self.docker_test()
         self.docker_compose_test()
+        self.python_docker_test()
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
