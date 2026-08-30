Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F28AEC61DD9
	for <buildroot@archiver.kernel.org>; Sun, 30 Aug 2026 17:22:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDF91405CE;
	Sun, 30 Aug 2026 17:22:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7NSUu_fIZweY; Sun, 30 Aug 2026 17:22:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788110568;
	bh=pE5vt9mJafQeJtFa8BZgw2ywI2Gt1o7xaOl9KPIsjdw=;
	h=Date:From:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=XeguqOgYQ06XEOri2GSd8sste32uloqTMKVtN/L6A3wen/1G8hNNwq8LKx/J8JoMX
	 BPgsQNKysRvNOpGmZgHLPjekkAnc0n3T4xX/P3xdo50ewIbXsm1J5taxf1TlEl//8R
	 NqXQ6b72L+pPW1F752vlHzbDOZsbzyG3UeRrRDhrY7RbjP2Sv/X8zpJmKVKV1KZBm6
	 +NjaDdjpkhSahCKFqGhs4hZC2GJOcSCn/Ach8LyAf+S38HeA5AkANK1CX5HwMjF3Yz
	 ijVuiGyQ6yOZbaNu8kguqJeg3oJvsXG40ewB4yUOLKQp2L9iyzc50aAc9tw63znsSf
	 lIcqUihMa8VUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4ADFE405AA;
	Sun, 30 Aug 2026 17:22:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A03AF2
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 17:22:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3BB8A405AA
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 17:22:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VQeEBmcQ5Oqv for <buildroot@buildroot.org>;
 Sun, 30 Aug 2026 17:22:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 23247405A7
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 17:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1788110557; bh=tqXm0hCeO2wTRkh9upwf9wc+YAGA2TZ8FaROIe8PgvE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Gv46WCLOqYFgfEqyD2ShNPnS0pEb9a18vkZmjd8v1euc6HIrZXI7pEc4byZb9m9Go
 xeo422tlZkwCWoAfIS0NjfR5id8sMr8RQcng9b0mtj2oCIOsoC7hiGrOXxWC2iG9M1
 9+TQLQEEDgMrYofN+nAaQoeGrY3OFDDKKTIlTZIqcKkgnWTfj4xQ/0DB+0tZpLpAlw
 dwaD9YhBmbeLcsVoKDoHwskZ8hNRt14QICggKs9+BZbj0v9GFq15Nz2YOd5u3myitU
 Hym+BHXMHxzTm1Zzh6T3wzIJTKljRl2xTZbtG1gYn0HB196S2a4MIP7AU1Eu3YzdA6
 jmD82Rlc912iw==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 2FAD731E0AEB; Sun, 30 Aug 2026 19:22:35 +0200 (CEST)
Date: Sun, 30 Aug 2026 19:22:34 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <apRm2p0SBim7_BtZ@waldemar-brodkorb.de>
References: <aoYrHjB83RoRdw1j@waldemar-brodkorb.de> <apLDmvqL1lzNhoH5@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <apLDmvqL1lzNhoH5@windsurf>
X-Operating-System: Linux 6.12.96+deb13-amd64 x86_64
Subject: Re: [Buildroot] [PATCH] arch/or1k: fix uClibc issues with fenv
 enabled
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,
Thomas Petazzoni wrote,

> Hello Waldemar,
> 
> On Thu, Aug 20, 2026 at 12:15:58AM +0200, Waldemar Brodkorb wrote:
> > OpenRISC architecture can be either soft-float or hard-float, so add the
> > ability to the user to configure it.
> > 
> > GNU libc has hard-float support since 03 May 2024, see here:
> > https://sourceware.org/pipermail/glibc-cvs/2024q2/085211.html
> > There fenv functions f.e. were added to glibc.
> > 
> > uClibc-ng has added fenv functions in commit 8a77b4785acd143d76ccc08142abb39c0100de3d
> > on 27 April 2025.
> > 
> > musl does not have any or1k architecture specific fenv support.
> > 
> > Tested with all 6 combinations of C libraries and float configurations.
> 
> Are you sure? I don't see how your patch solves the soft-float
> configuration.
> 
> > diff --git a/arch/Config.in.or1k b/arch/Config.in.or1k
> > index f42aef9eef..e626907496 100644
> > --- a/arch/Config.in.or1k
> > +++ b/arch/Config.in.or1k
> > @@ -1,3 +1,12 @@
> > +config BR2_OR1K_SOFT_FLOAT
> > +	bool "Use soft-float"
> > +	select BR2_SOFT_FLOAT
> 
> This should be "default y", to preserve existing behavior.
> 
> > +	help
> > +	  If your target CPU does not have a Floating Point Unit (FPU)
> > +	  or a kernel FPU emulator, but you still wish to support
> > +	  floating point functions, then everything will need to be
> > +	  compiled with soft floating point support (-msoft-float).
> > +
> >  config BR2_ARCH
> >  	default "or1k"
> >  
> > diff --git a/package/Makefile.in b/package/Makefile.in
> > index eac28b3a96..69859e8ce4 100644
> > --- a/package/Makefile.in
> > +++ b/package/Makefile.in
> > @@ -106,6 +106,14 @@ TARGET_ABI += -mabi=spe -mfloat-gprs=double -Wa,-me500mc
> >  endif
> >  endif
> >  
> > +# use hard-float option globally for OpenRISC, when not
> > +# soft-float choosen by the user.
> > +ifeq ($(BR2_or1k),y)
> > +ifneq ($(BR2_OR1K_SOFT_FLOAT),y)
> > +TARGET_ABI += -mhard-float
> > +endif
> > +endif
> 
> This needs somehow to go in the toolchain wrapper, so instead of your
> change, you would need something like this:
> 
> diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
> index 180e90856d..16c9e08ba5 100644
> --- a/package/gcc/gcc.mk
> +++ b/package/gcc/gcc.mk
> @@ -212,6 +212,10 @@ ifeq ($(BR2_SOFT_FLOAT),y)
>  ifeq ($(BR2_arm)$(BR2_armeb)$(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el)$(BR2_powerpc)$(BR2_sparc),y)
>  HOST_GCC_COMMON_CONF_OPTS += --with-float=soft
>  endif
> +else
> +ifeq ($(BR2_or1k),y)
> +HOST_GCC_COMMON_CONF_OPTS += --with-float=hard
> +endif
>  endif

The or1k gcc configuration has no --with-float. Only passing
-mhard-float as CFLAGS is possible.

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
