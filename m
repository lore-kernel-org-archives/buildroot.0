Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B0EBCAC59A
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 12:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2244183046;
	Fri, 19 Sep 2025 12:56:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oAErjgs3GlS9; Fri, 19 Sep 2025 12:56:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79A1382FBE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79A1382FBE;
	Fri, 19 Sep 2025 12:56:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DF097E7
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:56:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5F6640C23
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:56:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n5Isl7-D3g9X for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 12:56:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A86C440C14
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A86C440C14
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A86C440C14
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:56:23 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-45dcff2f313so13378135e9.0
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 05:56:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758286582; x=1758891382;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pQvBFpFf8Jyn/oTkNxy5J6uW0XGXokcRts2mo3L/7HA=;
 b=he7vc8RbvWne8ySMeasHFTVbyU7DdEhaBZvJBUb71EU0qmfetJItA5yzLsXtCVZ6qQ
 DhRpp7M5PkoIn9Xn2kYmC7Ot1Po5+aKx52I4n2Vpgx2sScEMkXbJDIujG8PMWc4m40hA
 c4AWkLkw6Q4dD2qL+BqXVZ/t/UKVFBreCDjynCP2a0er3vvVQYQYhEEKSmSPAD0DoDPP
 6IZS2s7XcxfKugt8UFAMiPjVT56G+G0PsRgcDzVUU7MQD2hVEklAniEOR4fCazNkErid
 ByVLSlzkpR9D/oOZ1NQj1OGe+Bg/5f5q0A6GHlRf/YTxTugwjV6p6aBJeMfOPvGc2Ccc
 z+2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYHKLd8WRSEcT5BQ75vtyQfkJ5edSmXd2MAMwNnzzKbwpWyD2p+CFLT/y6D2qXoznJJD0caEp7x7w=@buildroot.org
X-Gm-Message-State: AOJu0YzMp4qcLAB56ShQiwZdEGFxsPwWu9tfwPYoLYjpyxPUuL3VoDer
 HaAI+pV7YCipU1JF5krome7a5gEUcVbXWN5amw+zG/f1pyMWXuPaLgI6CO1Ye068RVYb+/v4egd
 /iyQNLXU=
X-Gm-Gg: ASbGncsVYDe32yznUR6eLVaph8i8jbidsbdyIHlYcxMfVGAXZSr5VEeJYekPdgjwt/6
 vMCfTG4TUqXlExV3DcNNTPwjlYLhge0rVW60AtnfHQnxCUIjVoSr5im75g1AJ7+crpO+RML7q1P
 TlWTRErGkkvojoozByZ6AUF/pQKhaRl58y5Te+F6Lmul83UOW3VdEBLNGne3N01Qwe1fBr45vGM
 CpfQNJ8GAEi4WNmETs8fVsp6G+OdHOJtncr+Hr3UZ0kB6WjiNR51T7LeApPh9wyDa+QrZkflX68
 89+9qc+ki1u4qOgficv+PHGxO3DNv0HmqxQ0Qi1u7atyTNwnpAWfDVrjET++G0ZTXgx2fI0BStb
 hzg3DCy87QPPK8rk=
X-Google-Smtp-Source: AGHT+IEwv5DI4HVqCVkq3Jd0L6DpyTe5jI8zgQ8NQQj6X0HFU9NHLLhqzmuQGhMS6fwKss98ygqKAw==
X-Received: by 2002:a05:600c:1991:b0:45f:284b:1d89 with SMTP id
 5b1f17b1804b1-467ef72c49dmr27588555e9.25.1758286581647; 
 Fri, 19 Sep 2025 05:56:21 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ee141e9cf7sm6024862f8f.12.2025.09.19.05.56.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 05:56:21 -0700 (PDT)
