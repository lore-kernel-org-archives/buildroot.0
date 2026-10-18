Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C553ECCA490
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 17:31:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F813406EF;
	Sun, 18 Oct 2026 17:31:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ICdt4euRIyK; Sun, 18 Oct 2026 17:31:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3D8FC406DB
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792344717;
	b=XCuEyX/quzFcimUcTOaDFbUnrX51b+u0/Z3vPMpgUWWzLhRb2JFwMGxXHAkfB3ptTlwa
	 pntUEeN3z9PLWCU13d7Pm+/nNcQAZSMJLMUMwIs5RnDFePdCka+kCn6qpUuCoXHEn9Ruj
	 NPg79FKt/xN5yJpoZ1H3V2n16sJRSCoxG6huoQqbOpy3ySZ6l3M/0WGpvPW4IINWsR+iH
	 vESMM8SV8UEsVETkYc1yIsrVELd+9KSmupjKv+sDuE1EnfoNFMUKTzv30ww7DuR0ePN5K
	 OP7c7ialtMXZLAir+pbcnjAHDgmvlOfsieeczBxerxU76C6f9u8xl/MZAfM8tuIG0UA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792344717;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Date:From:To:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Reply-To:Cc:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=8Z46+I+R+RxtqVft6GviUap8k/OtAmrxi+gleGVxZt8=;
	b=TPD/eD0iIFYQ/BJkLATSDyksdTWsOaokuO4cLlw7iC9hPKyityRO06PaWNLhcuoqmDGI
	 crYltGBrPeLBM6v7BvCnvCidMae4hF+hVam5iEicJ68SnLKAV9D3gVCXNR6vDves5ee9n
	 mERmF3bnkLUlTC9I/y8aFUYv8lCtxajEo9PdJpcQzF893VsViYBOJb0Kx+7YyvqjX5a+h
	 mGpLCV/5tsTX5jZIXk8XtHA74qYiBRe1Jug6TKdD9yaGyeOGjiBcaoLxoJgwc+mF48Jp7
	 JUJzi40mzXGJaq8jl2pS7ju/aa0iKr2JRCHYkpqPJoI5DA7sUyfEiOj1d7SOb7aS+ow==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792344717;
	bh=8Z46+I+R+RxtqVft6GviUap8k/OtAmrxi+gleGVxZt8=;
	h=Date:From:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:Cc:From;
	b=UFObApfRKfUJK6MjYE1PWCbArJ5tJc9mz4/AinLZTK2CjBVWt5OO9cLhnhnTe6FjL
	 ULS88oc15HdFL08mFiGI8Ez7SZAlOn+9ude04P/UHZ5RlKEkzet7AW3b0JiF/H/a5M
	 DMCfd6iIWP1qUB86EE5cVOU4FsQAiZv7Ow6xkB1dKv1h/Pl6eE3FeoJCS9A9P0VAIA
	 0/XO+/6sO7oeTKgDsxeD7LZtdzP/tV/K1Ys8iC4qoph8E56+szmvTHJkwUz2iZAv1H
	 7GWn0vOLdnqRhudmuEI/04bpe91nOT1gyJ7b1fbH3cbVj+fRE8n0c0zEWR3Kt8FKMW
	 pQwy8wqqPVgow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D8FC406DB;
	Sun, 18 Oct 2026 17:31:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 57F2B1E9
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 17:31:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D08C4005C
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 17:31:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gypRREbwC4w1 for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 17:31:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org E918940049
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::330"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792344714;
 b=jH9+58fKj7mebL+cSrSfZBpOtxCYrLPkWld8Rg5e2Xs3hCTkoYcTFnGdqoLGwX7QoSqv
 XB/bsoL9aHaJQi56BArVmHegSEn/uoIMeC+5NC/QbCpxyw1Jfa3FeLztyyjACoGw9Vn8b
 I5EivzWpTA+tK7G4CmaCfupgj7Orb3nw0nPFOO2POD9YC7I8Toqi6t1x5/i570RslSGZE
 1Enfx/v0rFmBNA26Of/FnI6vsRsov0Xsxs6PNl4r/SF15k8KaaeUpGQQNaWU6rRzIsuPi
 snXvWrGkvH0J2BekfrhUcgr4emK5MOPtrPw7p/490MqVgR0o0IXSY/y4RY1Si785NDQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792344714;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
 Subject:Message-ID:Reply-To:References:MIME-Version:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
 bh=b3m+hmjR+7+OWTRyap/ZTdDjRq1Ki3LpNZgWqua7FvA=;
 b=RPVe+gP5tzzV3fxpq/YLXve21U3LPnTS8bdIam2cquoje27ohntZymjU+Iu5z6Dqjhy8
 5CO2fU+6Qme2zbo9GpzQYyerSZa6etE9J9nPQdyCKFDcbss6ipos3+H/DkYKvLy3gmqph
 Y0zmtVFdI6xWtEBi/NX10rsgSH03/oavJldVytCI3wmyq1twkF1b9n/ubiXTNBd1QJTaP
 GPOM1VYlVqQ9dai+a2ZyFJY7ba+FJFWBEc3nJfCWryQCIRPCqO3kEQLZUN8C1F5VNIvea
 EBtR0o2LcyNfoE4Aydwg5D+E9Hg4C+cxH0Bfz3sKLV3mJ+PVvK0vRLaFWCwmkx5bGhA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="lp4A/Urr"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::330"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=lp4A/Urr
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E918940049
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 17:31:53 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4980fe6b3beso15073125e9.0
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 10:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792344712; x=1792949512; darn=buildroot.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :content-type:mime-version:references:reply-to:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=b3m+hmjR+7+OWTRyap/ZTdDjRq1Ki3LpNZgWqua7FvA=;
 b=lp4A/Urr2hPKisVqhJFOUOZqsgUlyJEfPCXRvZV0YHQZD5RWsXAzwx/ft5I5oUHYEF
 4FdyzP9RMD6nvQcD93MO/O+LVdBb7sChQpS1JODpOd8i9JZ6qZ1IKhEYTNRpLUrX27pk
 namg+cxr4HrxX1BKTKdSIXHweWpbfB5IU+vs69akaItssjm1prym2R9tWvvznXJ4p5td
 h7KNXznV7e9DEl9zaKoTax7L4OndmtTDffXur4mS9Cu46rKYDTfbgcczRANuRat5rL8i
 WLF2lWNGerEklpR5cRcOLmTmplEBUie1LO8B8iSm1oAssD1PVsy5K4h73ONbPsSGud6D
 r8uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792344712; x=1792949512;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :content-type:mime-version:references:reply-to:message-id:subject:cc
 :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=b3m+hmjR+7+OWTRyap/ZTdDjRq1Ki3LpNZgWqua7FvA=;
 b=1ayaObGTjmMHc+EJydLVSQ0ipxcnKIotcwqRsoX4Z82Mk8yBYxxpEbkVSMM8bQQrRs
 vzQ9/i7+L48et2DyoNcGsI8qJ0wonWZl8wfHWd/ne8SEgrvXUHvtsHAiFMgThGQKHZnt
 KkoTGEUIPdOggGKSMe5p+wJ49DIDbJRozB+ng5n3zKxG+s/G7ysVfRFViG898hZ1P54j
 2ZN/T37epoxWL82mbzRydG3ulvukrVquVIlZEwZ1ywM6r+v44pCVSqnxRqN/eFPfi/ma
 lOQyPtzaoVVqJ3kYQHbeUS1mHoVDHQ0hE8ADC2DM6WNFpgrm7+8lsTMn2jGUKuFFJeTd
 jG+Q==
