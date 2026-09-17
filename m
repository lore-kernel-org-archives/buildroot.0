Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD760C982C1
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 07:26:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 710D660839;
	Thu, 17 Sep 2026 07:26:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tFWNh5MoZAqw; Thu, 17 Sep 2026 07:26:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 426AC60659
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789630015;
	b=D32XrUvo85YprgXMm6aB4xkdFT4RlSKWAZwop+Swt4kAC0bPOEHYUV3ToHaRi6ydUZsZ
	 zWeq1EoJK7y0zbF3oZWENausUUPUX3ozfqXAY9yfUwOaCar/kPdpOqC9iCewvF27KVk06
	 mfF43cGKvSUbpD8+n2V4d0Io5QiwiJM9nyFDvm+7hxLD8tgXFyg85StyD/n/BKPPgebTk
	 sKErn6/EYKJI2zwZIv8UGH4gUUwDX9KqYLWZba35asxvLCdedxFsA/rnjkECVSueflXvR
	 o2y3DnM0lxPsRGsI5EHUjlYFMst//37zXwx+YgSRdD3CgNsf4X5pALZdDaN6hAQgU+w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789630015;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=7RY1GxDYZEBjDEPYFur97/yr1omSPjBB8RIUnjH9gJ0=;
	b=qCvQ/lmhX1BMDqotTcXYlZnsRZmNY3ji1BNdrqkkfjE7FzIEwvJDpqU/Hec4LTuf5nwm
	 2gwp8q34ezH05e883hXT6NkA7FPrsYBmWMeNS5SH5p1R7IOyBqzpO+5UhbJIwoKXhk/Q/
	 apIflMAnBoIRWDfmtI89iCMJ1Iqf/G+lebe1/Fjp8+uXrs2yugGakeRsFu0f8G56nRFB2
	 A2beYu6LaKcQPO+hp1H360bIyDXcdUPJ7rrBki8+1h6niyemMHJf5fWeMbtLwyAZq2/Ko
	 bUZMvBhUtRzLrmuI+t1XnR/98ZsDFTGhCposBGw5pK1n3X4C7tFWTG1U0WRXEyiHIMg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789630015;
	bh=7RY1GxDYZEBjDEPYFur97/yr1omSPjBB8RIUnjH9gJ0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ltPzoJEPdRjeZAcd+MlIHN4MAMg6PHUgCbQ0r9091jpy1dhnUuPOF3MTkrGG/qOjq
	 KPdrjuNBfkPAfdmrpCBiXxLekqGuX4A39jTFkD+Av8J5clzsjCTDm40RuJEFr0jnXD
	 +UHBLbxBEUkZZ6gl9SFSqdMRVwBYNtK36WHM0O8Dk6ZHi31cTZdADtW2vzki6Ckx/s
	 Jcsa+FNVwfA+M9Pq2F8F/j/9UJUoCe38WT1GCR8L8HT6VG5w17XQbAbQOmqlHBPnq5
	 HusDuXtH0H3Tg9VICdpcKnL2PVuZUNpiBK30C04IHPNMVL3F9cFgv3Wfv4csyWpHU+
	 Zol9pu/vHAIvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 426AC60659;
	Thu, 17 Sep 2026 07:26:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C167424D
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3BB9B40793
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:26:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M_SGiuwLP73g for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 07:26:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3246B40782
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789630012;
 b=VWxdWTJg02aDSgHqu02RswLesJfKfDzD2K4gtrT6HH0Y86X2C+LNQY66Z1EAMr+EqKJI
 9EDdtZ4fYtJqFnVxqTE+k7N6vBwlftN0GOqwTTkbfN1258bTNFUK5IPpvZ9CPWFSh+tcZ
 47x5cVRQWhKYLxNXgxkhQjymLGxNqxmQaf3bKkZ7QMghmNAcLaq2IvZOpufztqujm8fzf
 08NmrO0no49VuyFzn2jlIaesNTVqELjMJQ7AUthe+pLsORE6bFz2xAIhtZOwqjNzsJieZ
 mJRqOuWYW3/7E7Y3qzTcE7g3a9+/jC7jMLT+ljDhJzYULuLjTqQLyPD1TIN1uvlBR5w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789630012;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=m6ya2rAMV2R2/BU4BxFWRYsXDfFTkuaRbxphj5fN8+8=;
 b=Ze6M2X3+bCdDDJsHJTkro8isQvhXcA26R9QnvnlScVIzD9w9vbWh6f9jjPbRkJoGimzO
 bATnN7KuczjQaTugPNYHJxxG0qpppTw6HHAUOzJfvxTP/wDiKYoWLAh38drm8T4/2Wk9+
 6KDZFI7Pkx+0ftwGZNn9Z+frbA7ZY+c//ICV1gRCV6blEFAQks9+seSj7wGpHSH6QEM3s
 Tu/i9YlPtuIkQcGb/9fBxdQ1vYHcBdsbd0HgZxQJMUGGZzvWYXSPB5H0meEEYlNBmnhWQ
 wstkGlReq9TPAdYV9Vq8CynWDdGCMMw2K3chJ7MQAUD8VnxJ4UFoajZtRV1fFilQ/Yw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=a7YspwYJ; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3246B40782
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:26:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id DCE1DC5CD71;
 Thu, 17 Sep 2026 07:27:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 911755FAA3;
 Thu, 17 Sep 2026 07:26:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B86BD11C7A20E; 
 Thu, 17 Sep 2026 09:26:48 +0200 (CEST)
