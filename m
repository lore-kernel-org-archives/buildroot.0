Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NUMERIC_HTTP_ADDR,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEE7BC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:11:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B6A960C3F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:11:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8B6A960C3F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58EC840483;
	Tue,  3 Aug 2021 21:11:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NYCoVSC2RPk3; Tue,  3 Aug 2021 21:11:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92C554035F;
	Tue,  3 Aug 2021 21:11:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3DB2C1BF9C1
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B225840275
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yio5-9PHtePB for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F19940235
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 552E487BB7; Tue,  3 Aug 2021 21:09:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 14 May 2021 23:00:16 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4915b692c84711aa9b7b2d5ea436e4b53d7215bc
X-Git-Newrev: aa31d10808df0560cc9e9b92acadad1af9a041e9
X-Patchwork-Hint: ignore
Message-Id: <20210803210936.552E487BB7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] test_docker_compose.py: Test
 the volume mount feature
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

commit: https://git.buildroot.net/buildroot/commit/?id=aa31d10808df0560cc9e9b92acadad1af9a041e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Extend docker_compose_test() to expose /bin on the host to the container
through a volume mount and verify that /bin/busybox can be downloaded and
contains the right data.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/conf/docker-compose.yml              | 4 +++-
 support/testing/tests/package/test_docker_compose.py | 3 ++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/support/testing/conf/docker-compose.yml b/support/testing/conf/docker-compose.yml
index de33251dfd..ce89d79b59 100644
--- a/support/testing/conf/docker-compose.yml
+++ b/support/testing/conf/docker-compose.yml
@@ -2,6 +2,8 @@ version: '3'
 services:
   busybox:
     image: "busybox:latest"
-    command: httpd -f -h /etc/
+    command: httpd -f -h /www/
     ports:
       - "80:80"
+    volumes:
+      - "/bin:/www"
diff --git a/support/testing/tests/package/test_docker_compose.py b/support/testing/tests/package/test_docker_compose.py
index 364f75b5b0..737dbf393c 100644
--- a/support/testing/tests/package/test_docker_compose.py
+++ b/support/testing/tests/package/test_docker_compose.py
@@ -45,7 +45,8 @@ class TestDockerCompose(infra.basetest.BRTest):
         self.assertRunOk('docker-compose up -d', 120)
         # container may take some time to start
         self.assertRunOk('while ! docker inspect root_busybox_1 2>&1 >/dev/null; do sleep 1; done', 120)
-        self.assertRunOk('wget http://127.0.0.1/resolv.conf', 120)
+        self.assertRunOk('wget -O /tmp/busybox http://127.0.0.1/busybox', 120)
+        self.assertRunOk('cmp /bin/busybox /tmp/busybox', 120)
 
     def test_run(self):
         kernel = os.path.join(self.builddir, "images", "bzImage")
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
