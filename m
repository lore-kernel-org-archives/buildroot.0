Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4105DC36016
	for <buildroot@archiver.kernel.org>; Mon, 31 Mar 2025 20:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F174F40BC0;
	Mon, 31 Mar 2025 20:03:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oijC2RTejh-K; Mon, 31 Mar 2025 20:03:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CCE740BD3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CCE740BD3;
	Mon, 31 Mar 2025 20:03:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FFA61ED5
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 20:03:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5DB1281EE9
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 20:03:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dtvpH7O2uZxJ for <buildroot@buildroot.org>;
 Mon, 31 Mar 2025 20:03:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4894981ED6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4894981ED6
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4894981ED6
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 20:03:09 +0000 (UTC)
Received: from home.juju.sh (unknown [82.64.214.120])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 5D754B00593;
 Mon, 31 Mar 2025 22:03:06 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Mon, 31 Mar 2025 22:03:02 +0200
Message-ID: <20250331200302.207790-1-ju.o@free.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743451387;
 bh=l822nx8IUWK6/yq/h7/GHCPXSFGZaJJs6qIJspsPfLo=;
 h=From:To:Cc:Subject:Date:From;
 b=pQA1OAeWIiy50gKZFu8XfwYwLANzgx0OrxQ2QtPNKxAC1EkxW/8mUEzcvaebeb4SI
 DNn5FQ54/2FoIX4XGpSrFsKYGQGCXC3ksCoPkwhQ7dWVJ1pcrdc3C5K0J0rBEpVHRt
 2GGaikO1TiKgsh26y1jpHLu8JBttjBb8Xc0usOSw+7w18NqZKFNidD6kjCSuuugVz8
 y9yRoMlkfG+NK7CDAHN9eQNcZmYImQj3tPiNW2LqKYwotv3HcTYcqaPyAo9+CsTowK
 8HN2tohaHF+8MVdQLiErDqrw1KojlRpZF6XoL/k3TIIar497tmiDEpLjq80m+Hdqaz
 6SfyTOLhvYouA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=pQA1OAeW
Subject: [Buildroot] [PATCH 1/1] support/testing: weston: fix the weston
 shutdown test
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit [1] "support/testing: improve weston test reliability" moved
out the wait time from the emulator (to run on the test controller).

While doing so, the sleep time which was initially _after_ the
"killall weston" invocation to in stop_weston() was incorrectly
moved before the command invocation. In this state, the test can
succeed on fast host computer running the test. But it will most
likely fail on an average computer.

This commit fixes this issue by moving the sleep time after
the command invocation.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/6561a5d773d8e159556e2b911b315e3b5a0b89b1

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_weston.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_weston.py b/support/testing/tests/package/test_weston.py
index 2ed59a7f15..43b5240b2d 100644
--- a/support/testing/tests/package/test_weston.py
+++ b/support/testing/tests/package/test_weston.py
@@ -58,8 +58,8 @@ class TestWeston(infra.basetest.BRTest, GraphicsBase):
 
     def stop_weston(self):
         cmd = "killall weston"
-        time.sleep(3)
         self.assertRunOk(cmd)
+        time.sleep(3)
 
     def test_run(self):
         img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
