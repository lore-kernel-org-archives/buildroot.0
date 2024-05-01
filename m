Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB09C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 19:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B89A580A65;
	Wed,  1 May 2024 19:18:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bKzxnFBXa0Ep; Wed,  1 May 2024 19:18:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB0FF80B15
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB0FF80B15;
	Wed,  1 May 2024 19:18:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 00BEF1BF2C9
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:18:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E9F4380B15
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:18:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WmAHhbyppHCr for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 19:18:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B3A7A80A65
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3A7A80A65
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B3A7A80A65
 for <buildroot@buildroot.org>; Wed,  1 May 2024 19:18:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C3F2140003;
 Wed,  1 May 2024 19:18:38 +0000 (UTC)
Date: Wed, 1 May 2024 21:18:38 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20240501211838.1596d8a1@windsurf>
In-Reply-To: <20240401152312.72881-1-giulio.benetti@benettiengineering.com>
References: <20240401152312.72881-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1714591118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QAMJ999pB7wVLfJnuKX3XxpoQd/YhgT8GGUDnEYroY0=;
 b=mzlvEUnhmqQEav6h63v06bhMeqgVt95r0n5IiSFg5oyVK2WBb8C6Vft9HPdr7kAUV1cNut
 nEGWMYhmOrViTvKx68Q4yKzZjMNuuv0tbnvm7q8ePtz7JHI17qnmvcKIc0if6D9CcKsyFX
 2qfK4z/vXzFuzIR0lISITSCZnIJos9UOockRbF0hfHeDJ5t6Wa4OADyApyqcAhd01fRoJg
 dK/IdtsilcDlpBiqMgFCSqT3x9XLyHQhiSamjxDAIjIvNGsfHGZZuRuy0Y10ed4V14+IWe
 L6N/miZXsw4JWHA8M/UFSA6xhyymPH//m7kHdcfGJyCS0LQ8qffZ8Ogu03S15g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mzlvEUnh
Subject: Re: [Buildroot] [PATCH] package/esp-hosted: bump version to
 2024-04-01
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

On Mon,  1 Apr 2024 17:23:12 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Add support for Linux 6.9
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  ..._ng-fix-build-failure-on-Linux-6.9.0.patch | 37 +++++++++++++++++++
>  package/esp-hosted/esp-hosted.hash            |  2 +-
>  package/esp-hosted/esp-hosted.mk              |  2 +-
>  3 files changed, 39 insertions(+), 2 deletions(-)
>  create mode 100644 package/esp-hosted/0001-esp_hosted_ng-fix-build-failure-on-Linux-6.9.0.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
