Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C64AEC4332F
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 18:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A4F260E3E;
	Tue,  1 Nov 2022 18:15:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A4F260E3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cjY6WkadaHXE; Tue,  1 Nov 2022 18:15:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96C1F60E38;
	Tue,  1 Nov 2022 18:15:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96C1F60E38
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 869301BF5F8
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 18:15:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 896998138B
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 18:15:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 896998138B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oLeq8pqxoDfV for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 18:15:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF33A81296
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 18:15:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF33A81296
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A890B8799E; Tue,  1 Nov 2022 18:15:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 1 Nov 2022 19:14:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 685d8a031896352abfbbca65d3e433e06fef620a
X-Git-Newrev: f486521b27711ecad71d3241645e3036efaf9d23
X-Patchwork-Hint: ignore
Message-Id: <20221101181512.A890B8799E@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 support/testing/tests/package/test_docker-compose: quiet overly verbose
 output
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f486521b27711ecad71d3241645e3036efaf9d23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Docker compose up outputs terminal control characters intended for
interactive output viewing.

Wget similarly can use the -q option to produce quieter logs.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_docker_compose.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_docker_compose.py b/support/testing/tests/package/test_docker_compose.py
index c940cc8839..a833c68233 100644
--- a/support/testing/tests/package/test_docker_compose.py
+++ b/support/testing/tests/package/test_docker_compose.py
@@ -40,10 +40,10 @@ class TestDockerCompose(infra.basetest.BRTest):
 
     def docker_compose_test(self):
         # will download container if not available, which may take some time
-        self.assertRunOk('docker compose up -d', 120)
+        self.assertRunOk('docker compose up -d --quiet-pull', 120)
         # container may take some time to start
         self.assertRunOk('while ! docker inspect root-busybox-1 2>&1 >/dev/null; do sleep 1; done', 120)
-        self.assertRunOk('wget -O /tmp/busybox http://127.0.0.1/busybox', 120)
+        self.assertRunOk('wget -q -O /tmp/busybox http://127.0.0.1/busybox', 120)
         self.assertRunOk('cmp /bin/busybox /tmp/busybox', 120)
 
     def test_run(self):
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
