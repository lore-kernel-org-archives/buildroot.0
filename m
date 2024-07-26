Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2EF7C3DA49
	for <buildroot@archiver.kernel.org>; Fri, 26 Jul 2024 07:40:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C976409BE;
	Fri, 26 Jul 2024 07:40:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DWDm7zzj0aOe; Fri, 26 Jul 2024 07:40:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61ECD40944
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61ECD40944;
	Fri, 26 Jul 2024 07:40:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C35811BF311
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 07:40:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AFD5081F9C
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 07:40:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aqCH2E8HP8Xl for <buildroot@lists.busybox.net>;
 Fri, 26 Jul 2024 07:40:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6341B81F88
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6341B81F88
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6341B81F88
 for <buildroot@buildroot.org>; Fri, 26 Jul 2024 07:40:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AAEF7240003;
 Fri, 26 Jul 2024 07:40:06 +0000 (UTC)
Date: Fri, 26 Jul 2024 09:40:05 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240726094005.1fbcd4e9@windsurf>
In-Reply-To: <20240725080641.303312-1-dario.binacchi@amarulasolutions.com>
References: <20240725080641.303312-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721979606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lChn8IbhxzAodMRPEEQBMmh5q1Se1/LibB1VLS++LNg=;
 b=Y6LYDTBnrnUj+58jh693EFBd+DWq25yYUTWI1NXSWY8UdpMTs3SXbc3aCuSx3Vm6JTUFft
 qzKnfXkZxhQvHkcBVFm23LYMFsYRxLGxOA42p4Q9tUwcilIKc6mx4Y7NSL800fBpWi7BWI
 plyhAw/JToDc/Wfe6J8nCplifOB2J5NCLLryRd3wXw4IrOXL889h3IEO6l+TQXIW/ZUaEs
 7Duc4bMQ6UeRYq8fMvCLfBWyauIoR/eelWhhtbWIVw8MZIYKq9kR+2ImeDvhFBWjoQbafN
 BLLQan9czIX1sZN5ictAPWwj5zGIgCecUx8LIM11LTLARFvqAbv7vWr/WOvB5w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Y6LYDTBn
Subject: Re: [Buildroot] [PATCH 1/1] package/elfutils: fix build on
 microblaze
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
Cc: Vincent Fazio <vfazio@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 25 Jul 2024 10:06:41 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> +ifeq ($(BR2_microblazebe),y)

I've changed to:

ifeq ($(BR2_microblaze),y)

as the issue applies to both LE and BE Microblaze, and applied.

Although we do have a proposal for a more general solution to this
problem: add symber attribute support for Microblaze, in patch:

  https://patchwork.ozlabs.org/project/buildroot/patch/20240228165300.4158751-1-vfazio@gmail.com/

Problem is that the patch proposed by Vincent is apparently not going
to be accepted by upstream gcc, so we would carry it forever, so I'm
not sure which decision to take about it.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
