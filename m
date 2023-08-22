Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA388EE4993
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 18:03:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53938611E5;
	Tue, 22 Aug 2023 18:03:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53938611E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DekJjE5V2s92; Tue, 22 Aug 2023 18:03:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8779D60E6D;
	Tue, 22 Aug 2023 18:03:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8779D60E6D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9C72E1BF348
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 18:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70B5540BBF
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 18:03:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70B5540BBF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zA-S1fiJUtAT for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 18:03:12 +0000 (UTC)
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 758D9400D2
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 18:03:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 758D9400D2
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-1c4c6717e61so3481847fac.1
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 11:03:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692727391; x=1693332191;
 h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
 :from:content-transfer-encoding:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bB9yZKtNGJg5c+dlbjH4KIszYfDXTeQME16ZRYvXdsA=;
 b=bmsy1DWWxjJlJfapMu2ipepa+o2JL5syJwog5FKaiit+KTKuRnTpvBQSuSU2+H+WB3
 iljVdJ0Iygb6xqRIwPFg2nunVy9pL7q+0MscnCayaA4etTfcjypwoseU4qdQrGozzw8+
 9jRsyfADrfpCaojQK847DYke9QhljshyPBmd9B2swP0HFw1uxRiboHCcjwyv8OfVbQr9
 +udsrRagI9Pfi2fQ/c6jMy7a2f41rjp7yHqFjOxM4awBILdx+IgEZsT/DvTIkbTD/Xcy
 UR8WaUF6nnL9aArIwffgdQPD895YTAOdic1TWuEP0TRDFaf/jJuK5YR8gEPhldnP8dKH
 IPDg==
X-Gm-Message-State: AOJu0YxJa1ZdHuMVmsWA7NjSDYmK8D396V+3QLoFZxgvMzao2boqY4oR
 TMjH1EEvD5weTXRQ4Q8rbzI=
X-Google-Smtp-Source: AGHT+IE2CHqaf6wtnjSatvCVy+JqyMwX/8bO/pHlBLWg1bi94/dwWujOvGmiUmA9hKq9Zjt5Ighxeg==
X-Received: by 2002:a05:6870:4154:b0:1bb:c0ee:5536 with SMTP id
 r20-20020a056870415400b001bbc0ee5536mr13648894oad.47.1692727391222; 
 Tue, 22 Aug 2023 11:03:11 -0700 (PDT)
Received: from smtpclient.apple ([2600:1700:65a0:14f0:e0e5:47ae:5acd:d671])
 by smtp.gmail.com with ESMTPSA id
 r67-20020a0de846000000b00589e84acafasm2919742ywe.48.2023.08.22.11.03.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Aug 2023 11:03:10 -0700 (PDT)
