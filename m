Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F920C98321
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE13781349;
	Fri, 25 Sep 2026 14:46:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PObRJuW-m0SZ; Fri, 25 Sep 2026 14:46:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E3509813FB
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347607;
	b=sajA//zyBajjGUU90rDU0I82ov07sTD632cUPzAOzqwcChlcTSEIeZA+WDvWXuSxKdsX
	 PQU1bHwRfrWcjk1jhHrR0JVKI5wkPdH/Ojwi6N1BcwSzf3PythWoXveyv8FkeWlWdICLk
	 XnfN9+uVD6AwLHPpzbWhlqPOMCQZlaYXehJGRrVCUoMMzqpnjOytKNTog8P5xLKXIAUcT
	 IoEfOxe+z7a2i7GjXhBL9hSkIvUlZwp9Px4xQYhOgCHFN0Hk5ZYzk6MXrlpjMNi34c22Q
	 zLgs+CE0dfaD6j0p/oQ4E3dIXK0FXmiH6RtLemdBRMVxCHTBBesunwWE/7U+PDOg4cQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347607;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=71cqTlWGI9tJplIUacWbC3XCScQhVumNlNVjv/H80oI=;
	b=TcgJnUPLQOzJlbsrDQEP8xzOpSJldh1MBfKBAEBP1YgSCDwegABbR+KpSSh1qsZDxoLl
	 U52L8YOq6sIHLcmfwBBodJg/cho7ZfDcxV9cLJPfibQTrb0jh1ETv+jPxWXAucO/M5Znl
	 5jsoV2se50Ic9JQBYZpa8UwiLfrnyrjzHCUIYN063FYhKPFQ5gpdpAyZfaWl7o9r0FFA6
	 ztWoF7hSEsQZbstXo48PDcO29R/sBYRlLb2gEDjozTmocvyvtoeyHF8M4R2yOKMt/nmBC
	 dw1UfTnpTTqwVWwH0mm/z/vZVimIGXrEb5Rn8GsOU+3BY2N34ikGOHwDZDqRCargQrg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347607;
	bh=71cqTlWGI9tJplIUacWbC3XCScQhVumNlNVjv/H80oI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oaq/HA45/+MiBzJBDz2miOFpW6VO1W/4Bw0y0ODpn65BP8vCg+f3SRIHHDvIpctjh
	 A+kR2DbShkpS+ImswhvTLtgLzkThUSr6Yqr2un8pnP200viPmoBo8X5rF4EM0z0oDr
	 TWYyr+EICO++0kyBW85z4hM7y2O5DwDIL60SA39l6AEM8toxfKhFfdLRFo4171Lmfx
	 rIf3+ZJZ9m4Pn/T9uvA4Nv4qQgeAoRTzyradpyzv3zEMchcCKsWFs2HkGRLwY+E60V
	 ugPbCh8yqvgf04JgmVpmlShvFcaThX3Lk5Oh4HePOZoDKZmKzmYo28vZf4pGMedpJF
	 C8LXmlRksVmrw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3509813FB;
	Fri, 25 Sep 2026 14:46:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1EA47334
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C32240475
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:46:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YtoI9CNj4oUT for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:46:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 0D6CB40181
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347603;
 b=LZd/vneUPfJQAgKKI71oRqUvKUh5Pmfvd0ZwWR+/CoyEpIxvOns7UJlOugvY+kNxk6Yr
 TDS+2JPm4AZEPCbLMSAn4zspvPyTgrTbVgBGp38ZbLeTZbCmhILuYXIFGbcMgBZ9emWSh
 xwCnGHhxQcxo+ZiPO/WskpkzBEviirIiEq50B6dgXZce9BJlaGZHszgE2VmVwSBVKq7aE
 DfZTQLzQmOISp3tJjOYEaJRb9pCMWcDZ8nOe+naSc73IeuuANgs8ZsO0Rjboi2+qJbEVs
 9OJMwiLmg5U2k3NDAXLPKh6ap9evmJ90TNRmWxffdB0qM1LXGAy3XSucCPUmsAJZGhQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347603;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=MHYDutI62HF2OesgHxuIfRSu26Pw3mOT/1ZWQRSIHqs=;
 b=a2dzIlWRQhF8bWUyzTqZUIy2gcIjHt/u6TmpGmgaQ6atm3w1WwoZc/2Hp05J29128aRG
 Gb/oexgyN+uEvFpH79K1ZYNISZqNLxso6DOXFduit/HgVoEhVXSlVqLXrVV+dF+Khq8kn
 tWOfMKStKkl7vakHM7+3rrS46KzTIIyT5d4+O1g3FtHP5jui/gZFhGRxMUJUyS6/LTlfl
 8b+vBQNjxgZNpXDi5Gxw+q9uVnwwQqXGIek+KYP1RwTIgBI1/mpoSDkHwzTFQgTWNUIGg
 Ix3Zlh1ILfuZB0C5bRVzqPw95/V/eh/jjexVkWcbJwjFDJaXZzxEgfrXrMiiMAe141w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=h8C9awsa; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::f"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:30::f;
 helo=mail-wr2-x0f.google.com; envelope-from=raphael.melotte@essensium.com;
 receiver=<UNKNOWN> 
