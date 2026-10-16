Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A03D3CCF2C1
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 22:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AB1E405F8;
	Fri, 16 Oct 2026 22:17:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tNuE439PVmh6; Fri, 16 Oct 2026 22:17:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 555CE40602
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792189042;
	b=dL3gteHZ/J1z9Ji2QK/gwIEyTf/rR7qnZxO4N1QfLtmdR1N2BfiErSobdTDzmPEZUESz
	 ARhr3BX4/FZ27jKinTKggjJ/7Y9CDZIoHcO4cpMIo42NO/XhwCAl/N9T9XU9LNEJLwUnm
	 7xKljyokk7Y/Tzh81oLLJC31TlMFyPu+uqFEMYgh7wQ0vUU9IfmWyEKVhGNhs4hJEipjw
	 XdLPF6WLgs42jHJ74UjFO+0uxsivCSa10+6bw8VBPV7B6vBqpeH6zRRjvAH82P9poflGT
	 ZYv3q8Shy3cfxCxu3I6mnZYrah4+EhayNh7RRfe8hRuzO6p301UXPE8L7cKa07OCinA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792189042;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Date:From:To:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Reply-To:Cc:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=5yER/J5yxtBOD0kwPLKI3hjpSCgGlqrKb3sAzBqp/2A=;
	b=hbOrPk8aeR180aTryOYpqMn+Uo5jkQvaaAjZE+BpR82oMMyZkTTaHjnfzKkcT5FjlATd
	 xCa5zwLgH9TJ5wzMlYcKAS78DLY4AJLesePUM5w+WhAz7yvxbinAnmX2vRaITAuE/rZOx
	 2bpbHkqdAOqLCD7NKRh0t6K6aqhVuOPMEwh2NlCjcUcJV/r/lhZH72bsPHjfTR6rTJTJB
	 xURQas22cQnrvXAQSo/Rpg7MWKOQ/Sifhxonm+XfwxaodLKkhQ2VNxlxB5DA5UU/xpSiQ
	 5t6r0DqYoTE4C1YILqORw3qF8xvTwMGArSGk0oAskBF8i0C42JDlc/xseqR1JJaGF+g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WB3tC71b;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792189042;
	bh=5yER/J5yxtBOD0kwPLKI3hjpSCgGlqrKb3sAzBqp/2A=;
	h=Date:From:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:Cc:From;
	b=T8BnVX6tq2LQsZz4lQL74sOOMODuJSH0YeC4y06hu9AaLkBG3ZLTAal2lf9oBQkV7
	 7JyDcraOkO1Ho8sgXIKkEad7FQUHRNvszobAWt98n5VMUPzVVPoSClCOmweez2opeQ
	 K6ZkBWR7ZtTbPFTkokbUtiQ/hHNhhlHZPsJ98sZ9Qe4FYPz2fqtnlR3GW64+daQOqw
	 +l+Na3icb/wUMOZ61+0qPWwqgkkdiRZiyLjljuIdNTcQnMvmnOEjpEoRhzgjRCGbNC
	 t1HQEFEiNXeTUO10hGLpmh6t+fHj2gL5cRhA3GtKodCHUzDNWpYb//RQXZ2dDsseeK
	 TRMRumTOgbTeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 555CE40602;
	Fri, 16 Oct 2026 22:17:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D2990362
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 22:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B852140602
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 22:17:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gP0FlhIuFN5R for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 22:17:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 80968405F8
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::333"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792189039;
 b=gCIJX9zmVzsdOkYY9MYByQrSc0z/ESIaQ+gmNbnHEz3DuXemggn1OSxAqas1jFTRxiFy
 RUP74VtQ6LelG0EVurdhbQf8fV5lLN8YqFyqJOm5bEq/PVsNE64dnxfawMBCWsQdzhIE2
 qKSeuGID2BtWtGFmeiqVsrEBjrn5gG1djQA/gl/K5SywmFFZULtStTSc+sOZrd3k47FDs
 6TJzvhRh7zmtE0SxuvAgCB06cy2Zp5NPdwtFsck8Wn9t5yDSeYy/WOmjUF0z3WNOyXuNt
 Ao0CsGtGfFeEuBCJa4blliBVRzt52YzgkvxqS00J0e6JTkckGz1p+XRx8wFVS5TGZOQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792189039;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
 Subject:Message-ID:Reply-To:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To;
 bh=nHf6RAiXhz1D2jl3SxoB/eciCDgoSjW113h3ljJHQFM=;
 b=EAbrB+jd01dPGCiYEeuII97owKo+Q3RpUYX1P7AciK3aFOZhPOiaLXJ4soM6Zk5oBW6a
 /8jjQQoWPs5FJ4guJygIjuqgIYUS9zcmIGdCn4WGAOwM+U0v0GfguTZdiPlBLLL4vMcGe
 VH+r9X9vWpRaecnM6AryL/3+XA0lVlUBl5Du52hw7ScDvLF3s7AxTJOESC33/+wlL3J/f
 gLYq8P7xQivo2SM/3g1wsfq4S7LFvzPudGy8LkLtjTfDtEsaXsQrEf3lsQp10q0XW+3CU
 XW8zu9uIGmswwKaEy/5QywX15eoCp80WUif3A3NI1pP3/OfXYZut7YR2IUPG8umYQcA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=WB3tC71b; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::333"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=WB3tC71b
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 80968405F8
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 22:17:18 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4a180fbeef5so3102685e9.1
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792189037; x=1792793837; darn=buildroot.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:reply-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=nHf6RAiXhz1D2jl3SxoB/eciCDgoSjW113h3ljJHQFM=;
 b=WB3tC71bfnkYp1ScVDaVAHqyoNL/rtLoS8FqEFtjPNfHEbeRdzgywp1ZvWTpxljfOJ
 EmEt19SlHq4mYue7dnuKyQJhi7tXqUSyZ6qpDhbfnvEhDINZwGaFLmwjnsCZXYgdwmLO
 eSGeUedryGx2GL0Ne7AaxQ60d8ZPIRbeaCu2pH+EQbxPPLU9Sn6ib8sRkih7rus5UG3d
 swW35oyVsedf5gFmEN9rCoCDIVJuwm1OV8gdWiy2x+vNrkVTyFMWr+8GFirhfHfJ19ct
 jd2B228qYqpfbE0HspvMCuNxGTUGCLB/gXhVMSTSA0i/nR+lW1Iz7kixLNBnTRenxrkI
 xihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792189037; x=1792793837;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:reply-to:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=nHf6RAiXhz1D2jl3SxoB/eciCDgoSjW113h3ljJHQFM=;
 b=xPZbepsWa25IErNQ+wBpZ0mftXBRt+8Rgv/+W9WjIETyl545as3KswCQJftYP5ZuIe
 iy1sB3J8LUBwh9+LL6uH8TeTABsQwF937Mi+5c0zPUcMmOfp3veljrplQzyTFA+renAp
 7Oh2IYgheHe58mIdZZyNOeRYtawcNOxybiwJ+9OmldfAP3mul4O2tyeufjuTADUssyPT
 7AN0Gag+hiVqLMEji77JRZsRVsOYmN93ZySMLWg1hk3T8wDaPUhDXFaouJk3D4XczxFA
 GCXJdCLLb9XSmvFJWxkbqj9LTyG++lLZ3FhQy+k3HqFx6Sgi8Z8ku1rtUOJY5H62spJm
 pVYQ==