From: Charles Hardin <ckhardin@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Tue, 22 Aug 2023 11:02:59 -0700
Message-Id: <4EEF27B4-2C4A-427E-91A3-EBA5A63A1AFB@gmail.com>
References: <20230822195726.0f691945@windsurf>
In-Reply-To: <20230822195726.0f691945@windsurf>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: iPhone Mail (20G75)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692727391; x=1693332191;
 h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
 :from:content-transfer-encoding:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bB9yZKtNGJg5c+dlbjH4KIszYfDXTeQME16ZRYvXdsA=;
 b=HKuCjW/qyouQ7Vo3jMaMPpeHy0of+U2HJUo0xl83WRopRGCNv2sQTVX4CxY8BHlWSd
 At0veyh+rjyu9L+BKyv67U3WtuLPsVi2K6CrnIztGc6iqvg192d6jy3DBlJ0xxUb5qt8
 nZKAMpjb/4EJ0MTdLoqsvZYDMv0O1ByxvoW/TScM1I3p8OsA0oMyul1wZShO949kijYM
 5ju4QC1OQjFGB4Jz7A8bg/MJPoLihQYpXs0oz7efRThHLmLfyvlnUSuDbLzQ7sqOg1b0
 /M/Tl/h8pVshs1LOpWjXHvMRCIOoyjtk+ZQnTK1VQ47fEawvsSrzuv4LHo9qIhhH1dp3
 pgEQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=HKuCjW/q
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pykwalify: add required
 package for zephyr cmake
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
Cc: "Alvaro G . M" <alvaro.gamez@hazent.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhvbWFzLAoKPiBPbiBBdWcgMjIsIDIwMjMsIGF0IDEwOjU3IEFNLCBUaG9tYXMgUGV0YXp6b25p
IDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKPiAKPiDvu79IZWxsbyBDaGFy
bGVzLAo+IAo+PiBPbiBNb24sIDIxIEF1ZyAyMDIzIDE2OjQ1OjIzIC0wNzAwCj4+IENoYXJsZXMg
SGFyZGluIDxja2hhcmRpbkBnbWFpbC5jb20+IHdyb3RlOgo+PiAKPj4gaHR0cHM6Ly9naXRodWIu
Y29tL3plcGh5cnByb2plY3QtcnRvcwo+IAo+IFllcywgSSBrbm93IHdoYXQgWmVwaHlyIGlzIDot
KQo+IAo+PiBUaGUgYnVpbGQgaXMgY21ha2UgZGVyaXZlZCBidXQgcmVsaWVzIG9uIGNhbGxpbmcg
aW50byBzb21lIHB5dGhvbiBzY3JpcHRzIHRvCj4+IGdlbmVyYXRlIHNvbWUgYnVpbGQgZGVwZW5k
ZW5jaWVzCj4+IAo+PiBodHRwczovL2dpdGh1Yi5jb20vemVwaHlycHJvamVjdC1ydG9zL3plcGh5
ci9ibG9iL21haW4vc2NyaXB0cy9yZXF1aXJlbWVudHMtYmFzZS50eHQKPiAKPiBPSy4KPiAKPj4g
U28sIHdlIGhhdmUgdmFyaW91cyBSVE9TIE1DVXMgdGhhdCBhcmUgaG9va2VkIHVwIGludG8gbGlu
dXggY29udHJvbGxlcnMsCj4+IGFuZCB0aGlzIGlzIGp1c3QgYSBzaW1wbGUgaG9vayBzbyB0aGF0
IHRoZSBzYW1lIFNESyBjYW4gYmUgaGFuZGxlZCB0byBidWlsZAo+PiBib3RoIGZpcm13YXJlIGZv
ciBzb21ldGhpbmcgbGlrZSBhbiBTVE0zMiBhbmQgYSBSYXNwYmVycnktcGkKPiAKPiBJZiBJIHJl
cGhyYXNlIHRoaXM6IHlvdSB3YW50IHRvIHVzZSBCdWlsZHJvb3QgdG8gYnVpbGQgdGhlIFplcGh5
cgo+IGZpcm13YXJlIGZvciB5b3VyIFNUTTMyIG1pY3JvLWNvbnRyb2xsZXIsIGFsb25nc2lkZSB3
aXRoIHRoZSBMaW51eAo+IHN5c3RlbSBydW5uaW5nIG9uIHRoZSBSYXNwYmVycnlQaT8KPiAKClll
cywgYW5kIHdlIGFyZSBkb2luZyB0aGlzIHRvZGF5IHdpdGggdGhlc2UgcGF0Y2hlcy4KCj4+IEFz
c3VtZSBhIHJlZmVyZW5jZSB0bwo+PiBodHRwczovL2dpc3QuZ2l0aHViLmNvbS90aXRvdWFuYy9l
YTA2ODVkOWNkODU5MmRlYjFjNDlkNDhlMzNiM2VlZSB0byBhZGQKPj4gdGhlIGdjYyBlYWJpIHRv
b2xjaGFpbiBoYXMgYmVlbiBkb25lIGluIGFuIGV4dGVybmFsIHBhY2thZ2UsIHdpdGggdGhlCj4+
IHBhdGNoZXMgYWJvdmUgd2UgY2FuIGFjdHVhbGx5IGJ1aWxkIGJvdGggZmlybXdhcmUgYW5kIHRo
ZSBkcml2ZXJzIGluCj4+IGJ1aWxkcm9vdCBmcm9tIG9uZSB0cmVlIHdpdGggZXh0ZXJuYWwgcmVj
aXBlcyBsaWtlIGJlbG93Cj4gCj4gTm90ZTogdGhpcyBnY2MgZWFiaSB0b29sY2hhaW4gaXMgbm93
IGluIEJ1aWxkcm9vdCB1cHN0cmVhbSwgbm8gbmVlZCB0bwo+IGFkZCBpdCBhcyBhbiBleHRlcm5h
bCBwYWNrYWdlLgo+IAoKVGhhbmtzIAoKPj4gZW52IFBBVEg9L29wdC9zZGsvYWFyY2g2NC1idWls
ZHJvb3QtbGludXgtZ251X3Nkay1idWlsZHJvb3QvYmluOiRQQVRIIGNtYWtlCj4+IFwKPj4gCj4+
ICAgIC1EQ01BS0VfVE9PTENIQUlOX0ZJTEU9L29wdC9zZGsvYWFyY2g2NC1idWlsZHJvb3QtbGlu
dXgtZ251X3Nkay1idWlsZHJvb3Qvc2hhcmUvYnVpbGRyb290L3Rvb2xjaGFpbmZpbGUuY21ha2UK
Pj4gXAo+PiAKPj4gCj4+IC1EQVJNR05VX0dDQ19UT09MQ0hBSU5fUFJFRklYPSIvb3B0L3Nkay9h
YXJjaDY0LWJ1aWxkcm9vdC1saW51eC1nbnVfc2RrLWJ1aWxkcm9vdC9zaGFyZS9nY2MtYXJtLW5v
bmUtZWFiaSIKPj4gXAo+PiAKPj4gICAgLURDTUFLRV9CVUlMRF9UWVBFPURlYnVnIFwKPj4gCj4+
ICAgICAgICAuLi9idWlsZHJvb3QtZXh0ZXJuYWwKPiAKPiBOb3Qgc3VyZSB0byByZWFsbHkgZm9s
bG93IGluIHdoaWNoIHByb2plY3RzIHRoaXMgY21ha2UgY29tbWFuZCBpcyB1c2VkPwo+IFRvIGJ1
aWxkIFplcGh5cj8KPiAKClRoZXJlIGlzIGEgY3VzdG9tIGNtYWtlIGZpbGUgdG8gZG8gdGhlIHpl
cGh5ciBidWlsZCwgc28gbWFrZSBkb2VzIHRoZSBidWlsZHJvb3QgYnVpbGQgYW5kIHdlIGNhbiB1
c2UgY21ha2UgZm9yIHRoZSB6ZXBoeXIgYnVpbGQuCgpJdCBpcyBub3Qgb3V0IG9mIHRoZSBib3gg
YnV0IHByZXR0eSBzaW1wbGUgZ2x1ZSB0byBtYWtlIGl0IHdvcmsuCgo+IEJlc3QgcmVnYXJkcywK
PiAKPiBUaG9tYXMKPiAtLSAKPiBUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBC
b290bGluCj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5p
bmcKPiBodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
