Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D886BCD8CA7
	for <buildroot@archiver.kernel.org>; Mon,  8 Jun 2026 22:05:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD37B42ADA;
	Mon,  8 Jun 2026 22:05:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AaH777T9oUQe; Mon,  8 Jun 2026 22:04:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0528E42AD3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780956299;
	bh=PgZferVgpbwiSbnalS2evF8wfknfJzQ0v+8ey0X6M6k=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yf8xjFVJbJyCC+kfCA0skpDh7w4Er33xK1TCg4ooTJPOth6CUER5T0P7JuY8tN3Kp
	 2UOCjm7WPvXvvL7NedS0lhLkINrcxWiIksWhl/mjJfnj9s+McQVT67xUwyiFPSXK37
	 wHVN0VtJ8OdL5cY/BKxHWFk9hqYkPOm6UiAtV3psAJ+T74KoIL0cbfJ+tQx6QQYPjq
	 /lRjHE1SaGc7iPZMNVFutCcJUEWcyzZzL4ESXUXOaq3oFCFXMfHwGtyaAIiDgcmCoR
	 Ruq3nsng3/8fE7rcFQ6P24c/cjihPX37eGqApn5Ro/cte54/cP0Hk87uZojfVYWxoQ
	 QW0ZqI0+HHyYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0528E42AD3;
	Mon,  8 Jun 2026 22:04:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E7912C1
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 22:04:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 550B961BC7
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 22:04:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2aN1sRwUuZrd for <buildroot@buildroot.org>;
 Mon,  8 Jun 2026 22:04:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=obbardc@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3FBA661C82
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FBA661C82
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3FBA661C82
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 22:04:56 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-691c5776f95so2401541a12.3
 for <buildroot@buildroot.org>; Mon, 08 Jun 2026 15:04:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780956294; cv=none;
 d=google.com; s=arc-20240605;
 b=FvsEEGxW0wV+dQLKUxBj5WMZ+ScDwib6lhfmkw9LtTEhFSho/dDMGQx/GiGdCBGXdl
 8PwyCfNZ13kzEOVo2k+sVWCYD/MOkEtAnB/GBDk56m6UWA+5m+tvsrLaCVvTo2LCcvgX
 U7ZGZMDqP0b0p73/nC8QxrvmZH241W7EGj2Wr43tpCIYvyxzVSxSc/TuACnQPPpThUiL
 WgbKu/gekmzDx+AVZByPYH8GW4d5mkMg38Xapck9u4cFh3AZfLR55/wAG0qAXnwyTVg+
 oEc2Nct/jwnYpSC+4arxlXHUD7V7GZGeXGfMxCjDiLWsygViPUI4tZINumZNhnbKKT3I
 N7kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=V90IceHjeU6eIN3kE0P7HVoU86K8+dBpotHXapcSYbQ=;
 fh=kYLL5OW0hvS0SuIBzPHfAacj7SLeqtwEOHM5NmShMrQ=;
 b=WJeMuUynjlVMyDAwFkaVg1wJM6QvuO+NrCxuEOX/k+ATWwuzxq5KftGsZLg3O7KkUv
 rIxYEeshv1JiA3ZsVfDwLHKAdYd1QimTEiOsvrd8LLL+DgpFRXpTVloqkbFzAO/2UeVv
 0E2zu70Nrm2HiduK4B36yFhs91Rk29SxRNl/c53Q+k4HG42RC/nOLLJMUNVMCG/cZANa
 b5b9nEZWqsQFnMOsvHspW7MYB6/HYmDKvCmRIJgHElS+Ik3pgRuso1W77kt0KUBAvf3a
 Imnzp6+7nwWwfkB9ZejU3MSy5cp7+ZGkzaT27/atiikjSV5agd3hqclD8Uj//qfgcmq6
 bZUA==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780956294; x=1781561094;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V90IceHjeU6eIN3kE0P7HVoU86K8+dBpotHXapcSYbQ=;
 b=UrTNg6yVZorg2xwac0mj7V695SgQs7zh7YnMEJ/FqgbEk+M5S3nzKZ5N0dKwNUZtDX
 s8J6/MWt8Uq6ymtGM14Ub4RbxhLNjDB2ThTAT5yMGDQuObEEJlACUGGprE6dtWH/RWbL
 elWUwEI5AR/TE+jcwAH7nh1AFECLaJ+WTgzd1EMABpyBMFPXPXeTLUNANehY2+FeCHXC
 xRwZ6MreHX9mj9oCcNwG42bIpOEPSq31CDqtiLDgbaeGIkw3Btusm3lnaBiTf4osoMjC
 pDCOzYsqdd3ImOmtDKdWKww5CQAUwihjjuFIG840ToCKOzmGAQKbS5564TffLv05kHsu
 4BKg==
X-Gm-Message-State: AOJu0YzrFLWSdNmGBXGO6/AqwHARJzUaqbmHhtYQkk9K29L1Ll33TuVJ
 x0DOnme5QIsU1lGlE1BXLOt0snysefuCprdYSFckKaXzTnOLG6YSzFmLjh4sjSClGTRCnjhkWTS
 3sSU69x8M8BfsOmXzKQKvnJZhi7nYzvw=
