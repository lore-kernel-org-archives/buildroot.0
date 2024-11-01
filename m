Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1108E6F063
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 14:58:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EC2D60662;
	Fri,  1 Nov 2024 14:58:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d-NIG8Omywq6; Fri,  1 Nov 2024 14:58:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7840C6068B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7840C6068B;
	Fri,  1 Nov 2024 14:58:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9483060
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 14:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C97C40353
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 14:58:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I6O-MF3JQk9I for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 14:57:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a32; helo=mail-vk1-xa32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E7FE140299
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7FE140299
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com
 [IPv6:2607:f8b0:4864:20::a32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E7FE140299
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 14:57:58 +0000 (UTC)
Received: by mail-vk1-xa32.google.com with SMTP id
 71dfb90a1353d-50d32d82bd8so575244e0c.1
 for <buildroot@buildroot.org>; Fri, 01 Nov 2024 07:57:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730473077; x=1731077877;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5UnqSQHgtsiFrVJfFZEY6GkoUGWqMQ4X09Z6WJMBHYc=;
 b=GsBuYTQ9ZKYnOXF+eGq1rYXE6u7h7A6E9JboOwbAQJGEEl6jheY6yt3CL8DrvWgZvk
 3IzbB4HJiTL3U9AqZsJSXuRJsgujSAiEP435g4H6/S123np175sAiMxyXXZXBvgmAxvS
 IuChEI3wrXJxbEiLLqSAcmX6sRBZ9MYtz/5XVoukEOrxyRBF0x9aShThxEX8dCgRxtDC
 kaAArl+LJGTG5y22+84pXDIOTURVFJ/mlHnf6X4JXVGytCv45WMO1N+vTTxLX+7WkQWY
 HOurgMjyq/+OfHU3qI7Dw9Dc+2whvVjSKQWnQKfxadrEg/M8hwO/bEEGZhjfdYb2AAAY
 vOIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKctSc058q9INLN/HE/Nc7zs2E0sLCMksyOH2eP62Z6hGl8fCJgX7aMcupnAX5ok5z9bHHDA+1GAk=@buildroot.org
X-Gm-Message-State: AOJu0Yyqv0/O4yHgN8kxeUYnJmSCAW8DMahtl9O8a6zT7Vhg6howob5w
 e6wdwGmBUfmqmp8GhltEVMgshE3DISk99wd/2NS0gD6C2vf/5c2+u169styCI+EqWVeMo2aaRjs
 ve+hPu1D2yhuexhvkhDlDy1wxuRbGSjhT
X-Google-Smtp-Source: AGHT+IHN6tKpEfIzSU0DMp8UMC3QYCvSZ5FQOJG1OcMqyv97UY+nqSekA0MYPNeaHGyPh6zNanDrIcVe2JE02EG4BjY=
X-Received: by 2002:a05:6122:8c7:b0:50d:3ec1:154b with SMTP id
 71dfb90a1353d-5106ae6decbmr7567228e0c.3.1730473077485; Fri, 01 Nov 2024
 07:57:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240921185558.3647651-1-bernd@kuhls.net>
 <20240921185558.3647651-2-bernd@kuhls.net>
 <20241031205621.064eceae@windsurf>
In-Reply-To: <20241031205621.064eceae@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 1 Nov 2024 08:57:46 -0600
Message-ID: <CADvTj4oYpFkJYp_CkXc30WM-K-pVQBTLKmN0kN11v5kWxJNvyA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org, 
 Asaf Kahlon <asafka7@gmail.com>, Fiona Klute <fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730473077; x=1731077877; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5UnqSQHgtsiFrVJfFZEY6GkoUGWqMQ4X09Z6WJMBHYc=;
 b=c4AZUX3rTc2xHgtIpdEGEgihibc1NT7q6N+Nwhz8IJUUq3zuw7NfUfz27GvDoVzCVo
 oSCN/4NTy61EvENqTiy/XhiQVWOjNQHDQgzNDSjyE0NZy3GUEY6NzDEo/xRIJ4vQyHAf
 FLs0b4wiCxt8RRx40oGGmIyBf5g3S+Qc5fi5XRjpH+Re55hjl64A5QYkxsxp9OuV7R1T
 SslYf7qvVwmbElWPNSNNb+NoEIghQ7TQencXTkebrvG8WieGaEsItcMEsD6CnWFKv1KE
 lj+cMZa+DLSCgNYZemcx3yFjbKNop1QuXubhDrj/zOzaVfrzu3hJdSCHF+Mbt5PvtGJg
 qxCw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=c4AZUX3r
Subject: Re: [Buildroot] [PATCH 2/2] package/python-emailproxy: new package
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

T24gVGh1LCBPY3QgMzEsIDIwMjQgYXQgMTo1NuKAr1BNIFRob21hcyBQZXRhenpvbmkKPHRob21h
cy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGVsbG8gQmVybmQsCj4KPiBUaGFu
a3MgZm9yIHRoaXMgcGF0Y2guCj4KPiBKYW1lczogY291bGQgeW91IGhlbHAgcmV2aWV3aW5nIHRo
aXMgcGF0Y2g/IEluIHBhcnRpY3VsYXIsIEkgZmluZCBpdAo+IG9kZCB0aGF0IGl0IG5lZWRzIGhv
c3QtcHl0aG9uLWNyeXB0b2dyYXBoeSBob3N0LXB5dGhvbi1weWFzeW5jb3JlIGFzCj4gYnVpbGQg
ZGVwZW5kZW5jaWVzLiBDb3VsZCB5b3UgcHJvdmlkZSBzb21lIGd1aWRhbmNlIG9uIHRoaXM/CgpZ
ZWFoLCB0aGF0J3MgY29taW5nIGZyb20gaGVyZToKaHR0cHM6Ly9naXRodWIuY29tL3NpbW9ucm9i
L2VtYWlsLW9hdXRoMi1wcm94eS9ibG9iLzIwMjQtMDktMTIvcHlwcm9qZWN0LnRvbWwjTDIKCkJ1
dCB0aGV5IG1pZ2h0IG5vdCBiZSByZWFsIGRlcGVuZGVuY2llcywgY291bGQgdHJ5IGJ5cGFzc2lu
ZyB3aXRoIGJ1aWxkIG9wdHM6Ci0tc2tpcC1kZXBlbmRlbmN5LWNoZWNrCgo+Cj4gVGhhbmtzIGEg
bG90LAo+Cj4gVGhvbWFzCj4KPiBPbiBTYXQsIDIxIFNlcCAyMDI0IDIwOjU1OjU4ICswMjAwCj4g
QmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4gd3JvdGU6Cj4KPiA+IFNpZ25lZC1vZmYtYnk6
IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+Cj4gPiAtLS0KPiA+ICBERVZFTE9QRVJTICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCj4gPiAgcGFja2FnZS9D
b25maWcuaW4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+ID4gIHBhY2th
Z2UvcHl0aG9uLWVtYWlscHJveHkvQ29uZmlnLmluICAgICAgICAgICAgICB8IDE0ICsrKysrKysr
KysrKysrCj4gPiAgcGFja2FnZS9weXRob24tZW1haWxwcm94eS9weXRob24tZW1haWxwcm94eS5o
YXNoIHwgIDUgKysrKysKPiA+ICBwYWNrYWdlL3B5dGhvbi1lbWFpbHByb3h5L3B5dGhvbi1lbWFp
bHByb3h5Lm1rICAgfCAxNSArKysrKysrKysrKysrKysKPiA+ICA1IGZpbGVzIGNoYW5nZWQsIDM2
IGluc2VydGlvbnMoKykKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9weXRob24tZW1h
aWxwcm94eS9Db25maWcuaW4KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9weXRob24t
ZW1haWxwcm94eS9weXRob24tZW1haWxwcm94eS5oYXNoCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IHBhY2thZ2UvcHl0aG9uLWVtYWlscHJveHkvcHl0aG9uLWVtYWlscHJveHkubWsKPiA+Cj4gPiBk
aWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKPiA+IGluZGV4IGM5NDQzNTU4YzEu
LmI4OWIzMmVhNTEgMTAwNjQ0Cj4gPiAtLS0gYS9ERVZFTE9QRVJTCj4gPiArKysgYi9ERVZFTE9Q
RVJTCj4gPiBAQCAtNDk2LDYgKzQ5Niw3IEBAIEY6ICAgICAgICBwYWNrYWdlL3ByaXZveHkvCj4g
PiAgRjogICBwYWNrYWdlL3B1cmUtZnRwZC8KPiA+ICBGOiAgIHBhY2thZ2UvcHl0aG9uLWNvdWNo
ZGIvCj4gPiAgRjogICBwYWNrYWdlL3B5dGhvbi1jc3N1dGlscy8KPiA+ICtGOiAgIHBhY2thZ2Uv
cHl0aG9uLWVtYWlscHJveHkvCj4gPiAgRjogICBwYWNrYWdlL3B5dGhvbi1nbHNsYW5nLwo+ID4g
IEY6ICAgcGFja2FnZS9weXRob24tbWFrby8KPiA+ICBGOiAgIHBhY2thZ2UvcHl0aG9uLW13Y2xp
ZW50Lwo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvQ29uZmlnLmluIGIvcGFja2FnZS9Db25maWcu
aW4KPiA+IGluZGV4IDQ2NjFlM2Q2MDAuLjA4NGI5NWM0ZTEgMTAwNjQ0Cj4gPiAtLS0gYS9wYWNr
YWdlL0NvbmZpZy5pbgo+ID4gKysrIGIvcGFja2FnZS9Db25maWcuaW4KPiA+IEBAIC0xMDk2LDYg
KzEwOTYsNyBAQCBtZW51ICJFeHRlcm5hbCBweXRob24gbW9kdWxlcyIKPiA+ICAgICAgIHNvdXJj
ZSAicGFja2FnZS9weXRob24tZHBrdC9Db25maWcuaW4iCj4gPiAgICAgICBzb3VyY2UgInBhY2th
Z2UvcHl0aG9uLWR0c2NoZW1hL0NvbmZpZy5pbiIKPiA+ICAgICAgIHNvdXJjZSAicGFja2FnZS9w
eXRob24tZWNkc2EvQ29uZmlnLmluIgo+ID4gKyAgICAgc291cmNlICJwYWNrYWdlL3B5dGhvbi1l
bWFpbHByb3h5L0NvbmZpZy5pbiIKPiA+ICAgICAgIHNvdXJjZSAicGFja2FnZS9weXRob24tZW1h
aWwtdmFsaWRhdG9yL0NvbmZpZy5pbiIKPiA+ICAgICAgIHNvdXJjZSAicGFja2FnZS9weXRob24t
ZW5naW5laW8vQ29uZmlnLmluIgo+ID4gICAgICAgc291cmNlICJwYWNrYWdlL3B5dGhvbi1lbnRy
eXBvaW50cy9Db25maWcuaW4iCj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tZW1haWxw
cm94eS9Db25maWcuaW4gYi9wYWNrYWdlL3B5dGhvbi1lbWFpbHByb3h5L0NvbmZpZy5pbgo+ID4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAuLmY1YzcyZDNhMTgKPiA+
IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLWVtYWlscHJveHkvQ29uZmln
LmluCj4gPiBAQCAtMCwwICsxLDE0IEBACj4gPiArY29uZmlnIEJSMl9QQUNLQUdFX1BZVEhPTl9F
TUFJTFBST1hZCj4gPiArICAgICBib29sICJweXRob24tZW1haWxwcm94eSIKPiA+ICsgICAgIGRl
cGVuZHMgb24gQlIyX1BBQ0tBR0VfSE9TVF9SVVNUQ19UQVJHRVRfQVJDSF9TVVBQT1JUUyAjIHB5
dGhvbi1jcnlwdG9ncmFwaHkKPiA+ICsgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9IT1NUX1BZVEhP
TjMKPiA+ICsgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9IT1NUX1BZVEhPTjNfU1NMCj4gPiArICAg
ICBzZWxlY3QgQlIyX1BBQ0tBR0VfUFlUSE9OX0NSWVBUT0dSQVBIWSAjIHJ1bnRpbWUKPiA+ICsg
ICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9QWVRIT05fUFJPTVBUX1RPT0xLSVQgIyBydW50aW1lCj4g
PiArICAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfUFlUSE9OX1BZQVNZTkNPUkUgIyBydW50aW1lCj4g
PiArICAgICBoZWxwCj4gPiArICAgICAgIEFuIElNQVAvUE9QL1NNVFAgcHJveHkgdGhhdCB0cmFu
c3BhcmVudGx5IGFkZHMgT0F1dGggMi4wCj4gPiArICAgICAgIGF1dGhlbnRpY2F0aW9uIGZvciBl
bWFpbCBjbGllbnRzIHRoYXQgZG9uJ3Qgc3VwcG9ydCB0aGlzCj4gPiArICAgICAgIG1ldGhvZC4K
PiA+ICsKPiA+ICsgICAgICAgaHR0cHM6Ly9naXRodWIuY29tL3NpbW9ucm9iL2VtYWlsLW9hdXRo
Mi1wcm94eQo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLWVtYWlscHJveHkvcHl0aG9u
LWVtYWlscHJveHkuaGFzaCBiL3BhY2thZ2UvcHl0aG9uLWVtYWlscHJveHkvcHl0aG9uLWVtYWls
cHJveHkuaGFzaAo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAu
LmUyMTBhZDM4OTgKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLWVt
YWlscHJveHkvcHl0aG9uLWVtYWlscHJveHkuaGFzaAo+ID4gQEAgLTAsMCArMSw1IEBACj4gPiAr
IyBtZDUsIHNoYTI1NiBmcm9tIGh0dHBzOi8vcHlwaS5vcmcvcHlwaS9lbWFpbHByb3h5L2pzb24K
PiA+ICttZDUgIGVhMjU0YWUxZThkNzcxYmIxNjliZTQxY2NjNTc1OTY3ICBlbWFpbHByb3h5LTIw
MjQuOS4xMi50YXIuZ3oKPiA+ICtzaGEyNTYgIGIzZmVmODdlYmY4MDNkYmQ4ZWQ5OTg1MjFiM2Vj
NDI0YzRmZTdmOGYwMmI2ZWYxZTFlMDhiMmMzYTY5OTJmNzIgIGVtYWlscHJveHktMjAyNC45LjEy
LnRhci5nego+ID4gKyMgTG9jYWxseSBjb21wdXRlZCBzaGEyNTYgY2hlY2tzdW1zCj4gPiArc2hh
MjU2ICBjNzFkMjM5ZGY5MTcyNmZjNTE5YzZlYjcyZDMxOGVjNjU4MjA2MjcyMzJiMmY3OTYyMTll
ODdkY2YzNWQwYWI0ICBMSUNFTlNFCj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tZW1h
aWxwcm94eS9weXRob24tZW1haWxwcm94eS5tayBiL3BhY2thZ2UvcHl0aG9uLWVtYWlscHJveHkv
cHl0aG9uLWVtYWlscHJveHkubWsKPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAw
MDAwMDAwMDAwLi44OWNlM2E1ZGFhCj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9wYWNrYWdl
L3B5dGhvbi1lbWFpbHByb3h5L3B5dGhvbi1lbWFpbHByb3h5Lm1rCj4gPiBAQCAtMCwwICsxLDE1
IEBACj4gPiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiA+ICsjCj4gPiArIyBweXRob24tZW1h
aWxwcm94eQo+ID4gKyMKPiA+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ID4gKwo+ID4gK1BZ
VEhPTl9FTUFJTFBST1hZX1ZFUlNJT04gPSAyMDI0LjkuMTIKPiA+ICtQWVRIT05fRU1BSUxQUk9Y
WV9TT1VSQ0UgPSBlbWFpbHByb3h5LSQoUFlUSE9OX0VNQUlMUFJPWFlfVkVSU0lPTikudGFyLmd6
Cj4gPiArUFlUSE9OX0VNQUlMUFJPWFlfU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVk
Lm9yZy9wYWNrYWdlcy9hNS9hYS80MmU0MDhlYzZmOWM5ZTA2ZDQ1MWIyNmFlOTdlMTI3ZjQ2NDQ4
NjAzMzZiMjg2MzZiYmYxNDg0NWEzNWEKPiA+ICtQWVRIT05fRU1BSUxQUk9YWV9ERVBFTkRFTkNJ
RVMgPSBob3N0LXB5dGhvbi1jcnlwdG9ncmFwaHkgaG9zdC1weXRob24tcHlhc3luY29yZQo+ID4g
K1BZVEhPTl9FTUFJTFBST1hZX1NFVFVQX1RZUEUgPSBzZXR1cHRvb2xzCj4gPiArUFlUSE9OX0VN
QUlMUFJPWFlfTElDRU5TRSA9IEFwYWNoZS0yLjAKPiA+ICtQWVRIT05fRU1BSUxQUk9YWV9MSUNF
TlNFX0ZJTEVTID0gTElDRU5TRQo+ID4gKwo+ID4gKyQoZXZhbCAkKHB5dGhvbi1wYWNrYWdlKSkK
Pgo+Cj4KPiAtLQo+IFRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4K
PiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwo+IGh0
dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
