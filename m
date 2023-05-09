Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 331F9C77B75
	for <buildroot@archiver.kernel.org>; Tue,  9 May 2023 13:31:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB27D845FF;
	Tue,  9 May 2023 13:31:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB27D845FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6deHeZL_1gao; Tue,  9 May 2023 13:31:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5910845FA;
	Tue,  9 May 2023 13:31:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5910845FA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2975B1BF867
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 13:31:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02C4F845F4
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 13:31:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02C4F845F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hpXT6Kymq686 for <buildroot@lists.busybox.net>;
 Tue,  9 May 2023 13:31:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F22E98456C
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F22E98456C
 for <buildroot@buildroot.org>; Tue,  9 May 2023 13:31:41 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-50bc0ced1d9so8945307a12.0
 for <buildroot@buildroot.org>; Tue, 09 May 2023 06:31:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683639100; x=1686231100;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ik6rPcIQ13DetGJeOZARKwMOPnuEuq3JrV2q+wS6eGU=;
 b=L8/WwmBUXTrgrwalfjRAFQjPN5eEzoG+2lz/uxWlb6ph4OL4+sjiVdE/udEXIjuT/u
 UKamTh3aLYaOjZHGtt5Is7te11Y2p59OOiVvSsCTwjbbk7d3l/I2YmE3HL1cobp01Gxu
 Pb/UHdXr+ilbMkPaAmbdqVgf26Emfe1y/1/s6MS77y0otEHNtF39r7uZrB5Z5zeRdWQ/
 rXKmC4/gap/nUZ4WcQNp20bl/xHLFAKTP8tvAE1Bkhjbbh7ZGLe4lLiJCyPbZ9fxIHDl
 dfcLBdW2YzTOXKe45d5BD5Q5FfOSwxdYGxDePIdT1V4Ovxryb0+ogFn8fUWubZx0bdfN
 9cpg==
X-Gm-Message-State: AC+VfDw2eBkB/oAYBuSR1Fc7rQpi0OLCtA1lWxxKzO/3qY4o04MN7C3J
 UYpVBi6L3KSYok3dfGbtNedOEHMqECPzXko1fKnBxRzFWQ0ST7KdPvE=
X-Google-Smtp-Source: ACHHUZ5KLv1qWSo2yXpT6cdsryrzUlGfblSXwDTJpQX2wK6OyLpCP4mQNUWUFxZhiYLaDDUUQ41rLneaafYK4assd4A=
X-Received: by 2002:a17:907:3f9a:b0:94e:dd3f:b650 with SMTP id
 hr26-20020a1709073f9a00b0094edd3fb650mr13478726ejc.18.1683639100005; Tue, 09
 May 2023 06:31:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAOcd1mo0dRncibAFbShjgkPGOhPab_wd1n=b76r_tmEe=zEoCg@mail.gmail.com>
In-Reply-To: <CAOcd1mo0dRncibAFbShjgkPGOhPab_wd1n=b76r_tmEe=zEoCg@mail.gmail.com>
From: James Knight <james.d.knight@live.com>
Date: Tue, 9 May 2023 09:31:29 -0400
Message-ID: <CALAjcgXuSyV-5v=YHokFW7fc=Pt1fW8govYrpm7z=_724TmEYg@mail.gmail.com>
To: Naveen Mamindlapalli <naveen.mamindlapalli@gmail.com>
Subject: Re: [Buildroot] Bpftrace support in buildroot
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
Cc: Romain Naour <romain.naour@gmail.com>, Qais Yousef <qais.yousef@arm.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TmF2ZWVuLAoKT24gVHVlLCBNYXkgOSwgMjAyMyBhdCA3OjQ34oCvQU0gTmF2ZWVuIE1hbWluZGxh
cGFsbGkKPG5hdmVlbi5tYW1pbmRsYXBhbGxpQGdtYWlsLmNvbT4gd3JvdGU6Cj4gQ2FuIGFueWJv
ZHkgcGxlYXNlIGNsYXJpZnkgd2hldGhlciB0aGUgcGF0Y2hlcyBnb3QgYWNjZXB0ZWQgYW5kIG1l
cmdlZAo+IHRvIGJ1aWxkcm9vdD8KCkl0IGFwcGVhcnMgdGhhdCB0aGUgd29yayBqdXN0IHN0YWxs
ZWQgYXJvdW5kIG1pZC0yMDIxIFsxXS4gWW91IG1heSB0cnkKdG8gY29udGludWUgaXRzIGRldmVs
b3BtZW50IGJ5IGNoZWNraW5nIHRvIHNlZSB0aGUgbW9zdCByZWNlbnQgY2hhbmdlcwpyZXF1ZXN0
ZWQgYW5kIHN1Ym1pdCBhbiB1cGRhdGVkIHBhdGNoIHlvdXJzZWxmICh1bmxlc3MgdGhlIG9yaWdp
bmFsCmF1dGhvcihzKSBwbGFuIHRvIG1ha2UgdGhlc2UgY2hhbmdlcyB0aGVtc2VsdmVzKS4KClsx
XTogaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9saXN0Lz9x
PWJwZnRyYWNlJnN0YXRlPSoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