Received: from mail-wr2-x0f.google.com (mail-wr2-x0f.google.com
 [IPv6:2a00:1450:4864:30::f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0D6CB40181
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:46:42 +0000 (UTC)
Received: by mail-wr2-x0f.google.com with SMTP id
 ffacd0b85a97d-48881a62e09so374064f8f.2
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:46:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347601; x=1790952401;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=MHYDutI62HF2OesgHxuIfRSu26Pw3mOT/1ZWQRSIHqs=;
 b=qSgusqPBBIsGlJ8arhtmOEchAiDQNCtrbU3WmH+w9mw48ML/rb6+o83OjwtgpQX4ok
 VbIzB4VgqLmzRt7VgWwFxDRIMJH2ZtOH0caFzwM03XtNx8FYuBrBoIW0AMTDoqPHTtky
 y98grIzXstwBAooF0j3ZPUOXBEGoMEwHql2CH6wYZmc2TgMOMuMs3wvhk4Cy7UdZDihk
 ry2wRRZJENrJKbva4luCmyeldfbeFYjTmCGdawgihKwTAmQ7PHm9TCPHeOaJ6T6Kh1bU
 W3Fg1E6frwPPQnJS6Xa6lgKR3jMh58oOqqZqF4ckvEk7z+Tk56IzNHRy/2ohAh4g5mXl
 Sm6w==
X-Gm-Message-State: AFuF++ksgpPTH5myaPKL+PUOxYCL67Rwcst58BrXzujqxN8VE2+g2kfl
 gUIc9XAq82ZHHUwlSR/VCBw/kn0efbLJXj/wj3f+RLYjNnSMkpRTHlx3180RUCUzLtDYGBxsYgM
 9GQ4Nt9NDMg==
X-Gm-Gg: AYBFou3JwH57vlyQoKmn/lfJ2az/7t6yW541fgI8oVKuhjPQgtwjF0qy6AGeto8OrV1
 8Ogggh5nM8S/HvdEWd8fBhCP0Kjtnj/8tw1qRORql0DcHa/RbpUcqzlDchXFSsIBHPA5LtBlVwh
 uCyKb94edR/qSs6w5b1QsW8kRG2m2WSq++e5S8Od57ZWK+Shm6tzOL36BMUGMtrWHhzPAAHDOeJ
 zYYC1ubvm28kUV2TKKyi16OYkT75ygZAlIZEvcEgD77Kws2pYFXvUUS3aibBWUg03zP+vOreieB
 LjJpT0kc+Q2NgeZ5UsZs9FBf8lrF0Eghedetnvgsncsy9/wQRk7vjHMFhATEjxfSh7V3bAIliDF
 F+H2BYwo9OPVoAKVSY33cUnlaJ/AQ8NU0rJAkOwgXRf6EAgcW101O59EwM/dR7aefzYonFP8iyZ
 sKZVXbVwl1Yt7OFnZlA7qxgn26zQakAUuJjAufPnc95z++QJO2I4kJGNNQyjzxJJ7hjXBtqCIRn
 hRoFxVG4EY4d4n1cpA5UzzCIWggt2Zg6aGfDaeGFQ==
X-Received: by 2002:a05:6000:41cd:b0:487:11e1:cab2 with SMTP id
 ffacd0b85a97d-48871770959mr10816679f8f.49.1790347600857; 
 Fri, 25 Sep 2026 07:46:40 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4887a355826sm7881803f8f.18.2026.09.25.07.46.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:46:40 -0700 (PDT)
To: buildroot@buildroot.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:46:37 +0200
Message-ID: <20260925144639.4099783-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260917075326.1256294-4-yegorslists@gmail.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/3] package/qemu: host-qemu does not
 support XOP capable CPUs
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Commit 1f7efaf89f03 ("package/qemu: do not support x86_steamroller or
> x86_core_avx2") excluded BR2_x86_steamroller from
> BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS. This is still needed, but for a
> different reason than AVX, and the exclusion is incomplete.
> 
> steamroller is bdver3, and what the Qemu TCG engine cannot emulate
> there is not AVX, but the Bulldozer-specific XOP, FMA4, TBM and LWP
> extensions. In Qemu 11.0.0 (the version we currently package) and
> 11.1.1, target/i386/cpu.c has:
> 
>   #define TCG_EXT3_FEATURES (CPUID_EXT3_LAHF_LM | CPUID_EXT3_SVM | \
>             CPUID_EXT3_CR8LEG | CPUID_EXT3_ABM | CPUID_EXT3_SSE4A | \
>             CPUID_EXT3_3DNOWPREFETCH | CPUID_EXT3_KERNEL_FEATURES | \
>             CPUID_EXT3_CMP_LEG)
> 
> CPUID_EXT3_XOP, CPUID_EXT3_FMA4, CPUID_EXT3_TBM and CPUID_EXT3_LWP are
> defined in target/i386/cpu.h, but are not part of that mask, i.e. TCG
> does not implement them. Binaries using those instructions therefore
> die with:
> 
>   qemu: uncaught target signal 4 (Illegal instruction) - core dumped
> 
> This affects the whole Bulldozer family, not only steamroller:
> bulldozer (bdver1), piledriver (bdver2) and excavator (bdver4) are
> equally unsupported, but were never excluded.
> 
> Use the newly introduced BR2_X86_CPU_HAS_XOP symbol, which covers all
> four variants, instead of listing BR2_x86_steamroller alone. As for
> AVX512, this disables gobject-introspection and nodejs, which are the
> two packages needing host-qemu in user mode.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> Assisted-by: Claude:claude-opus-5

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/qemu/Config.in.host | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
> index 48979fd7ce..fbc989b003 100644
> --- a/package/qemu/Config.in.host
> +++ b/package/qemu/Config.in.host
> @@ -22,10 +22,11 @@ config BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
>  	default y if BR2_sparc64
>  	default y if BR2_xtensa
>  	default y if BR2_x86_64
> -	depends on !BR2_x86_steamroller
> -	# The Qemu TCG engine does not implement the AVX512
> -	# instruction set, so binaries built for such CPUs cannot be
> -	# emulated.
> +	# The Qemu TCG engine implements neither the XOP instruction set
> +	# nor the other Bulldozer-specific extensions (FMA4, TBM, LWP),
> +	# and it does not implement the AVX512 instruction set either,
> +	# so binaries built for such CPUs cannot be emulated.
> +	depends on !BR2_X86_CPU_HAS_XOP
>  	depends on !BR2_X86_CPU_HAS_AVX512
>  	depends on !BR2_powerpc_620 && !BR2_powerpc_630
>  
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
