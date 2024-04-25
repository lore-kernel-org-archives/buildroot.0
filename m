Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E517C4345F
	for <buildroot@archiver.kernel.org>; Thu, 25 Apr 2024 08:15:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73BE66067D;
	Thu, 25 Apr 2024 08:15:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u7We15D4mPpi; Thu, 25 Apr 2024 08:15:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 576C660A42
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 576C660A42;
	Thu, 25 Apr 2024 08:15:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 746C41BF331
 for <buildroot@lists.busybox.net>; Thu, 25 Apr 2024 08:15:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F147822D1
 for <buildroot@lists.busybox.net>; Thu, 25 Apr 2024 08:15:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ydZqO478PnLG for <buildroot@lists.busybox.net>;
 Thu, 25 Apr 2024 08:15:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C03B4822D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C03B4822D0
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C03B4822D0
 for <buildroot@buildroot.org>; Thu, 25 Apr 2024 08:15:45 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2db6f5977e1so7358261fa.2
 for <buildroot@buildroot.org>; Thu, 25 Apr 2024 01:15:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714032943; x=1714637743;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vu3RmzEYZkfCQySPxSlwQTCC3ZHBgix10fxuJxh4xls=;
 b=ONg05xJAAtLiARlnK7b5A/pgrsxTIW6mWi+yb/xrf+rQoyBlKbL7PAfW4cvNNCqzy5
 gYDp9kZFK5ExqhmKp1T36ZmCfE2Cf9qvHLjR/wwMGXlKI9UW1SM1ABCWq9/8Yt/Zsryf
 j6rJ2fqvW4MlfnOS4u8z5eF36jVTykXcdSbBclQtj4OX1HT7ibCm6Xilsjt7HjI64Dsw
 /A0wTj1YOSyXBHhV+SVSWajFxc1+/LTj5WbTDcqGcklueZtXTyrLmlOvxYhdaW7UqM/D
 eGhmc6iWXsjgifVou8iGPQSduzR8dF85ZehyLuhYSyR5WpuThyLGaafyZH5JfGCMawTl
 t8Pw==
X-Gm-Message-State: AOJu0Ywry6yUzguGRSJ0Hlrjq6Ks+bdvqPLoIBqfw2FwBnS3in/F1gl/
 Dr3aAypdfxtmysWE+blGKJyeSZhACB7fQtWN5729FZiW8gmBedRWakLCYq4Wa8+Om4eN5MeOEuN
 nZ+jHzL5SexPEhGZxYBbDkeMZSj0=
X-Google-Smtp-Source: AGHT+IGz4rG+bqy7iD+0Upr1pG0QjUxEW7wUsHQQwi6gYHfpRr2So9b3WRHN2roG6Gk1WR6BF0y5uy0Vd1XHG1x7/Fk=
X-Received: by 2002:a2e:9c45:0:b0:2d8:7363:ff36 with SMTP id
 t5-20020a2e9c45000000b002d87363ff36mr2970933ljj.37.1714032942988; Thu, 25 Apr
 2024 01:15:42 -0700 (PDT)
MIME-Version: 1.0
References: <20231219170451.60414-1-adam.duskett@amarulasolutions.com>
In-Reply-To: <20231219170451.60414-1-adam.duskett@amarulasolutions.com>
Date: Thu, 25 Apr 2024 10:15:30 +0200
Message-ID: <CAGm1_kuWLz+iXiap1u4cNh1JV9ch4fZfKJLZEOWw-SqxCTUqJg@mail.gmail.com>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1714032943; x=1714637743; darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vu3RmzEYZkfCQySPxSlwQTCC3ZHBgix10fxuJxh4xls=;
 b=RsjfzYa2UwpDtNbLpDXUO/nSXtiuR9DJet8LnGeCvGv1bO3tBSrrFPYLZPvVDhAOx3
 tPa+tDmwO51LghPW9V76IOvGdlGErqgMOMtvPxBXTr/OJEFdUnQLRlbGKl8mUrS/FQrR
 AZ3nyzjPt/zeHSUrIHRpwwc+iKQTryGJ2/QgyvGqUlO5zCdwd/tdgNyopTxg+25ceE1c
 gbNaebfRIocGVlzlvdbYh7ecHa+Gn0zrnaNny3WQ8Ipe2Pd5uvyVXy9PR/5cEDJ10j97
 tPxlT/f3H10Km6UkedFx+OqP5A4TVDi3bFLs1tj305a5pPRpnG6j+XLrB+Z5OIfEke0t
 elbA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RsjfzYa2
