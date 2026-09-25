Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73051C9830D
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A32460DBF;
	Fri, 25 Sep 2026 14:45:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zzlWxOkQFqMv; Fri, 25 Sep 2026 14:45:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 31F7260D91
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347549;
	b=VsHxptUP+uyOoyRa1irD7Sftn5BhuGC4Xr8KrEVrYRRanEMHlF+9LS8+OHlfVAIgYss+
	 wLnNW7JDnj/LMGX6gefHutQOc/QvZMx/dO15ZDXnqg37eKvhyDfnjhnQTE2wgIM9kt+NB
	 F6kJib5lDeL183kaJAi8AdJdXNUJh0tO/TxffgZZ995Mg9nNrHAsnvJadbQpKX84gk/nn
	 +e6ahWtjadPeODnbg39lV2vAhjFr/KJonYHmhzjZSjF2t0R+jUtFJ/YY+s/4SsFPXuw5F
	 UaTQjRLLT5vG0ipOM30XrUKYgWD9YLhDWd9CzLyXKW678IO3YC0Usc3zRMTmW5C6sJA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347549;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=3rO1l2/t7SrnygduTrMZ1T3HB/lS4eLuFK4MAWb7id0=;
	b=ETtUEYuZXtQITczyLgJ3dGig+XNA3/+BbzdJh45HWywMfv3MsxMRL7x8KM+/vBr+XWkM
	 L83jEGASV7jXQS2c2U7GsRQ3SlNdI4XPVpEGVYiQWTXRaFYBd3J5FnfF/S8XsP2Ycc9Tu
	 hSFIle7gFJfsgy8HYEP7B7dbDGw1ZngOIaD6nY086ostlL+bGmu7Huiwo/T8f74z8Efzd
	 +5pJ81Lk4De89NEysO7iyyl/r0EBkK75f4QVHSncDp1+aLIDR3kCgOo/d+uAKuN6yLo9W
	 cLtHR3uQQgSJ6iuD9nyxNQA4OPp3rUN8pu6S9+b3wsuf2t3HN7IWAOudwNLhcpG/8DQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347549;
	bh=3rO1l2/t7SrnygduTrMZ1T3HB/lS4eLuFK4MAWb7id0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Q4s8pxlfaO1x0JNrLLOWhDVWhhgtPrJ7KwRP+zCcmnTLCNADjxbQSdWZ90PZc6zk+
	 ZLGI6po0Pzch1aRYpzHmixwhexPEdi/LUWWFKeoiyPK+FPG8Qqrr+NfrqSEkQjtIra
	 gY9NWBufcY/V+7m5j7u7LmF3mAzmvcvIDioslrbeRp73yQd8NDuRbJoXARQ3MM2C5j
	 4jQnScHzsQfSz4kyD7z7WS6qcllBfRCo/tjS+U5aV87fetAFnIu7KgwDIHmQk+paD6
	 pHHC6/NguicNkKIEwtI6N0sFXc/Y1wNKbWgowtIaaj3Ztv6s99UjIKeCEiKRvKiUcz
	 j8CEt9Wa3qI5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31F7260D91;
	Fri, 25 Sep 2026 14:45:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AFDD5332
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD41F8136A
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:45:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tlZwm0pVeGlV for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:45:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D43B481347
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347547;
 b=ie8ZZV89/8ojcxaXLNM/2ax5UFoo+P9+G6CFmVIf5diHyUh7MLa0rBSUBU2DGzkxoQs3
 THgPIdiZ1WenKzMAQyl2e1jVdAYdnAWKjcAuPlrcfejRNDYY1e0+A0awvncNc+fJ7z2so
 EugOcY4C1+u/rveNGIzotrbqFeBa8KYa6p5H69TqiBDCmt/2NU0bZqeCOBgO7ZNx3raeU
 OdVabUIO9T1zvLSdsUg0sEYEAO1LVLsSAfR8AicJ/0sUIeAY5u8nRTWIg0/tITTZvJn/O
 knVHrxKOPlvO0ikAkuA3GURMNPCDL8fx9VCGIFY5zO573lHM0fvOg1WGEEQGeueQZ2A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347547;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=+0EicyBuGIyCQBdkfZdfYXjl6VitcUXsFRVnDXWwYik=;
 b=dga0QWfuQjhSlrP134T7qofobpJiTRz7rBKOqa+FQ16E04zULH6ZEpSf9RNtfjH6Fnxk
 wpiaMu67k6AbS6Mm/+O2ZBqFDPYebPNJyenG9Ar4hBZ6Qm0oagMZyoCzyTCLBGqi1uvOG
 33/G4A3/6wu16EPoJ0SapyneGX4t8R/xqI3ST2CSY/1X88NQPNxzQDpp3I3ERsvPwqqk+
 PiZ/whgh+RrEj0J4XbPKU3FnuodAogfgnm7WSM+ie9v8qZxR48zXYC2qqBw06DkzfYRhI
 LDuxTh9IRzw1hXokiB4LJneuqM5sNSi5GYfATYmSzxmhx+lHdY7ZIw4euSPrFpGou4w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=baE82o+o; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D43B481347
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:45:46 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49e71cdb22bso7355615e9.2
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:45:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347545; x=1790952345;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=+0EicyBuGIyCQBdkfZdfYXjl6VitcUXsFRVnDXWwYik=;
 b=rDtAqNDh3GJo1Ot3r7P6BlyWRPHjn9E+FXsn2wDL/AJYTUcUho5Ebz1yRAi9jZ+vvb
 HPwIYECRPfyihxkZgGX3g9WJ2C6WweZx5n//UV2bPkvIeCVPoXMxEEzGKJZAn8Fdn7rd
 +tAyRNHnwZOfll819ljD+DS+olp5l5DFlG0rcI+4j6f7yOldxbj9OFUWGLTexOMTPdSX
 jaqyRq02nrKy8NgHAEwVe1KolZ1GqrAArQnU79gNo4TdxwkjMJiSPVjJvvn7tM3JI0l+
 zn12pxr3hLWzByp8vBPTPgdBj5op4qtWhUnR4BH/nCyN4us72jUmkrfLra7O3B+7/UNs
 4x1g==
