Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A83C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 09:25:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E6FE6402D4;
	Mon,  3 Jun 2024 09:25:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jZ8rKENv7B9E; Mon,  3 Jun 2024 09:25:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E814040350
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E814040350;
	Mon,  3 Jun 2024 09:25:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 617A21BF3EB
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 09:25:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D27580ED9
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 09:25:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OBxN0J5pCoIO for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 09:24:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 32C4C812E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32C4C812E3
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 32C4C812E3
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 09:24:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 35D4113F81D;
 Mon,  3 Jun 2024 11:24:55 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 03 Jun 2024 11:24:55 +0200
Date: Mon, 3 Jun 2024 11:24:54 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <Zl2L5jxjTdIQO_v7@landeda>
References: <20240603072829.539067-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240603072829.539067-1-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717406697;
 bh=NFTdh7ZgkjXVAFUyRkS42HcCrZp/Bt490Ck8V7WvzZQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Khp622zn8Fx9e7sqqLIpfoAs2fJnlYRrpJWCMC4jsTqUuITsCGU/IJMxffjkQYqGl
 XsqQTohviGuFb7urqSrKaB3xH9EzlT8WCtpkFC6cVxDmNOs8OYYuy/uIwyRnWE5HWD
 2ZhGHLnP9pBqbtGAkh9HFt8RTAE1F09NjtB+U/diBWULQpkq+QEtm7V2Q2xX5LjypC
 gNvlkZ6VUB4H5jQsQoIrF/WyVg/MnMixDUiGDVJivHJAz43NzScv+7NG8kJMplJBdK
 dkzUdaOeVglAJEpC5A9zpC75zc3+s5p6aMrGg4/ZW2Td4+Dm/wEA8ofxEDTltlZ6Z0
 lEHzmKagIwJRg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Khp622zn
Subject: Re: [Buildroot] [PATCH] Config.in: drop --passive-ftp from default
 wget options
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

On 2024-06-03 09:28 +0200, Peter Korsgaard spake thusly:
> Fedora has recently migrated to wget2, which has dropped ftp support and the
> --passive-ftp command line option:
> 
> https://fedoraproject.org/wiki/Changes/Wget2asWget
> 
> It turns out that the command line option also doesn't do anything for wget1
> as it was made the default in wget 1.10:
> 
> https://git.savannah.gnu.org/cgit/wget.git/tree/NEWS?h=v1.13#n292
> 
> wget 1.10 is from 2005, so it is safe to assume that all supported
> distributions use >= 1.10.

Safe bet, I believe.

> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Config.in b/Config.in
> index b5a94325c4..bdf5fa8647 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -105,7 +105,7 @@ menu "Commands"
>  
>  config BR2_WGET
>  	string "Wget command"
> -	default "wget --passive-ftp -nd -t 3"
> +	default "wget -nd -t 3"
>  
>  config BR2_SVN
>  	string "Subversion (svn) command"
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
