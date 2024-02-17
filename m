Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C568CC48BC4
	for <buildroot@archiver.kernel.org>; Sat, 17 Feb 2024 21:14:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F75B40891;
	Sat, 17 Feb 2024 21:14:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k0WmnuKJw41V; Sat, 17 Feb 2024 21:14:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5206640895
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5206640895;
	Sat, 17 Feb 2024 21:14:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4E26B1BF2A3
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 21:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3BA7E608A9
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 21:14:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VkJTgKzelAFu for <buildroot@lists.busybox.net>;
 Sat, 17 Feb 2024 21:14:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=alexander.sverdlin@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 018D76086C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 018D76086C
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 018D76086C
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 21:14:25 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-33d3a9f377aso153453f8f.3
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 13:14:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708204464; x=1708809264;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Eq4KHIR1cbPinBGdCFYyUUYY2h0yCY3orX/T8SoznoY=;
 b=fRmFIAtzkvWyRIRdmAtShXsH2xEiZBztdLJyi1QhclwPi5xdZFgmfnbHUbb95QpJDW
 nQpuIsVMVpf8DZWVjqOh9VxnwJVfVoe7fjfuZOgl1oMqdsCBK1Bs3AqKk6dDdx79R/nB
 GRJ1T6TOqhsEuOwrq1u+85S1Wgc+QKEyH+6pT9Kyu/7pE1cBYvG0QHWLqzufWy/a+rs2
 F6gJVNL5gkCg7wZgbqyQefI4i3KHVpop4krJd4ATjrudt1GZEHp4YASGLNxmfzbzdkd9
 9A6OXz8CmpD7ZmwiiSPw8Pg5yeXOUDA7YTr+TRwtBbUbi6YHJk4/mwh07NTWR93oPSCN
 fneg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlJXbrWkC8hjJiElFNYY1Bh+qSaGzzQz81TJULNdADhvYksq5xUebEeVb9AjJ0fyot1XwGe7MyIjB7EIeTmwhk7MKA9eFkig==
X-Gm-Message-State: AOJu0YwWREJG+oq/sM0ZBrR41kp/op601qQ93WB2HTOrzJBiHwKNHZ4H
 QLDvjqb56m97QJyEgVeysV0EvDtXyQ5mL29XoMNV4IIhVGh4UTgn
X-Google-Smtp-Source: AGHT+IGbqrJaPevml2n3GhwOZkwoyAiUlG6OlH99cOs1Aj8BnwOCarKRoHopsLWYdKYGdSZ+UbnVkA==
X-Received: by 2002:adf:fe47:0:b0:33d:1896:de92 with SMTP id
 m7-20020adffe47000000b0033d1896de92mr4242417wrs.10.1708204463939; 
 Sat, 17 Feb 2024 13:14:23 -0800 (PST)