X-Gm-Message-State: AFuF++nYztmsmzwwVFpBg1X0xLtpjYFKtlD5xquMhufSFgrK2qpEgriU
 d4HFwqgfPmLOGFi7yju8p9znxb+CqTtJ2tzCWaPX27L/PiATEVU9OCZ1OqzjR3kxBY+gyT6Sfcj
 Sr9ptbKN02g==
X-Gm-Gg: AYBFou1OzbZrtfJr/88D1OG8fVbzdjqGFqwotGGq+E2BujnhCztayLOo0Ofc2sSvQh3
 YgSVa4zZXke2NAJ5q+FgCpVK9o/CxkLYt4GyCo4dqXWrr8SkkDptBJXS5P0tm6wc+aYexzqp610
 7lGzc1qNhOOfAWmy4K5E99dcrDkO1wF/FFXE9UW0/lIDzua0jG8iYvWQ45U3f3eATJIfwr38yMw
 dGRBw8DcPGFtk3EadWWTyibJ7OmfbPmhsTJaHbkXUQgKFxed076UdfL/8zSWWUMcEWyPyyOv+U2
 iBrt7NoALhWH33EbH6uzalEusAHG9U3Jyk7xbi6VFoK3Tveowr5mNlqR3/GfjpInrQWozpgSXvY
 DTwJ/6FeRPYFXXLECeOzdypf0/nX9AmsBTAv7ajNQ94BKoe2rEBa+SyGlpiLymgpPQvihfKlJRX
 6FHEldiUhYWjqqPCW0Y2nnCSboq2SYpIX9yC+jm09pybMK+yQzkdM4CZXDnDp3ZCMqy8ctCT5LD
 Lvww5JGKPtPqKOlPrvKujhkwOpVGyAVobs/gQL15A==
X-Received: by 2002:a05:600c:4f4f:b0:49e:69f8:e846 with SMTP id
 5b1f17b1804b1-49fe66cbb70mr118071305e9.9.1790347543903; 
 Fri, 25 Sep 2026 07:45:43 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fe667ae2fsm152719015e9.13.2026.09.25.07.45.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:45:39 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:45:36 +0200
Message-ID: <20260925144538.4098078-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260915214437.2029799-1-thomas.petazzoni@bootlin.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/rpi-rgb-led-matrix: propagate
 ffmpeg dependency
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> BR2_PACKAGE_RPI_RGB_LED_MATRIX_VIDEO_VIEWER selects
> BR2_PACKAGE_FFMPEG, but without propagating its depends on, and most
> notably BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS.
> 
> Fixes: e821078031e14df69e5142f23e9cb7b5a1ea0e77 ("package/rpi-rgb-led-matrix: new package")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/rpi-rgb-led-matrix/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/rpi-rgb-led-matrix/Config.in b/package/rpi-rgb-led-matrix/Config.in
> index 5088af3bf1..8bf9a81908 100644
> --- a/package/rpi-rgb-led-matrix/Config.in
> +++ b/package/rpi-rgb-led-matrix/Config.in
> @@ -29,6 +29,7 @@ config BR2_PACKAGE_RPI_RGB_LED_MATRIX_TEXT_SCROLLER
>  
>  config BR2_PACKAGE_RPI_RGB_LED_MATRIX_VIDEO_VIEWER
>  	bool "Build video-viewer"
> +	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
>  	select BR2_PACKAGE_FFMPEG
>  	select BR2_PACKAGE_FFMPEG_SWSCALE
>  	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
