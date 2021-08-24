Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96D7DC4320E
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:34:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5353260FE6
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:34:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5353260FE6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 23701407A6;
	Thu, 26 Aug 2021 22:34:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RX3Y_Jbr6toJ; Thu, 26 Aug 2021 22:34:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7827E407B3;
	Thu, 26 Aug 2021 22:34:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1349A1BF33E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:03:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D5A17407BB
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AeAvBkBkQaPi for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 12DEA407D3
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 755898DC50; Thu, 26 Aug 2021 22:01:33 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 24 Aug 2021 23:54:53 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: fe4e06d3176b01834fda92d25ae7ece65f3550e0
X-Git-Newrev: f4ff135e7811417cf4b4accbf3342f35968d34c0
X-Patchwork-Hint: ignore
Message-Id: <20210826220133.755898DC50@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/testing: revert the
 last change of check_network()
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

commit: https://git.buildroot.net/buildroot/commit/?id=f4ff135e7811417cf4b4accbf3342f35968d34c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

check_network() must check the error code of the command
used to check the network configuration with the value
passed as argument "exitCode".

But this argument is ignored since this commit [1].

Revert the last change of check_network().

Fixes:
https://gitlab.com/kubu93/buildroot/-/jobs/1522848308
https://gitlab.com/kubu93/buildroot/-/jobs/1522848306

[1] afc1ed4d5152e0f6e724e6986a1d12c8001b94fe

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/init/base.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/support/testing/tests/init/base.py b/support/testing/tests/init/base.py
index 6a85b87783..7f12186b73 100644
--- a/support/testing/tests/init/base.py
+++ b/support/testing/tests/init/base.py
@@ -42,4 +42,5 @@ class InitSystemBase(infra.basetest.BRTest):
 
     def check_network(self, interface, exitCode=0):
         cmd = "ip addr show {} |grep inet".format(interface)
-        self.assertRunOk(cmd)
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, exitCode)
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
