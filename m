Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F207CA0EDC
	for <buildroot@archiver.kernel.org>; Fri, 30 Aug 2024 16:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB7D6411BE;
	Fri, 30 Aug 2024 16:57:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S7FbM7I-PCOQ; Fri, 30 Aug 2024 16:57:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5D64411DC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5D64411DC;
	Fri, 30 Aug 2024 16:57:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 422AC1BF35F
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 16:57:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A23C4244C
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 16:57:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bsez53xmUW4f for <buildroot@lists.busybox.net>;
 Fri, 30 Aug 2024 16:57:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D8DDF42448
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8DDF42448
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D8DDF42448
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 16:57:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 06803E0002;
 Fri, 30 Aug 2024 16:57:37 +0000 (UTC)
Date: Fri, 30 Aug 2024 18:57:37 +0200
To: Niklas Cassel via buildroot <buildroot@buildroot.org>
Message-ID: <20240830185737.568a1905@windsurf>
In-Reply-To: <20240830101327.2000179-3-niklas.cassel@wdc.com>
References: <20240830101327.2000179-1-niklas.cassel@wdc.com>
 <20240830101327.2000179-3-niklas.cassel@wdc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725037058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MpYVMlzIB9xc1LOVD+RelAQRtGReIW6UH/IVj2SsqEk=;
 b=JqJiaMyGqF3kztHt4ZclL9CN3rZqgpuL7D25qiNrpinPMr2RXyYg7G7SN5kksgCLvKS6Ds
 1pw4Zt58IZxfJSjXZJdoBmPFe4UH6iqOXWKRGAeQZ3GFQpLV4RtVwdoz/aaCRVoffNzQoc
 oNePy7I2Ctam7rWjtZl/NsUXLi3dMwXX7aB+qMIyBJAztAXs2uroAZAwmveZlZM6cbXobm
 IEsGE9PR5fqV6lRxhRgknyBB3ShwroWY8xWt8x6OydNiabXSnJhn0Buxf8OS9G6PKqiaXt
 FJJqW7qNA7eah4nprOsua1uy47vuCEanuDJm4vFxrVnjNqzSqfz8/S0jazlIpQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JqJiaMyG
Subject: Re: [Buildroot] [PATCH 2/4] board/radxa/rock5b: there is no need to
 specify rootfstype
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>, Damien Le Moal <dlemoal@kernel.org>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>, Niklas Cassel <cassel@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 30 Aug 2024 12:13:25 +0200
Niklas Cassel via buildroot <buildroot@buildroot.org> wrote:

> From: Niklas Cassel <cassel@kernel.org>
> 
> The ext4 rootfs is mounted as ext4 perfectly fine without rootfstype
> specified on the kernel command line.
> 
> In order to keep the kernel command line clean, remove the superfluous
> kernel parameter.
> 
> Signed-off-by: Niklas Cassel <cassel@kernel.org>
> ---
>  board/radxa/rock5b/extlinux.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
