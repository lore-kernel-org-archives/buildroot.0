Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98142EB64D8
	for <buildroot@archiver.kernel.org>; Fri, 16 Jun 2023 06:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D00F83E59;
	Fri, 16 Jun 2023 06:04:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D00F83E59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E8EGgzzrVXIt; Fri, 16 Jun 2023 06:04:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 689D183E33;
	Fri, 16 Jun 2023 06:04:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 689D183E33
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7AAF51BF616
 for <buildroot@lists.busybox.net>; Fri, 16 Jun 2023 06:04:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5386241D62
 for <buildroot@lists.busybox.net>; Fri, 16 Jun 2023 06:04:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5386241D62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kG3vVnFbzm2r for <buildroot@lists.busybox.net>;
 Fri, 16 Jun 2023 06:04:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E38DB41D64
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E38DB41D64
 for <buildroot@buildroot.org>; Fri, 16 Jun 2023 06:04:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2139520008;
 Fri, 16 Jun 2023 06:04:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@48ers.dk>)
 id 1qA2ZW-00F8Ax-TD; Fri, 16 Jun 2023 08:04:34 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Jun 2023 08:04:20 +0200
Message-Id: <20230616060421.3606283-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230616060421.3606283-1-peter@korsgaard.com>
References: <20230616060421.3606283-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] support/testing: add python-docker test
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
Cc: james.hilliard1@gmail.com, Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Python-docker needs a working docker setup to do anything useful, so add it
to the existing docker_compose (which tests docker and docker-compose)
rather than adding a completely new test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../testing/tests/package/sample_python_docker.py    | 12 ++++++++++++
 support/testing/tests/package/test_docker_compose.py | 10 +++++++++-
 2 files changed, 21 insertions(+), 1 deletion(-)
 create mode 100644 support/testing/tests/package/sample_python_docker.py

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
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
