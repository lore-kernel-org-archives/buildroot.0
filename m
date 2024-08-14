Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1121CC3DA4A
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 21:00:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A26CA60637;
	Wed, 14 Aug 2024 21:00:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wZ1wv_tyQa-Y; Wed, 14 Aug 2024 21:00:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 376FF608DD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 376FF608DD;
	Wed, 14 Aug 2024 21:00:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 533391BF471
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 21:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4017B4013C
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 21:00:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WUSvcPzTDjJU for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 21:00:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=gael.portay@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 67625400AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67625400AC
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 67625400AC
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 21:00:29 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-428243f928cso1191645e9.3
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 14:00:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723669227; x=1724274027;
 h=in-reply-to:references:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=b1TqGFxhmv7iQJU+VpqP5u0gNuCfDc1Bv7Go2prjm9I=;
 b=Gs+w9bnfGpKe4GOYRbzkbhgVC959GEkGZ6vS/QiqGUr4X41SOBXsanGgA8LcBAIIbU
 9w5C212MZPEmmvO44pmw3CaoXxvZYno3UDFB5Yxt4QhZWhCA64WTziQN625DJ+ZXtfvf
 8PqcD1wChHQlPIW8++kW1bvuSgMCoQOrUixmDQzEGzLSgnvV6pk+lTzuG08IJuN8kPOK
 N73hcIdhUZA6P7DmACXa9bO0rSLpN/y2E6UuUUQLaSpIM+hESbPTJl1tiqoQbc4AK1Zt
 DMWrIMvRb/AcVQklVjq52nHHztAKgkdXLGfzcu6eFnNmxUzv8Fi+My7yaNlqrot+UEz9
 09aw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4vCDpwBoMmPZmyP9iTmJALJcOrTQDBrrvOIAmA49ihnspS/5u+CD8hCdDPF33nghYnv1ANXNRVE7KCxkH7ajW8EdkvQf6XA==
X-Gm-Message-State: AOJu0YzknS9RuNU4Ob/O8spJuOYb6k9XyRhm72ahBAcZjN9J7TDNCh4j
 dhV8XQK9h8ksH88J2Nf9H87FkoRAS+OmBHoINxtRqwseLggZqk5F
X-Google-Smtp-Source: AGHT+IG9SpWcyhPvwrEOHJdGBVKFFjtFOOUGuSV+fEsmH/4hquujeaMJN32Mh8nC0Ue0tq3wRZohyQ==
X-Received: by 2002:a05:600c:8708:b0:426:6edb:7e14 with SMTP id
 5b1f17b1804b1-429dd268d3fmr27466275e9.35.1723669226957; 
 Wed, 14 Aug 2024 14:00:26 -0700 (PDT)
Received: from localhost ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ded71dfasm30368195e9.38.2024.08.14.14.00.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Aug 2024 14:00:26 -0700 (PDT)
Mime-Version: 1.0
Date: Wed, 14 Aug 2024 23:00:26 +0200
Message-Id: <D3FXQUWVOR8I.15NN28V1FC1AT@gmail.com>
From: =?utf-8?q?Ga=C3=ABl_PORTAY?= <gael.portay@gmail.com>
To: "Fiona Klute" <fiona.klute@gmx.de>, <buildroot@buildroot.org>,
 =?utf-8?q?Jos=C3=A9_Mendes?= <jp.baltazar.mendes@gmail.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <CAFAK9+dq5Sru4npWX=u1P3y70a5bveavSLRhBoB-6r7wZZyg7A@mail.gmail.com>
 <e0ee0dca-132f-4f29-93ed-e272b6767867@gmx.de>
In-Reply-To: <e0ee0dca-132f-4f29-93ed-e272b6767867@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723669227; x=1724274027; darn=buildroot.org;
 h=in-reply-to:references:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b1TqGFxhmv7iQJU+VpqP5u0gNuCfDc1Bv7Go2prjm9I=;
 b=Ys+3TYGmrg1ZrvdXHtPKxlVm1zDyU1ueTHoJ/vxNUrw92vtpRFTxcsBO70ugP8pGFu
 c/5SY9Ql2LIG4wMPXnWhIWupousZrl0hv6NsTGeCPWeFGVMnshiL7ToKArCdsrlru1sM
 ZKTmtLLQnez7WtmGtmWBLL821neYeCwx+9+qSfGPBsOTAE/A5toJpYB2s35U2lWNKInT
 8RMQ9srH20waNBlRdDDlayfavQSLTDkqCmxMDSmGACrDDtO0H63TK/k5qyw4M053W5Fi
 02YD5B+rNGo6R0oqQhuMMudF8GVduuqTymt+sEQhKU+qw4TJKLIlYu6uL5FEjEZcmWeH
 AlSw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Ys+3TYGm
