Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA2FC27C53
	for <buildroot@archiver.kernel.org>; Sat, 22 Jun 2024 17:34:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE458400DD;
	Sat, 22 Jun 2024 17:34:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8aApIq7pLjZ3; Sat, 22 Jun 2024 17:34:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58E1F40278
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 58E1F40278;
	Sat, 22 Jun 2024 17:34:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 011F91BF5DB
 for <buildroot@lists.busybox.net>; Sat, 22 Jun 2024 17:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2BC6402A6
 for <buildroot@lists.busybox.net>; Sat, 22 Jun 2024 17:34:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UcwNMhqO_U-3 for <buildroot@lists.busybox.net>;
 Sat, 22 Jun 2024 17:34:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4E411402A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E411402A3
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4E411402A3
 for <buildroot@buildroot.org>; Sat, 22 Jun 2024 17:34:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5F87A20002;
 Sat, 22 Jun 2024 17:34:08 +0000 (UTC)
Date: Sat, 22 Jun 2024 19:34:07 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240622193407.1981d92d@windsurf>
In-Reply-To: <Zm/ksIQncNtMkBcv@waldemar-brodkorb.de>
References: <Zm/ksIQncNtMkBcv@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1719077648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tnKNWsV6FLkKJA2uBx3SqYOHm1oeBJjMbYhU38AlQpw=;
 b=FHIVD0ltYhIG+pXB5k8UFrx0jNSY61s8br0HpvzKa2JYQyvqXkcbqiLiVdnm2vx4Xk98Yr
 omYZMHgPsW/nKwXRu8DOW7pdCFhK3k2rjWQLFIADMDqv6ANgmkYbOvENL/5Wj1Gu4cN8KE
 DVUirKjpjl8KGcqU/GEXBj7A0X6QSKXlQYqL6HpldG6Ki0RpEwC1JiJZx7lXutGjfULVXp
 9b2QV77IMzcF4B5tY4c1TzGoMOQWKKnJt66e/dOER4mlthNbX4O54oWsp56L41dVub9e8U
 PfpjhkEyayJTEVDHrlBlzioLH22CbL5YOiv1yseWTtH156OZIoJo0fGViYoN3Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FHIVD0lt
Subject: Re: [Buildroot] [PATCH] configs/qemu: Update defconfigs to Linux
 6.6.32
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

Hello Waldemar,

On Mon, 17 Jun 2024 09:24:32 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Linux version are changed to 6.6.32 (LTS) for all qemu defconfigs,
> 
> Qemu 9.0.0/9.0.1 has introduced a Bug in sh4/sh4eb emulation so
> that the system doesn't boot anymore.
> The issue is already reported by Guenter Roeck:
> https://lists.nongnu.org/archive/html/qemu-devel/2024-05/msg00606.html

So this is not a regression introduced by this patch, right?

> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> Should we switch sh4/sh4eb to initramfs?

I guess it would be good to have those defconfigs working yes.

> diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
> index ac724d5c15..d332445779 100644
> --- a/package/binutils/binutils.hash
> +++ b/package/binutils/binutils.hash
> @@ -9,3 +9,6 @@ sha512  3518b47d5c11d1fb478ee152bde1719363f9391db73f3b9f5491217c17742bef8ebca6a5
>  # locally computed
>  sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING3
>  sha256  56bdea73b6145ef6ac5259b3da390b981d840c24cb03b8e1cbc678de7ecfa18d  COPYING.LIB
> +
> +# locally computed
> +sha256  a76052c0c71d4025b117dcfc18ca7e189ac495a7645fa98c1bdaddca15cce815  xtensa_dc233c.tar.gz
> diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
> index 0b48a1acdd..0dbcd82ed1 100644
> --- a/package/gcc/gcc.hash
> +++ b/package/gcc/gcc.hash
> @@ -20,3 +20,6 @@ sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYIN
>  sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING3.LIB
>  sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
>  sha256  9d6b43ce4d8de0c878bf16b54d8e7a10d9bd42b75178153e3af6a815bdc90f74  COPYING.RUNTIME
> +
> +# Locally calculated
> +sha256  a76052c0c71d4025b117dcfc18ca7e189ac495a7645fa98c1bdaddca15cce815  xtensa_dc233c.tar.gz

I believe those hashes should not be in package/binutils/binutils.hash
and package/gcc/gcc.hash, because they are specific to the Qemu Xtensa
defconfigs. Instead, they should go in board/qemu/patches/gcc/gcc.hash
and board/qemu/patches/binutils/binutils.hash. My understanding of the
hash checking code is that hashes are looked *both* into the main hash
file (package/gcc/gcc.hash) and into any existing hash file provided in
the BR2_GLOBAL_PATCH_DIR directory.

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