To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 19 Sep 2025 14:56:18 +0200
Message-ID: <20250919125620.136430-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250909-fix_php_lua-v1-1-f3e379f98bf9@bootlin.com>
References: <20250909-fix_php_lua-v1-1-f3e379f98bf9@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758286582; x=1758891382; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pQvBFpFf8Jyn/oTkNxy5J6uW0XGXokcRts2mo3L/7HA=;
 b=RfrWkDlsNXZ72+/L/wtw7K4YI1XfYsU1qrMXbBh1+6kc4VnCHedn45Vq0j4yHdMcI3
 TM0YLM2uuIG/af2JkwKtAx+is3YHy19HiO4M5r3MSMRBj/YJ1vG/065HJ3T5qui1ImZH
 IQqL5bdiSQ2RV2+uzJdZ/K2PqLCOMMy9EkkiSJP/4VGuQbLCrjJSEckvpezlE5JtNDGw
 2P1Ah3OzSJ+WFEt0hXpvpqhDDNBDw+gF09l6zsqjJsKxzFIfwu+L69hI25QdZU9Gzwt9
 SpOtM3+jS7tE94Un8i1fqh2KyGhjo/viHMwcwelNNtjxd7o8x+dgFWmu7YlAXx2KGwfd
 EhGw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=RfrWkDls