X-Gm-Message-State: AFq9FYKTLSlEfUujvEVO/eCKIhN/ezttSamSyn1ebKCjR9HQAmx3PPnF
 WFihRav/Uw48SqRkjhPi8SsXYW34d/Md1AbMcz43xj4/SYykeAgNU9jg
X-Gm-Gg: AYBFou2hyESzpoOLFN06Snaq+rKcXPLlO0szXA6L7IdjT0CA7h5B1UV03hamXmTJDfy
 fgybhz3l7JzEWYaTsYtwb0PXZJf8qOzSx8uq2jejwfBYiY/pXURG5m3THQcGP+Ftatdz/kSiNtB
 ec4AM0tvRvY44MAW8QWoFuVzusdYsgs66zCbk28pRVbBA28Pb5nTctwlgMtrQOu/wSwGeUUiBcC
 lWwCB52nnD4cuzcp7nngKGbWOatmR9QXVuAzP2i3Jn/UC7wLvBYw4iOKxFz2tjxIutJO+nfUMI7
 xfVn/Lss4a0GiRwwb/vv8ocFK/4Ora5v15bK4mvvNa0ihUDBmbg/DUsorS3aODY6Iaiv+lCmXS4
 B63StEDHGwdoaafLMFEUq7OHtH9ngR2ckfnw88yEWmU/xhs6h6/BAXp5o7xuIk/2wZQDDiCl1KU
 4sj2RTZ36m+GoUvllOBqpGTU9ni2LwftWsAkscB6wxaP82bGcXBM+PcRwYE9mRXP2ot6gVNMxF2
 oHwKw1gwNGhoA45AMhJYgI9PZwfw+EE3QI=
X-Received: by 2002:a05:600c:4f88:b0:4a1:9c71:9f17 with SMTP id
 5b1f17b1804b1-4a1d75fe190mr111977775e9.9.1792344711500; 
 Sun, 18 Oct 2026 10:31:51 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1dc8ee409sm191444145e9.13.2026.10.18.10.31.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Oct 2026 10:31:50 -0700 (PDT)