X-Gm-Message-State: AFq9FYJnJHn+MKdOBxUL2Fr3RdYs02ESv40s0HinsrKk9kmVCufYfm1e
 gte28hY/E20uUbl6w0uNltHQiGbCd0TRWZ7fCtfHtMsSzTQoYqif5wNg5i2UgQ==
X-Gm-Gg: AYBFou3/gPrp3RgxgUP/h2Mk8eWyYs2NlwHDeBDafP8TZyQFkF+2lWAF0wZa7J2Rk8i
 iVTeS8UmYEFimGGSnxDsEEF4RgY35N77WnPum4Z7JTEby+u8GJa3ae9T/XB3wxiTCGxAsgWyMuI
 rKpSrzrStExWpFdVGvLDfw3f0TvbwHnauljRt8ZrH+cYJTxXLDD7YaVzCIgNtWzoBY8gn1Rwin/
 qnWIsYUes27hm5MH1mLxi0/1gFYlAaufIbg+I99VnvWCE7FWPL4zJ7OpSOFV4YdXGiBYTrOwcdt
 lxGsEPvY8Z4V/4qfrfXtQtCau57lQo0YWxRv3VKzZyo1KJPRnZelTT9TCByXe+EzSXijIwcTVF0
 GiCvexPTszAXuUATBeg0/jX6ENgHSq8LorKS6xlf8BqpJ6HK6+pDtnzHh97ivFyuPwW7UF9xkQW
 wC1CJ02G+YJHWYVNnxBo69bphvCQDu0eskOUqXi8vPWWzCAwr00ZdX9AhtlOT6w5A0fJ5ddYurr
 FnUN+GMVsI8iqU2/Pkr+AVH/6TJesWl8Jk5