Subject: Re: [Buildroot] [PATCH] package/php-lua: fix build with lua < 5.2
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gcmVwbHkgb2Y6Cj4gcGhwLWx1YSBmYWlscyB0byBidWlsZCBpbiBidWlsZHJvb3QgMjAyNS4w
OC1yYzMgb24gdGhlIGZvbGxvd2luZyBlcnJvcjoKPiAKPiBpbiBmaWxlIGluY2x1ZGVkIGZyb20g
Wy4uLl0vdXNyL2luY2x1ZGUvcGhwL1plbmQvemVuZC5oOjMyLAo+ICAgICAgICAgICAgICAgICAg
ZnJvbSBbLi4uXS91c3IvaW5jbHVkZS9waHAvbWFpbi9waHAuaDozMSwKPiAgICAgICAgICAgICAg
ICAgIGZyb20gWy4uLl0vYnVpbGQvcGhwLWx1YS0yLjAuNy9sdWEuYzoyNDoKPiBbLi4uXS9idWls
ZC9waHAtbHVhLTIuMC43L2x1YS5jOiBJbiBmdW5jdGlvbiDigJhwaHBfbHVhX3dyaXRlX3Byb3Bl
cnR54oCZOgo+IFsuLi5dL2J1aWxkL3BocC1sdWEtMi4wLjcvbHVhLmM6MjQ3OjM3Ogo+IGVycm9y
OiDigJh2YWzigJkgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rpb24pOyBkaWQg
eW91IG1lYW4KPiDigJh6dmFs4oCZPwo+ICAgMjQ3IHwgICAgICAgICBsdWFfcHVzaGxzdHJpbmco
TCwgWlNUUl9WQUwodmFsKSwgWlNUUl9MRU4odmFsKSk7Cj4gICAgICAgfCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBefn4KPiBbLi4uXS91c3IvaW5jbHVkZS9waHAvWmVuZC96
ZW5kX3N0cmluZy5oOjY2OjI2Ogo+IG5vdGU6IGluIGRlZmluaXRpb24gb2YgbWFjcm8g4oCYWlNU
Ul9WQUzigJkKPiAgICA2NiB8ICNkZWZpbmUgWlNUUl9WQUwoenN0cikgICh6c3RyKS0+dmFsCj4g
ICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fgo+IFsuLi5dL2J1aWxkL3BocC1s
dWEtMi4wLjcvbHVhLmM6MjQ3OjM3Ogo+IG5vdGU6IGVhY2ggdW5kZWNsYXJlZCBpZGVudGlmaWVy
IGlzIHJlcG9ydGVkIG9ubHkgb25jZSBmb3IgZWFjaCBmdW5jdGlvbgo+IGl0IGFwcGVhcnMgaW4K
PiAgIDI0NyB8ICAgICAgICAgbHVhX3B1c2hsc3RyaW5nKEwsIFpTVFJfVkFMKHZhbCksIFpTVFJf
TEVOKHZhbCkpOwo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Xn5+Cj4gWy4uLl0vdXNyL2luY2x1ZGUvcGhwL1plbmQvemVuZF9zdHJpbmcuaDo2NjoyNjoKPiBu
b3RlOiBpbiBkZWZpbml0aW9uIG9mIG1hY3JvIOKAmFpTVFJfVkFM4oCZCj4gICAgNjYgfCAjZGVm
aW5lIFpTVFJfVkFMKHpzdHIpICAoenN0ciktPnZhbAo+ICAgICAgIHwgICAgICAgICAgICAgICAg
ICAgICAgICAgIF5+fn4KPiBtYWtlWzJdOiAqKiogW01ha2VmaWxlOjIxNDogbHVhLmxvXSBFcnJv
ciAxCj4gCj4gVGhlIGlzc3VlIHRyaWdnZXJzIG9ubHkgaWYgbHVhIGludGVycHJldGVyIHZlcnNp
b24gaXMgbG93ZXIgdGhhbiA1LjIuIEluCj4gdGhpcyBjYXNlLCAgcGhwX2x1YV93cml0ZV9wcm9w
ZXJ0eSBjYWxscyBaU1RSX1ZBTCBvbiB0aGUgd3JvbmcgdmFyaWFibGUuCj4gCj4gRml4IHBocC1s
dWEgYnVpbGQgYnkgY2FsbGluZyBaU1RSX1ZBTCBvbiB0aGUgY29ycmVjdCB2YXJpYWJsZS4KPiAK
PiBTdWdnZXN0ZWQtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgo+IFNp
Z25lZC1vZmYtYnk6IEFsZXhpcyBMb3Rob3LDqSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+
CgpBcHBsaWVkIHRvIDIwMjUuMDIueCwgMjAyNS4wNS54ICYgMjAyNS4wOC54LiBUaGFua3MKCj4g
LS0tCj4gV2hpbGUgdGhpcyBwYXRjaCBmaXhlcyBwaHAtbHVhIHdpdGggbHVhIDwgNS4yLCB0aGlz
IHdvdWxkIG1ha2VzIGl0IHlldAo+IGFub3RoZXIgZG93bnN0cmVhbS1vbmx5IHBhdGNoLCB3aGlj
aCBpcyBub3QgcmVhbGx5IGRlc2lyYWJsZS4gSSB3aWxsCj4gcGluZyBpbiB0aGUgbWVhbiB0aW1l
IHRoZSBpbmFjdGl2ZSB1cHN0cmVhbSByZXBvc2l0b3J5diB0byBjaGVjayBpZgo+IHRoZXJlIGlz
IGFueSBjaGFuY2UgdGhhdCBpdCBjb3VsZCBiZSB1cGRhdGVkIHRvIGludGVncmF0ZSB0aG9zZSBw
YXRjaGVzLgo+IC0tLQo+ICAuLi5hLmMtZml4LVpTVFJfVkFMLXVzYWdlLXdoZW4tdXNpbmctbHVh
LTUuMi5wYXRjaCB8IDM4ICsrKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQs
IDM4IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9waHAtbHVhLzAwMDQt
bHVhLmMtZml4LVpTVFJfVkFMLXVzYWdlLXdoZW4tdXNpbmctbHVhLTUuMi5wYXRjaCBiL3BhY2th
Z2UvcGhwLWx1YS8wMDA0LWx1YS5jLWZpeC1aU1RSX1ZBTC11c2FnZS13aGVuLXVzaW5nLWx1YS01
LjIucGF0Y2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAuLmM1ZDk5ZGI3ZjUxODM2MmJmNmU4ZDA5ODFlMzhjYTg5
ZDRhZTcwODgKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9waHAtbHVhLzAwMDQtbHVh
LmMtZml4LVpTVFJfVkFMLXVzYWdlLXdoZW4tdXNpbmctbHVhLTUuMi5wYXRjaAo+IEBAIC0wLDAg
KzEsMzggQEAKPiArRnJvbSA3YmYzMzQ4MzJhZDM2ZDFmMjk3NjQwNmQ2ODBiMzVhMTY4ZmZhYTkx
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+ICtGcm9tOiA9P1VURi04P3E/QWxleGlzPTIwTG90
aG9yPUMzPUE5Pz0gPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgo+ICtEYXRlOiBNb24sIDgg
U2VwIDIwMjUgMTc6MjA6MTIgKzAyMDAKPiArU3ViamVjdDogW1BBVENIXSBsdWEuYzogZml4IFpT
VFJfVkFMIHVzYWdlIHdoZW4gdXNpbmcgbHVhIDwgNS4yCj4gK01JTUUtVmVyc2lvbjogMS4wCj4g
K0NvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAo+ICtDb250ZW50LVRyYW5z
ZmVyLUVuY29kaW5nOiA4Yml0Cj4gKwo+ICtXaGVuIHVzaW5nIGEgbHVhIGludGVycHJldGVyIHdp
dGggYSB2ZXJzaW9uIGxvd2VyIHRoYW4gNS4xLCB0aGUKPiArcGhwX2x1YV93cml0ZV9wcm9wZXJ0
eSBlbmRzIHVwIGNhbGxpbmcgdGhlIFpTVFJfVkFMIHdpdGggdGhlIHdyb25nCj4gK3ZhcmlhYmxl
IChpdCBpcyBleHBlY3RlZCB0byByZWNlaXZlICJtZW1iZXIiLCBhIHplbmRfc3RyaW5nIHZhcmlh
YmxlLAo+ICtidXQgaXQgaXMgInZhbHVlIiB0aGF0IGlzIHBhc3NlZCwgd2hpY2ggaXMgYSB6dmFs
KS4KPiArCj4gK0ZpeCBwaHAtbHVhIGNvbXBhdGliaWxpdHkgd2l0aCBpbnRlcnByZXRlcnMgPCA1
LjIgYnkgcGFzc2luZyB0aGUgY29ycmVjdAo+ICt2YXJpYWJsZQo+ICsKPiArVXBzdHJlYW06IHVw
c3RyZWFtIGRlYWQsIGN1c3RvbSBwYXRjaAo+ICtTaWduZWQtb2ZmLWJ5OiBBbGV4aXMgTG90aG9y
w6kgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgo+ICstLS0KPiArIGx1YS5jIHwgMiArLQo+
ICsgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gKwo+ICtk
aWZmIC0tZ2l0IGEvbHVhLmMgYi9sdWEuYwo+ICtpbmRleCBhNDBlNWRhNDQyYTQuLjU4ODliYzdm
ODNlYSAxMDA3NTUKPiArLS0tIGEvbHVhLmMKPiArKysrIGIvbHVhLmMKPiArQEAgLTI0NCw3ICsy
NDQsNyBAQCBzdGF0aWMgenZhbCogcGhwX2x1YV93cml0ZV9wcm9wZXJ0eSh6ZW5kX29iamVjdCAq
b2JqZWN0LCB6ZW5kX3N0cmluZyAqbWVtYmVyLCB6dgo+ICsgCWx1YV9TdGF0ZSAqTCA9IHBocF9s
dWFfb2JqX2Zyb21fb2JqKG9iamVjdCktPkw7Cj4gKyAKPiArICNpZiAoTFVBX1ZFUlNJT05fTlVN
IDwgNTAyKQo+ICstCWx1YV9wdXNobHN0cmluZyhMLCBaU1RSX1ZBTCh2YWwpLCBaU1RSX0xFTih2
YWwpKTsKPiArKwlsdWFfcHVzaGxzdHJpbmcoTCwgWlNUUl9WQUwobWVtYmVyKSwgWlNUUl9MRU4o
bWVtYmVyKSk7Cj4gKyAJcGhwX2x1YV9zZW5kX3p2YWxfdG9fbHVhKEwsIHZhbHVlKTsKPiArIAo+
ICsgCWx1YV9zZXR0YWJsZShMLCBMVUFfR0xPQkFMU0lOREVYKTsKPiArLS0gCj4gKzIuNTEuMAo+
ICsKPiAKPiAtLS0KPiBiYXNlLWNvbW1pdDogNTZkOWQ1ZThmMDg3MjczN2ZkNzlhYmY2YTYwZTY2
OTIwYmI3ODYxYwo+IGNoYW5nZS1pZDogMjAyNTA5MDgtZml4X3BocF9sdWEtOWJmNzg3MmIyNWI1
Cj4gCj4gQmVzdCByZWdhcmRzLAo+IC0tIAo+IEFsZXhpcyBMb3Rob3LDqSwgQm9vdGxpbgo+IEVt
YmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKPiBodHRwczovL2Jvb3RsaW4uY29t
Cj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBi
dWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
