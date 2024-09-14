Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B20C02195
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 12:46:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A262D40523;
	Sat, 14 Sep 2024 12:46:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MaTLVm4993-s; Sat, 14 Sep 2024 12:46:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A7D74059B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A7D74059B;
	Sat, 14 Sep 2024 12:46:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C8BC31BF232
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 12:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C422360769
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 12:46:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2jezSCaKn2w8 for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 12:46:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E0284606E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0284606E7
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E0284606E7
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 12:46:51 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [IPv6:2a02:61:a2::3f4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id D5C9478050F;
 Sat, 14 Sep 2024 14:46:47 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 14 Sep 2024 14:46:47 +0200
Date: Sat, 14 Sep 2024 14:46:47 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZuWFt3u8_zI3beOt@landeda>
References: <20240914101527.31256-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240914101527.31256-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1726318010;
 bh=CJSbJjakn2pOT5zVT97yvp8OS8t1OKQYaejOpmgWdB8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KnfWfHNgOmhbL/m9xrn2EI13qyqqXg7M2wTw4kLGqEwkrawZtVr/WBDLtCrTi6Tym
 n1sDPxrVHoPgUY9j6eKreKT/pQEpIWZI/UIE8d96HWP3UAYf4aOt0fqacZpuT6GDj/
 mw9+/RKKyQI8Ve/DXdgN8o1LqZH12oisDVl0hBSDoOoAhfN1yI+njq3ba6EC0gtX5V
 AeZXGL6/GHBYPPFZKzJLSvTvezE6U0E0ZH+DfXayPKUFPa9n6MeJRFlIZ0ZAWv7tYc
 FQbiUS0eD9NULwPxPMz+Qp8Em5+rFlTAOuEkF8MC4CPrw0Y17TSwT52Hbiiv1TZZaW
 Yh0o4E+FxQKtw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KnfWfHNg
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: drop Samuel Martin
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

Thomas, All,

On 2024-09-14 12:15 +0200, Thomas Petazzoni via buildroot spake thusly:
> Samuel Martin has not been around in the Buildroot community for many,
> many years. His last posting on the mailing list was on July 2018. So
> let's not pretend those packages are actually maintained, and let's
> stop spamming Samuel with lots of patches and autobuilder failures.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  DEVELOPERS | 14 --------------
>  1 file changed, 14 deletions(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 479ebeed37..c9f805a82c 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2898,20 +2898,6 @@ F:	package/zoxide/
>  N:	Sam Lancia <sam@gpsm.co.uk>
>  F:	package/lrzip/
>  
> -N:	Samuel Martin <s.martin49@gmail.com>
> -F:	package/armadillo/
> -F:	package/cwiid/
> -F:	package/flite/
> -F:	package/nginx/
> -F:	package/opencv3/
> -F:	package/openobex/
> -F:	package/pkg-cmake.mk
> -F:	package/python-numpy/
> -F:	package/scrub/
> -F:	package/urg/
> -F:	package/ussp-push/
> -F:	support/misc/toolchainfile.cmake.in
> -
>  N:	Sam Voss <sam.voss@gmail.com>
>  F:	package/ripgrep/
>  
> -- 
> 2.46.0
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
