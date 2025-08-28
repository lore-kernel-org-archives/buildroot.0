Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F12A3CA0EED
	for <buildroot@archiver.kernel.org>; Thu, 28 Aug 2025 20:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4FF161163;
	Thu, 28 Aug 2025 20:44:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mTUbwOxOHFqw; Thu, 28 Aug 2025 20:44:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E819C610CF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E819C610CF;
	Thu, 28 Aug 2025 20:44:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D8AD928
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 20:44:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FDBE41296
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 20:44:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wCpJJGhkLRGO for <buildroot@buildroot.org>;
 Thu, 28 Aug 2025 20:44:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6B0BA41294
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B0BA41294
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6B0BA41294
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 20:44:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 52B8BB978306; Thu, 28 Aug 2025 22:44:19 +0200 (CEST)
Message-ID: <9d6603d5-c827-401d-8dad-42bd907bdd91@rnout.be>
Date: Thu, 28 Aug 2025 22:44:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Cc: Yuriy Kolerov <yuriy.kolerov@synopsys.com>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
References: <20250518115421.41021-1-thomas.petazzoni@bootlin.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250518115421.41021-1-thomas.petazzoni@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1756413860; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=2JheTG4uasI2CtJYteMdY3QVfvhJ5LtZvAkassdtWRo=;
 b=FNcN9d9swUd8Mo5VMgea2eSvOntT/XmN38rEJEnKqWQw+H1/f9ILM5moU+zWginZl/Rm4q
 bisJPCL0xN+VN+Z8pPa+/hRNoajx6ZfUW/oIPZUBrTJVlDKSWjlPcHYWxZcE/tkKk2BQaz
 IlxCZqniB8qouxeHooF4nPPMpuHKiur68yyxPFsGT0Uw0pNQvxWP5r9sSPwLshg1bwGHUk
 KQPLBs14zxTy3PCAOJv+6JTzc/CVrOrLtwJxNAhTMZtuavZsbLp/NZ4+9men921cV5AgkE
 5qo6RgQpVwHr0JxAXrDVHMid9XVCmLylSqdMYBp3rQL2hIghI3DZ7FJCVuhNJA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=FNcN9d9s
Subject: Re: [Buildroot] [PATCH] support/scripts/gen-bootin-toolchains:
 arcle-750d toolchain has no gdbserver
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 18/05/2025 13:54, Thomas Petazzoni via buildroot wrote:
> Since the build of gdbserver for ARC 750D is broken, Bootlin
> toolchains since 2024.05 no longer provide gdbserver for ARC, causing
> build failures when the autobuilders try to use it. Let's fix this by
> telling gen-bootlin-toolchains that the arcle-750d toolchains don't
> have gdbserver.
> 
> Fixes:
> 
>    https://autobuild.buildroot.net/results/77c865f941612e99d8b6a7f66b5bc06f90d6b7db/
> 
> Cc: Yuriy Kolerov <yuriy.kolerov@synopsys.com>
> Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   support/scripts/gen-bootlin-toolchains                          | 1 +
>   .../toolchain-external-bootlin/Config.in.options                | 2 ++
>   2 files changed, 3 insertions(+)
> 
> diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
> index 502411d4cc..152bb90a85 100755
> --- a/support/scripts/gen-bootlin-toolchains
> +++ b/support/scripts/gen-bootlin-toolchains
> @@ -36,6 +36,7 @@ arches = {
>       'arcle-750d': {
>           'conditions': ['BR2_arcle', 'BR2_arc750d'],
>           'prefix': 'arc',
> +        'gdbserver': False,
>       },
>       'arcle-hs38': {
>           'conditions': ['BR2_arcle', 'BR2_archs38'],
> diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
> index ef3d23d026..2dac422796 100644
> --- a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
> +++ b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
> @@ -353,6 +353,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_750D_UCLIBC_BLEEDING_EDGE
>   	depends on BR2_arcle
>   	depends on BR2_arc750d
>   	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
> +	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
>   	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
>   	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
>   	select BR2_USE_WCHAR
> @@ -378,6 +379,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_750D_UCLIBC_STABLE
>   	depends on BR2_arcle
>   	depends on BR2_arc750d
>   	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
> +	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
>   	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
>   	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
>   	select BR2_USE_WCHAR

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
