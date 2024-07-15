Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D585C3DA4B
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 22:12:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BA0160684;
	Mon, 15 Jul 2024 22:12:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kCyiV7OnHxuB; Mon, 15 Jul 2024 22:12:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39C3F60744
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39C3F60744;
	Mon, 15 Jul 2024 22:12:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0127C1BF3DF
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 22:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EEA8D40372
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 22:12:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XZn5hiZ7CO9J for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 22:12:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e30; helo=mail-vs1-xe30.google.com;
 envelope-from=alistair23@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BE4C34035A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE4C34035A
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com
 [IPv6:2607:f8b0:4864:20::e30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BE4C34035A
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 22:12:22 +0000 (UTC)
Received: by mail-vs1-xe30.google.com with SMTP id
 ada2fe7eead31-48fe6ddc33bso1849624137.1
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 15:12:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721081541; x=1721686341;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q47NmtTJCtzLsyhS7roC6CxfLFGU+Lsb94yAxY28TTI=;
 b=ZDhE/gnH2nN8ZV6t0j6IiYLQzZBGN5aoWgRt89o5PKAxg6MyIk5s7bBqKJ4gSPoEvi
 iqVEp27IRYg/LUgp0PZ79AmdLcyEWIc3GtfnA243Q8hAaqgLKpDXrAe1kgJtr1aCwIav
 U1rIa9jVrq1+/QugLav3izVPn4ZfUnf5G78my3jUk0m0+4qukoWMC4PkKOtjHitsU/N4
 8tW1D+T69lwnZ905T/009/OuXHdrHvfW1uoCAnSM4W5X/QbqmqCspcO8eh4/XDbpXVYt
 7NP7rEg1jyIgNdahuzww0mnf6bBOv6uaQGZwPDA1fVqpjJxOD0f/LCifOjWMTF6v6sd6
 xJiA==
X-Gm-Message-State: AOJu0YzGNh3cRXSyWhJ+jj3ctPayVKtiES+ovWee24KhUBxHnpd2B8OT
 V8qSrxCjb/mN0kDmVzfs+HkIp0UzldMrJ2EuNB1Z7F67mnkJai6fd+yvcndTBck8ebJKczFPzer
 7bY9sDNcZJg4sPntI362WYyn+hhnu+dET
X-Google-Smtp-Source: AGHT+IGodrs5sj5TgON4/nUcHJh8W9X9sf9Va4gYkQzqE6r5c4YDZ6a3z383jukwdecXQPDJF0EtpslqRO5MeF9BBGY=
X-Received: by 2002:a05:6102:2d02:b0:48f:e5dc:259b with SMTP id
 ada2fe7eead31-4914c56eb16mr455379137.25.1721081541252; Mon, 15 Jul 2024
 15:12:21 -0700 (PDT)
MIME-Version: 1.0
References: <YT2PR01MB4239F7AA538B4C2B46B13D7EF7A12@YT2PR01MB4239.CANPRD01.PROD.OUTLOOK.COM>
 <CAKmqyKNaX0mwdTRdb33X7Rc7VuDwadcm1p_j0-iWEsCJMvBFrA@mail.gmail.com>
 <YT2PR01MB4239F24C075D994E5746EB30F7A12@YT2PR01MB4239.CANPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <YT2PR01MB4239F24C075D994E5746EB30F7A12@YT2PR01MB4239.CANPRD01.PROD.OUTLOOK.COM>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 16 Jul 2024 08:11:54 +1000
Message-ID: <CAKmqyKP8LMKA72nc8MKws_Zar1BpwS7Yju2bjamLfyY6Z64VSw@mail.gmail.com>
To: Rajnesh Joshi <rajnesh_joshi@sfu.ca>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721081541; x=1721686341; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q47NmtTJCtzLsyhS7roC6CxfLFGU+Lsb94yAxY28TTI=;
 b=KArV5Fl1XbSjySctEMuNqjcbPevolMH36KWv9biBl6UZ8w+q5LIdcFYGSqJkahZ8OT
 UhR9h8p/8qk48nOgGC/fLq37Z0D9uzPHQ/5RY4wsOxGtYLKtS9kEH3PNxXJ3v8Z1slKm
 /xPXTKRJpZvpQv3avwR36m6FdeFFQ3uDy1KeBEom4cNl8+uzCO7ms0+zLMPMWa4z+LM9
 dJQ3wxvKfk4ndJ4yfxNsklvPFhniV2+etoM8SA6e2oapBI/OwZwOuvqoeoXORx7KOf0C
 U5H8XKbK1iFEhLtOGbSzIpk6sfyBUXeVstfIeJGMZN1ytKVuO01dB7czqebDxr1MGEhH
 +Ryg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=KArV5Fl1
Subject: Re: [Buildroot] 32-bit RISCV build error
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCBKdWwgMTYsIDIwMjQgYXQgNzo0M+KAr0FNIFJham5lc2ggSm9zaGkgPHJham5lc2hf
am9zaGlAc2Z1LmNhPiB3cm90ZToKPgo+IEhlbGxvIEFsaXN0YWlyLAo+Cj4gQWNjb3JkaW5nIHRv
IHRoaXMsIEJ1aWxkcm9vdCBzaG91bGQgYXV0b21hdGljYWxseSBhZGQgdGhlIGV4dGVuc2lvbnMg
aWYgdGhlIGdjYyB2ZXJzaW9uIGlzIGdyZWF0ZXIgdGhhbiBvciBlcXVhbCB0byAxMi4wLCBubz8K
Pgo+IFtQQVRDSHYyLDEvMl0gYXJjaC9Db25maWcuaW4ucmlzY3Y6IGVuYWJsZSBaaWNzciBhbmQg
WmlmZW5jZWkgc3RhbmRhbG9uZSBleHRlbnNpb25zIHdpdGggZ2NjID49IDEyIC0gUGF0Y2h3b3Jr
IChvemxhYnMub3JnKQoKVGhhdCBzaG91bGQgZG8gaXQsIGJ1dCBpdCBsb29rcyBsaWtlIGl0J3Mg
bm90IHdvcmtpbmcgZm9yIHNvbWUgcmVhc29uCgpBbGlzdGFpcgoKPgo+IFNpbmNlcmVseSwKPgo+
IFJham5lc2gKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IEZyb206IEFsaXN0
YWlyIEZyYW5jaXMgPGFsaXN0YWlyMjNAZ21haWwuY29tPgo+IFNlbnQ6IEp1bHkgMTUsIDIwMjQg
MjozMSBQTQo+IFRvOiBSYWpuZXNoIEpvc2hpIDxyYWpuZXNoX2pvc2hpQHNmdS5jYT4KPiBDYzog
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPgo+IFN1Ympl
Y3Q6IFJlOiBbQnVpbGRyb290XSAzMi1iaXQgUklTQ1YgYnVpbGQgZXJyb3IKPgo+IE9uIFR1ZSwg
SnVsIDE2LCAyMDI0IGF0IDY6NTnigK9BTSBSYWpuZXNoIEpvc2hpIDxyYWpuZXNoX2pvc2hpQHNm
dS5jYT4gd3JvdGU6Cj4gPgo+ID4gSSBhbSByZXNlbmRpbmcgdGhpcyBlbWFpbCBhcyBCdWlsZHJv
b3QgQXV0b21hdGVkIEVtYWlsIHRvbGQgbWUgdGhhdCBJIHdhcyBub3Qgc3Vic2NyaWJlZCB0byB0
aGUgbWFpbGluZyBsaXN0LCBhbmQgdGhlcmVmb3JlLCBjb3VsZCBub3Qgc2VuZCB0byBpdC4gSSBk
b3VibGUtY2hlY2tlZCwgYW5kIEkgYW0gYSBwYXJ0IG9mIHRoZSBtYWlsaW5nIGxpc3QsIGJ1dCB0
aGlzIGVtYWlsIHRlY2huaWNhbGx5IGhhcyB0d28gYWxpYXNlcyBzbyBJIGFkZGVkIHRoZSBvdGhl
ciBvbmUuIExldCdzIHRyeSB0aGlzIGFnYWluLiBTb3JyeSBmb3IgdGhlIGRvdWJsZSBtZXNzYWdl
IGluIGNhc2UuCj4gPgo+ID4gRGVhciBNYWlsaW5nIExpc3QgUmVhZGVycywKPiA+Cj4gPiBJIGFt
IHRyeWluZyB0byBidWlsZCBhIDMyLWJpdCBMaW51eCBLZXJuZWwgdXNpbmcgdGhlIHVjbGliYyBs
aWJyYXJ5IGZvciBhIHNvZnQtY29yZSBDUFUsIHVzaW5nIGEgY3VzdG9tIExpbnV4IGZvcmsuCj4g
Pgo+ID4gSW4gbXkgLmNvbmZpZywgSSBoYXZlIHRoZSBmb2xsb3dpbmcgbGluZXM6IEJSMl9UT09M
Q0hBSU5fR0NDX0FUX0xFQVNUXzEyPXkgd2hpY2ggSSBiZWxpZXZlIGlzIHRoZSBwYXRjaCBmb3Ig
dGhpcyBpc3N1ZSwgYnV0IGl0IGlzIG5vdCB3b3JraW5nIGZvciBzb21lIHJlYXNvbi4KPiA+Cj4g
PiBJIGFtIGdldHRpbmcgdGhlIGZvbGxvd2luZyBlcnJvcnMgd2hlbiBCdWlsZHJvb3QgY29tcGxl
dGVzIGRvd25sb2FkaW5nIHRoZSBMaW51eCBLZXJuZWwgYW5kIGJlZ2lucyBidWlsZGluZyB0aGUg
TGludXgga2VybmVsLgo+ID4KPiA+Cj4gPgo+ID4gVG8gcHJvdmlkZSBtb3JlIGNvbnRleHQsIGhl
cmUgaXMgbXkgZGVmY29uZmlnIGZvciB0aGUgImJvYXJkLiIKPiA+Cj4gPiBCUjJfcmlzY3Y9eQo+
ID4gQlIyX3Jpc2N2X2N1c3RvbT15Cj4KPiBUaGUgcHJvYmxlbSBpcyB0aGF0IHlvdSBhcmVuJ3Qg
dXNpbmcgUlYzMkcsIHNvIHlvdSBuZWVkIHRvIG1hbnVhbGx5Cj4gc2F5IHlvdSBzdXBwb3J0IHRo
ZSBaaUNzciBhbmQgdGhlIFppZmVuY2VpIGV4dGVuc2lvbnMuCj4KPiBTZWUgaHR0cHM6Ly9naXRo
dWIuY29tL3Jpc2N2LWNvbGxhYi9yaXNjdi1nbnUtdG9vbGNoYWluL2lzc3Vlcy8xMjYyCj4gZm9y
IGFuIGV4YW1wbGUgb2YgaG93IHRvIGRvIHRoaXMuCj4KPiBJJ20gbm90IHN1cmUgaG93IHlvdSBj
YW4gZG8gaXQgd2l0aCBidWlsZHJvb3QgdGhvdWdoLiBZb3UgbWlnaHQgbmVlZAo+IHRvIHBhdGNo
IGJ1aWxkcm9vdCB0byBhbGxvdyBzcGVjaWZ5aW5nIGN1c3RvbSBleHRlbnNpb25zCj4KPiBBbGlz
dGFpcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
