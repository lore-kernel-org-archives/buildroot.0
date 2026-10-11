Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB35CA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 19:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CEA8405EF;
	Sun, 11 Oct 2026 19:16:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xQK4-TvD18Dj; Sun, 11 Oct 2026 19:16:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4C6A5405F0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791746170;
	b=O+ABt0VrNt0xEsLNPPuSlygH5LAUeStcNp90pPJw3HBE5YMi5Yh1r8Ymh0BSOcx10Gi7
	 GOEi8ru++0j5cuGWXsdhtQ2Cai/lmeKWtJSbDGxRqledpp9SS43iaz/47E1WMJOxDOe0c
	 ZPaqSa8Q0W7Z673Wui6QIj1UfZ9EldFv4kFrFtBBLnpSj/W/BmGwVscMETNlDR8io4XyF
	 WT1rop+ZfrX+0AqUPvCrOhEpMvGrzdv3GCy97HS6yY8ZeJFn7ay7OLUouVBHFixK1L+9G
	 CRNOoRAlA9YeldyH4HyomtsM5KG2T+5+vWkN1LzjIMPmdRiBDguquJO0Nx7uYiH/0Ag==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791746170;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=aQDn5Idd6oI1+nADneI/wr1KwVgoZY4GG601mMBndbM=;
	b=F7V48SFt5RVJzZz51HRrQUIDdjV5Yb8Wn7NcclaB89UCz2ZeryJJdMhFsE4t+oaKookH
	 HWXCZvTx6tr+3JsncKTOfXcuicvMWZHEtc4Cu+XFu+KB20AmSBjjxnkWS7kTqZr/FbuyB
	 ZNLruWFWbFMXlGzwPaWmNhwGVNeQWz4VF8+oC2o+diY9n3xjIyonNroxI2AmR5o1Ja+4O
	 /CVOVRgd4/U5wXeJ1LKN2C696VXaMy8nP6AjXt7catBgK2EVOKhzW4MULchHazbecBN6N
	 5LQKnRh27+ttdOTjzUwlK3B+M7x+TBoG9fh1ViHjWoTkudBJ0nSdFirbqXTAqwZhAJg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791746170;
	bh=aQDn5Idd6oI1+nADneI/wr1KwVgoZY4GG601mMBndbM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DodIIfHFlhkUhhAFn+M5nKk3sWBgtJHEUex9n85BT9EuefY/JfWISYaZuC4EG4tfG
	 U5s+L7Wrjc4njPPDDr61XLJLEwrT7aAun6M1yCuOt4lyUJpAV6L7U1DVfrdgypPwJB
	 Dx7Fs6tj2+YG5PPY0QxjgpX5OC8S7v3Or8hUAw0WA4gu+t5GxS66ozoVB9+F84d0V9
	 ZvRW3MpaoXyRSiR3EldO3rPK0vz/jjD+Pule9kg0AlmA0xU0aI2yec/cpYv5ka58/E
	 A68lOvHekaKXWAkzMQbsyorbNfbqQviF+4vgx3b3VdPrNDksgZV5XYJr7c5uSToWUA
	 cLlElhXV6CEHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C6A5405F0;
	Sun, 11 Oct 2026 19:16:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D51D1A6
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 19:16:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 538BA4002B
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 19:16:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GKmBJZWNJdxf for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 19:16:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 6702D40075
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791746167;
 b=pDw5+j/8dvL1zV7HeWZLl/hr+MK7Ujgo+aLSpLtrWcyFAbbpJDcQagVlafdk1qbSqyqU
 VT54UpX/T5G3kuAyCeJs70I2c3cvy8g3iPu/GXD/LiDbaJpgg8BTKxdf7acdswB440lbu
 773kpwUYmfkXKDteSObJnbzZHykiOGPHpKWjm6G/X9Bpe9YTtUrPu9gUbyPb0JuTiF9Xv
 3lO+NgvSSx7j35Fy9VGvR8X0idDMcP33i2oZGwB+fffplQEColNOo+fbBCi1DpAvQQVJX
 7stzEYpMdOngavLRMEnsEiGGlILyWlBCwjX55jWDpuFShPBOZDToYCnwvyK90tlnzyw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791746167;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=o6DITwihNLFkyk3LRjfm+zsTshRkGQIC0nXcycu9aYQ=;
 b=aPU1Imp5LJZOcEit9J3G7FCnI4C8933hm9JM2cucvMeVjqqQd4+NonRm85fHiJTH14CK
 pKa7ykr4PshHFl5KOuf4WpjMf54SGcDnG1iYSmDZI/svqwYIbJ46NJ/i1BKGTVJGszztw
 NHoMMcaSiB1QOGxUPE5QtJwFyvTyCjVh7OjHEhsrlZi3LUhfPP8hnNN7W0RGkjujuvL1B
 4ER+TRLfLsjQmSWBi6Kle5aOqenZ91WaOupbidmgnXXzUyTHs68DGRpeynCEJb4bgTKTe
 V4x5l32kn7sGGI8GYnsZZmU+GWfYBweeom3E3zVoctyPuq66hmpNYAxQiYa0tpf9BZg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=rnout.be;
 dkim=pass header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=MVkOqtSo; 
 arc=none smtp.remote-ip=79.99.201.12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6702D40075
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 19:16:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 403C4B97A15B; Sun, 11 Oct 2026 21:16:04 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Arnout Vandecappelle <arnout@rnout.be>,
 =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 =?UTF-8?q?Jos=C3=A9=20Mendes?= <jp.baltazar.mendes@gmail.com>,
 "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
