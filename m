Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 535A4C79FBB
	for <buildroot@archiver.kernel.org>; Thu, 10 Sep 2026 19:40:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CAC34037B;
	Thu, 10 Sep 2026 19:40:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OBSfgEkE8izF; Thu, 10 Sep 2026 19:40:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5CB2840AB9
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789069214;
	b=tWh1OFuIdJetnel/SYRdf6qvzxK6ouAvii8+lxgUJvd0P8ITZ8zlkfVnApLyEoTGvxOe
	 A69f6uW/p4CjQx4updOLRpdrCZU28c0MmGGGH0Dr+JOINr0RuBNySrP33Tzcrd7pRHE2U
	 BtcoGfyDu1Zec3An6RPL5m7Du4sJ6EP8y/4kQTS2ssKziwDYkB520L/3fWR7U8NY1R4ZD
	 rfVO0OAS74qPM8KkXOMXc+hy1um26zUGilbtVL5zWoOfNLJsJWCSfBfO1/3vY2+EYFT02
	 SJLnJGZp5mmNhsNHIa/pB5tHChRpSJzrDmxr6estfisYHoNFJG06oBT9gUbA+kGOwcA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789069214;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=zwssaht+Z1iMcWVfVxU7RGIBpecspvzcxpvRcVxKP1M=;
	b=cqXe84uz3dNeyfP8g05mGYwYg/bwdz2ipguINfwQiKzHermRDPLcB46m8OsmGXcfBKyr
	 Y9KY2Hf3IFP6BgKvnIxnJcAJJ5JXjjMkyM4NUhvh2DI1qe2cJ4XCHcK3LF0n251Q6qHmr
	 dWaisdyalLTLbji4yf8B0mk1YHUGzU4jg2a5eWjeONL5oLPuXWwEzMIkt0PIozrXBR9vY
	 eY1CpMhelBe+3K2jsQfrlc6375IjuJSpgQNvyg4vB5HJbj21Q8QfYFx+NeggThp09eHPh
	 sWRnl3nyY+DrnzaGpk/CrRpYwkQZiDQRXaISvQw3vfWGkocgb7tqIdRHEpW1lWXzzAA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789069214;
	bh=zwssaht+Z1iMcWVfVxU7RGIBpecspvzcxpvRcVxKP1M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=De1F3yANZ3hzt4tomRdVwtZmWl85Omr0g32kITTOSy/RwF5WvMlq30/steQnn8HB9
	 zc0xcMLpbGGdRcROr7XMeWDHEThUA2X1POdBH72X2jcsbA7bhLYqx66hrILtR2M7nr
	 TM9FAxHQdwpaKuRZEalnS0N3NryCs/P40ZvBeTfQx71JkMWzg9NXuuSg/BzLIDBWkU
	 O0eyJXvEZ46hyz3BvSNbBkhU2i09E67qE1wMYkU+Z0SuDeNq467iShSk1TkV9mSUgp
	 fqByYF/Q9AiDJf4h5CohLDwT9U7YP4iFl+hoR2Za0vHouCxwpCPRsrBL1MRzAFvkCe
	 AvW3tSO5tvTuQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CB2840AB9;
	Thu, 10 Sep 2026 19:40:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 74CE92104
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 19:40:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5AB0F60BD7
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 19:40:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BWCfn1QRZbIj for <buildroot@buildroot.org>;
 Thu, 10 Sep 2026 19:40:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5284E60B7B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789069210;
 b=sWd1GeoW74+ip8iTLbkg6c5ISPWyeuIWabOzc81N1rIYgqwKF7AMR9qg0us05F4I/yaZ
 VXWdwf+93UoQvcAe+kqaZ+3ZHE5M/u21ADpMwmy0qQdOjGaH9qIOFUYx6JA/TDm4tjrlS
 VM9vBTStFBn2l34AvGuaHcSKLHKlF+DwtGzNLJ+3Owhbu0En4uY+x4GjAYOkVREQNhOhN
 TglisnVsLTUqAgd5D+6/58hSdpRv6OyGnHVPFj0vmfwIv5EpGcuD8/FUXXqLbr1lfU7y2
 TcBMLdP3AIJpUAePQmE/gQs4+dLitA+vLRNBUEECN/2ax3x4KIGCMtoTVAqigeatahQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789069210;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=W1wmj8/eOu3MLd8k7iRnRq3UuAgrBOXyovLyc2wfYjI=;
 b=hY5d7b564go+SMUJ+mtG0+cOlP0QJ9N7H/Br/l+sz6FZhTRD3Z19a8PKd9/ug2PFopFQ
 AYK2fC8V+RITJGdITTeiZadkRnbEdfrcprrjOYuvt+R2gFOqYKBOezkz1bw91ISQNQIIb
 Ia/W2RQpILbR5RSjCKEJtrYClKyCDILDX/EKKyVPZeCRey2X9sYVyODurCukuBp0KBlPj
 IiIg+/Gju3MgA+AQsmwYPUctdPOF0rQ06VS2+x8/Yw5FjMeGUBofwlr5frPv01Gr4CZkK
 3IqClF033Dk4PUMD9Xwlz00TFpKcKx/B0GKQIq/adFPoFExOPYfnAZUupy+MsPGUy4g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5284E60B7B
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 19:40:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C2A8795479; Thu, 10 Sep 2026 19:39:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Sep 2026 21:38:38 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 4b06935cb01309f874806a173a10f2fccb1eeaa7
X-Git-Newrev: 93e8f75c559a6efd6d4b503123e4755bb2a49576
X-Patchwork-Hint: ignore
Message-Id: <20260910193906.C2A8795479@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] Makefile: Update for
 2026.05.3
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/93e8f75c559a6efd6d4b503123e4755bb2a49576
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index e3dd63518d..b86b84f273 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2026.05.2
+export BR2_VERSION := 2026.05.3
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1787518800
+BR2_VERSION_EPOCH = 1789069200
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
