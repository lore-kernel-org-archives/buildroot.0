Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A541CFA463
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 19:53:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D722140800;
	Wed, 23 Oct 2024 19:53:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HZg-AXrSunPm; Wed, 23 Oct 2024 19:53:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAF374080B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAF374080B;
	Wed, 23 Oct 2024 19:53:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C4D34960
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 19:53:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5BE3F4080B
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 19:53:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n0ZnEUydlxwH for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 19:53:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EEAD240800
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEAD240800
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EEAD240800
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 19:53:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B261320004;
 Wed, 23 Oct 2024 19:53:37 +0000 (UTC)
Date: Wed, 23 Oct 2024 21:53:36 +0200
To: Jamie Gibbons via buildroot <buildroot@buildroot.org>
Cc: Jamie Gibbons <jamie.gibbons@microchip.com>, Conor Dooley
 <Conor.Dooley@microchip.com>, Valentina Fernandez Alanis
 <Valentina.FernandezAlanis@microchip.com>
Message-ID: <20241023215336.1e78a347@windsurf>
In-Reply-To: <20241023135317.2356119-1-jamie.gibbons@microchip.com>
References: <20241023135317.2356119-1-jamie.gibbons@microchip.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729713218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JyG3zs2BuLK8EfbhdLW3ukQyfa7mzNCl0JIbvkHImmY=;
 b=Mq9vkTXM3exxp+d+xyG4yUHxVnzY1Xvu9VDZW+8trTzzKv5tux0DuZnPiXwEARbyd3CnLL
 Jxm95oEzZUazbKoIggeIE4ETUIgUo/cV2ABZ7WrRPCtrgAXoSzxv7KNnmtGdCYxqo8rJan
 7QY1UyZEPIgYkorskVkymTW0MpHasCqroTsb+yjjbUfLXgi6iHXYz14Az422C6Z29hw2lv
 n9dcIAYTnnUAKxafTOS65MvAjFrR6sSm2qVVvon1mC5fhJ1UAPKiQtF5HPMBE2G0eo+Woy
 q1HphvCI/wqf9givtGrZq0OV7vPXNj3Kv3+PW4DF7gf1AP3cbFCoZwXPV7kbrw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Mq9vkTXM
Subject: Re: [Buildroot] [PATCH 1/2] configs/beaglev_fire: Bump U-Boot
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

On Wed, 23 Oct 2024 14:53:16 +0100
Jamie Gibbons via buildroot <buildroot@buildroot.org> wrote:

> Bump U-Boot to latest release tag: linux4microchip+fpga-2024.09. This
> includes the latest features and bug fixes.
> 
> Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
> ---
>  board/beagleboard/beaglev_fire/patches/uboot/uboot.hash | 2 +-
>  configs/beaglev_fire_defconfig                          | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Both applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
