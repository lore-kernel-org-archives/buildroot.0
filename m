Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA4C8D74941
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 21:29:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94CC7813D0;
	Tue, 29 Oct 2024 21:29:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QZHan2LJ6v_q; Tue, 29 Oct 2024 21:29:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3CD1813D5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3CD1813D5;
	Tue, 29 Oct 2024 21:29:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9ACDB4EC0
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 21:29:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A7B440A86
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 21:29:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Joiu7H4SKuwL for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 21:29:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3AC214055E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3AC214055E
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3AC214055E
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 21:29:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4125EFF803;
 Tue, 29 Oct 2024 21:29:39 +0000 (UTC)
Date: Tue, 29 Oct 2024 22:29:38 +0100
To: Hannah Kiekens via buildroot <buildroot@buildroot.org>
Cc: Hannah Kiekens <hannah.kiekens@mind.be>, Jesse Van Gavere
 <jesseevg@gmail.com>, Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Message-ID: <20241029222938.67c80af7@windsurf>
In-Reply-To: <20240921080845.18098-1-hannah.kiekens@mind.be>
References: <20240921080845.18098-1-hannah.kiekens@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730237379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XXxP60MJMDFdv0HF3w026OVGRxtBYpwxxP7mkAKfAqY=;
 b=oPtKHWkA5hTXPDP30HUKU8KoNh7CFBUDTc+I2kMnIZYV3kBd/9xXJS3n5IqMoT+SNCxTFA
 qycbys14Ylx3cO/puZlSISzkuILyTp0IABq7uJ1bl1uHFRgbI5c+FG+3GXFYf8++x4ObNw
 XxVlvsEf2PbeJz6D7fN7TicOfRTfeKIQM8sS80IkfK3Tijba+d6MMieIenM1vk9swoVlvb
 GwR2pUv6822gsO5yT/wO+v6arbcn5dRKweMll5fCogp0kd9gD17k8Mvpe53YKocXFoP20q
 M2hYRW78TG7rmCkqe64Hpjw1p+/bo8ajjePTbK2i5YWrmaERKq8jF9vo17J+ZA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oPtKHWkA
Subject: Re: [Buildroot] [PATCH 1/1] package/qt6/qt6base: remove
 -DFEATURE_concurrent=OFF from hard coded list
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 21 Sep 2024 10:08:45 +0200
Hannah Kiekens via buildroot <buildroot@buildroot.org> wrote:

> It is set by BR2_PACKAGE_QT6BASE_CONCURRENT
> 
> Signed-off-by: Hannah Kiekens <hannah.kiekens@mind.be>
> ---
>  package/qt6/qt6base/qt6base.mk | 1 -
>  1 file changed, 1 deletion(-)

Well spotted, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
