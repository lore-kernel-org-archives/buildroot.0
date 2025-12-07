Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B8CCD1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 22:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33938406EF;
	Sun,  7 Dec 2025 22:12:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FVohHXORsslv; Sun,  7 Dec 2025 22:12:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0ED11406DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765145560;
	bh=lWUo0f0Ulj2phNRcL1iPcD9mvgqj0XhcEHUY/t4vLoY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EZwhp36Dvtk97mntwMgOTMhoYizw/n7miV2NBxH6/BMEpT6MMmr1to2hpdIUlP1Nm
	 cdQJiYscXg7MLTyIWLL/+Wbmmt+2WZNE2cw+tlnx9cdp5a0D7jTfFywORu6Fpx8OWd
	 i8sIl/u1qFMLwAuWpVHr4Yx4cx+pk8qaSVeIBtusB9S4RGc9XEpY9G44a70zUz8SOt
	 MrbxoJP27OvX9Ss5s3nbfKZnVnl4gIjA3kkZRprenYUqiKkUi56jLjnS8GYFfITJXy
	 C/MtIKNNcJPxmi+EEuSwreyPbgrMcLIvI8vpT2vl5zi+I7QRmXvDrjXJokfihmUskO
	 L8pbCQBR72P/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0ED11406DE;
	Sun,  7 Dec 2025 22:12:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 19C3AE7
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 22:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EDEFB406DE
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 22:12:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iCNTZc5rmv8X for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 22:12:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E4881406CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4881406CD
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E4881406CD
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 22:12:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id A758060132;
 Sun,  7 Dec 2025 23:12:34 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 07 Dec 2025 23:12:34 +0100
MIME-Version: 1.0
Date: Sun, 07 Dec 2025 23:12:34 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251206095325.2091213-1-giulio.benetti@benettiengineering.com>
References: <20251206095325.2091213-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <e2b8b2dd522fea40dadd44a732fc1372@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765145555;
 bh=rTB649uY7wU8O4eiXoHcS5AOWrP1yhjpqEG8wXd13wA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tVExF+g8EFH7bCIJk23o/VqhhbmBjhozHy/pDOD8GJeYhg3heqMMl9NfCBEqTY9LW
 xXUJgtYUaUTZzNUmuChB0HUH057X/zPrrRApmdXBBFvHXNm8plz43ExM72oUZOD+Uf
 O7dUJdzsDI6Rswa4Gn2lT13f5urBP0Iy0lexRqm4bPzPywfJHvnI7pVcO4ARwjP8Qt
 fKJO5gYNWA5Zj+G0LeSh7qLA3j6Dxrhi3twlEFgkwGd9Fr/k54DPuncbqhBWDfPVrk
 D8pHO4852P8AxVEmCmRSvIRiY7IXYR0RPPJVCyfhdjJ5flbqzPguo6hH1eXQLxrWUS
 ipKxwdnbux0iw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tVExF+g8
Subject: Re: [Buildroot] [PATCH] package/libnspr: bump to version 4.38.2
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio,

On 06/12/2025 10:53, Giulio Benetti wrote:
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

libnspr was already bumped to 4.38.2 in branch next (master is in rc). 
See:
https://gitlab.com/buildroot.org/buildroot/-/commit/382faf08aa595a7b42d96d97fc6d5b6577d84652

I just marked this patch as "not applicable".

> ---
>  package/libnspr/libnspr.hash | 4 ++--
>  package/libnspr/libnspr.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libnspr/libnspr.hash 
> b/package/libnspr/libnspr.hash
> index 172778540e..9148cf393e 100644
> --- a/package/libnspr/libnspr.hash
> +++ b/package/libnspr/libnspr.hash
> @@ -1,4 +1,4 @@
> -# From https://ftp.mozilla.org/pub/nspr/releases/v4.37/src/SHA256SUMS
> -sha256  
> 5f9344ed0e31855bd38f88b33c9d9ab94f70ce547ef3213e488d1520f61840fa  
> nspr-4.37.tar.gz
> +# From 
> https://ftp.mozilla.org/pub/nspr/releases/v4.38.2/src/SHA256SUMS
> +sha256  
> e4092faeab77bdc9b32db1113e4215948ee768e26c4666db3b5a60b35f2c9105  
> nspr-4.38.2.tar.gz
>  # Locally calculated
>  sha256  
> fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  
> nspr/LICENSE
> diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
> index a045140743..3c7351c2d7 100644
> --- a/package/libnspr/libnspr.mk
> +++ b/package/libnspr/libnspr.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -LIBNSPR_VERSION = 4.37
> +LIBNSPR_VERSION = 4.38.2
>  LIBNSPR_SOURCE = nspr-$(LIBNSPR_VERSION).tar.gz
>  LIBNSPR_SITE = 
> https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_VERSION)/src
>  LIBNSPR_SUBDIR = nspr
> --
> 2.47.3

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
