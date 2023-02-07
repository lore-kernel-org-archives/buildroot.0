Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB56C636D3
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 17:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EF4C418CB;
	Tue,  7 Feb 2023 17:23:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EF4C418CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MLJYF3G2dncK; Tue,  7 Feb 2023 17:23:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC02B40342;
	Tue,  7 Feb 2023 17:23:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC02B40342
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9851D1BF5F6
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:23:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7274B81426
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:23:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7274B81426
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rfQOqwwfX6lw for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 17:23:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88D4D81065
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 88D4D81065
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 17:23:19 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 9E32F13F8DF;
 Tue,  7 Feb 2023 18:23:15 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 07 Feb 2023 18:23:15 +0100
Date: Tue, 7 Feb 2023 18:23:15 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20230207172315.GM4124@scaer>
References: <20230207163119.292389-1-thomas.petazzoni@bootlin.com>
 <20230207163119.292389-2-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230207163119.292389-2-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675790597;
 bh=esajML1cLTEZUQRiGcRNUBzcip77wS4umUBxCrwiQ8k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nznakSOax7lWtvi/fvDD1bTOZtfpjgUydzdqEdCtW2nBiMKN0KONUkEtO5JRdb5CR
 m48r9jvLsuHIe3A8jWhvuhh+LV06TntRLhj8EWCK52lpcKJPfyOnkJW7V6KzqfVYH7
 NGBVWdpaxUeOzT3wsa7mXhUvDhkdWiaZvJr8vYjg2x7sQV/FAsGGaItVXCrcQQVDxm
 XioCQ4q6viwrEP7zw9zy0XFf07VQ7hUpDRgmHZURREI/bE33MKNaW9/lTBrQhRW2cv
 wHgpKMggPIx70AAgVTv2D/gqg/C+QxtRdDAo94FQG8jK2psgxqwi2nNmQzZm6wsGOw
 +TaoB0pBGVYng==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=nznakSOa
Subject: Re: [Buildroot] [PATCH 2/3] support/docker: use APT::Retries in
 apt-get calls to retry
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
Cc: Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2023-02-07 17:31 +0100, Thomas Petazzoni via buildroot spake thusly:
> snapshot.debian.org is notoriously slow, and quite often leads to
> timeouts when downloading packages. To give us a better chance of
> succeeding, let's retry 3 times before failing.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  support/docker/Dockerfile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
> index de1534e77a..a16c1e3849 100644
> --- a/support/docker/Dockerfile
> +++ b/support/docker/Dockerfile
> @@ -20,8 +20,8 @@ COPY apt-sources.list /etc/apt/sources.list
>  
>  # The container has no package lists, so need to update first
>  RUN dpkg --add-architecture i386 && \
> -    apt-get update -y
> -RUN apt-get install -y --no-install-recommends \
> +    apt-get -o APT::Retries=3 update -y
> +RUN apt-get -o APT::Retries=3 install -y --no-install-recommends \
>          bc \
>          build-essential \
>          bzr \
> -- 
> 2.38.1
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
