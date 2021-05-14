Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NUMERIC_HTTP_ADDR,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 306C7C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:20:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C55AE60C3F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:20:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C55AE60C3F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 856A0404D9;
	Tue,  3 Aug 2021 21:20:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vK5MvhhXiB7C; Tue,  3 Aug 2021 21:20:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ADFCF40519;
	Tue,  3 Aug 2021 21:20:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 328D91BF9C1
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE8FD404BF
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rj-hjTXDSsZY for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E414A403F0
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 4823E87BB7; Tue,  3 Aug 2021 21:09:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 14 May 2021 22:59:58 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2fd33900f50f6df058263582fba0b0e7c0367996
X-Git-Newrev: 4915b692c84711aa9b7b2d5ea436e4b53d7215bc
X-Patchwork-Hint: ignore
Message-Id: <20210803210936.4823E87BB7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] test_docker_compose.py: Test
 the port publish feature
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=4915b692c84711aa9b7b2d5ea436e4b53d7215bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Extend docker_test() to expose a random (8888) port to verify that doesn't
fail, and extend the docker-compose test to run the busybox httpd in the
background, expose that as port 80 and verify that /etc/resolv.conf could be
fetched by wget.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/conf/docker-compose.yml              | 3 +++
 support/testing/tests/package/test_docker_compose.py | 8 +++++---
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/support/testing/conf/docker-compose.yml b/support/testing/conf/docker-compose.yml
index 49ff2677da..de33251dfd 100644
--- a/support/testing/conf/docker-compose.yml
+++ b/support/testing/conf/docker-compose.yml
@@ -2,3 +2,6 @@ version: '3'
 services:
   busybox:
     image: "busybox:latest"
+    command: httpd -f -h /etc/
+    ports:
+      - "80:80"
diff --git a/support/testing/tests/package/test_docker_compose.py b/support/testing/tests/package/test_docker_compose.py
index 67ee795f21..364f75b5b0 100644
--- a/support/testing/tests/package/test_docker_compose.py
+++ b/support/testing/tests/package/test_docker_compose.py
@@ -37,13 +37,15 @@ class TestDockerCompose(infra.basetest.BRTest):
 
     def docker_test(self):
         # will download container if not available, which may take some time
-        _, exit_code = self.emulator.run('docker run --rm busybox:latest /bin/true', 120)
+        _, exit_code = self.emulator.run('docker run --rm -p 8888:8888 busybox:latest /bin/true', 120)
         self.assertEqual(exit_code, 0)
 
     def docker_compose_test(self):
         # will download container if not available, which may take some time
-        _, exit_code = self.emulator.run('docker-compose up', 120)
-        self.assertEqual(exit_code, 0)
+        self.assertRunOk('docker-compose up -d', 120)
+        # container may take some time to start
+        self.assertRunOk('while ! docker inspect root_busybox_1 2>&1 >/dev/null; do sleep 1; done', 120)
+        self.assertRunOk('wget http://127.0.0.1/resolv.conf', 120)
 
     def test_run(self):
         kernel = os.path.join(self.builddir, "images", "bzImage")
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
