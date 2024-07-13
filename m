Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B34DC3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 08:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC38B82003;
	Sat, 13 Jul 2024 08:50:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id la3Ofi-iQuAd; Sat, 13 Jul 2024 08:50:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E77218202B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E77218202B;
	Sat, 13 Jul 2024 08:50:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AA5061BF405
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 08:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96DA94174A
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 08:50:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pHb7v6bdiX8m for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 08:50:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 162CC4152D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 162CC4152D
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 162CC4152D
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 08:50:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 58D0640003;
 Sat, 13 Jul 2024 08:50:09 +0000 (UTC)
Date: Sat, 13 Jul 2024 10:50:08 +0200
To: David Barbion <davidb@230ruedubac.fr>
Message-ID: <20240713105008.5ff2d290@windsurf>
In-Reply-To: <20221127081232.2160208-1-davidb@230ruedubac.fr>
References: <20221127081232.2160208-1-davidb@230ruedubac.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720860609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=axdb5f6tqWbDgPMV0zyEjLxEncyiSrKnyzwEGU+tI28=;
 b=Th0VdL5ElmknRS3tp07y8+XE95cRw1bZzbZzLyS/V5HHe7urLsR8IAF7qGNmDww0QhX75L
 5FSyOHMjJmvcU6/ySkhoMfksSVYKEPXQheUHvrYXMq5AA/asziLOraLL1wnG6qxRhLOebt
 sFTJh0vp34WXV1BcHUbsMjPGJO8o2vfFtASxqSML2fo3l/MKith2vlUDPDoc8racsaFBU0
 Q+nE2aRXzo7sNQtfNNk2XldYyc2hdVm5hM8e8x52l0iecOPov3t+R09meluNGdjysTkdq3
 zwIJyOPFtu93wvDzjm9SfLHWz4uzM0jd0WODi87XI+Mw0xanP4K67OqDY0BKeA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Th0VdL5E
Subject: Re: [Buildroot] [PATCH 1/1] package/x265: fix armv6 cross
 compilation issue
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Thijs Vermeir <thijsvermeir@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello David,

On Sun, 27 Nov 2022 09:12:32 +0100
David Barbion <davidb@230ruedubac.fr> wrote:

> When running a program that depends on x265, it crashes with the
> message: illegal instruction
> 
> The package x265 was forcibly compiled with the gcc flag -mfpu=neon even
> if the target CPU does not support the neon instruction set.
> This fix adds the cmake flag CROSS_COMPILE_ARM to correctly set gcc flags
> when compiling for ARMv6 architecture.
> 
> Signed-off-by: David Barbion <davidb@230ruedubac.fr>
> ---
>  package/x265/x265.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Sorry for the very, very long delay with which we are getting back to
you, and thanks for your investigation. Your patch was indeed fixing
the problem, but I took a step back and fixed a little more. See the
following two patches:

  https://gitlab.com/buildroot.org/buildroot/-/commit/9d62687d0024f7e3bac68157f1250970ef45abff
  https://gitlab.com/buildroot.org/buildroot/-/commit/1fbd26f83169a206bdf9c36c85510a33c0e7a864

Of course, if you're still working on your project, it would be great
to get a confirmation that those patches are still fixing the problem
for you.

Once again, thanks for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
