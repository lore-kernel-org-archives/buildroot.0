Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3123C5B572
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 04:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B2E280EA4;
	Sun, 16 Aug 2026 04:46:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B2A2EIVI4z8M; Sun, 16 Aug 2026 04:46:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B8B980EA5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786855573;
	bh=VixaUDaFAagQAV//8RHGWOYB+Znxa8vr2nV2zakJl5A=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I3RjY5Y/Tb2i4TogCSXcQNNcXnJyGdto+G+fbaAevBXeZ4lI07WsjuTswdCmEfIm3
	 O7l4HJujCfxm1+A8sV2BHuglTUyRqmqyJs1n0guynQRReOBLyiSX00EaSkvozYRx6W
	 nuLHEEiWtuoYOlDPOQ1FwmhIFdP9CgJa+9R4hgOTawb9dqasRR5sXZJQpGsXoTAK6d
	 AChJTTpProkdHX8WLPTxg+yO3P3+IaX8HrSrgNXuGksc7AbRgwdkBZrdY1mjs5kV/K
	 +IUUoCaNmL9DfFvMRY1jTUW+6fTqYmVW/nBY6yl8otNCfZ4+e+Y5VhzGEVuS6KAR5G
	 LztDRVnyJ486g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B8B980EA5;
	Sun, 16 Aug 2026 04:46:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EA013282
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 04:46:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D367580EA5
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 04:46:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Ydeo_btBLcO for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 04:46:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com;
 envelope-from=thecharlesjenkins@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 12ED680EA4
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12ED680EA4
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=N9Ycje4F
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 12ED680EA4
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 04:46:10 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2cc97653887so38939455ad.1
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 21:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786855570; x=1787460370; darn=buildroot.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=gGpi5qXOP2v/fTHRRmjru0FPLD8tM2ojKwglxKqcncw=;
 b=N9Ycje4FlJCG7/QAuxnUmjTWyAM5kgkLuVgKNvMNKpRwz/d66lTabZZr5tT+FClzym
 1NeSuV0xL6Q88wEmHoUFBvm1utPdTjP22mMQKQmfxDpq16y37bxYRNt1BkXm8QWSUV8m
 8+JeJmVG26JVCLRAgKY4XW4ZROg8uAmMJ9zmkyKV0Q22l9dWToJbwu6/+r0fuwJnOU6B
 KW9/DW1OB8UHf3IerkKjOfrRomTI6BXGahBlEi8qbUrXrKYzQcY2ezIM39NLmhzprNgd
 A2xHrTuY3yo+dHpMmcg0Z1qCeASgbhqo8Vnssda+bSLfInQevKhPoODK5ZzoOK1rdmXn
 SgAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786855570; x=1787460370;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=gGpi5qXOP2v/fTHRRmjru0FPLD8tM2ojKwglxKqcncw=;
 b=LmbhSg7Bo0AsCghO8mn5RuQR+X1ZHxPJbMEUWJMStd1J7yAFe9gGhZK43di/Z/Evda
 oAyAUAWEMn3M+rU+Go+fuqE+ieDadY3Gb78GV5EWJ/oFFawuK/jVZ254159xBMpP7dCv
 mZrksIaUakbn2A8QWtSTlCTs1++hyDDd7KuxjkWQRsjcNFIvaNegLWrAh9o1iI/+M+FN
 qwelNDhk+tJSOW9TbGeLps3/XZqFAhPnEyzux6Gvv22z+7dc37c4Esq43K9iE1h4kJbZ
 cGsnpjs5ufJsSglZWS2QNr6tcKV8om3A/aF2KfEgvG0YF8snp45xtuFzgrMqD3jkhkT/
 6AXg==
X-Gm-Message-State: AOJu0YwDJ9r2Bhe4lf9KuXxGOifyReoNib7UWVqUrpslI2DcJi9dl9Ld
 RYZAmvvLbnghmTSP1JGvClhOTs+XbI95mBcnpRvx+Y3CVK+6LOc4T0u4mJpIiQ==
