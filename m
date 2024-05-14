Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 606E2C25B75
	for <buildroot@archiver.kernel.org>; Tue, 14 May 2024 15:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0977C82306;
	Tue, 14 May 2024 15:41:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SMIXrbugjgom; Tue, 14 May 2024 15:41:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0417682AF8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0417682AF8;
	Tue, 14 May 2024 15:41:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 58EF21BF4DB
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 15:41:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5265141596
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 15:41:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r07Lpo_ypHIR for <buildroot@lists.busybox.net>;
 Tue, 14 May 2024 15:41:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2E049415A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E049415A8
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2E049415A8
 for <buildroot@buildroot.org>; Tue, 14 May 2024 15:41:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id C23FD13FA3B;
 Tue, 14 May 2024 17:41:00 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 14 May 2024 17:41:00 +0200
Date: Tue, 14 May 2024 17:41:00 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Message-ID: <ZkOGDJ-hOO51bzD7@landeda>
References: <dc678054-0f96-4f69-a4ff-de669919ad06@grenoble.cnrs.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dc678054-0f96-4f69-a4ff-de669919ad06@grenoble.cnrs.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1715701263;
 bh=irUzcNtiXXwVNceXyjF5t3TS6cFfPqxprvqSjUa3UE0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hpuRHFpHfyJi236BWT+rdu0GuHvLgMDg0pAaf/3rhuR7ZAXvWwfeUbIoKfx82K1bt
 NGGQC1DuJdvcLxMOdeeVEWSqzjci0zKMtOV86GL9bc0W3t9yyCaae8Ld2XtgUXLVGu
 DB3EBpWWsudgsYni3EkSfaMrIQ54efrgcE6b2G2B9lq7fmaaaHcaILCrDQD+Bp3p+k
 iJULUHSic1XF+DwRn/gL23MWCOBT23IGuUpqzKpRkfGZDGydpPIDyZ6hS+Q+2DpRmt
 G39sB7romNYNOCF19X/UqHMqQRUHilmgJZ59yaZwoLZXegD4dfRJ+nPdf7b6QlGm7m
 EETwRpPRn5J6w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=hpuRHFpH
Subject: Re: [Buildroot] [PATCH 1/1] board/acmesystems/acqua-a5: fix hash of
 at91bootstrap3
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
Cc: Biagio Montaruli <biagio.hkr@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Edgar, All,

On 2024-05-14 14:22 +0200, Edgar Bonet spake thusly:
> Commit 5b847f88fef7 (board: update hashes for generated achives) updated
> the file
> 
>     board/acmesystems/acqua-a5/patches/at91bootstrap3/at91bootstrap3.hash
> 
> by changing the file name suffix: -git3.tar.gz -> -git4.tar.gz. It did
> not, however, update the hash itself. Do it now.

I knew I would miss some things here and there. I hoped I wouldd not,
but I knew I would...

> Fixes: 5b847f88fef768c8e79422db4193533b3a7488ea
> Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>

Applied to master, thanks for fixing my mess!

Regards,
Yann E. MORIN.

> ---
>  .../acqua-a5/patches/at91bootstrap3/at91bootstrap3.hash         | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/board/acmesystems/acqua-a5/patches/at91bootstrap3/at91bootstrap3.hash b/board/acmesystems/acqua-a5/patches/at91bootstrap3/at91bootstrap3.hash
> index 3734f22c95..6edf3d3345 100644
> --- a/board/acmesystems/acqua-a5/patches/at91bootstrap3/at91bootstrap3.hash
> +++ b/board/acmesystems/acqua-a5/patches/at91bootstrap3/at91bootstrap3.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated
> -sha256  fef34111a07d9e5aa97b0840355a367f806a17e029583830e9deaa747ce47824  at91bootstrap3-v3.10.3-git4.tar.gz
> +sha256  5ea2a8fed1ba0024229c6f6d77176679e1b24791bdbce8e285634013d4a93551  at91bootstrap3-v3.10.3-git4.tar.gz
> -- 
> 2.34.1
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
