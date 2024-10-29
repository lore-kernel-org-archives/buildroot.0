Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDEEDD5B171
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 09:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65C6060614;
	Tue, 29 Oct 2024 09:01:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K31s8y3iUQVF; Tue, 29 Oct 2024 09:01:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82FBF6077D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82FBF6077D;
	Tue, 29 Oct 2024 09:01:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 860CA4EC0
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 09:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72BD2401B0
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 09:01:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZZnuwIghxKH2 for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 09:01:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 034B54018F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 034B54018F
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 034B54018F
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 09:01:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E883C60012;
 Tue, 29 Oct 2024 09:01:34 +0000 (UTC)
Date: Tue, 29 Oct 2024 10:01:33 +0100
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20241029100133.06382c6e@windsurf>
In-Reply-To: <20241029070344.2661276-1-neal.frager@amd.com>
References: <20241029070344.2661276-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730192495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eOfXY4ywhDiqcINx9VPrBmb84nq+TSKJ6xARPdSQ14Y=;
 b=lMugEnjv+X7J93Lk1ChUVXYCKpswAjt4Tb5eJ1142TLg8ewv4vgGh41ZDjMOGmFzGzjmtS
 z3wOSkNmfQM8h6UKhpJA4ux4t0pv95qB8Pdbnlfkt8Mta+KcQTJUkVHLWVsiWnvdU24Vuk
 10BufpxB0q6Ic+3+3ALTY+ahbrPMaTfbRQxelQi054zIklxgFyM9koN4T+UsKd0IsS0SaW
 xprV03ywVnlHqDm0n01yGR+72y4BYMcfDC8lTe6NjwE3d+h582WC0+VeE3DxtQH7u5MXQu
 nut+hY1YMWmbRF0pi5opzZ7Y+Lk6oKDW2uzk0zAxEwNxxqhIn+2kAxqKew+Dmg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lMugEnjv
Subject: Re: [Buildroot] [PATCH v1 1/1] package/bootgen: clean up variable
 names
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
Cc: michal.simek@amd.com, luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Neal,

On Tue, 29 Oct 2024 07:03:44 +0000
Neal Frager <neal.frager@amd.com> wrote:

> -BOOTGEN_VERSION = xilinx_v2024.1
> -BOOTGEN_SITE = $(call github,Xilinx,bootgen,$(BOOTGEN_VERSION))
> +HOST_BOOTGEN_VERSION = xilinx_v2024.1
> +HOST_BOOTGEN_SITE = $(call github,Xilinx,bootgen,$(HOST_BOOTGEN_VERSION))
>  HOST_BOOTGEN_DEPENDENCIES = host-openssl host-pkgconf
> -BOOTGEN_LICENSE = Apache-2.0
> -BOOTGEN_LICENSE_FILES = LICENSE
> +HOST_BOOTGEN_LICENSE = Apache-2.0
> +HOST_BOOTGEN_LICENSE_FILES = LICENSE

No, the way it is done today is correct.

Even for host packages, we expect those "generic" variables to NOT use
the HOST_ prefix, except if the value needs to be different between the
target and host package.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