Date: Thu, 17 Sep 2026 09:26:48 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
Message-ID: <aquV1bdJfyJ04l6h@windsurf>
References: <20260914092612.1283030-1-yegorslists@gmail.com>
 <aqrl-vOwcHy1wpBs@windsurf>
 <CAGm1_kux2mRrdnvkcX=y2vB=Hb3-UxkjCu-F67L2_2-N3cs-tg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGm1_kux2mRrdnvkcX=y2vB=Hb3-UxkjCu-F67L2_2-N3cs-tg@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/qemu: host-qemu does not support
 AVX512 CPUs
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

Hello Yegor,

On Thu, Sep 17, 2026 at 08:56:46AM +0200, Yegor Yefremov wrote:

>  No, I don't think it does anymore, and I believe it can simply be dropped.
> 
>   1. The exclusion comes from commit 1f7efaf89f03 ("package/qemu: do not
>   support x86_steamroller or x86_core_avx2", Feb 2020), i.e. from the Qemu
>   4.2 era, when TCG had no AVX support at all. Since Qemu 7.2, TCG
>   implements AVX, AVX2, F16C, FMA3 and VAES. In Qemu 11.0.0,
>   target/i386/cpu.c:
> 
>     #define TCG_EXT_FEATURES (... | CPUID_EXT_AVX | CPUID_EXT_F16C | \
>               CPUID_EXT_FMA | ...)
>     #define TCG_7_0_EBX_FEATURES (... | CPUID_7_0_EBX_BMI1 | \
>               CPUID_7_0_EBX_BMI2 | CPUID_7_0_EBX_AVX2 | ...)
> 
>   which covers everything -march=core-avx2 can generate.

Cool!

>   2. You are right that core-avx2 and haswell are equivalent: gcc's
>   core-avx2 is a deprecated alias for haswell, and "gcc -march=core-avx2
>   -Q --help=target" yields exactly the same feature bits as

TIL about "gcc -march=core-avx2 -Q --help=target", nice!

>   -march=haswell. In arch/Config.in.x86 both also select the very same
>   BR2_X86_CPU_HAS_* symbols. So excluding one and not the other never
>   made much sense. The same applies to broadwell, skylake, zen*,
>   x86-64-v3, ..., which all enable AVX2 and were never excluded - and
>   they do build fine on the autobuilders, which is another hint that
>   AVX2 is not the problem.

ACK.

>   3. The steamroller exclusion, however, is still needed - but it is
>   incomplete. steamroller is bdver3, and what TCG cannot emulate there is
>   not AVX, but XOP/FMA4/TBM/LWP. Qemu 11.0.0 has:
> 
>     #define TCG_EXT3_FEATURES (CPUID_EXT3_LAHF_LM | CPUID_EXT3_SVM | \
>               CPUID_EXT3_CR8LEG | CPUID_EXT3_ABM | CPUID_EXT3_SSE4A  | \
>               CPUID_EXT3_3DNOWPREFETCH | CPUID_EXT3_KERNEL_FEATURES | \
>               CPUID_EXT3_CMP_LEG)
> 
>   CPUID_EXT3_XOP, CPUID_EXT3_FMA4, CPUID_EXT3_TBM and CPUID_EXT3_LWP are
>   defined in target/i386/cpu.h, but are deliberately not part of that
>   mask.
> 
>   And the whole Bulldozer family is affected, not only steamroller
>   (checked with gcc -march=<variant> -Q --help=target):
> 
>     bdver1 (bulldozer):   XOP, FMA4, LWP
>     bdver2 (piledriver):  XOP, FMA4, TBM, LWP
>     bdver3 (steamroller): XOP, FMA4, TBM, LWP
>     bdver4 (excavator):   XOP, FMA4, TBM, LWP (and AVX2)
> 
>   So BR2_x86_bulldozer, BR2_x86_piledriver and BR2_x86_excavator ought to
>   be excluded as well.
> 
>   If you agree, I'll send a follow-up patch that:
> 
>    - drops the !BR2_x86_core_avx2 dependency,
>    - adds a hidden BR2_X86_CPU_HAS_XOP symbol in arch/Config.in.x86,
>      selected by the four bdver variants, and replaces
>      !BR2_x86_steamroller with !BR2_X86_CPU_HAS_XOP in
>      BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS - i.e. the same pattern as the
>      existing BR2_X86_CPU_HAS_AVX512 dependency.

This looks perfect!

>   If you'd rather not add a new BR2_X86_CPU_HAS_* symbol for a single
>   user, I can just list the four variants explicitly instead.

I think adding BR2_X86_CPU_HAS_XOP is better, even if it has a single
user. Indeed, it makes it explicit what is the feature that isn't
implemented by Qemu.

Thanks a lot for this very thorough answer!

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