Date: Sun, 11 Oct 2026 21:15:48 +0200
Message-ID: <179174589249.232021.1677603637320322971.b4-ty@b4>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20250207171458.1127620-3-fiona.klute@gmx.de>
References: <20250207171458.1127620-3-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v3 2/3] board/raspberrypi: allow
 non-matching globs for DTBs
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCAwNyBGZWIgMjAyNSAxODoxNDo1NyArMDEwMCwgRmlvbmEgS2x1dGUgdmlhIGJ1aWxk
cm9vdCB3cm90ZToKPiBGcm9tOiAiRmlvbmEgS2x1dGUgKFdJV0EpIiA8ZmlvbmEua2x1dGVAZ214
LmRlPgo+Cj4gV2hlbiBpbnN0YWxsaW5nIERUQnMgZnJvbSB0aGUgcnBpLWZpcm13YXJlIHBhY2th
Z2UKPiAoQlIyX1BBQ0tBR0VfUlBJX0ZJUk1XQVJFX0lOU1RBTExfRFRCUz15KSwgdGhlcmUncyBu
byBEVEIgZGlyZWN0bHkgaW4KCiBJIGFkZGVkICJ0aGUgZGVmYXVsdCIgaGVyZSB0byBhZGRyZXNz
IE5pa2xhcycgY29tbWVudC4KCj4gdGhlIGltYWdlcyBkaXJlY3RvcnkgYmVjYXVzZSB0aGUga2Vy
bmVsIGJ1aWxkIGRvZXNuJ3QgcHJvdmlkZSBvbmUuCj4KPiBVc2luZyBwcmUtY29tcGlsZWQgRFRC
cyBpcyBkaXNjb3VyYWdlZCwgYnV0IHVzZWZ1bCBmb3IgdXNpbmcgbWFpbmxpbmUKPiBrZXJuZWxz
IHVudGlsIHN1aXRhYmxlIERUUyBjYW4gYmUgbWVyZ2VkLCBvciB0byBwcm92aWRlIFUtQm9vdCB3
aXRoIGEKPiBEVEIgKHZpYSB0aGUgZmlybXdhcmUgYm9vdGxvYWRlcikgaW5kZXBlbmRlbnQgb2Yg
d2hhdGV2ZXIga2VybmVsIERUQgo+IGlzIGluIHVzZS4KPgo+IFNpZ25lZC1vZmYtYnk6IEZpb25h
IEtsdXRlIChXSVdBKSA8ZmlvbmEua2x1dGVAZ214LmRlPgo+IFJldmlld2VkLWJ5OiBHYcOrbCBQ
T1JUQVkgPGdhZWwucG9ydGF5K3J0b25lQGdtYWlsLmNvbT4KCiBBcHBsaWVkIHRvIG1hc3Rlciwg
dGhhbmtzIQoKIFJlZ2FyZHMsCiBBcm5vdXQKCj4gLS0tCj4gQ2hhbmdlcyB2MSAtPiB2MjoKPiAq
IENoZWNrIGZvciBleGlzdGFuY2Ugb2YgcGF0aHMgcmV0dXJuZWQgYnkgdGhlIERUQiBnbG9iIGV4
cHJlc3Npb25zCj4gICBpbnN0ZWFkIG9mIGNoYW5naW5nIHNoZWxsIGdsb2IgYmVoYXZpb3IKPgo+
ICBib2FyZC9yYXNwYmVycnlwaS9wb3N0LWltYWdlLnNoIHwgMiArKwo+ICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYm9hcmQvcmFzcGJlcnJ5cGkvcG9z
dC1pbWFnZS5zaCBiL2JvYXJkL3Jhc3BiZXJyeXBpL3Bvc3QtaW1hZ2Uuc2gKPiBpbmRleCBlNDYx
MWQwNWRkLi5hM2EyZDhkNjIwIDEwMDc1NQo+IC0tLSBhL2JvYXJkL3Jhc3BiZXJyeXBpL3Bvc3Qt
aW1hZ2Uuc2gKPiArKysgYi9ib2FyZC9yYXNwYmVycnlwaS9wb3N0LWltYWdlLnNoCj4gQEAgLTEz
LDYgKzEzLDggQEAgaWYgWyAhIC1lICIke0dFTklNQUdFX0NGR30iIF07IHRoZW4KPiAgCUZJTEVT
PSgpCj4gIAo+ICAJZm9yIGkgaW4gIiR7QklOQVJJRVNfRElSfSIvKi5kdGIgIiR7QklOQVJJRVNf
RElSfSIvcnBpLWZpcm13YXJlLyo7IGRvCj4gKwkJIyBpZ25vcmUgbGl0ZXJhbCBnbG9icyB0aGF0
IGRpZG4ndCBtYXRjaCBhbnl0aGluZwo+ICsJCVsgLWUgIiR7aX0iIF0gfHwgY29udGludWUKPiAg
CQlGSUxFUys9KCAiJHtpIyR7QklOQVJJRVNfRElSfS99IiApCj4gIAlkb25lCj4gIAo+IC0tIAo+
IDIuNDcuMgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