X-Gm-Gg: Acq92OHvd2K10oB9WpChLfYA5+E8Dkvqh2TVFqgMasVi0AJuLzdQK72g6nq5gTjC11a
 eaEW1Szvq+1WUVU/FB3FWAQWgYgL9xr6wThSDIka8rWk5lICK0DMCsZO5tLuUb1U1j4Dihsab0H
 cPCYlPO+4DZJDYXeNcQPbmEwitvW740ohW5w7yakUvvRoNZHLEjFvHV/fBMkDDLRevLZmou4vNZ
 fuyKaQQPhc3ecmZ2auorzW4dEyAPpMwDta7N5ChiEO5hDWBFfNKc7pGG/i4ttJhiJBH1y7yKQA2
 rrFTYsVntyYwWRkJGKDIZ4j1uiOuUXzvchJcRlhplUzNoHOPVhMltqZlbxyAcysUQR/rxqiTraw
 IjixeukViT69bD3jfN4pt9J91ffPSexy5gSCfsByb2LPtVM0wfhSmjXBdHXDFUUK40p7Xeyqbeq
 0bstMRhG4P0mYIgQ==
X-Received: by 2002:a17:906:6a28:b0:bd2:6d40:3f6a with SMTP id
 a640c23a62f3a-bf3739f9dc8mr810530766b.45.1780956293727; Mon, 08 Jun 2026
 15:04:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260524-wip-obbardc-boot-efibootguard-initial-pkg-v3-1-47fc8262591b@gmail.com>
 <20260526074203.19772-1-thomas.perale@mind.be>
In-Reply-To: <20260526074203.19772-1-thomas.perale@mind.be>
From: Christopher Obbard <obbardc@gmail.com>
Date: Mon, 8 Jun 2026 23:04:39 +0100
X-Gm-Features: AVVi8CdZY2b87cwQiEKAY9MOfpu42UbfwRcm494UnwArSWKIfdizZ7HdT1dybHI
Message-ID: <CAP03XeqwNR3Z6B=zW9NGQginu+XQn+43ssJeqYWsJpAJzjgoJQ@mail.gmail.com>
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>, 
 efibootguard-dev@googlegroups.com, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780956294; x=1781561094; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=V90IceHjeU6eIN3kE0P7HVoU86K8+dBpotHXapcSYbQ=;
 b=fxctdbIRk7kkXEOmVwjchd4K2KikzCTNSOaQ8pQNCIUINHXtzpKzMaajWeOxglrkkr
 a8mIDCPwhombwVeqcBWK3cY7ajrn+PIBotYz4ZF0TZ83ewgSpGTtln6hpZtgl2OW2Si4
 AbpFjsqZesvD/i8/ZT7bmgVaXaVwxUQ3qhJZe5zsA7sZZVvvnVq1I26OvU+XFO16RN5L
 gIFZZK7hzU/iz4Abz/euv+JfwUXvCSXfBd3V/sMD06rDMjb1hlYyJBgwnUC2l7sfK+ps
 75oXngWRVEJ8z/xaOPhYD6dz4eS97LI4jR+6N/HLQk7oEaiba8PCzID1+Mv6F8NZnCR9
 GRhA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=fxctdbIR
Subject: Re: [Buildroot] [PATCH v3 1/2] boot/efibootguard: new boot package
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

Hi Thomas,

On Tue, 26 May 2026 at 08:42, Thomas Perale <thomas.perale@mind.be> wrote:
> Just a small comment as I see that simens/efibootguard has a GHSA assigned with
> a CVE associated:
>
> - https://github.com/siemens/efibootguard/security/advisories/GHSA-j6pp-7g99-24m7
> - https://nvd.nist.gov/vuln/detail/CVE-2023-39950
>
> With the CPE ID `siemens:efibootguard`.
>
> > diff --git a/boot/efibootguard/efibootguard.mk b/boot/efibootguard/efibootguard.mk
> > new file mode 100644
> > index 0000000000..c40cef13ac
> > --- /dev/null
> > +++ b/boot/efibootguard/efibootguard.mk
> > @@ -0,0 +1,60 @@
> > +################################################################################
> > +#
> > +# efibootguard
> > +#
> > +################################################################################
> > +
> > +EFIBOOTGUARD_VERSION = 0.22
> > +EFIBOOTGUARD_SITE = $(call github,siemens,efibootguard,refs/tags/v$(EFIBOOTGUARD_VERSION))
> > +EFIBOOTGUARD_LICENSE = GPL-2.0-only
> > +EFIBOOTGUARD_LICENSE_FILES = COPYING
> > +
>
> Add the following entry:
>
> EFIBOOTGUARD_CPE_ID_VENDOR = siemens

Thank you for your comment. I have added EFIBOOTGUARD_CPE_ID_VENDOR to
the next revision.


Cheers!

Chris
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
