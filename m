Return-Path: <SRS0=vewd=OP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FA48C433F5
	for <buildroot@archiver.kernel.org>; Sat, 25 Sep 2021 14:32:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B72EB60EE9
	for <buildroot@archiver.kernel.org>; Sat, 25 Sep 2021 14:32:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B72EB60EE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 892DD60615;
	Sat, 25 Sep 2021 14:32:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hhPX5tceTrey; Sat, 25 Sep 2021 14:32:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE5B66060C;
	Sat, 25 Sep 2021 14:32:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 223231BF868
 for <buildroot@lists.busybox.net>; Sat, 25 Sep 2021 14:32:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F095827AA
 for <buildroot@lists.busybox.net>; Sat, 25 Sep 2021 14:32:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QxZSH9LDrUAx for <buildroot@lists.busybox.net>;
 Sat, 25 Sep 2021 14:32:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3FC99827A8
 for <buildroot@busybox.net>; Sat, 25 Sep 2021 14:32:04 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e5cb:5ead:8e76:4901])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 85A637802D6;
 Sat, 25 Sep 2021 16:31:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1632580322;
 bh=nWKnDFvf6u8g0MlPSntOsi64u/AKBEMzpoJ2a6NRAl8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FY4CFhcS9y35oABkDVo1sDSqoSEQXvILwZm+CHcDc1xTOxMcryMFL6p/JjmiD+Q8j
 HL54NHaxiYUnl2okD9dBtfl/Fc2t0cYsuL2QNX+SJJw56FWQ5PRSoiRw68fK6bCJNO
 z0xGAOEuvBhxGupNkqAi0llgVekHT0yE9Es/Py03kFtPNihfBx3c4DhZlBe19kYpQO
 KlVZflxcMHiTMdWf2mXrYL2HCNObbsJCVazO9AjUJqDAIPLpAT1P52fkLZfwPAC0Xg
 3GYJgyUdZ2onHuBadPKBNZdKrTUi0BNAuVD4r5gsiUBVT+miP/K7AXp58n1WRtxwX1
 Nt+q4Fa4kvwFw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 25 Sep 2021 16:31:58 +0200
Date: Sat, 25 Sep 2021 16:31:58 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Baruch Siach <baruch@tkos.co.il>
Message-ID: <20210925143158.GM3176@scaer>
References: <1b69453d90cdcf874e4545dcd60b87e9599e16d0.1632314616.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1b69453d90cdcf874e4545dcd60b87e9599e16d0.1632314616.git.baruch@tkos.co.il>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: remove Baruch Siach from
 openipmi
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Baruch, All,

On 2021-09-22 15:43 +0300, Baruch Siach via buildroot spake thusly:
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  DEVELOPERS | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 926c6a27d78c..95142fec58b9 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -294,7 +294,6 @@ F:	package/ebtables/
>  F:	package/i2c-tools/
>  F:	package/libcurl/
>  F:	package/libpcap/
> -F:	package/openipmi/
>  F:	package/socat/
>  F:	package/strace/
>  F:	package/tcpdump/
> -- 
> 2.33.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
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
