Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9718CD1292
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 21:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8C0A60902;
	Sun,  7 Apr 2024 21:11:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ZXlp4X4F6AL; Sun,  7 Apr 2024 21:11:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2144608D3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2144608D3;
	Sun,  7 Apr 2024 21:11:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 25E9B1BF387
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 21:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 201B1608BD
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 21:11:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z1OYd9rwIN7E for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 21:11:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B1A83608D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1A83608D3
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B1A83608D3
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 21:11:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 769D3240002;
 Sun,  7 Apr 2024 21:11:47 +0000 (UTC)
Date: Sun, 7 Apr 2024 23:11:46 +0200
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20240407231146.0b9fcf12@windsurf>
In-Reply-To: <6e119079-bbae-49dd-b3f7-f8117e8a201e@mind.be>
References: <20240406154308.3336009-1-chinhuat@gmail.com>
 <20240406233701.036e7ca8@windsurf> <ZhLcHN3heQjqZvCD@NUC7CJYS>
 <6e119079-bbae-49dd-b3f7-f8117e8a201e@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712524307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YcaBPWgWWEIaxK3tKVxk6qsbbX1vgtz58Lk2x7Vv854=;
 b=DP3MsichqIkFlJPk2GOWWQc1r0aGWw/cDp8OUBZxtMZLQcSrJ97x5d3fEbqdQP0Mghg0h0
 3hTmgc76Go7ESVRc6H8oBJanjO8cFiLaoW34FkZVmImi5xeGbuVUOYMDTJnSyYsodmyUHu
 rZrzPMfJQo/e+KP3wDX0hBbtcR+2coyK2YCFASxaqJNRc/ZaQgrp0euQ9AVYJUTjVqNDXx
 qSrzLizZBWQsRmPdCXVTjB2ZtX5OWBkBRZP0fN9B3hBmyYD4pXtj2UwvbMT4RFTsBWdcUd
 cjZhSSU/O+AvV2cz7h4FX5veSo/wXnyj8S2wt/HCSa8J6uOtOUBYhptzBtc0VA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DP3Msich
Subject: Re: [Buildroot] [PATCH] package/uclibc: bump to version 1.0.47,
 add Y2038 config option
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Chin Huat Ang <chinhuat@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 7 Apr 2024 21:30:09 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

>   IMHO the question is if uClibc acts like musl (i.e. unconditionally enable 
> 64-bit time, which breaks binaries that were compiled with 32-bit time) or like 
> glibc (i.e. the compiled library supports both 32-bit and 64-bit time, and 
> applications use the one or other version depending on _TIME_BITS).
> 
>   I _think_ that uClibc acts like musl. In that case, passing -D_TIME_BITS=64 
> doesn't make any sense. And therefore, having the option at uClibc level makes 
> more sense. However, I don't think it's very useful to have this configuration 
> knob in Buildroot's config. What I would do instead is to unconditionally change 
> our bundled uClibc config to enable 64-bit time, and let people provide their 
> own config if for some reason they don't want 64-bit time.

If we go this way, then we should also do it for glibc, and drop
BR2_TIME_BITS_64.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