Received: from giga-mm-1.home ([2a02:1210:8690:9300:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 b17-20020a05600010d100b0033ce1ef4e7asm5772800wrx.13.2024.02.17.13.14.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Feb 2024 13:14:23 -0800 (PST)
Message-ID: <50656de7f9f23a436adeafeb47b13412904c7b17.camel@gmail.com>
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
 buildroot@buildroot.org
Date: Sat, 17 Feb 2024 22:14:29 +0100
In-Reply-To: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
Autocrypt: addr=alexander.sverdlin@gmail.com; prefer-encrypt=mutual;
 keydata=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
User-Agent: Evolution 3.50.4 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708204464; x=1708809264; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Eq4KHIR1cbPinBGdCFYyUUYY2h0yCY3orX/T8SoznoY=;
 b=WAQs1Q0WLYmj6AQuXPAdRrVhG0EVyS8WZdMXJgGqFPdCv0F+xiVudRgLS1yrw1IR5S
 o1v2tKczhi+LsCWKIxlXkF3zO1EFahLT+RxHIYoQfzGQPpgxl7gED85Jk/6BkrxFy94Q
 18UPpEpln5KXtsvzhUQUSloei4gJ134b7aEL5O02k0LnuQ+4pcQmSIBnXCP5khOlP+3t
 Wvr/S7we9P4BoY4gGz8+0wIXLGQJ7/628xS4C3FkxddBBJcbjLGMvhAnZLT7EfHmBSbP
 JIm2ft6AZgAyHBeAEenE0ZbUjuxpKLDbBLR9jCxoTiArvvAZYZ5zIMGVmv+7HX0keUXe
 wu1A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=WAQs1Q0W
Subject: Re: [Buildroot] [PATCH v4 00/20] Add support for AM62x-SK HS-FS
 devices
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
Cc: michael@amarulasolutions.com, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>, Andreas Dannenberg <dannenberg@ti.com>,
 linux-amarula@amarulasolutions.com, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRGFyaW8sCgpPbiBTYXQsIDIwMjQtMDItMTcgYXQgMTc6MDIgKzAxMDAsIERhcmlvIEJpbmFj
Y2hpIHdyb3RlOgo+IFRoZSBTSy1BTTYyQi1QMSBpcyB0aGUgbmV3ZXN0IHZlcnNpb24gb2YgU0st
QU02MiB3aGljaCBpbmNsdWRlcwo+IGhpZ2gtc2VjdXJpdHkgZmllbGQtc2VjdXJhYmxlIChIUy1G
Uykgc2lsaWNvbiB0byBvcHRpb25hbGx5IGN1c3RvbWl6ZSBrZXlzCj4gYW5kIGVuY3J5cHRpb24g
Zm9yIHNlY3VyaXR5IGFwcGxpY2F0aW9ucy4KPiBUaGlzIHJlcXVpcmVzIGVuYWJsaW5nIHRoZSBC
UjJfVEFSR0VUX1RJX0szX0lNQUdFX0dFTl9TRUNUWVBFX0hTX0ZTIG9wdGlvbiwKPiB3aGljaCwg
aG93ZXZlciwgd2FzIGJ1Z2d5LiBUaGlzIHNlcmllcyBmaXhlcyB0aGUgZXJyb3JzIGFuZCBidW1w
cyB0aGUgTGludXgKPiBrZXJuZWwgYW5kIFUtQm9vdCByZXF1aXJlZCBmb3Igc3VjaCBhIG5ldyBk
ZXZpY2UuCj4gCj4gVGhpcyBzZXJpZXMsIHdoaWNoIGluIG15IGh1bWJsZSBvcGluaW9uLCBzaG91
bGQgaGF2ZSBiZWVuIGltbWVkaWF0ZWx5Cj4gY29uc2lkZXJlZCB0byBjb3JyZWN0IHRoZSBjb21w
aWxhdGlvbiBlcnJvcnMgaW4gY2FzZSBvZiBIUy1GUyBkZXZjaWVzLCBoYXMKPiBzZWVuIGFuIGlu
Y3JlYXNlIGluIHBhdGNoZXMgaW4gdmVyc2lvbiA0IHRvIHJlbW92ZSB0aGUgdGktazMtaW1hZ2Ut
Z2VuCj4gcGFja2FnZSB0aGFua3MgdG8gQmlubWFuLiBBZGRpdGlvbmFsbHksIGl0IHNoYXJlcyBz
b21lIG1vZGlmaWNhdGlvbnMgYW5kCj4gdmlld3Mgb24gaG93IHRvIGltcGxlbWVudCBjZXJ0YWlu
IGNoYW5nZXMgd2l0aCB0aGUgc2VyaWVzCj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9w
cm9qZWN0L2J1aWxkcm9vdC9saXN0Lz9zZXJpZXM9Mzk0ODQwLgo+IFRoZXJlZm9yZSwgSSB0aGlu
ayBpdCBpcyBuZWNlc3Nhcnkgbm90IHRvIHJ1biB0aGVtIGluIHBhcmFsbGVsIGJ1dCB0byBkZWNp
ZGUKPiB3aGV0aGVyIHRvIG1lcmdlIG9uZSBiZWZvcmUgdGhlIG90aGVyIG9yIHRvIGNvbnNpZGVy
IGEgc2luZ2xlIHNlcmllcyB3aGVyZQo+IHRoZSBwYXRjaGVzIGNhbiBiZSBjb2hlcmVudCB3aXRo
IGVhY2ggb3RoZXIuIEkgYW0gYXZhaWxhYmxlIGZvciBib3RoIHNvbHV0aW9ucy4KPiBMZXQgbWUg
a25vdy4KPiAKPiBEYXJpbyBCaW5hY2NoaSAoMjApOgo+IMKgIGNvbmZpZ3MvdGlfYW02Mnhfc2tf
ZGVmY29uZmlnOiBmaXggQlIyX1RBUkdFVF9PUFRFRV9PU19QTEFURk9STQo+IMKgwqDCoCBzZXR0
aW5nCj4gwqAgY29uZmlncy90aV9hbTY0eF9za19kZWZjb25maWc6IGZpeCBCUjJfVEFSR0VUX09Q
VEVFX09TX1BMQVRGT1JNCj4gwqDCoMKgIHNldHRpbmcKPiDCoCBjb25maWdzL3RpX2FtNjJ4X3Nr
X2RlZmNvbmZpZzogZXhwbGljaXRseSBzZXQgdGhlIHRpLWszLXI1LWxvYWRlcgo+IMKgwqDCoCB2
ZXJzaW9uCj4gwqAgY29uZmlncy90aV9hbTY0eF9za19kZWZjb25maWc6IGV4cGxpY2l0bHkgc2V0
IHRoZSB0aS1rMy1yNS1sb2FkZXIKPiDCoMKgwqAgdmVyc2lvbgo+IMKgIGJvb3QvdGktazMtcjUt
bG9hZGVyOiBidW1wIHRvIHZlcnNpb24gMjAyNC4wMQo+IMKgIGJvb3QvdGktazMtY29yZS1zZWNk
ZXY6IG5ldyBwYWNrYWdlCj4gwqAgYm9vdC90aS1rMy1pbWFnZS1nZW46IG1hbmFnZSBIUyBoYXJk
d2FyZQo+IMKgIHBhY2thZ2UvcHl0aG9uLWpzb25zY2hlbWE6IGFkZCBob3N0IHZhcmlhbnQKPiDC
oCBwYWNrYWdlL3B5dGhvbi1hdHRyczogYWRkIGhvc3QgdmFyaWFudAo+IMKgIHBhY2thZ2UvcHl0
aG9uLXJlZmVyZW5jaW5nOiBhZGQgaG9zdCB2YXJpYW50Cj4gwqAgcGFja2FnZS9weXRob24tcnBk
cy1weTogYWRkIGhvc3QgdmFyaWFudAo+IMKgIHBhY2thZ2UvcHl0aG9uLWpzb25zY2hlbWEtc3Bl
Y2lmaWNhdGlvbnM6IGFkZCBob3N0IHZhcmlhbnQKPiDCoCBib290L3RpLWszLXI1LWxvYWRlcjog
c2V0IGJpbm1hbiBlbnZpcm9ubWVudAo+IMKgIGJvb3QvdWJvb3Q6IHNldCBCSU5NQU5fSU5ESVJT
IGZvciBUSSBLMyBETQo+IMKgIGNvbmZpZ3MvdGlfYW02Mnhfc2tfZGVmY29uZmlnOiBidW1wIFUt
Qm9vdCB2ZXJzaW9uIHRvIDIwMjQuMDEKPiDCoCBjb25maWdzL3RpX2FtNjJ4X3NrX2RlZmNvbmZp
ZzogYnVtcCBMaW51eCB2ZXJzaW9uIHRvIDYuNi4xCj4gwqAgYm9vdDogbW92ZSB0aS1rMy0qIHBh
Y2thZ2VzIHRvICd0aS1rMycgZGlyZWN0b3J5Cj4gwqAgYm9vdC90aS1rMzogbW92ZSBUSV9LM197
U0VDVFlQRSxTT0N9IG91dCBvZiB0aGUgaW1hZ2UtZ2VuIHNjb3BlCj4gwqAgYm9vdC90aS1rMy90
aS1rMy1yNS1sb2FkZXI6IGluc3RhbGwgdGlib290My5iaW4KPiDCoCBjb25maWdzL3RpX2FtNjJ4
X3NrX2RlZmNvbmZpZzogZG9uJ3QgdXNlIHRpLWszLWltYWdlLWdlbiBhbnltb3JlCgp0aGUgc2Vy
aWVzOgotIGJ1aWxkcyBhbmQgc3RhcnRzIG9uIFNLLUFNNjJCIChIUy1GUykKLSBidWlsZHMgZm9y
IGFtNjJ4IEdQCgpUZXN0ZWQtYnk6IEFsZXhhbmRlciBTdmVyZGxpbiA8YWxleGFuZGVyLnN2ZXJk
bGluQGdtYWlsLmNvbT4KCi0tIApBbGV4YW5kZXIgU3ZlcmRsaW4uCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
