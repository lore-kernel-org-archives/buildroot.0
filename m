Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F736CD4F54
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 13:32:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 321EA41A00;
	Fri, 29 May 2026 13:32:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1s2YI1xGWwuR; Fri, 29 May 2026 13:32:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F86F41DA5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780061523;
	bh=yMt4RuXftwtKBPxr0uDv4kqyh5axu0kAVi9FKNbODIg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QTDB0BPSJTVdi+tsjULf1B+nY/CqcZJ+gcr3j9KwPlUvtdKCdY5KkDnycYwzMsm2W
	 ugc1mGBUeatKXVMu04WNm6qEAdufPh+BTlfUHPBJBFguoXUjl1tbZEGxulLu/tGhxa
	 Pzw7moDvlh0URSZy8Q8YSKGo9bJ6bZ1v+J/HClOxbZ6MREtGm24zrquIiH6hCJAcLy
	 Q1KjqcYRtaqXskVbi3bwhHQnfGwtPh9pw2PqW2rCKQQ4JCnHVOyDMAHv+Qvr6MZAUw
	 fBOGwoJcHHHPajynhWCYnPiR//k0PZF1ZnhoM5aYSnw0X32FRTElLinDi4eU+vMw3Y
	 /WtfeI0OJv5UQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F86F41DA5;
	Fri, 29 May 2026 13:32:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 77195F4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 13:32:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65E4D41E7A
 for <buildroot@buildroot.org>; Fri, 29 May 2026 13:32:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qACpJec4p3Ki for <buildroot@buildroot.org>;
 Fri, 29 May 2026 13:32:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4E65B41E79
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E65B41E79
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4E65B41E79
 for <buildroot@buildroot.org>; Fri, 29 May 2026 13:31:59 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 302714E42D0E;
 Fri, 29 May 2026 13:31:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E8122601FA;
 Fri, 29 May 2026 13:31:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6DF1010888CC5; 
 Fri, 29 May 2026 15:31:54 +0200 (CEST)
Date: Fri, 29 May 2026 15:31:53 +0200
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, 
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Ismael Luceno <ismael@iodev.co.uk>, Romain Naour <romain.naour@gmail.com>
Message-ID: <ahmScNri2ZIPLaVG@windsurf>
References: <20260424132326.825570-1-jeanmichel.hautbois@yoseli.org>
 <20260424132326.825570-7-jeanmichel.hautbois@yoseli.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260424132326.825570-7-jeanmichel.hautbois@yoseli.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780061516; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=IGpnm/A0OI72UW249D7wal/XlraLUYA09ttoUOCRlUY=;
 b=zFDDIEYTPVa9kcRrMovsHpMl/5mAnxPG/YEF75QVBBBmzmOnB74Kr7VNopzycfhSuf2CY2
 0sCD+MeenwG5EkK3SVlRfFMusFEu2EK8G7G8XbaNKC5EhykN3k8iOjv2RGcP4C0kBQlDD2
 86q0tfU1wDRVWe58DTiJztPO6PMfWHxBOS/PK4V+PBv9/JVgfJg2PGk+Zp77S09Xa3jwfZ
 cN66FGqkavaPw4m3fvilpEoveRX4cO+gx7E/jNzwtvScZiDFirCu0QVQk2AKjnNOteES94
 HuacGE8tnQdImRwXzRavaMrSFHmAdq37wWK3uo+yg05DsaPn04KT29O9B7Z48w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=zFDDIEYT
Subject: Re: [Buildroot] [PATCH 06/11] package/libopenssl: extend m68k
 ColdFire support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Jean-Michel,

On Fri, Apr 24, 2026 at 03:23:21PM +0200, Jean-Michel Hautbois wrote:
> ColdFire has no hardware atomic instructions. Disable OpenSSL's
> atomic operations and inline assembly which assume a different m68k
> variant, and add -fno-strict-aliasing to prevent GCC from optimizing
> away type-punned pointer accesses used in OpenSSL internals.
> 
> Link with libatomic for the 64-bit atomic operations that OpenSSL 3.x
> requires, and force the linux-generic32 target to avoid arch-specific
> assembly paths.
> 
> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> ---
>  package/libopenssl/libopenssl.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
> index bd4b889c88..6009cbb345 100644
> --- a/package/libopenssl/libopenssl.mk
> +++ b/package/libopenssl/libopenssl.mk
> @@ -23,6 +23,9 @@ ifeq ($(BR2_m68k_cf),y)
>  LIBOPENSSL_CFLAGS += -mxgot
>  # resolves an assembler "out of range error" with blake2 and sha512 algorithms
>  LIBOPENSSL_CFLAGS += -DOPENSSL_SMALL_FOOTPRINT
> +LIBOPENSSL_CFLAGS += -DOPENSSL_NO_ATOMICS -DOPENSSL_NO_ASM -fno-strict-aliasing
> +LIBOPENSSL_CONF_ENV += LDFLAGS="-latomic"
> +LIBOPENSSL_TARGET_ARCH = linux-generic32

Why is this needed now? It is correctly building at least for existing
Coldfire platforms that we support (I believe).

If it needs -latomic, it would most likely need that on other
architectures like Sparc for which atomic built-ins are implemented in
libatomic.

So essentially the problem that I see with your patch that it is
"just" fixing your particular issue in your particular case, but not
really taking a step back and see to which cases which fix/workaround
should apply. For example the -fno-strict-aliasing thing, why is that
Coldfire specific?

Also, have a look at config BR2_PACKAGE_LIBOPENSSL_TARGET_ARCH, it
should already use "linux-generic32 no-asm", which is basically what
you're doing here. Except perhaps you have
BR2_TOOLCHAIN_HAS_LIBATOMIC, which is why "linux-latomic no-asm" gets
used instead?

As you can see, a bit more investigation is needed to have a cleaner
solution.

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
