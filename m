Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF668CAC5B8
	for <buildroot@archiver.kernel.org>; Sat, 27 Sep 2025 16:44:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 511AC8128F;
	Sat, 27 Sep 2025 16:44:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZA_pKqur6weW; Sat, 27 Sep 2025 16:44:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E14381291
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E14381291;
	Sat, 27 Sep 2025 16:44:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CDBE111
 for <buildroot@buildroot.org>; Sat, 27 Sep 2025 16:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B126421C1
 for <buildroot@buildroot.org>; Sat, 27 Sep 2025 16:44:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gWbkdbPewbPL for <buildroot@buildroot.org>;
 Sat, 27 Sep 2025 16:44:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::935; helo=mail-ua1-x935.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 461B1421BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 461B1421BF
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com
 [IPv6:2607:f8b0:4864:20::935])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 461B1421BF
 for <buildroot@buildroot.org>; Sat, 27 Sep 2025 16:44:28 +0000 (UTC)
Received: by mail-ua1-x935.google.com with SMTP id
 a1e0cc1a2514c-90f5eb2feb8so964199241.0
 for <buildroot@buildroot.org>; Sat, 27 Sep 2025 09:44:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758991467; x=1759596267;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eoEzlM3PmMi+DPOPW8n3EPQfqXHI5b7BOq/wvA2bMKE=;
 b=hClTlBoCwg9Y4ue5anny2IDEsKUMmi3iOSjdN913prVO8BjYhxwoXX6XHzUBMdguXL
 GZB6ooh2h8+NlXe4TFpRrQyOPSy29pM4pY4fQW6VG5kJym5krR4jAlp0nI1DRYmyL/cw
 9p0gslEfdwKOPiE5R6v0coHZ0d5Ej1BiEhUGdXPTs95/g3mbtKB5SdK1YfVXqEAmta6p
 BCGrz46sbMKr2oht41yR4g3VZqh/CHvxlAFf3UlX/rY5ot1AHZ5Iwe0zJrtonDOxGfnq
 AuFLrDOdg3A8rgyKVy79HCyFLuUHOYh19z8yllII8ELj8C0tmUPp2Kywu18XW14u071T
 ltSg==
X-Gm-Message-State: AOJu0YzMItAtjHzRv+bRp8y6XBUXlUmrFqZts9I5Ku33fqLGpyhVTaWh
 U2c4qLFi5qLutOfD9+V7F2u8aa+HNssvjOSmDy8xDmHC0zRTFsRW19ZLkWABnVxBP6Xt8pXWrIv
 2unOWnWP2MPtfAzlm1DayD1KPmjhf2Dp+zS3z
X-Gm-Gg: ASbGncsHTbYcjakFI2M5kFNJ1Y7k7BcYtNS0EG+BH+Qz1SLfQaTnPGTRvmamOtU0AJI
 4qkKrrgABCIdna/8Qtqu9vqTwAH8WcxlZN4lWJHIw6Rs48q0T9c0uT82DBRU8Z2a364TtY/+mVr
 rCmdOicNSYcCLspEJ7ql3XDawGiDS7w8TBreaJxOsBFjm5thUwzgMzvUTmylPk/mqRhT1lf9ODs
 dccgnsf
X-Google-Smtp-Source: AGHT+IGHg6F+pIZwwxQXt4fVCARYdGdThaznqPhNybAUtJc4vt075MNQqCqB5G4NE0+z19FVJX0mr2xqYBG8HBuI7fA=
X-Received: by 2002:a05:6102:d91:b0:52a:4903:95af with SMTP id
 ada2fe7eead31-5accd4f6945mr3794879137.19.1758991466819; Sat, 27 Sep 2025
 09:44:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250925222814.2323048-1-james.hilliard1@gmail.com>
 <465fee2707f10b55fa963edff7baea16@free.fr>
In-Reply-To: <465fee2707f10b55fa963edff7baea16@free.fr>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 27 Sep 2025 10:44:15 -0600
X-Gm-Features: AS18NWCywLlDnjEoAqI1r_V5CuztDdkyAqruj6g5BnRtNeYRlQ0nUMYsA7gZocc
Message-ID: <CADvTj4qz2Q=smPFhE3s+0XdbnT=40F3_4Jr_W3odKHKrpaSiNQ@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758991467; x=1759596267; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eoEzlM3PmMi+DPOPW8n3EPQfqXHI5b7BOq/wvA2bMKE=;
 b=KgObKLYFb4ZJ4MAyHA/o0i8OL2jDfrvuHsYJKrXy/G2kIFwWlZxemJ7fWZkidF3lf5
 qE0spSrJ+LHUyum9qkGReumFs8t9ZPNDp2DwfLKScYoxfvR3Qdkyrv9ALL6un0wxz0Dp
 aJQIcG5EZC7IqEZfIZnsewA9HMGdwZI0QOZEg7SPyH2VUjJSC6QLlEPCDiuSMeXE7jxt
 XrKs+2sGmMJBkY0WwC0R/7PrVs+3DJWq3O797XluJkN3yqdVGRaCNw+16dN+2JnQ20rn
 tolNJzxxepRkWlMewR3W2TDqNHzHQrf1qMaMZHgJJ/UeinDS6qtc8EV5MiRnyHZKcuh5
 Xlbw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=KgObKLYF
