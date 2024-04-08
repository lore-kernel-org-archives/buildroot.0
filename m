Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7434C67861
	for <buildroot@archiver.kernel.org>; Mon,  8 Apr 2024 21:16:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A08DB40469;
	Mon,  8 Apr 2024 21:16:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cwn13S5nxI_P; Mon,  8 Apr 2024 21:16:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A054240568
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A054240568;
	Mon,  8 Apr 2024 21:16:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B3FCF1BF2A6
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 21:16:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD84181F06
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 21:16:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J6v0WT7Fpm8f for <buildroot@lists.busybox.net>;
 Mon,  8 Apr 2024 21:16:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com;
 envelope-from=robimarko@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9ED0081EDC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9ED0081EDC
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9ED0081EDC
 for <buildroot@buildroot.org>; Mon,  8 Apr 2024 21:16:00 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-6e46dcd8feaso2421985b3a.2
 for <buildroot@buildroot.org>; Mon, 08 Apr 2024 14:16:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712610960; x=1713215760;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NFpjnI/dgB+b7nqjVSmP/SPWwmO+4FU8obp7olqZJ2I=;
 b=Vxudx5wd7mC2Cl4wlMK5b3ztEMhYR3P+1VAqpnFpWkMU3CjTBJq4tkPk05ubF/j3u/
 4Mt2TcrRSfM2X4zTkPtSTeM0WDT2nVXfQlguPpFx5cL2zGbcRKN92Mi2LkRiwU05zmwy
 iMNm4+H1oyVGIk2EP9SLjiMBuC4/VC/PhulJwNH0spFoikzUZBoaaThpdFWiknd+8DC0
 zFvpWwHE7wYswos5i8NOlC08UedrqDLVpyNlWZyOjPqyItpRdKLZokq/9Wz/H5JnZE0g
 7Dda+Pv9grm5+x3GrOXrEVFKyWVt4Xql12daaSBbpqzzKbv6gwj09ej+H62AmfQZXXCA
 xEeQ==
X-Gm-Message-State: AOJu0Yz/tHSHD3CjAX2byWy6Uugjvai7xv0N3l01SjeCc4vEjj/G9fKW
 ZGxpoyeZdxseqa12QSUCi8xUSjerwkJK4z+JvcM9DS1EnKUdMqZ6RupDMjwAr/cKMNZDB4IEn35
 6AtCL8yltV2HIGGBrYhncmLV0k7s=
X-Google-Smtp-Source: AGHT+IFT/JE3h9WDFXUE3ncG6+fZTj21e9L0zy/BGKct0VxDhvCVNZKIANLFTbwIZM6iB0Idamo+DWDOsbb1/64N6Qc=
X-Received: by 2002:a05:6a21:3a83:b0:1a3:673b:62b8 with SMTP id
 zv3-20020a056a213a8300b001a3673b62b8mr10042152pzb.35.1712610959586; Mon, 08
 Apr 2024 14:15:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240403121807.2087547-1-robimarko@gmail.com>
 <20240408223621.39b37892@windsurf>
In-Reply-To: <20240408223621.39b37892@windsurf>
From: Robert Marko <robimarko@gmail.com>
Date: Mon, 8 Apr 2024 23:15:48 +0200
Message-ID: <CAOX2RU6BaR4q8Vzg+dSspsgRecb4OiG=GOhr2hm-DO-iFk+ybQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712610960; x=1713215760; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NFpjnI/dgB+b7nqjVSmP/SPWwmO+4FU8obp7olqZJ2I=;
 b=Ns5dwNcK0ilJSOmmVNdG7x1gKu8ukbSL5KLjdrOFawb8YOJ9BcISQ9EeGMfd+FSE1G
 lR7s692biuVIbaAZu/xzeBxJgKWJF6ffkZwCS3ZJxCMqfY3rIxI/QZEh+OCj2hlVNdeL
 zefd1kCMAkUeNvXZuEkuXDp5qkjy+rsElZgRBE+e+RWOEVygCenetpWhTK7K4N6FsvrE
 ELRWNHltgb/3R9J7AV62d9PGkXUKqCOWdZJcJqtHyOegeqtI7KYkMM/M9l6d17E6TlPg
 KFTBYbeRTjQhcN3diiqCc2uL6MSztsWfQEX3VvU1JISHzatEIr13Uk+Cb+EOLtLFUb6Z
 q6lA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Ns5dwNcK
