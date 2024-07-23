Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F123C3DA49
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 20:47:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C72D60711;
	Tue, 23 Jul 2024 20:47:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3so3JyQUXBW6; Tue, 23 Jul 2024 20:47:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5AFBC606AA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AFBC606AA;
	Tue, 23 Jul 2024 20:47:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 02D381BF27E
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 20:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E32E18127D
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 20:47:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8lgH9dgmCyfe for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 20:47:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A8E8781279
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8E8781279
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A8E8781279
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 20:47:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0DCF21BF203;
 Tue, 23 Jul 2024 20:46:56 +0000 (UTC)
Date: Tue, 23 Jul 2024 22:46:55 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240723224655.31a4e6fb@windsurf>
In-Reply-To: <20240723153035.260929-1-fontaine.fabrice@gmail.com>
References: <20240723153035.260929-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721767617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IDtAJnMQkG1Kh1xKDjxEkZ6lTqUy1BoDSzIagK3svMA=;
 b=lBy0AHDaY+PI+2VsxLGR+EwjljLUVVCifR2DObM6hwUc9lpUIHQ2WKDLpgmirFepvgvWUh
 o0G3XyLqqQCqfRCIkYzNRRT6BhJi0k/+FvnrgbhRBgizWkNZj945AosyEKIKXOXyTJvDkY
 Rlyl9NJrYjoM1YKQSRQxBul0yDjqnWZr2IQADpYnBetQVjKng7AJ6RQ2cEJoanv3rfouij
 vAUWZJ6DH2oAXhBfOBvqY3WMmV1GnYCqnvAprBZtZK0smEKiuMXpajIq3m3uIexJD2Iz/t
 N+wHFIkSADJsvT1grT2dg2Po8nS/nErCDA9S2AagP1A6/RcOn7HJBIO4xbZEFQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lBy0AHDa
Subject: Re: [Buildroot] [PATCH 1/1] package/speex: ARM5E needs ARM mode
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

On Tue, 23 Jul 2024 17:30:35 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Add a dependency on ARM mode for ARM5E to fix the following build
> failure on arm926ej-s which only supports Thumb2 mode:

This cannot be true, because ARM926EJ-S does not support Thumb2 at all.
ARM926EJ-S supports only the ARM instruction set and the classic Thumb
instruction set.

Thumb 2 was introduced in ARM1156, which is an ARMv6 core.

I'm not sure what you're pointing to ARM926EJ-S this the failing
configuration at:

> Fixes:
>  - http://autobuild.buildroot.org/results/1575da3a8ea2bcde7fa9885df317a12d5c36918f

This configuration builds for Cortex-M3, which only supports the Thumb2
instruction set if I understand correctly.

> @@ -18,6 +18,7 @@ config BR2_PACKAGE_SPEEX_ARM4
>  config BR2_PACKAGE_SPEEX_ARM5E
>  	bool
>  	default y
> -	depends on BR2_arm && !BR2_PACKAGE_SPEEX_ARM4
> +	depends on BR2_arm && BR2_ARM_CPU_HAS_ARM && \
> +		!BR2_PACKAGE_SPEEX_ARM4

So I do believe this change is correct, just the explanation in the
commit log isn't.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