X-Gm-Gg: AR+sD10Ajzsyib0r02uqt0iYmj1wF2vwKIkVxmCvuSw6D12LWuflTn8GDrBe5UcjV6n
 YOqd07XCPIbOMw/5gRaak3Fkdrt/vZgPQ/ibhiIJJ+FtUab96s/hTtfc2xqwQlvzE+kZEtZZSfr
 46KJCESJvygQolaQh//Dq4jmgvLR99HRHWTj6kcIaPs/qy8jguLy2Mam5qnSaJd5LNRimf6wzL5
 K1qAv3pgpPxSF8aSqas4EoVlltA+METUmib5FGQGaLFdkJKyOa7RS+QnHjhdsXKg7slbbF9EmIO
 Abnrw19c6AQr1mO5qfZ+PzBIaAAJ6b5gOweQDQj19E/r+NAD0oCZWUYRbFrf/bvJjxf619wAcDA
 ZY8JdJvTi2xC1oIM7af+j//ocDSVyx+wyFxNUboBYF3Ts6ElR8fZ26R79hTorGOPuJsTp51/ZGI
 +Bmh2joM7e6C8WwYeBFJUw6g451jDw9dZqCC7uBGNt2JOWs9qZ3HQItSSWFxN0JG3SdM2G87sf9
 AhmIBtPm33u4UpSUXU+AbE=
X-Received: by 2002:a05:6a20:2587:b0:3c3:33df:4d9a with SMTP id
 adf61e73a8af0-3cc71c1b66fmr16978071637.1.1786855570131; 
 Sat, 15 Aug 2026 21:46:10 -0700 (PDT)
Received: from blinky ([67.174.242.98]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-141387af4adsm24657561c88.1.2026.08.15.21.46.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Aug 2026 21:46:09 -0700 (PDT)
Date: Sat, 15 Aug 2026 21:46:07 -0700
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@buildroot.org
Message-ID: <aoFAj5Sx-c-ULa9Q@blinky>
References: <20260815-ncurses_strip-v1-1-da424b80d70d@gmail.com>
 <87o6f2wva3.fsf@tarshish>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87o6f2wva3.fsf@tarshish>
Subject: Re: [Buildroot] [PATCH] package/ncurses: Enable stripping of progs
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Aug 16, 2026 at 07:20:52AM +0300, Baruch Siach wrote:
> Hi Charlie,
> 
> On Sat, Aug 15 2026, Charlie Jenkins wrote:
> > Commit 2ab611c40ff08bd4a7922456fed22af6953af3b1("ncurses: fix build
> > failure with ncurses 6.1") added --disable-stripping to the ncurses
> > build because ncurses started stripping by default but using the host
> > strip instead of the cross strip.
> >
> > Enable stripping and change the strip program to $(TARGET_CROSS)strip.
> > This shrinks the binary sizes of the programs generated by
> > BR2_PACKAGE_NCURSES_TARGET_PROGS on aarch64 by:
> >
> > clear:		18k -> 10k
> > infocmp:	76k -> 62k
> > tabs:		27k -> 18k
> > tic:		103k -> 87k
> > toe:		27k -> 18k
> > tput:		33k -> 22k
> > tset:		33k -> 22k
> 
> The 'target-finalize' target defined in top level Makefile should strip
> all target binaries. Lookup STRIPCMD in top Makefile.
> 
> Doesn't that work for ncurses binaries?

That's a silly oversight on my part, thank you! I was looking at this
Makefile and the outputs but didn't look at the final outputs generated
by this step, oops.

- Charlie

> 
> baruch
> 
> >
> > Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
> > ---
> >  package/ncurses/ncurses.mk | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
> > index 5e2077500a..e017bacf6e 100644
> > --- a/package/ncurses/ncurses.mk
> > +++ b/package/ncurses/ncurses.mk
> > @@ -31,7 +31,7 @@ NCURSES_CONF_OPTS = \
> >  	--enable-const \
> >  	--enable-overwrite \
> >  	--enable-pc-files \
> > -	--disable-stripping \
> > +	--with-strip-program=$(TARGET_CROSS)strip \
> >  	--with-pkg-config-libdir="/usr/lib/pkgconfig" \
> >  	$(if $(BR2_PACKAGE_NCURSES_TARGET_PROGS),,--without-progs) \
> >  	--without-manpages
> >
> > ---
> > base-commit: e389f1b44c54660c7bb5512207a561e684b41595
> > change-id: 20260815-ncurses_strip-615a30afa120
> >
> > Best regards,
> 
> -- 
>                                                      ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
