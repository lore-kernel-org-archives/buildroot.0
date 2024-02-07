Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA2DC4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 09:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A0DF82BC3;
	Wed,  7 Feb 2024 09:41:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 83_aHa65Kz6b; Wed,  7 Feb 2024 09:41:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68C7682EFC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68C7682EFC;
	Wed,  7 Feb 2024 09:41:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 12C851BF868
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 09:41:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5AA661362
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 09:41:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ECv_f6LkSrxc for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 09:41:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CA7A761371
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA7A761371
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CA7A761371
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 09:41:18 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 97AE013FA38;
 Wed,  7 Feb 2024 10:41:11 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 07 Feb 2024 10:41:11 +0100
Date: Wed, 7 Feb 2024 10:41:11 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <ZcNQNxGAr-y-htEL@landeda>
References: <20240206175330.570115-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240206175330.570115-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707298876;
 bh=NgxsTA0sW9YpEe2kjQTUW8Xr6hpMCkq2CCRz+p4UcE0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=feUNINa6HWBF3/T8yVUPcFhCvYWBuRuyz/Jp/dR13u/uq+WR5U/4TWVkMisyf+52s
 SvuRrPrmiDI/3oOU2Mbq+AcSmYKwSgGHaRQ0MTx9oIp4f3BszPzSNnuztwmtiBaypN
 nhTLZ4i8kVdlXseNysou7xbzlnirF06DLcyCRMS56BK5MJhli5/eMB36Y6k1heVO21
 q6p5QzO8rBug+xgWMMCne5M09O6T3fHLOeRToG+gcXksV6lBFMs6fBu3kOlaIhfIKf
 +obrzYBEcTDTHdVZxBvuacbrjNr44IvXDqjn1C7svv+TRuStgU943eKioZuqxfy/Tk
 U3o3kNy3pXCqQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=feUNINa6
Subject: Re: [Buildroot] [PATCH 1/2] package/tinyxml2: add host variant
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Samuel Martin <s.martin49@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dario, All,

On 2024-02-06 18:53 +0100, Dario Binacchi spake thusly:
> It is required by package uuu starting from version 1.5.165.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/tinyxml2/tinyxml2.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/tinyxml2/tinyxml2.mk b/package/tinyxml2/tinyxml2.mk
> index 5ea9e13a4b0b..f53e8d6b9926 100644
> --- a/package/tinyxml2/tinyxml2.mk
> +++ b/package/tinyxml2/tinyxml2.mk
> @@ -16,3 +16,4 @@ TINYXML2_CONF_OPTS += -DBUILD_STATIC_LIBS=ON
>  endif
>  
>  $(eval $(cmake-package))
> +$(eval $(host-cmake-package))
> -- 
> 2.43.0
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
