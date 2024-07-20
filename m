Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC0B6C3DA59
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 09:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DA4140553;
	Sat, 20 Jul 2024 09:36:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id afZH3Qd2rC6Z; Sat, 20 Jul 2024 09:36:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33F1B4057F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33F1B4057F;
	Sat, 20 Jul 2024 09:36:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1A4DB1BF3F9
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 09:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 136E5606A6
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 09:36:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PTzsU2rZZW4Z for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 09:36:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F19C96069D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F19C96069D
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F19C96069D
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 09:36:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0A4BDE0002;
 Sat, 20 Jul 2024 09:36:06 +0000 (UTC)
Date: Sat, 20 Jul 2024 11:36:05 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20240720113605.3e39316b@booty>
In-Reply-To: <20240719223224.2b67a89f@windsurf>
References: <20240719-boot-uboot-env-select-v2-1-6abcd50db794@collins.com>
 <20240719223224.2b67a89f@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721468167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4FixN69t7XP8Tz9kiFNQAE6RouPhnPNe0b1u7e9FuG4=;
 b=bL/uiz4pjQDcSFfNTxoiraxqOrt6T5qQewHCN3iuzii9thcOPIqBi2h4x5ROwieFvW0Zxm
 KnYvfdDp//ZMPJmUGGaExd61PrgDHKAwFZ+h6o4KCl/v72/DWDLcnSeNBNa5iFDZXhcSrT
 AxDvQiVnEUGhzM46/YBlHql5GFonDj3lRYkpb6mb1Qn7eoygRe5euAKIU48B+5VO1ZRTpn
 sd95KF0DQ342mIM8fb3019auR9iUzcJ7d5GN4MxJnGjV9OJ3kF1cN7J1cZd6QuysFKb6cd
 5i3RNiBJxEbwJrjXdrgnr4I4WUnjEEgGsmFvCxIPOJ4YFyy1z6dibos1dqZOGg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bL/uiz4p
Subject: Re: [Buildroot] [PATCH v2] boot/uboot: fix Kconfig warning for
 DEFAULT_ENV_FILE
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Brandon Maier <brandon.maier@collins.com>,
 Brandon Maier via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas, Brandon,

On Fri, 19 Jul 2024 22:32:24 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello,
> 
> On Fri, 19 Jul 2024 14:50:26 +0000
> Brandon Maier via buildroot <buildroot@buildroot.org> wrote:
> 
> > +config BR2_TARGET_UBOOT_DEFAULT_ENV_FILE_HIDDEN  
> 
> No need to resend for that, and even though I know I was the one
> suggesting this name, I don't actually like it. Maybe:
> 
> config BR2_TARGET_UBOOT_DEFAULT_ENV_FILE_ENABLED
> 
> or something like that?

I agree _HIDDEN is not the best possible name. In my v1 it was
BR2_TARGET_UBOOT_USE_DEFAULT_ENV_FILE, but that was a visible option to
"USE" (imperative) would make sense. Now it might be OK for a hidden
option, but perhaps _ENABLED is even better so my vote for that.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
