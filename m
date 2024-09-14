Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FCD0C0219D
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 14:11:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00672406E1;
	Sat, 14 Sep 2024 14:11:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CWuAqmJBlWxt; Sat, 14 Sep 2024 14:11:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBAC3409AE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBAC3409AE;
	Sat, 14 Sep 2024 14:11:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 292801BF3FC
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 14:11:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16BB2409AE
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 14:11:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B7ydxXOdIeet for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 14:11:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D3118406E1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3118406E1
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D3118406E1
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 14:11:41 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [IPv6:2a02:61:a2::3f4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 420A6780331;
 Sat, 14 Sep 2024 16:11:35 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 14 Sep 2024 16:11:35 +0200
Date: Sat, 14 Sep 2024 16:11:35 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Parthiban Nallathambi <parthiban@linumiz.com>
Message-ID: <ZuWZl7iTpr72tGbT@landeda>
References: <20240914125406.3026002-1-parthiban@linumiz.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240914125406.3026002-1-parthiban@linumiz.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1726323100;
 bh=+Z2QXEMvwrrvwkUKIEmifJxEQJ7pWfkHwhHFb+A9Q0s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=caYyniBVd+k2lpDBWoSdzWPNZh2sJ3X4RHxQlX4HtvjBUg5e8BMA9w6yp/Ip9OqeA
 a8OGY8HykY9EoFhjwJCuDS3ICXMEd9UbtZaWqw686g6jszy0et3WS5hZh6ZnMDmFmn
 ++K8wiYGqKPEcdhemQDCGPm1Ch8pW0BNJItsySzE517/uKmCWM94r2F0kH1bdyf0W8
 do4GnQmqqixffkfcKqsXId1jT+SRwKoztghfGMyvgI/60HiMFaUmPatabpwCbfapaR
 HkQVQ7cr8kh1ZlfUN7v/y5vwtiL3xhhTiURbvg9LrAAiT7XTK9j02JD1+hCnobvcL6
 2+DE9uVUUrYtA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=caYyniBV
Subject: Re: [Buildroot] [PATCH] bluez5_utils: disable asha profile
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
Cc: marcin@bis.org.pl, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Parthiban, All,

On 2024-09-14 18:24 +0530, Parthiban Nallathambi spake thusly:
> asha profile as it depends on audio profile which isn't selected
> by default (BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_AUDIO), results in
> below linking failure.
> 
> ld: profiles/audio/bluetoothd-asha.o: in function `get_transport':
> asha.c:(.text.get_transport+0x2c): undefined reference to `media_transport_get_path'
> 
> Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>

Applied to master with the autobuild reference you later mentionned,
thanks!

Regards,
Yann E. MORIN.

> ---
>  package/bluez5_utils/bluez5_utils.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
> index b1caef5cc5..59eb68de61 100644
> --- a/package/bluez5_utils/bluez5_utils.mk
> +++ b/package/bluez5_utils/bluez5_utils.mk
> @@ -28,6 +28,7 @@ BLUEZ5_UTILS_CONF_OPTS = \
>  	--disable-lsan \
>  	--disable-ubsan \
>  	--disable-pie \
> +	--disable-asha \
>  	--with-dbusconfdir=/etc
>  
>  ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_OBEX),y)
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