X-Received: by 2002:a05:600d:82c7:b0:4a1:775b:5eb2 with SMTP id
 5b1f17b1804b1-4a1d75f9389mr24712695e9.13.1792189036864; 
 Fri, 16 Oct 2026 15:17:16 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd4f9c41sm8121777f8f.38.2026.10.16.15.17.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 15:17:14 -0700 (PDT)
Date: Sat, 17 Oct 2026 00:17:11 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Titouan Christophe <titouan.christophe@mind.be>
Message-ID: <20261016221711.GD331129@pevik>
References: <20261010151121.876133-1-titouan.christophe@mind.be>
 <20261010151121.876133-3-titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261010151121.876133-3-titouan.christophe@mind.be>
Subject: Re: [Buildroot] [PATCH 2/7] */Config.in: use the new $(VAR) syntax
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: ps.report@gmx.net, yann.morin@orange.com, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

> Since upstream Linux commit 104daea149 [1], the syntax for Kconfig variable
> references requires to enclose them in $(VAR).

> Variables whose expansion should be deferred until makefile evaluation
> (such as TOPDIR, BASE_DIR, CONFIG_DIR or ARCH) must now be written as
> \$(VAR).
+1

> Finally, the `option env=` syntax will no longer be supported.
> Environment variables are directly expanded in KConfig files.
> Therefore, some intermediate variables that were used as "tricks" can be
> removed and their usage subsituted with the actual environment variable
> they were derived from. This changes the following:
>   BR2_VERSION --> BR2_VERSION_FULL
>   BR2_HOSTARCH --> HOSTARCH
>   BR2_SKIP_LEGACY --> SKIP_LEGACY
>   BR2_BASE_DIR --> BASE_DIR
>   BR2_HOST_GCC_VERSION --> HOST_GCC_VERSION
>   BR2_DEFCONFIG_FROM_ENV --> BR2_DEFCONFIG

> Also update the manual to reflect these new conventions

> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=104daea149c45cc84842ce77a9bd6436d19f3dd8

LGTM, I'd add my RBT but the commit is broken:

$ make defconfig
Config.in:23: can't open file "(BASE_DIR)/.br2-external.in.paths"
make[1]: *** [Makefile:1047: defconfig] Error 1
make: *** [Makefile:83: _all] Error 2

Even removing output/ directory does not help:

$ rm -rf output/; make defconfig; echo $?

You fixed it in the 5th commit
04d878306a ("package/openssl: move libopenssl/libressl options out of the choice")

But NACK to that approach. Each commit must work. Either this 5th commit must be
squashed into with this 2nd commit, or if it does not break the current master
it should be as a separate commit before.

With that fixed you may add my RBT.

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
