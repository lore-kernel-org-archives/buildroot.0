Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8795CC3DA7F
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 19:50:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5099F60727;
	Thu, 15 Aug 2024 19:50:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hFyUancVdrYR; Thu, 15 Aug 2024 19:50:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 623EE608FB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 623EE608FB;
	Thu, 15 Aug 2024 19:50:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2F07A1BF599
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 19:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2823981F3B
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 19:50:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vkM8IY_QRqyT for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 19:50:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DF37A81F3A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF37A81F3A
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DF37A81F3A
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 19:50:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 04E12240002;
 Thu, 15 Aug 2024 19:50:41 +0000 (UTC)
Date: Thu, 15 Aug 2024 21:50:40 +0200
To: Dong Wang <wangdong115@foxmail.com>
Message-ID: <20240815215040.0908cb47@windsurf>
In-Reply-To: <tencent_C2D6061483906AA710B3001B277F4EE62606@qq.com>
References: <tencent_C2D6061483906AA710B3001B277F4EE62606@qq.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723751443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dkPt5lvyYzkDjej43h3y3bzIkhITKkBRRdshzeAa5TA=;
 b=X60uI9dVkm2BQKuxWzkJa0x2b5kYAOK/e2jq06E+WIwu1X2l77OVikxT7YxrvnTy/WCyNP
 iKrzLC+IBeQAJr5s6VtkQvSRkZ2uXJQtbkYPZqY5+pY7ie29u2foHExpa5ETPl24vue3HG
 5Q3g1PnL2sBIJ21bdiJXcCux61QtOOmjFqcRlX6r/R7wfWgDPb/4y9UuFIYzvM+TGDuG6V
 PAXYh/vlR3dnwqHNgratKM4NOZgb/lyeBBX8MYFG8OiaKMHbb+hwJL0WAsjtpyl9bma6ID
 c0S7xFZFFlJ2BY6vRLqypU0K2MeAAocL+vYAVZ6y6cWOR0E6HzA4hhQceZ4ffA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=X60uI9dV
Subject: Re: [Buildroot] [PATCH next] board/friendlyarm/nanopi-neo: fix
 uboot partition size
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Fri, 16 Aug 2024 01:28:26 +0800
Dong Wang <wangdong115@foxmail.com> wrote:

> This patch fixes the wrongly calculated uboot partition size in
> genimage.cfg. The size should be 1016K, which is
> 1MB (typical partition start) - 8K(offset dictated by the bootrom).
> 
> Signed-off-by: Dong Wang <wangdong115@foxmail.com>
> ---
>  board/friendlyarm/nanopi-neo/genimage.cfg | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/board/friendlyarm/nanopi-neo/genimage.cfg b/board/friendlyarm/nanopi-neo/genimage.cfg
> index ec78fd0e56..8d6bdd3295 100644
> --- a/board/friendlyarm/nanopi-neo/genimage.cfg
> +++ b/board/friendlyarm/nanopi-neo/genimage.cfg
> @@ -7,7 +7,7 @@ image sdcard.img {
>  		in-partition-table = false
>  		image = "u-boot-sunxi-with-spl.bin"
>  		offset = 8K
> -		size = 1000K # 1MB - 8KB(offset) - 16KB(GPT)
> +		size = 1016K # 1MB - 8KB(offset)

Actually, does this size argument really make sense? This space will
automatically take the size of the "u-boot-sunxi-with-spl.bin" file I
believe. Or is it needed to make sure that the next partition doesn't
start before 1 MB?

Why is it important that the size is 1MB - 8KB, and not 1MB or 2MB ?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