Subject: Re: [Buildroot] [PATCH 1/1] package/tailscale: bump to version
 1.88.3
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU2F0LCBTZXAgMjcsIDIwMjUgYXQgNzowM+KAr0FNIEp1bGllbiBPbGl2YWluIDxqdS5vQGZy
ZWUuZnI+IHdyb3RlOgo+Cj4gSGkgSmFtZXMsCj4KPiBPbiAyNi8wOS8yMDI1IDAwOjI4LCBKYW1l
cyBIaWxsaWFyZCB3cm90ZToKPiA+IFNpZ25lZC1vZmYtYnk6IEphbWVzIEhpbGxpYXJkIDxqYW1l
cy5oaWxsaWFyZDFAZ21haWwuY29tPgo+ID4gLS0tCj4gPiAgcGFja2FnZS90YWlsc2NhbGUvdGFp
bHNjYWxlLmhhc2ggfCAyICstCj4gPiAgcGFja2FnZS90YWlsc2NhbGUvdGFpbHNjYWxlLm1rICAg
fCAyICstCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvdGFpbHNjYWxlL3RhaWxzY2FsZS5oYXNo
Cj4gPiBiL3BhY2thZ2UvdGFpbHNjYWxlL3RhaWxzY2FsZS5oYXNoCj4gPiBpbmRleCBlMmQ2MDBm
MDNlLi40NDQ0MTJmOGY0IDEwMDY0NAo+ID4gLS0tIGEvcGFja2FnZS90YWlsc2NhbGUvdGFpbHNj
YWxlLmhhc2gKPiA+ICsrKyBiL3BhY2thZ2UvdGFpbHNjYWxlL3RhaWxzY2FsZS5oYXNoCj4gPiBA
QCAtMSwzICsxLDMgQEAKPiA+ICAjIExvY2FsbHkgY29tcHV0ZWQKPiA+IC1zaGEyNTYKPiA+IDQ4
MzBjZDgyMmE4MzhkNWQ0NGZkNWVlZWJkMDdhMmFhY2FmMDI1NWZiM2ZiN2QzODUyZDU3NjU5ZjU0
ZTUxYmMKPiA+IHRhaWxzY2FsZS0xLjc4LjEtZ28yLnRhci5nego+ID4gK3NoYTI1Ngo+ID4gOThi
NTFlOTVlODQzNzhhYjI4MGM1YTg3MDY1MDhkNDkzYWI5MTUyYTAyMTVmMDBmMGY2OWUzZWEyNjcz
ZWEwZgo+ID4gdGFpbHNjYWxlLTEuODguMy1nbzIudGFyLmd6Cj4gPiAgc2hhMjU2Cj4gPiBkMWVl
MWM3OTQ3ZDRiMmMxOTYzZWEyMTRkNTMyNGYxZDRjODlmMmYxZDBmMDIyNDg4OWI0ZGZiODY4ZGFk
NzI1Cj4gPiBMSUNFTlNFCj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS90YWlsc2NhbGUvdGFpbHNj
YWxlLm1rCj4gPiBiL3BhY2thZ2UvdGFpbHNjYWxlL3RhaWxzY2FsZS5tawo+ID4gaW5kZXggM2M2
YzdiY2UxZS4uMTQxYTViOThkNiAxMDA2NDQKPiA+IC0tLSBhL3BhY2thZ2UvdGFpbHNjYWxlL3Rh
aWxzY2FsZS5tawo+ID4gKysrIGIvcGFja2FnZS90YWlsc2NhbGUvdGFpbHNjYWxlLm1rCj4gPiBA
QCAtNCw3ICs0LDcgQEAKPiA+ICAjCj4gPgo+ID4gIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiA+
Cj4gPiAtVEFJTFNDQUxFX1ZFUlNJT04gPSAxLjc4LjEKPiA+ICtUQUlMU0NBTEVfVkVSU0lPTiA9
IDEuODguMwo+Cj4gRm9yIHNvbWUgcmVhc29uLCB0aGUgZG93bmxvYWQgb2YgdGhpcyBkZXBlbmRl
bmN5Cj4gZ2l0aHViLmNvbS90ZGFra290YS9hc2NpaWNoZWNrIHYwLjIuMAo+IGlzIGZhaWxpbmcu
IFNlZSBhbHNvOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS90YWlsc2NhbGUvdGFpbHNjYWxlL2Jsb2Iv
djEuODguMy9nby5tb2QjTDM4Nwo+Cj4gaHR0cHM6Ly9naXRodWIuY29tL3RkYWtrb3RhL2FzY2lp
Y2hlY2sKPiBjdXJyZW50bHkgcmV0dXJucyBhIDQwNC4KPgo+IEFueSBjbHVlIGhvdyB0byBzb2x2
ZSB0aGlzIGlzc3VlPwoKT2gsIHRoaXMgcGF0Y2ggc2hvdWxkIGZpeCBpdDoKaHR0cHM6Ly9wYXRj
aHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDI1MDIwNTIzMjgzNy43
MDMwMy0xLWNocmlzdGlhbkBhcGVydHVyZS51cy8KCj4KPgo+ID4gIFRBSUxTQ0FMRV9TSVRFID0g
JChjYWxsCj4gPiBnaXRodWIsdGFpbHNjYWxlLHRhaWxzY2FsZSx2JChUQUlMU0NBTEVfVkVSU0lP
TikpCj4gPiAgVEFJTFNDQUxFX0xJQ0VOU0UgPSBCU0QtMy1DbGF1c2UKPiA+ICBUQUlMU0NBTEVf
TElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKPiA+IC0tCj4gPiAyLjQzLjAKPgo+IEJlc3QgcmVnYXJk
cywKPgo+IEp1bGllbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
