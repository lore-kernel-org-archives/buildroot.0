Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE8BAC83F07
	for <buildroot@archiver.kernel.org>; Sun,  6 Jul 2025 22:07:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E4EB61230;
	Sun,  6 Jul 2025 22:07:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lHanfYtEuu27; Sun,  6 Jul 2025 22:07:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DE4F60BEB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DE4F60BEB;
	Sun,  6 Jul 2025 22:07:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 446CD12E
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 22:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3601C403C4
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 22:06:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5J4m8QjfXPiK for <buildroot@buildroot.org>;
 Sun,  6 Jul 2025 22:06:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b32; helo=mail-yb1-xb32.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 82E3940358
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82E3940358
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 82E3940358
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 22:06:57 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-e812c817de0so1813719276.0
 for <buildroot@buildroot.org>; Sun, 06 Jul 2025 15:06:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751839616; x=1752444416;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Itr8KeCQk1cGxIyXyo4l1mcTcoOhaluIlKg5bBxTRL8=;
 b=trJvDM1WN3Gvx3GmDEXaOOWVTpnFj4JLMzKYLOVn0WDDbwM4cDX5GvxNRQzfpWd6UN
 ASLrX3oxjc+Fksmaib7nJwPVI6WouhVLixqswInRkYl6HdMjux6IyeVZozHgHJwDoLq1
 HGke8z4S1BOQMbRUnag+T+R2ZcD2GlWDFZt6jiFKW6U8hOycNZsY2EBB1mjzHPwi9GnI
 MMmnErEqY8FWUGYkFZ6kcuflpIr9+FFNDDu5Wcp/G2XxkgTrTP4L5QGOIEh4/XK443dK
 +HCY3xLuOJqji+fkHVmk1ro7MSKjUZAktXfr19tSioMaENUQSMd+TvHUoYFua4cTChv9
 nMuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAy+53D+ES8+1d7xHxejeG706RHLWsmCSxahnhaJZlgGv+Sqvw2qd3a6X3IuEOuPa1i4UuoG2Le40=@buildroot.org
X-Gm-Message-State: AOJu0Yy8pV2UU6XyQrHbBrMOjg7whNo0hlqkJJ9qxW30bEaHiBl/8aOV
 bCOFwoL6wzZ3fP80e0WZyS+14VQtIb1OMh3Sw3B6x2taAZGUy5aW9e8HGkfKIhVVJq3eIBef6Ya
 CdKBk
X-Gm-Gg: ASbGncvfHoHcq+BNh04z8RN8jqaceKdvoIHXwmTCS5KP0s6R+vB533EW6xO/nm2vAxU
 Jb16Iqq/jSXWXIoEzXgXdkVJafxX2oisBbYZFVYRUjRhC3EKqYOKfLX/0x9UhAV3Xh15kBALwM0
 PoNJjY+U1SVMK4iunpaiW1JwEjLtSmoWTbDbxATyuJWUPc17fE2D6i45X91oKTlkPA6Kwv/+E88
 hrf4mxZUgJFTG3nt75CznX7ZgUTZhvaxioT5FJvInmsg/9vR6O2hIBy2/EcUSsOrO4y54NA0I+S
 2u6W/lqcetFqOluOI3EmxCKPT8izkOVPKexh3NvszNBTB0H2HHicZiYY+D+/5lu/OBlYsDGuROZ
 DxvbgpezCagyxGpYKRevgD/e9KXSZVw==
X-Google-Smtp-Source: AGHT+IGnrISPIDS2VcpPU84kGKN6Wds1LHCFAk/nBMTFwu0/zE/mgmp06Jb+Pu21rP6zh0UyP8gQmw==
X-Received: by 2002:a05:690c:700a:b0:710:f09c:b00f with SMTP id
 00721157ae682-7166b5f7d64mr131025657b3.15.1751839616082; 
 Sun, 06 Jul 2025 15:06:56 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com.
 [209.85.128.182]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-716659a160asm13975197b3.42.2025.07.06.15.06.55
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Jul 2025 15:06:55 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-7170344c100so9485707b3.0
 for <buildroot@buildroot.org>; Sun, 06 Jul 2025 15:06:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWb1GAN0pmn4i1FFdLtwBD+dXE7CRVDuET3EuM5+pwlbe8ABa6SmKyfIX8Kkgd9ct5OMMHjwK3uzEE=@buildroot.org