Subject: Re: [Buildroot] [PATCH 1/1] kconfig/lxdialog: fix check() with GCC14
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
Cc: Petr Vorel <petr.vorel@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCA4IEFwciAyMDI0IGF0IDIyOjM2LCBUaG9tYXMgUGV0YXp6b25pCjx0aG9tYXMucGV0
YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhlbGxvIFJvYmVydCwKPgo+IE9uIFdlZCwg
IDMgQXByIDIwMjQgMTQ6MTg6MDcgKzAyMDAKPiBSb2JlcnQgTWFya28gPHJvYmltYXJrb0BnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gPiBHQ0MxNCBub3cgdHJlYXRzIGltcGxpY2l0IGludCB0eXBlcyBh
cyBlcnJvciBzbyB3aGVuIGNoZWNrKCkgZnJvbQo+ID4gY2hlY2stbHhkaWFsb2cuc2ggaXMgY2Fs
bGVkIHRvIGNoZWNrIHdoZXRoZXIgd2UgY2FuIGxpbmsgYWdhaW5zdCBuY3Vyc2VzCj4gPiBpdCB3
aWxsIGZhaWwgc2lsZW50bHkgYW5kIHRoZSBoZWxwIHRleHQgaW5kaWNhdGluZyB0byBpbnN0YWxs
IG5jdXJzZXMgaXMKPiA+IHByaW50ZWQuCj4gPgo+ID4gSG93ZXZlciwgdGhpcyBpcyBub3QgZHVl
IHRvIG1pc3NpbmcgbmN1cnNlcyBidXQgb25jZSB0aGUgc3RkZXJyIHJlZGlyZWN0Cj4gPiB0byAv
ZGV2L251bGwgaXMgcmVtb3ZlZCB3ZSBjYW4gc2VlIHRoZSByb290IGNhdXNlOgo+ID4gPHN0ZGlu
PjoyOjE6IGVycm9yOiByZXR1cm4gdHlwZSBkZWZhdWx0cyB0byDigJhpbnTigJkgWy1XaW1wbGlj
aXQtaW50XQo+ID4KPiA+IFNvLCBpbiBvcmRlciBmb3IgbWVudWNvbmZpZyB0byB3b3JrIHdpdGgg
R0NDMTQgbGV0cyBqdXN0IHNwZWNpZnkgdGhlCj4gPiByZXR1cm4gdHlwZSBvZiBtYWluKCkgYXMg
aW50Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFJvYmVydCBNYXJrbyA8cm9iaW1hcmtvQGdtYWls
LmNvbT4KPgo+IFRoYW5rcyBhIGxvdCBmb3IgdGhlIHBhdGNoLiBIb3dldmVyLCBtYWtpbmcgY2hh
bmdlcyBpbiBzdXBwb3J0L2tjb25maWcvCj4gaW4gQnVpbGRyb290IHJlcXVpcmVzIGEgYml0IG1v
cmUgY2FyZS4gSW5kZWVkLCB0aGlzIGNvZGUgaXMgdGFrZW4gZnJvbQo+IHRoZSBMaW51eCBrZXJu
ZWwgY29kZSwgYW5kIHdlIHRyeSB0byBrZWVwIGEgd2VsbC1kZWZpbmVkIGxpc3Qgb2YKPiBjaGFu
Z2VzIG9uIHRvcCBvZiB0aGUgb3JpZ2luYWwgY29kZSBmcm9tIHRoZSBrZXJuZWwuCj4KPiBBcyBl
eHBsYWluZWQgaW4gc3VwcG9ydC9rY29uZmlnL1JFQURNRS5idWlsZHJvb3QsIHRoZSBjdXJyZW50
IGNvZGUgaW4KPiBzdXBwb3J0L2tjb25maWcvIGlzIHRha2VuIGZyb20gTGludXggNC4xNy1yYzIs
IG9uIHRvcCBvZiB3aGljaCB0aGUKPiBwYXRjaGVzIGluIHN1cHBvcnQva2NvbmZpZy9wYXRjaGVz
LyBoYXZlIGJlZW4gYXBwbGllZC4KPgo+IFNvIGZyb20gdGhpcywgeW91IGhhdmUgdHdvIG9wdGlv
bnM6Cj4KPiAoMSkgQWRkIGEgbmV3IHBhdGNoIGluIHN1cHBvcnQva2NvbmZpZy9wYXRjaGVzLyB3
aGljaCBpbXBsZW1lbnRzIHRoZQo+ICAgICBjaGFuZ2UgeW91IG5lZWQgZm9yIEdDQzE0IGNvbXBh
dGliaWxpdHkKPgo+ICgyKSBVcGRhdGUgdGhlIGNvZGUgaW4gc3VwcG9ydC9rY29uZmlnLyB0byB0
aGUgbGF0ZXN0IGNvZGUgYXZhaWxhYmxlIGluCj4gICAgIHRoZSBMaW51eCBrZXJuZWwgc2NyaXB0
cy9rY29uZmlnIGRpcmVjdG9yeSwgcmViYXNlIG91ciBwYXRjaGVzLCBhbmQKPiAgICAgdmVyaWZ5
IGl0IGFsbCB3b3Jrcy4KPgo+IE9idmlvdXNseSwgKDEpIGlzIHRoZSBlYXNpZXN0IHBhdGguICgy
KSBpcyBuaWNlciBsb25nIHRlcm0sIGFzIHdlCj4gYmVuZWZpdCBmcm9tIGFsbCBuZXcgZmVhdHVy
ZXMvZml4ZXMgYWRkZWQgYnkgdGhlIExpbnV4IGtlcm5lbAo+IGRldmVsb3BlcnMuIFR1cm5zIG91
dCB0aGF0IGluIHRoZSB1cHN0cmVhbSBrZXJuZWwsIHRoZQo+IGNoZWNrLWx4ZGlhbG9nLnNoIHNj
cmlwdCBoYXMgYmVlbiByZW1vdmVkIGFuZCByZXBsYWNlZCBieSBzb21ldGhpbmcKPiBkaWZmZXJl
bnQsIHdoaWNoIG5vIGxvbmdlciBoYXMgdGhpcyBtYWluKCkgZnVuY3Rpb24gZGVmaW5pdGlvbi4K
Pgo+IENvdWxkIHlvdSBoYXZlIGEgbG9vayBhdCBpbXBsZW1lbnRpbmcgZWl0aGVyICgxKSBvciAo
MikgPwoKSGkgVGhvbWFzLApJIGNhbiBvbmx5IGltcGxlbWVudCBzb2x1dGlvbiAxIGN1cnJlbnRs
eSwgd2lsbCByZXNwaW4gZm9yIHYyLgoKUmVnYXJkcywKUm9iZXJ0Cgo+Cj4gVGhhbmtzIGEgbG90
IQo+Cj4gVGhvbWFzCj4gLS0KPiBUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBC
b290bGluCj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5p
bmcKPiBodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
