Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73AD6C25B5C
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 19:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 309F44010D;
	Mon,  6 May 2024 19:25:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ak47NfKgjjzw; Mon,  6 May 2024 19:25:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 309E5408CA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 309E5408CA;
	Mon,  6 May 2024 19:25:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2C30C1BF28B
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 19:25:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 247AC82094
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 19:25:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9IltDAsiSOxw for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 19:25:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 09C8E80E9E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09C8E80E9E
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 09C8E80E9E
 for <buildroot@buildroot.org>; Mon,  6 May 2024 19:25:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 34F5640004;
 Mon,  6 May 2024 19:25:52 +0000 (UTC)
Date: Mon, 6 May 2024 21:25:51 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240506212551.55d9132c@windsurf>
In-Reply-To: <20240505084753.38281-1-fontaine.fabrice@gmail.com>
References: <20240505084753.38281-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715023552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o6qP9fVUPfivjFTqYrwPM9s+jBiVPjbcANGiWc4vU2w=;
 b=MdHjF/iZulpyAVp9Kevw7yhxzgGlMkPA4GU99NBNjZ+64fvjiYohR0if4Fspv6k7Briby5
 VsPCKOOSqAXxJI25oR7qaYFyryUwwEhUgRlS/APu30vURQRLokmvPUYl4B9UsBvROMtDZ+
 aJyWaud+/Sx1wAqrGIBYYYKP5L/Kv64ATKqZvilE9vZ/jzQLFo9gsBLXxIPfl7Wt+Fs8AW
 Cw1prxfDuUroX9GDfyUPt3r9oHllHEn5pq98Lz4jWyhtmMDCQgk+66ezxwM1vM2EqZsFaS
 7QuvhbJAohNl7KvhxmxmuEwYYmdpPgmrpQkVSz0JC0iBlNixZ3zR4hMlExSeRA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MdHjF/iZ
Subject: Re: [Buildroot] [PATCH 1/1] package/highway: fix build with powerpc7
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
Cc: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

On Sun,  5 May 2024 10:47:53 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> +ifeq ($(BR2_powerpc_power7),y)
> +HIGHWAY_CXXFLAGS += -DHWY_DISABLE_PPC8_CRYPTO
> +endif

You're going to hate me, but this really shouldn't require a hack in
Buildroot's packaging. It should be handled directly by the highway
build system/conditional build logic.

BTW, some stuff in hwy/detect_targets.h is weird:

#if HWY_ARCH_PPC && HWY_COMPILER_GCC && defined(__ALTIVEC__) && \
    defined(__VSX__) && defined(__POWER8_VECTOR__) &&           \
    (defined(__CRYPTO__) || defined(HWY_DISABLE_PPC8_CRYPTO))
#define HWY_BASELINE_PPC8 HWY_PPC8
#else
#define HWY_BASELINE_PPC8 0
#endif

Why is this defined(__CRYPTO__) || defined(HWY_DISABLE_PPC8_CRYPTO) ?

So when you *disable* PPC8 crypto, it uses it? Or I am misunderstanding
things?

The problematic code starts with:

  #if !HWY_S390X_HAVE_Z14 && !defined(HWY_DISABLE_PPC8_CRYPTO)

I guess it needs some additional condition to not kick in on Power7.

Could you have a look into this, or report the bug upstream?

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