X-Received: by 2002:a05:690c:6d05:b0:70e:5eda:4941 with SMTP id
 00721157ae682-7166b6cc2demr123384607b3.23.1751839615355; Sun, 06 Jul 2025
 15:06:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1751377540.git.yann.morin@orange.com>
 <d23125d705a0c24ca91071624d507392ecfe7b0d.1751377540.git.yann.morin@orange.com>
 <a8b668d1-24da-4b18-8235-e98a29732884@smile.fr>
In-Reply-To: <a8b668d1-24da-4b18-8235-e98a29732884@smile.fr>
Date: Sun, 6 Jul 2025 15:06:44 -0700
X-Gmail-Original-Message-ID: <CA+h8R2r9JW=D=0gmyiMvwVhZzyQaq5RhKpH=TM=Dd8t_rNaoQA@mail.gmail.com>
X-Gm-Features: Ac12FXxQkrnIkcBSUglxfZAjP-w3KWnw6YKbkY5NzbFKEPT499IbdF-UlTvxdhE
Message-ID: <CA+h8R2r9JW=D=0gmyiMvwVhZzyQaq5RhKpH=TM=Dd8t_rNaoQA@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
Cc: yann.morin@orange.com, buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1751839616; x=1752444416; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Itr8KeCQk1cGxIyXyo4l1mcTcoOhaluIlKg5bBxTRL8=;
 b=RHREgvAi8h1T+3aMpnclS9tcj5eelmtCFbgH9xd4hwoGILrsrjOeVN7O32Nfc1vH08
 bfnpBbPY54qi5NzH+srbbffs7ekyBoGiJMvtINavUEM5hnW7EC+jFlxglDglAiHyUYsc
 IJXtTPj+91OgCTwTCxCXONLO6BiKSi25lkw+pTPkLpY/EGA+cmkAkieDWHAJ8qOWppRc
 vEwxtvxCtl3qYq2fBx7Vg/cLRBRBTl4bd9H7VwX19T/Kfz0JPRxXfJTGKkAOZLabehx6
 lIIP4Eda5jJeCg0uDgZhIE/2XbDcFgtG6X/m7GhkUoMjEuPGFErPs5T2mNmvVf8sk2BM
 NXFg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=RHREgvAi
