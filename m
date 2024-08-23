Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0541DC52D7C
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 14:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD6AB840BF;
	Fri, 23 Aug 2024 14:56:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qmutDElr7fhL; Fri, 23 Aug 2024 14:56:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFD75840C0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFD75840C0;
	Fri, 23 Aug 2024 14:56:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 269A51BF345
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 14:56:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2096540327
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 14:56:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 12baWAnYNyR9 for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 14:56:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A24E840129
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A24E840129
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A24E840129
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 14:56:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EBB8120003;
 Fri, 23 Aug 2024 14:56:42 +0000 (UTC)
Date: Fri, 23 Aug 2024 16:56:40 +0200
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20240823165640.6f40aa58@windsurf>
In-Reply-To: <20240823122919.3325906-1-aperez@igalia.com>
References: <20240823122919.3325906-1-aperez@igalia.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724425003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=89Og2Gx9buOFhTHeEMjR6iF9GwvPRDQCoE7FLJ97+uE=;
 b=EV6LG6CCocd+ce9BAYkfnXDJ0AQi8bphP6BlW2MpXpRGzOzypYFhFvCW4u8TIQzBXJ1wp2
 9mhiPGb24qK0cFRDo1gu8E4jZ8tSRbf94ZHa7Dnr4niXwG1rwxZfqGTzowducPcC1bQWAC
 e8J8q5xHLrVXrykpN5R6FmmMlwLyldeutQoZqkwmQ9jzzFNFqiJ7wiEzvDm2zBFeJ7Aw5Y
 6106nHnYpTKZoG+pMADaziYNyTmenE1m7zf6RuUrvjBKql85+2S9kUrBz25bmGtCefrPPb
 +j5aDRnB9n6A5O02LAcqxp7kmJwJo7WM+bSdIwtJX66wjnqQ/VCPW1PrfxzPAw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EV6LG6CC
Subject: Re: [Buildroot] [PATCH] package/wpewebkit: disable JIT for all MIPS
 CPUs
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

Hello Adrian,

On Fri, 23 Aug 2024 15:29:16 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> -# JIT is not supported for MIPS r6, but the WebKit build system does not
> -# have a check for these processors. The same goes for ARMv5 and ARMv6.
> -# Disable JIT forcibly here and use the CLoop interpreter instead.
> +# JIT is not supported for MIPS, ARMv5, and ARMv6, but the WebKit build
> +# system does not have a check for these processors.
>  #
> +# Disable JIT forcibly here and use the CLoop interpreter instead.
>  # Also, we have to disable the sampling profiler and WebAssembly, which
>  # do NOT work with ENABLE_C_LOOP.
>  #
> -# Upstream bugs: https://bugs.webkit.org/show_bug.cgi?id=191258
> -#                https://bugs.webkit.org/show_bug.cgi?id=172765
> -#                https://bugs.webkit.org/show_bug.cgi?id=265218
> +# Upstream bug: https://bugs.webkit.org/show_bug.cgi?id=278559
>  #
> -ifeq ($(BR2_ARM_CPU_ARMV5)$(BR2_ARM_CPU_ARMV6)$(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS_CPU_MIPS64R6),y)
> +ifeq ($(BR2_ARM_CPU_ARMV5)$(BR2_ARM_CPU_ARMV6)$(BR2_mips)$(BR2_mipsel),y)

But then do we actually need a change?

Keep in mind that here we are only disabling JIT explicitly for ARMv5,
ARMv6 and MIPS32R6/MIPS64R6 because they were misdetected as supported
by wpewebkit. Indeed wpewekit supported ARM and MIPS, but not some
variants of it.

For all other architectures, we do nothing, and wpewebit properly
decides whether it supports JIT or not. So if JIT support for MIPS has
been dropped I believe the correct change is:

-ifeq ($(BR2_ARM_CPU_ARMV5)$(BR2_ARM_CPU_ARMV6)$(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS_CPU_MIPS64R6),y)
+ifeq ($(BR2_ARM_CPU_ARMV5)$(BR2_ARM_CPU_ARMV6),y)

but only of course once we use a version of wpewebkit that really has
dropped MIPS support.

As such, your change would potentially break: it re-enables JIT on
BR2_MIPS_CPU_MIPS64R6=y, because you disable for BR2_mips and
BR2_mipsel but there are the 32-bit variants of MIPS, and so
BR2_MIPS_CPU_MIPS64R6=y would again allow JIT.

Could you clarify if we have already updated to a version of wpewebkit
that has dropped MIPS support for JIT? If so, we should simply apply
the simpler change above.

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
