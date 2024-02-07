Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D49C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 15:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD7CF83B46;
	Wed,  7 Feb 2024 15:47:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UIfFn2lgaFQo; Wed,  7 Feb 2024 15:47:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8FB183B48
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8FB183B48;
	Wed,  7 Feb 2024 15:47:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5F0D61BF471
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 15:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C01383B48
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 15:47:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qYbP_JsyfCdW for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 15:47:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DD8D683B46
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD8D683B46
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DD8D683B46
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 15:47:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 220651BF20D;
 Wed,  7 Feb 2024 15:47:42 +0000 (UTC)
Date: Wed, 7 Feb 2024 16:47:41 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240207164741.1bad9b44@windsurf>
In-Reply-To: <20240114135446.1156025-1-fontaine.fabrice@gmail.com>
References: <20240114135446.1156025-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707320862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5ZybzQsNxRFpmyj1C9WWDcePvdkpWesJPc6dVWDPv48=;
 b=N+1Y0uxeQEO5rLEK2v+uSw3ctvyzxq92naTTF9+/9ApEw4dYEBKdncZkMb9gWgadsP54fr
 F81C2S3sxnQjV3kkB9mBnWmXImt+hhLpYl0+8KCKAajo0YZYUH1UrupiwiV5BxehMTqWzX
 L1OaAkimKKCSF4zeWgiESS3UJ1aYAH6VeOBz9EfhsBumtcI8MRria5IbAphMWGUDZgBqYu
 r9Gj9ZzPBQBSjSq3mXx46CUV7mRvO0DUR6L223TwUDMYfoDTXMY1Pke+jvL4Wtv6PaFuYR
 nxPVPqXC0Yu5Ukq4IhPI1tIi7vsNkB8AC9yGqnlG95tIDr5mnXLswL7WKVcg/g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=N+1Y0uxe
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/tinymembench: force arm mode instead of Thumb mode
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

On Sun, 14 Jan 2024 14:54:46 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> +# tinymembench has some assembly function that is not present in Thumb mode:
> +# Error: instruction not supported in Thumb16 mode -- `subs r1,r1,#16'
> +# so, we desactivate Thumb mode
> +ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
> +TINYMEMBENCH_MAKE_OPTS += CFLAGS="$(TARGET_CFLAGS) -marm"
> +endif

Why don't we simply extend the existing patch in the same way? It's
just that new code has been added in main.c that isn't Thumb
compatible, so I think you could change:

#ifdef __arm__

to

#if defined(__arm__) && defined(__ARM_ARCH_ISA_ARM)

in main.c, and this should get you going. Could you try this instead?

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
