Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0225CD98ED
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 12:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B4B4417B4;
	Thu, 18 Jun 2026 12:50:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xyv8_uicLVPn; Thu, 18 Jun 2026 12:50:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46C2A41780
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781787041;
	bh=nNuS1w3p5XR1DkT6TD+TcqNrStWzH06PBErERaxUN1s=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=O3QBBhCpYbjSjPHfqXBY3EyEMWadFiA3bwdr1bSLa9OkaxQTaJdV/hizwaolQA+M9
	 4UL4rATGtBv8WrVUgwuqOfMDqXYw/0KdSnGrvQ26rAtMbZKO6Nk4BzgTWHIMuAITpy
	 Gv9IlyCN9d3Roc6AIAE9xGdx3CZSULog9hC90VSFgMwt8MHsxaYNlzT2MDcu1Zzd+o
	 4+3vFNGi3tveoN6Jk1RqSKGHXnROHInS76M8lU/iqdF0I0R9yYlZMDN+HkK9pq5tzH
	 y6WPwMoE6BdvT57nGT1wuBAab+8Wu697GlHqNubeRHA3XkV3fvv+j1XatTqJYoLT0W
	 iJkByIbz2IJcw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46C2A41780;
	Thu, 18 Jun 2026 12:50:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CF3B71F3
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD44983C4F
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zM5iSDkObx_5 for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 12:50:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D326E83C51
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D326E83C51
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D326E83C51
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:35 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1329668206; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 18 Jun 2026 12:49:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1waCBw-0000000CJwO-0GKx;
 Thu, 18 Jun 2026 14:49:56 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 18 Jun 2026 14:48:16 +0200
Message-ID: <20260618124835.2935850-25-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260618124835.2935850-1-peter@korsgaard.com>
References: <20260618124835.2935850-1-peter@korsgaard.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=PLqbvgRuTDkuXAQDuVU5e39HbAfnHk52me3dbaV8Q7jiNk4CzH6J/VkGTKNIEU/ls5S9qJ01PRWy1KmriMY485yQvGfdcPA1ZZ5q3dCmNU//2yKwEBsPdlcZc893YaNMlU6DZ5D+PypuyXqKtiMLuUq9/Yk+biGxeE1+y+TUjCaCGyHxmgykzr8O5z6TghNyma2jAoDvWK0YYl0veIwnwn/iOJKcsTF07atIjBzJMBlL/YYaPUxkFoOMu554XzVUS30rNVmRd7rO9PlbuGN7AAksUfHOXmw7O0NArAl1VPOOyde2Mg9tWnymZNXmXfFHUrxgGODL+m7J+p5WbMGOSQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=7VLeaPcG8SfGRo5ZqOLIb03OLpbwGP7ZrpMWEpz8HNY=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=PLqbvgRu
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH 25/29] support/testing: test_screen.py: use
 assertRunNotOk()
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_screen.py | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/support/testing/tests/package/test_screen.py b/support/testing/tests/package/test_screen.py
index b6264d34df..977aa5b59a 100644
--- a/support/testing/tests/package/test_screen.py
+++ b/support/testing/tests/package/test_screen.py
@@ -27,8 +27,7 @@ class TestScreen(infra.basetest.BRTest):
 
         # There is no "screen" running yet. Listing sessions is
         # expected to fail.
-        _, exit_code = self.emulator.run("screen -ls")
-        self.assertNotEqual(exit_code, 0)
+        self.assertRunNotOk("screen -ls")
 
         # We now start a detached and named session.
         self.assertRunOk(f"screen -dmS {session_name}")
@@ -57,5 +56,4 @@ class TestScreen(infra.basetest.BRTest):
 
         # Since the session is supposed to be terminated, listing
         # sessions is expected to fail (again).
-        _, exit_code = self.emulator.run("screen -ls")
-        self.assertNotEqual(exit_code, 0)
+        self.assertRunNotOk("screen -ls")
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
