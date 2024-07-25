Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C7CAC3DA49
	for <buildroot@archiver.kernel.org>; Thu, 25 Jul 2024 08:03:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A0A0540DF9;
	Thu, 25 Jul 2024 08:03:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4xUW1Z8-jJz0; Thu, 25 Jul 2024 08:03:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23A954025C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 23A954025C;
	Thu, 25 Jul 2024 08:03:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3CF3E1BF397
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 08:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 37404804EA
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 08:03:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wfWyvF5zlnt3 for <buildroot@lists.busybox.net>;
 Thu, 25 Jul 2024 08:03:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C28C58043C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C28C58043C
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C28C58043C
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 08:03:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1CE031BF207;
 Thu, 25 Jul 2024 08:03:18 +0000 (UTC)
Date: Thu, 25 Jul 2024 10:03:16 +0200
To: Dmitry Chestnykh <dm.chestnykh@gmail.com>
Message-ID: <20240725100316.2b2c1867@windsurf>
In-Reply-To: <20240725064402.606108-1-dm.chestnykh@gmail.com>
References: <20240725064402.606108-1-dm.chestnykh@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721894598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FE9wqAvxKL4nfjxjByNkOtYBFyxfi0PRb6dLz+5S25A=;
 b=VkW+f4u2IHLpx8rgq4wNxkKiuUCIrp2hvrLjnENVoWxHOvCB2MK6Gw7YtHVdWk21jZrWJv
 f43BZ32ndtnFoCpwOYBgnQcvBv0a1fIYVEVy9fBig/84gBjyvTddJFXqa/sy4ndLqIX5DE
 nw5wZ0oIGZxgpC98uzcHllKLszM9nvKNyCDJAdK4b9O01r3HvCzeQzFoq3U9S6E4bhv/aS
 +PRF5G6+Wpau+gZ7or0IQ6k39dMqEo1dAvMM1Nj6HHd64tNL4pO5lzYzl8r6C/0QGFqHXd
 kiqkBfLKxOV/n05bYVjTgN4daDnpFV6oOq87KfjND3VHU9+GE1fKcTMHHPcLlw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VkW+f4u2
Subject: Re: [Buildroot] [PATCH] package/uclibc-ng-test: Fix musl build
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

Hello Dmitry,

On Thu, 25 Jul 2024 09:44:02 +0300
Dmitry Chestnykh <dm.chestnykh@gmail.com> wrote:

> Musl doesn't provide sys/asm.h header
> so we should add some defines inside
> mips-specific header file to avoid build errors
> 
> Signed-off-by: Dmitry Chestnykh <dm.chestnykh@gmail.com>

Thanks a lot for the patch!

Could you include in your commit message the following:

Fixes:

  http://autobuild.buildroot.net/results/af7a1d00930485f87f77762b34cae01873a8cd41/

also, do we know since when this error is occurring? Indeed, we want to
understand if this fix should be backported to our LTS branch or not.
And the only way to figure this out it to understand when the issue has
been introduced. Is this a recent regression? Something that has always
been occurring?

> diff --git a/package/uclibc-ng-test/0001-Fix-error-absent-sys-asm-h.patch b/package/uclibc-ng-test/0001-Fix-error-absent-sys-asm-h.patch
> new file mode 100644
> index 0000000000..ec88102e56
> --- /dev/null
> +++ b/package/uclibc-ng-test/0001-Fix-error-absent-sys-asm-h.patch
> @@ -0,0 +1,57 @@
> +From 556292ce354d33a94c54e7555dd999a9395c0a2d Mon Sep 17 00:00:00 2001
> +From: Dmitry Chestnykh <dm.chestnykh@gmail.com>
> +Date: Thu, 25 Jul 2024 09:15:11 +0300
> +Subject: [PATCH] Fix errors due to absent sys/asm.h in mips64 musl build
> +

We need the patch to contain an "Upstream:" tag which points to your
posting of this patch to the upstream project mailing list, or pointing
to the pull request.

We also need the patch to contain your Signed-off-by line.

You can get such things verified by running "make check-package" prior
to sending your patch.

> +diff --git a/test/tls/tls-macros-mips.h b/test/tls/tls-macros-mips.h
> +index eed0938..bd4c5c4 100644
> +--- a/test/tls/tls-macros-mips.h
> ++++ b/test/tls/tls-macros-mips.h
> +@@ -1,7 +1,40 @@
> + /* Macros to support TLS testing in times of missing compiler support.  */
> + 
> + #include <sys/cdefs.h>
> ++#if defined(__has_include) && __has_include(<sys/asm.h>)
> + #include <sys/asm.h>
> ++#else
> ++
> ++#define __STRING(x) #x
> ++
> ++#if ((_MIPS_SIM == _MIPS_SIM_ABI32 || _MIPS_SIM == _ABI32) && _MIPS_SZPTR == 32)
> ++#define PTR_ADDIU	addiu
> ++#define PTR_L		lw
> ++#endif
> ++
> ++#if _MIPS_SIM == _MIPS_SIM_NABI32 || _MIPS_SIM == _NABI32
> ++
> ++#if !defined __mips_isa_rev || __mips_isa_rev < 6
> ++#define PTR_ADDU	add
> ++#define PTR_ADDIU	addi
> ++#else
> ++#define PTR_ADDU        addu
> ++#define PTR_ADDIU       addiu
> ++#endif
> ++
> ++#define PTR_L		lw
> ++#endif
> ++
> ++#if ((_MIPS_SIM == _MIPS_SIM_ABI32 || _MIPS_SIM == _ABI32) && _MIPS_SZPTR == 64) \
> ++    || _MIPS_SIM == _MIPS_SIM_ABI64 || _MIPS_SIM ==  _ABIN32
> ++
> ++#define PTR_ADDU	daddu
> ++#define PTR_ADDIU	daddiu
> ++#define PTR_L		ld
> ++
> ++#endif

I can't really comment on whether this is all needed or not. It seems
complicated for a test suite, but maybe it's needed :-)

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
