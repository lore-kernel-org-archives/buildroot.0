Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E074CF31B9
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 20:39:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0462F80BCF;
	Wed,  2 Oct 2024 20:39:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P5uhi9HHdO1E; Wed,  2 Oct 2024 20:39:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04F6481414
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04F6481414;
	Wed,  2 Oct 2024 20:39:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EFEC11BF282
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 20:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EBD396110F
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 20:39:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4seLD8nXz_1H for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 20:39:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BBE3560A82
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBE3560A82
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BBE3560A82
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 20:39:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 712821BF203;
 Wed,  2 Oct 2024 20:39:32 +0000 (UTC)
Date: Wed, 2 Oct 2024 22:39:31 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20241002223931.4df9dde4@windsurf>
In-Reply-To: <20240929201459.1761285-1-dario.binacchi@amarulasolutions.com>
References: <20240929201459.1761285-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1727901572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0K37gS73Jm/6ZE5CQeeIrU+qnae2e3reDOqsJfBr6fk=;
 b=Rf6ecDebGO6mBwmHXwMmZkAhdbyv96rpEnjLLLNoVZN/du94DIOUtigSCDZxUaJqwQXFiy
 eCdth95Fd4G8t7GAsUhJztC0DrIkIQky64ZcJwQa9V3KO0p6KRbcBEKrAVph3mwEhohJ1f
 BmWrVR+no/aHGKho+OLtr9F7sMJ22VOgqTPUhsloTBsoehBH2pUtn4ajhUmCHQEfZhA7IB
 hpxfHjoLn9bDYFcx54A0isWL1N40qV6YVFM2bluu4E8tKjlUY4pYdunNnYSsmYeIQ1Nyh+
 Rf3bFnblLgejTRGA8TitQG8ord/fjSwYzfKYI3IWkbcusponbVEIF9IwYUMihA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Rf6ecDeb
Subject: Re: [Buildroot] [PATCH v3 0/9] add ARM FDPIC support
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Dario,

On Sun, 29 Sep 2024 22:14:50 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> Ben Wolsieffer (6):
>   Revert: "arch: drop now useless support for FDPIC"
>   arch: don't enable FDPIC binaries by default
>   arch/arm: add support for FDPIC
>   boot/uboot: pass -mno-fdpic if FDPIC is enabled
>   linux: pass -mno-fdpic if FDPIC is enabled
>   package/uclibc: enable NPTL on no-MMU ARM w/ FDPIC
> 
> Dario Binacchi (2):
>   Add the right dependencies on BR2_BINFMT_* to the toolchains
>   configs/stm32f746_disco_sd: new defconfig
> 
> Waldemar Brodkorb (1):
>   package/busybox: remove STATIC from busybox-minimal.config

Thanks for this new iteration, which I have applied, but with some
changes.

Essentially, I changed a bit my mind on PATCH 3/9, and I believe adding
BR2_BINFMT_ELF everywhere was a bit unneeded. And your patch was
actually not sufficient: it still allowed to select the Bootlin ARMv7-M
FLAT toolchain when ARMv7-M FDPIC was selected as the target
architecture in Buildroot.

So I simplified the patch, and only made sure that the Bootlin ARMv7-M
FLAT toolchain can only be selected when BR2_BINFMT_FLAT=y. BTW, in
this patch, you had modified directly
toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options,
but as explained at the beginning of this file, this file is
auto-generated, so modifying it without changing
support/scripts/gen-bootlin-toolchains is somewhat useless.

Also, on the patch actually enabling FDPIC on ARM, I restricted that to
ARMv7-M. I know it in theory works on MMU-capable ARM systems, but
FDPIC really doesn't make any sense in such cases (ELF works just
fine), so nobody will ever use FDPIC on such systems... making the
support of this configuration a bit useless.

Thanks for your persistence with this work!

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
