Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2BA3D12D4B
	for <buildroot@archiver.kernel.org>; Sun, 10 Nov 2024 17:13:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9109780D18;
	Sun, 10 Nov 2024 17:13:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f-pR-rAIYF89; Sun, 10 Nov 2024 17:13:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A316380D19
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A316380D19;
	Sun, 10 Nov 2024 17:13:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 778C96C
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 17:13:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 55CF5402D7
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 17:13:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5pLIBLixlcg1 for <buildroot@buildroot.org>;
 Sun, 10 Nov 2024 17:13:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D7D4B401D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7D4B401D8
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D7D4B401D8
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 17:13:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E47B11C0002;
 Sun, 10 Nov 2024 17:13:34 +0000 (UTC)
Date: Sun, 10 Nov 2024 18:13:34 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <20241110181334.0746f1a8@windsurf>
In-Reply-To: <20241110103624.1041337-1-bernd@kuhls.net>
References: <20241110103624.1041337-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1731258815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZBg60ldPN/PNzF9mgrDSzJms633BbXdtSFs5i7dHOHE=;
 b=d2+QTRw9q/vcihECJVNxe7GVS4JaMJ1EDBn2qpZDF2NnCItGfpqmnJ/LNbvFBeiveC24Ib
 gMXNIqV1TofQIp7j5GVgZHvpfCR4T15jKGdsqKSnhlFC0gEXDpftGvwZHTFKPhKjs7O5iM
 5IKxW8rN+kQr16lnYe6Lqa9TeHVR8cUa7QBklZ1ouTQZD7M6WX1g6K7gRWntoCs3wJqOUC
 dlsaWAtCH5nlRe4Do3Td08r/3tx60Dio36V/NiwSftbAOfwkb1VgnLGz7By+jFaMisA39j
 YL0KQtIR5X7LvHfEREr3+1e5WiQT483MmDZj46HW0GSZ5n+t2A/8bCvbcXU31Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=d2+QTRw9
Subject: Re: [Buildroot] [PATCH 1/1] package/libvpl: not supported on mips64
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

Hello Bernd,

On Sun, 10 Nov 2024 11:36:24 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> diff --git a/package/libvpl/Config.in b/package/libvpl/Config.in
> index b9e9a20fd7..5a370ed2e3 100644
> --- a/package/libvpl/Config.in
> +++ b/package/libvpl/Config.in
> @@ -1,6 +1,6 @@
>  config BR2_PACKAGE_LIBVPL_ARCH_SUPPORTS
>  	bool
> -	default y if BR2_ARCH_IS_64
> +	default y if BR2_ARCH_IS_64 && !BR2_mips64 && !BR2_mips64el
>  	default y if BR2_arm

Thanks for the fix. However, would it be possible to do something a bit
more consistent with what the code does?

#if defined(_WIN64) || defined(__LP64__)
    #define MFX_PACK_BEGIN_STRUCT_W_PTR()    MFX_PACK_BEGIN_X(8)
    #define MFX_PACK_BEGIN_STRUCT_W_L_TYPE() MFX_PACK_BEGIN_X(8)
/* 32-bit ILP32 data model Windows* (Intel(r) architecture) */
#elif defined(_WIN32) || defined(_M_IX86) && !defined(__linux__)
    #define MFX_PACK_BEGIN_STRUCT_W_PTR()    MFX_PACK_BEGIN_X(4)
    #define MFX_PACK_BEGIN_STRUCT_W_L_TYPE() MFX_PACK_BEGIN_X(8)
/* 32-bit ILP32 data model Linux* */
#elif defined(__ILP32__) || defined(__arm__)
    #define MFX_PACK_BEGIN_STRUCT_W_PTR()    MFX_PACK_BEGIN_X(4)
    #define MFX_PACK_BEGIN_STRUCT_W_L_TYPE() MFX_PACK_BEGIN_X(4)

So in our case, the code works on:

- Architectures that define __LP64__
- Architectures that define __ILP32__
- Architectures that define __arm__

Currently we only enable for 64-bit architectures and ARM, but other
32-bit architectures are also supported (the ones that define
__ILP32__).

This can easily be checked by looking at the built-in cross-compiler
defines:

$ ARCH-linux-gcc -dM -E - < /dev/null | grep -E "(LP|ILP)"

For example, it looks like i386 would be supported.

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
