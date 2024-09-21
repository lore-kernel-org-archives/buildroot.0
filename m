Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F282CCF9C5B
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 18:49:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B84BA40661;
	Sat, 21 Sep 2024 18:49:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PPkFISJbLpxv; Sat, 21 Sep 2024 18:49:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 773ED42560
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 773ED42560;
	Sat, 21 Sep 2024 18:49:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1206E1BF59E
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 18:49:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0FB040015
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 18:49:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ahKT3u01ivQT for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 18:49:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AAA35400E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAA35400E4
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AAA35400E4
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 18:49:31 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:5d8d:eab4:d280:c2c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id BA5435FF3F;
 Sat, 21 Sep 2024 20:49:27 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 21 Sep 2024 20:49:27 +0200
Date: Sat, 21 Sep 2024 20:49:27 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <Zu8VN_ArWo2K5h5C@landeda>
References: <20240920210836.4093091-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240920210836.4093091-1-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1726944569;
 bh=0N4CRtNqGeRaN5A+x8yeLerlwiNO16bsqz4PYj8pHbw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GdUbnkDHGWWbIaOZ5LHejIknckxB+o7TVN1bzcRh3x8u/EVf0ZpX+S2Jio1UUyyPl
 sXwaWQ3g1wIqpXu6GB6V5bKkXbLg1wM2IlSwEEJ+UeBiXdhsmLyO3lvxfi6rfjexzJ
 FxiJ1eK9/XJluS5uTL4dGJ4kXqiF/v7yTn2WSnXrIVDMLyVRPLghh1WD2DoQDkENVA
 8IFMg27c6luWDuuoczPOmr4Yrv9KjDU9mfgU6nHiyZ2678HqBTuYXncbjMdy8csiOP
 mo6yliUHtVzte34oWOpXkGKjm4NpGExVvnRMKpxEpSnYk1ARLguWL+sbRqhYirg1/8
 +KbsszC/YjAFg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GdUbnkDH
Subject: Re: [Buildroot] [PATCH 01/17] support/dependencies/dependencies.sh:
 fix 'mimic' typo
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2024-09-20 23:08 +0200, Peter Korsgaard spake thusly:
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Whole series applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  support/dependencies/dependencies.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
> index 6d5fc36037..fb0defd0c9 100755
> --- a/support/dependencies/dependencies.sh
> +++ b/support/dependencies/dependencies.sh
> @@ -143,7 +143,7 @@ fi
>  
>  # Check bash
>  # We only check bash is available, setting SHELL appropriately is done
> -# in the top-level Makefile, and we mimick the same sequence here
> +# in the top-level Makefile, and we mimic the same sequence here
>  if   [ -n "${BASH}" ]; then :
>  elif [ -x /bin/bash ]; then :
>  elif [ -z "$( sh -c 'echo $BASH' )" ]; then
> -- 
> 2.39.2
> 
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