Subject: Re: [Buildroot] [PATCH 1/4 v2] package/pkg-golang: simplify
 installing multiple binaries
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgWWFubiwgUm9tYWluLCBBbGwsCgoKT24gU2F0LCBKdWwgNSwgMjAyNSBhdCAxOjUx4oCvUE0g
Um9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+IHdyb3RlOgo+IExlIDAxLzA3LzIw
MjUgw6AgMTU6NDUsIHlhbm4ubW9yaW5Ab3JhbmdlLmNvbSBhIMOpY3JpdCA6Cj4gPgo+ID4gV2Ug
Y2hhbmdlIHRoZSBwa2ctZ29sYW5nIGluZnJhIHRvIGJldHRlciBjb3ZlciBzdWNoIGEgY2FzZToK
PiA+Cj4gPiAgIC0gaWYgX0JVSUxEX1RBUkdFVCBpcyAnLicgKHRoZSBkZWZhdWx0KSwga2VlcCB0
aGUgY3VycmVudCBzY2hlbWU6Cj4gPiAgICAgaW5zdGFsbCBhIHNpbmdsZSBiaW5hcnkgbmFtZWQg
YWZ0ZXIgdGhlIHBhY2thZ2UgcndhbmFtZTsKPiA+Cj4gPiAgIC0gaWYgX0JVSUxEX1RBUkdFVCBp
cyBub3QgJy4nLCBhbmQgY29udGFpbnMgYSBzaW5nbGUgd29yZCwgdXNlIHRoZQo+ID4gICAgIG5v
dGRpciBvZiB0aGUgYnVpbHQgdGFyZ2V0LCBidXQgYWxsb3cgdGhlIHVzZXIgdG8gb3ZlcnJpZGUg
aXQgd2l0aAo+ID4gICAgIF9CSU5fTkFNRSAodGhlIGN1cnJlbnQgYmVoYXZpb3VyKTsKPiA+Cj4g
PiAgIC0gb3RoZXJ3aXNlIChfQlVJTERfVEFSR0VUUyBpcyBzZXQgdG8gbW9yZSB0aGFuIG9uZSB3
b3JkKSwgZG8gbm90Cj4gPiAgICAgYWxsb3cgdGhlIHVzZXIgdG8gc2V0IF9CSU5fTkFNRSAoaXQg
ZG9lcyBub3QgbWFrZSBzZW5zZSksIGJ1dCBzZXQKPiA+ICAgICBfSU5TVEFMTF9CSU5TIGJ5IGRl
ZmF1bHQgdG8gdGhlIG5vdGRpciBvZiBfQlVJTERfVEFSR0VUUy4KClRoaXMgbG9va3MgZ3JlYXQg
dG8gbWUuIEl0J3MganVzdCBpbXByb3ZpbmcgdGhlIGRlZmF1bHQgY2FzZXMuIFdlIGNhbgpzdGls
bCBvdmVycmlkZSBfSU5TVEFMTF9CSU5TLgoKPiA+IFdlIHN0aWxsIGFsbG93IHRoZSB1c2VyIHRv
IHNldCBfSU5TVEFMTF9CSU5TIGluIHRoZSBsYXN0IGNhc2UsIHRvIGNvdmVyCj4gPiB0aGUgY2Fz
ZSBmb3IgZXhpc3RpbmcgcGFja2FnZXM7IHRob3NlIGFyZSBnb2luZyB0byBiZSAiZml4ZWQiIGlu
IHRoZQo+ID4gZm9sbG93aW5nIGNvbW1pdHMuCgo+ID4gV2Ugbm93IGNvbnNpZGVyIHRoYXQgX0lO
U1RBTExfQklOUyBpcyBhbiBpbnRlcm5hbCBpbXBsZW1lbnRhdGlvbiBkZXRhaWxzCj4gPiB0aGF0
IHNob3VsZCBubyBsb25nZXIgYmUgZXhwb3NlZCB0byB0aGUgdXNlcnMsIHNvIHdlIGRyb3AgaXQg
ZnJvbSB0aGUKPiA+IGRvY3VtZW50YXRpb247IHdlIHJlcGhyYXNlIHRoZSBjb3JyZXNwb25kaW5n
IHBhcnQgZm9yIF9CVUlMRF9UQVJHRVRTLgoKSXMgdGhlcmUgYW55IGNhc2Ugd2hlcmUgd2Ugd291
bGQgc3RpbGwgd2FudCB0byBvdmVycmlkZSB0aGlzPyBJIGd1ZXNzCnRoZSBsb2dpYyBpcyB3ZSB3
b3VsZCBuZXZlciBib3RoZXIgYnVpbGRpbmcgYSBiaW5hcnkgaWYgd2UgZG9uJ3QKaW5zdGFsbCBp
dC4gVGhpcyBtYWtlcyBzZW5zZSB0byBtZSBidXQgSSBkb24ndCB0aGluayBvZiBhbnkgZXhjZXB0
aW9ucwphdCB0aGUgbW9tZW50LiBJIGhhdmVuJ3QgdG91Y2hlZCB0aGlzIGluIHNvIGxvbmcgc28g
SSBkb24ndCBrbm93IGZvcgpzdXJlLgoKSSB3aWxsIGdvIGFoZWFkIGFuZCB0ZXN0IHRoaXMgc2Vy
aWVzIG9uIG15IGVuZC4KClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gU3Rld2FydCA8Y2hyaXN0aWFu
QGFwZXJ0dXJlLnVzPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
