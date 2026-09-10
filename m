Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3769AC79FBB
	for <buildroot@archiver.kernel.org>; Thu, 10 Sep 2026 19:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8FBD60BDF;
	Thu, 10 Sep 2026 19:15:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vrrp6d8qpRRo; Thu, 10 Sep 2026 19:15:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4152560BD6
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789067753;
	b=VWdX1Vegd4Ct+u/1NL7h+owxT0UWbYlAfiV+R6429ogmg4ysVph8JZdCmnfzutv3LLIY
	 uUwS9ijmEwPcwUFUFuJGShxIKFoemepcq2ABnNLa741ErR7eieMrQ23TXKn08GCYXhRhF
	 gO55f8nUKXtjojaaiwXC2PXCNvsPZ/89ZoQs1ijn9S670z0g0kD2bH0NEFywLmtkKr8Sq
	 2/+uh2/utlfJAV+pqN7o2k6bLi0zMSXF4tQXYseE1FIRf06Awl2/3ElwL05F2dlw0DrtF
	 gKNWIgQUp/2y5CPHg9HpBwmW4fp6Hf6TDR/DvXpRPJbQrraegWeLDlxRs9qS8cetu6Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789067753;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=BM3CbBmBGrHXkVLMose81HL1sft0pwYPfnc843isUmE=;
	b=f2uYIJrbDVC2MMrht2LjlO10sdm5bQ0qW0pLpHupLBoYL85kC2r8txCj49JclZ3BDuWU
	 t2YdlbWPBjAycAuXWPxUEn5D/8JJuM+m5zZxBti3+yACQgu+vG1O/uVpk0lGZk3U9az+y
	 T4PimZ5SSF3s8tbJTIQkWSs9Dx15KRo3UrJacO1tof/wQPQ1SJQ92+IdTg+0Sm8fxaSkR
	 Ut0klKWbjlZjJV/I9dBqeYypcOdEcF6gPu34glSScfIxMg1aXG4rm+Q+Pq2eOjbkuJkmW
	 Eak05s04BsKHBgrhU2rUjVEBoZtQv6ID18sonjHb3f6jC6p1tBQPqS0iiSw7AgSUiKw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789067753;
	bh=BM3CbBmBGrHXkVLMose81HL1sft0pwYPfnc843isUmE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nvNcZeH/ANMeQPagkB36qC+NdVs3OuSa5fgAyRgFObUfW44cPIZFOqVRJF0wG3D/q
	 fJhU3Gk37pAHa6q177YkYbaLxf8MhbTyKakDigbxQLsqTX3GIuN1KCpEQrQr6Fqonr
	 PaDxnEI+nLtXjqL+z/Zy/IVluSE0FZ6XCwW2cANlx2MmKVpXPcQ+3dxkBO0Vd1FDUS
	 s/AG3j9xGmp+9bIX1R/UxeeXuDGoOokzcFortABd01xPCI3M2n/FHgynZirZTmJj/I
	 59VLG0m/bBffIH34eH3uWCAw6C5QE02NXVr0/9MH5BGMXAtpOkXG8HzvV0dF68c92g
	 ZIp/zod00iWYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4152560BD6;
	Thu, 10 Sep 2026 19:15:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8CAE743F
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 19:15:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C062403AD
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 19:15:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q05UhHCgVFNM for <buildroot@buildroot.org>;
 Thu, 10 Sep 2026 19:15:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 9D9DB40387
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789067750;
 b=G/z1ucto3bo1wT0kUD6GYXYdTFXW7kKRRDKu7eigqcLEnHeaFZdCYcyK+ZyB96W2RScG
 kYKdx7laFZZHkj3FrypgVMFjVwMnfhBXOQM5Dt9Kd0OmKM1XII5O/rFihs5ABP4rZAHB/
 7uaGGywW5FMtISmkSvjY7t3e555gRfGn3U+O/SonsgUcOQg0G/98oZHlBlZYqvtQHkZWN
 OOIDB4c1cmArz/69xgsoPnN7pxydxxWUgoK78XEuo9kL3h2H0NNGhOZFGpwjNyMwAeS2K
 xNhpGVg7TvXHQTwlUUbGUaui1gczLgCWfVK4hjdUH0uMr5PioZ6awehWrUpZd0oHPNQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789067750;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=SRjIGcqinUwBzU4hL47sOtM3UKNHlL+0wiBJ/IA0yoU=;
 b=iNNwz4zfxGArMnscoRkD7Sleq4qhdVvWdqNzwL3xjBulI+AdVGApeJjbUKcZ/OXnGqIV
 DmEfxC5luwRUfw3nTaiZTw7ZgwiYdFxTAbSvPrxHOkdYQOAeunz2KgLWNKz61a34+32X2
 zvIjkwU5iqmuHVLH5Ub0A/1O1b4HOqck17g9Z013DUzsDYZhCi9SvhEICL2b7922TWq4v
 0GuRzAhkRJAY2cje8hnVn8Qx0FyL0SzRmL+siIDSnV85erwy30AJdDX4DamSLnmatFKjN
 nMGR9lsmx6wtxWHvSEmPkF1epI2/jb1Ii51pKL7fCx5fcMUhHS9dhGHJJDylZLawdOA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D9DB40387
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 19:15:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0D98A9358C; Thu, 10 Sep 2026 19:14:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Sep 2026 21:14:22 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0f81c9d8cdf53c27cdc019b87c6f4f0126d6323c
X-Git-Newrev: d030e36bbc9669230c015be971b14b6e062cfdde
X-Patchwork-Hint: ignore
Message-Id: <20260910191447.0D98A9358C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] Makefile: Update for
 2025.02.18
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d030e36bbc9669230c015be971b14b6e062cfdde
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 3b03b619d4..2a87b632da 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2025.02.17
+export BR2_VERSION := 2025.02.18
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1787518700
+BR2_VERSION_EPOCH = 1789067700
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