Subject: Re: [Buildroot] Raspberry Pi SPL
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSm9zw6ksCgpPbiBUdWUgQXVnIDEzLCAyMDI0IGF0IDM6NTQgUE0gQ0VTVCwgRmlvbmEg
S2x1dGUgdmlhIGJ1aWxkcm9vdCB3cm90ZToKPiBIaSBKb3PDqSEKPgo+IEFtIDEzLjA4LjI0IHVt
IDExOjIxIHNjaHJpZWIgSm9zw6kgTWVuZGVzOgo+ID4gSGkgYWxsLAo+ID4KPiA+IEknbSB0cnlp
bmcgdG8gYWRkIFNQTCBhbmQga2VybmVsIHJlZHVuZGFuY3kgdG8gbXkgc3lzdGVtLiBDdXJyZW50
bHkgdGhlCj4gPiBzeXN0ZW0gYWxyZWFkeSBoYXMgcm9vdCBmaWxlIHN5c3RlbSByZWR1bmRhbmN5
IGJ1dCBTUEwgc2VlbXMgaGFyZGVyLgo+ID4KPiA+IFRoZSBjdXJyZW50IHBhcnRpdGlvbiBsYXlv
dXQgaXMgdGhlIGZvbGxvd2luZzoKPiA+Cj4gPiB8IFUtQm9vdCArIEltYWdlICsgcnBpX2Zpcm13
YXJlIHwgUm9vdGZzQSB8IFJvb3Rmc0IgfCBEYXRhIHBhcnRpdGlvbiB8Cj4gPgoKSSBoYXZlIG5l
dmVyIGJvb3RlZCBVLUJvb3QgZnJvbSBhIFBpLCBzbyBJIG1heSB0ZWxsIHN0dXBpZCB0aGluZ3Mu
CgpJZiBJIHdlcmUgeW91LCBJIHdvdWxkIG1vdmUgdGhlIGtlcm5lbHMgYW5kIGR0YiB0byB0aGVp
ciByb290ZnMgYW5kIEkKd291bGQgdXBkYXRlIHRoZSB1LWJvb3Qgc2NyaXB0aW5nIHRvIGxvYWQg
dGhlIGtlcm5lbCBhbmQgaXRzIGR0YiBmcm9tCnRoZSBjb3JyZWN0IHBhcnRpdGlvbiBudW1iZXIg
KGRlcGVuZGluZyBpZiB5b3UgYXJlIG9uIEEgb3IgQikuCgpPZiBjb3Vyc2UsIHRoaXMgaXMgYXBw
bGljYWJsZSBvbmx5IGlmIFUtQm9vdCBpcyBhYmxlIHRvIHJlYWQgdGhlIHJvb3RmcwpwYXJ0aXRp
b24gdG8gbG9hZCB0aGUga2VybmVsIGFuZCB0aGUgZHRiIChpLmUuIGEgZmlsZS1zeXN0ZW0gc3Vw
cG9ydGVkCmJ5IFUtQm9vdCkuCgpJZiB5b3Ugd2FudCB0byAoYmVjYXVzZSB5b3UgbmVlZCB0bykg
ZHVwbGljYXRlIHRoZSBVLUJvb3QgYmluYXJ5LCB5b3UKaGF2ZSBubyBjaG9pY2UgYnV0IHRvIHVz
ZSBhdXRvYm9vdC50eHQgYW5kIHRyeWJvb3QuIFNlZToKCglodHRwczovL3d3dy5yYXNwYmVycnlw
aS5jb20vZG9jdW1lbnRhdGlvbi9jb21wdXRlcnMvY29uZmlnX3R4dC5odG1sI2F1dG9ib290LXR4
dAoKVGhpcyBpbXBsaWVzIHRvIGhhdmUgMiBtb3JlIHZGQVQgcGFydGl0aW9ucy4KCkluIHNob3J0
LCB0aGUgZmlyc3Qgb25lIGhvbGRzIHRoZSBzaW5nbGUgZmlsZSBhdXRvYm9vdC50eHQ7IGl0IHRl
bGxzIG9uCndoaWNoIHBhcnRpdGlvbiAobnVtYmVyKSB0aGUgZmlybXdhcmUgc2hhbGwgcmVhZCBj
b25maWcudHh0IGFuZCBsb2FkIHRoZQpiaW5hcmllcyAoYmxvYiBmaXJtd2FyZXMsIFUtQm9vdCBi
aW5hcnkuLi4pLCBpZiB0aGUgb25lc2hvdCBmbGFnIHRyeWJvb3QKaXMgc2V0LCBvciBub3QuIFRo
ZSB0d28gb3RoZXIgdkZBVCBwYXJ0aXRpb25zIGFyZSB0aGUgcmVkdW5kYW5jeSBvZiB0aGUKY3Vy
cmVudCBmaXJzdCBwYXJ0aXRpb24gKGNvbnRhaW5pbmcgdGhlIFUtQm9vdCArIGZpcm13YXJlICsg
Y29uZmlnLnR4dCkuCgpIZXJlIGlzIGFuIGV4YW1wbGUgb2YgYXV0b2Jvb3QudHh0OgoKCVthbGxd
Cgl0cnlib290X2FfYj0xCglib290X3BhcnRpdGlvbj0yCglbdHJ5Ym9vdF0KCWJvb3RfcGFydGl0
aW9uPTMKCk5vdGU6IFRoZSBmbGFnIHRyeWJvb3QgaXMgdm9sYXRpbGUgKG5vdCBwZXJzaXN0ZW50
KSwgaXQgaXMgc2ltaWxhciB0bwp0aGUgRUZJIEJvb3ROZXh0LiBUaGUgZmxhZyBpcyBzZXQgdG8g
dHJ5IGJvb3Rpbmcgb24gdGhlIG90aGVyIHN5c3RlbTsgaWYKdGhlIG90aGVyIHN5c3RlbSBib290
cywgeW91IGhhdmUgdG8gdXBkYXRlIHRoZSBhdXRvYm9vdC50eHQgdG8gc3dhcCB0aGUKYm9vdF9w
YXJ0aXRpb249IGluIHRoZSBzZWN0aW9ucyBhbGwgYW5kIHRyeWJvb290LCBpLmUuOgoKCVthbGxd
Cgl0cnlib290X2FfYj0xCglib290X3BhcnRpdGlvbj0zCglbdHJ5Ym9vdF0KCWJvb3RfcGFydGl0
aW9uPTIKCjEvIEkgc3VnZ2VzdDoKCnwgYXV0b2Jvb3QudHh0IHwgY29uZmlnLnR4dCArIFUtQm9v
dCBBIHwgY29uZmlnLnR4dCArIFUtQm9vdCBCIHwgSW1hZ2UgKyBSb290RlMgQSB8IEltYWdlICsg
Um9vdEZTIEIgfCBEYXRhIHBhcnRpdGlvbiB8CgoyLyBIb3dldmVyLCBpZiB5b3UgdXNlIGF1dG9i
b290LnR4dCBhbmQgdHJ5Ym9vdCwgeW91IGRvIG5vdCBuZWVkIFUtQm9vdDsKeW91IGNhbiBib290
IHRoZSBrZXJuZWwgZGlyZWN0bHkgKHRoZSBrZXJuZWwgY2Fubm90IGJlIGluIHRoZSByb290ZnMg
YXMKaXQgaXMgbG9hZGVkIGJ5IHRoZSBmaXJ3bWFyZSB2aWEgdGhlIGNvbmZpZy50eHQga2VybmVs
PSkuCgp8IGF1dG9ib290LnR4dCB8IGNvbmZpZy50eHQgKyBJbWFnZSBBIHwgY29uZmlnLnR4dCAr
IEltYWdlIEIgfCBSb290RlMgQSB8IFJvb3RGUyBCIHwgRGF0YSBwYXJ0aXRpb24gfAoKPiA+IElu
IG15IG1pbmQgdGhlcmUgYXJlIDIgd2F5cyBvZiBkb2luZyB0aGlzOgo+ID4KPiA+IEVpdGhlciBV
LUJvb3QgaXMgbW92ZWQgdG8gaXRzIG93biBwYXJ0aXRpb24gYW5kIEkgaGF2ZSB0aGUgSW1hZ2Ug
YW5kCj4gPiBycGlfZmlybXdhcmUgaW4gaXRzIG93biBwbGFjZS4KPgo+IFdoYXQgcGFydHMgb2Yg
cnBpLWZpcm13YXJlIGFyZSB5b3UgdXNpbmcgaGVyZT8gRFRCL292ZXJsYXlzPyBGaXJtd2FyZQo+
IGZvciB0aGUga2VybmVsPyBUaGUgbGF0dGVyIGdvZXMgaW50byB0aGUgcm9vdGZzIGFueXdheS4K
PgoKRmlvbmEsIEkgYWdyZWUgdGhlIGtlcm5lbCBzaG91bGQgZ28gaW4gdGhlIHJvb3RmcyBpZiBi
b290aW5nIFUtQm9vdCBhbmQKaWYgdGhlIHJvb3QgZmlsZS1zeXN0ZW0gaXMgc3VwcG9ydGVkIGJ5
IFUtQm9vdC4KCj4gSWYgeW91IHdhbnQgdG8gaGF2ZSByZWR1bmRhbnQgVS1Cb290IHRoYXQnbGwg
cHJvYmFibHkgcmVxdWlyZSB0aGUKPiAidHJ5Ym9vdCIgZmVhdHVyZSBvZiB0aGUgUlBpIGJvb3Rs
b2FkZXIsIGJ1dCBJIGhhdmVuJ3QgdHJpZWQgdGhhdCBteXNlbGYKPiB5ZXQuCj4KClRoZXJlIGlz
IGEgUG9DIGluIHJ0b25lLWJyMi1leHRlcm5hbDsgaXQgdXNlcyBSQVVDIGFuZCBhIGN1c3RvbSBi
YWNrZW5kCndyaXR0ZW4gaW4gYmFzaC4KCglodHRwczovL2dpdGh1Yi5jb20vUnRvbmUvcnRvbmUt
YnIyLWV4dGVybmFsLwoJaHR0cHM6Ly9naXRodWIuY29tL2dwb3J0YXkvcmFzcGJlcnJ5cGktZmly
bXdhcmUtcmF1Yy1ib290bG9hZGVyLWJhY2tlbmQvCgpKb3PDqTogV2hhdCB1cGRhdGUgc29mdHdh
cmUgYXJlIHlvdSB1c2luZz8gUkFVQywgc3d1cGRhdGUsIE1lbmRlciwKY3VzdG9tPwoKPiBCZXN0
IHJlZ2FyZHMsCj4gRmlvbmEKPgo+IFsxXSBodHRwczovL2RvY3MudS1ib290Lm9yZy9lbi9sYXRl
c3QvdXNhZ2UvZml0L2luZGV4Lmh0bWwKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAoKUmVnYXJkcywKR2HDq2wKClBTOiBXaGVuIHlvdSBzYXkgU1BMLCBJIHRoaW5r
IHlvdSBzaG91bGQgc2F5IFUtQm9vdCBkaXJlY3RseTsgSUlSQyB0aGUKVS1Cb290IFNQTCBpcyB0
aGUgImZpcnN0c3RhZ2UiIGJvb3Rsb2FkZXIgYWZ0ZXIgUk9NY29kZSwgaXQgaXMgYSB0aW55ClUt
Qm9vdCBib290aW5nIHRoZSBmdWxsIGZlYXR1cmVkIFUtQm9vdC4gSW4gdGhlIGNhc2Ugb2YgUGks
IHRoZSBmaXJ3bWFyZQpib290Y29kZS5iaW4gUGkvUGkyL1BpMyAob3IgdGhlIGZpcndtYXJlIGlu
IEVFUFJPTSBQaTQvUGk1KSBsb2FkcyB0aGUKa2VybmVsIGRpcmVjdGx5IG9yIFUtYm9vdCB2aWEg
Y29uZmlnLnR4dCBhbmQga2VybmVsPS4gQ29ycmVjdCBtZSBpZiBJIGFtCndyb25nLgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