Subject: Re: [Buildroot] [PATCH v4 1/3] package/itstool: new host-package
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQWRhbSwgWWFubiwKCk9uIFR1ZSwgRGVjIDE5LCAyMDIzIGF0IDY6MDXigK9QTSBBZGFtIER1
c2tldHQKPGFkYW0uZHVza2V0dEBhbWFydWxhc29sdXRpb25zLmNvbT4gd3JvdGU6Cj4KPiBUcmFu
c2xhdGUgWE1MIHdpdGggUE8gZmlsZXMgdXNpbmcgVzNDIEludGVybmF0aW9uYWxpemF0aW9uIFRh
ZyBTZXQgcnVsZXMuCj4gVGhpcyBpcyBuZWVkZWQgZm9yIHRoZSB6ZW5pdHkgcGFja2FnZS4KPgo+
IFNpZ25lZC1vZmYtYnk6IEFkYW0gRHVza2V0dCA8YWRhbS5kdXNrZXR0QGFtYXJ1bGFzb2x1dGlv
bnMuY29tPgoKUmV2aWV3ZWQtYnk6IFllZ29yIFllZnJlbW92IDx5ZWdvcnNsaXN0c0Bnb29nbGVt
YWlsLmNvbT4KCllhbm4sIGFyZSB0aGVyZSBhbnkgVE9ET3MgbGVmdCBvciBjYW4gdGhpcyBwYXRj
aCBiZSByZWJhc2VkIGFuZCBhcHBsaWVkPwoKWWVnb3IKCj4gLS0tCj4gdjMgLT4gdjQ6Cj4gICAt
IEFkZCBhIENvbmZpZy5pbi5ob3N0IGZpbGUgYW5kIHNlbGVjdCBob3N0LXB5dGhvbjMgW1lhbm5d
Cj4gICAtIEFkZCBhIGRlcGVuZGVuY3kgb24gaG9zdC1saWJ4bWwyIFtZYW5uXQo+ICAgLSBBZGQg
YSBjb21tZW50IGFzIHRvIHdoeSBhdXRvcmVjb25mID0geWVzIGlzIHNldC4gW1lhbm5dCj4gIERF
VkVMT1BFUlMgICAgICAgICAgICAgICAgICAgICB8ICAxICsKPiAgcGFja2FnZS9Db25maWcuaW4u
aG9zdCAgICAgICAgIHwgIDEgKwo+ICBwYWNrYWdlL2l0c3Rvb2wvQ29uZmlnLmluLmhvc3QgfCAg
OCArKysrKysrKwo+ICBwYWNrYWdlL2l0c3Rvb2wvaXRzdG9vbC5oYXNoICAgfCAgMyArKysKPiAg
cGFja2FnZS9pdHN0b29sL2l0c3Rvb2wubWsgICAgIHwgMTUgKysrKysrKysrKysrKysrCj4gIDUg
ZmlsZXMgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFj
a2FnZS9pdHN0b29sL0NvbmZpZy5pbi5ob3N0Cj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdl
L2l0c3Rvb2wvaXRzdG9vbC5oYXNoCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2l0c3Rv
b2wvaXRzdG9vbC5tawo+Cj4gZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJTCj4g
aW5kZXggMzExZGNkOTUwNC4uNTE5YWQyOTg0ZSAxMDA2NDQKPiAtLS0gYS9ERVZFTE9QRVJTCj4g
KysrIGIvREVWRUxPUEVSUwo+IEBAIC0zNyw2ICszNyw3IEBAIEY6ICAgIHBhY2thZ2UvZmx1dHRl
ci1lbmdpbmUvCj4gIEY6ICAgICBwYWNrYWdlL2ZsdXR0ZXItZ2FsbGVyeS8KPiAgRjogICAgIHBh
Y2thZ2UvZmx1dHRlci1waS8KPiAgRjogICAgIHBhY2thZ2UvZmx1dHRlci1zZGstYmluLwo+ICtG
OiAgICAgcGFja2FnZS9pdHN0b29sLwo+ICBGOiAgICAgcGFja2FnZS9weXRob24ta21vZC8KPiAg
RjogICAgIHBhY2thZ2UvcHl0aG9uLXZlcnNpb25lZXIvCj4gIEY6ICAgICBzdXBwb3J0L3Rlc3Rp
bmcvdGVzdHMvcGFja2FnZS90ZXN0X2ZpcmV3YWxsZC5weQo+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L0NvbmZpZy5pbi5ob3N0IGIvcGFja2FnZS9Db25maWcuaW4uaG9zdAo+IGluZGV4IGM4MDg0MmMz
M2EuLjZiYzE4NTdkZjIgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9Db25maWcuaW4uaG9zdAo+ICsr
KyBiL3BhY2thZ2UvQ29uZmlnLmluLmhvc3QKPiBAQCAtNTEsNiArNTEsNyBAQCBtZW51ICJIb3N0
IHV0aWxpdGllcyIKPiAgICAgICAgIHNvdXJjZSAicGFja2FnZS9pbWFnZW1hZ2ljay9Db25maWcu
aW4uaG9zdCIKPiAgICAgICAgIHNvdXJjZSAicGFja2FnZS9pbXgtbWtpbWFnZS9Db25maWcuaW4u
aG9zdCIKPiAgICAgICAgIHNvdXJjZSAicGFja2FnZS9pbXgtdXNiLWxvYWRlci9Db25maWcuaW4u
aG9zdCIKPiArICAgICAgIHNvdXJjZSAicGFja2FnZS9pdHN0b29sL0NvbmZpZy5pbi5ob3N0Igo+
ICAgICAgICAgc291cmNlICJwYWNrYWdlL2poNzF4eC10b29scy9Db25maWcuaW4uaG9zdCIKPiAg
ICAgICAgIHNvdXJjZSAicGFja2FnZS9qcS9Db25maWcuaW4uaG9zdCIKPiAgICAgICAgIHNvdXJj
ZSAicGFja2FnZS9qc21pbi9Db25maWcuaW4uaG9zdCIKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9p
dHN0b29sL0NvbmZpZy5pbi5ob3N0IGIvcGFja2FnZS9pdHN0b29sL0NvbmZpZy5pbi5ob3N0Cj4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi41MmIxN2E3NjJmCj4gLS0t
IC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvaXRzdG9vbC9Db25maWcuaW4uaG9zdAo+IEBAIC0w
LDAgKzEsOCBAQAo+ICtjb25maWcgQlIyX1BBQ0tBR0VfSE9TVF9JVFNUT09MCj4gKyAgICAgICBi
b29sICJob3N0IGl0c3Rvb2wiCj4gKyAgICAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfSE9TVF9QWVRI
T04zCj4gKyAgICAgICBoZWxwCj4gKyAgICAgICAgIFRyYW5zbGF0ZSBYTUwgd2l0aCBQTyBmaWxl
cyB1c2luZyBXM0MgSW50ZXJuYXRpb25hbGl6YXRpb24KPiArICAgICAgICAgVGFnIFNldCBydWxl
cwo+ICsKPiArICAgICAgICAgaHR0cHM6Ly9naXRodWIuY29tL2l0c3Rvb2wvaXRzdG9vbAo+IGRp
ZmYgLS1naXQgYS9wYWNrYWdlL2l0c3Rvb2wvaXRzdG9vbC5oYXNoIGIvcGFja2FnZS9pdHN0b29s
L2l0c3Rvb2wuaGFzaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4u
OTM3MTg1ZWMyYgo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL2l0c3Rvb2wvaXRzdG9v
bC5oYXNoCj4gQEAgLTAsMCArMSwzIEBACj4gKyMgTG9jYWxseSBjb21wdXRlZAo+ICtzaGEyNTYg
IGZiYTc4YTM3ZGMzNTM1ZTQ2ODZjN2Y1NzQwN2I5N2QwM2M2NzZlM2E1N2JlYWM1ZmIyMzE1MTYy
YjBjYzMxNzYgIGl0c3Rvb2wtMi4wLjcudGFyLmd6Cj4gK3NoYTI1NiAgOGNlYjRiOWVlNWFkZWRk
ZTQ3YjMxZTk3NWMxZDkwYzczYWQyN2I2YjE2NWExZGNkODBjN2M1NDVlYjY1YjkwMyAgQ09QWUlO
Ry5HUEwzCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvaXRzdG9vbC9pdHN0b29sLm1rIGIvcGFja2Fn
ZS9pdHN0b29sL2l0c3Rvb2wubWsKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAw
MDAwMDAuLjk0MzM3ZTIyOWMKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9pdHN0b29s
L2l0c3Rvb2wubWsKPiBAQCAtMCwwICsxLDE1IEBACj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
Cj4gKyMKPiArIyBpdHN0b29sCj4gKyMKPiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiArCj4g
K0lUU1RPT0xfVkVSU0lPTiA9IDIuMC43Cj4gK0lUU1RPT0xfU0lURSA9ICQoY2FsbCBnaXRodWIs
aXRzdG9vbCxpdHN0b29sLCQoSVRTVE9PTF9WRVJTSU9OKSkKPiArSVRTVE9PTF9MSUNFTlNFID0g
R1BMLTMuMCsKPiArSVRTVE9PTF9MSUNFTlNFX0ZJTEVTID0gQ09QWUlORy5HUEwzCj4gKyMgU3Ry
YWlnaHQgb3VyIG9mIGdpdCwgbm8gLi9jb25maWd1cmUKPiArSE9TVF9JVFNUT09MX0FVVE9SRUNP
TkYgPSBZRVMKPiArSE9TVF9JVFNUT09MX0RFUEVOREVOQ0lFUyA9IGhvc3QtcHl0aG9uMyBob3N0
LWxpYnhtbDIKPiArCj4gKyQoZXZhbCAkKGhvc3QtYXV0b3Rvb2xzLXBhY2thZ2UpKQo+IC0tCj4g
Mi40My4wCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