Date: Sun, 18 Oct 2026 19:31:37 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Titouan Christophe <titouan.christophe@mind.be>
Message-ID: <20261018173137.GA383673@pevik>
References: <20261010151121.876133-1-titouan.christophe@mind.be>
 <20261011191210.GA129909@pevik>
 <734360bc-1e66-4584-b04f-f5405af3be1b@mind.be>
 <20261016212923.GA331129@pevik>
 <5a67d18f-24f5-4426-9a55-82bdef6f13f3@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5a67d18f-24f5-4426-9a55-82bdef6f13f3@mind.be>
Subject: Re: [Buildroot] [PATCH 0/7] Update kconfig inrastructure to Linux
 7.2.9
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
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

> Hello Petr,

> First of all, thank you for having looked into this series !

Yw, I wish I had more time for testing (hopefully I find some more time).
So far I checked only "make {defconfig,nconfig,menuconfig,help}".
Big thank you to do that update.

> On 16/10/26 23:29, Petr Vorel wrote:
> > Thank you! FYI Now rebasing to current master requires resolve another =
conflict due
> > 5177cf9c2f ("package/openssl: move libopenssl/libressl options out of t=
he choice")
> > (Not difficult to solve, but if you rebase you make it easier for revie=
wers.)
> I rebased on top of latest master, resolving the conflict, and pushed to
> https://gitlab.com/essensium-mind/buildroot/-/commits/bump-kconfig

Thank you! Maybe once a while rebase and force push until finally merged?

> > Slightly problematic is that output/ format changed. Therefore
> > without 'rm -rf output' make config fails:

> > $ make defconfig
> > Config.in:23: can't open file "(BASE_DIR)/.br2-external.in.paths"
> > make[1]: *** [Makefile:1050: defconfig] Error 1
> > make: *** [Makefile:83: _all] Error 2

> > Obviously this part in Config.in is wrong:

> > # br2-external paths definitions
> > source "$(BASE_DIR)/.br2-external.in.paths"

> > bisecting shows the first bad commit
> > 121d3e6800 ("*/Config.in: use the new $(VAR) syntax")

> > With removing output directory first everything works.
> Actually, only output/build/buildroot-config needs to be removed:

I guess there is no way to avoid people bump into this problem.
Maybe at least to document the need of removing the file in the git commit
message.

> =A0 =A0 $ make defconfig
> =A0 =A0 Config.in:23: can't open file "(BASE_DIR)/.br2-external.in.paths"
> =A0 =A0 make: *** [Makefile:1050: defconfig] Error 1

> =A0 =A0 $ rm -r output/build/buildroot-config
> =A0 =A0 $ make defconfig
> =A0 =A0 [...]
> =A0 =A0 #
> =A0 =A0 # configuration written to /home/titou/Code/buildroot/.config
> =A0 =A0 #

> So there is probably some incorrect build dependency (kconfig source ->
> binaries).
> I will look into this.

Could be. Again, thank you for having a look.

And, if you have enough time and motivation, after this is merged, my perso=
nal
wish would be to speedup 'make help' (it takes 9 sec on my laptop, kernel's
target is much faster), but this is not due the update (an old problem).

> > $ rm -rf output/
> > $ make defconfig
> > ...

> > # No change to ...buildroot/.config


> There *are* some changes though !
> This is because of upstream commit aff11cd983 [1]. Before this series in


> Buildroot there was only the title of a menu in .config, now there is an =
end
> marker as well.
> See this example:

> =A0 =A0 =A0#
> =A0 =A0 =A0# Database
> =A0 =A0 @@ -1829,6 +1855,7 @@
> =A0 =A0 =A0# sqlitecpp needs a toolchain w/ C++, threads, gcc >=3D 4.9
> =A0 =A0 =A0#
> =A0 =A0 =A0# BR2_PACKAGE_UNIXODBC is not set
> =A0 =A0 +# end of Database

Yes, I noticed that during 'make defconfig' output comparison, done by aff1=
1cd983 [1].

Kind regards,
Petr

> I checked that this is the only change in .config output:

> =A0 =A0 diff -u .config.old .config | grep -E '^[+-]' | grep -v '# end of'
> =A0 =A0 --- .config.old 2026-10-18 17:21:54.495007495 +0200
> =A0 =A0 +++ .config 2026-10-18 17:44:13.970027594 +0200
> =A0 =A0 -# Buildroot 2026.08-1042-g279f4b6237 Configuration
> =A0 =A0 +# Buildroot 2026.08-1048-g55ffb69e12 Configuration


> Best regards,
> Titouan

> [1] aff11cd983 ("kconfig: Terminate menu blocks with a comment in the
> generated config")
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/scripts/kconfig?id=3Daff11cd983ec0850651ee9b1c2a88b33358cb2f2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
