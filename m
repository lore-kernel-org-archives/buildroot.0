Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B5ECD6E4A
	for <buildroot@archiver.kernel.org>; Tue,  2 Jun 2026 05:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57C4760B0C;
	Tue,  2 Jun 2026 05:32:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m7tGPT7NzFug; Tue,  2 Jun 2026 05:32:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3C9960B02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780378348;
	bh=oTQZkqSkgJbejQYCvKBWwBpkL+gVgJjKoLZpR/+LX44=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SNJG5ukiPvPB9Cn1DKRMDSbhh6DtDk5TqOovbcBywc1Px7I9FISTz/jirsdytzAlJ
	 hRZM2UbojmFHoiBKwMsXX5ilx64h7SpBM2yee2/esF66vapY21g3/9rEerTgZ6A/EB
	 Fy299NKCmqG+di6MdoSY1aGqTMMeHhvFGrxorqv4iXpDkOzfzT7WwOg6QokzfdHWlk
	 irNtH1N0lk1YCVwkgSyg52w79HriqZl2tN5jo99PJyrcF1wvmsUHglHp/cFLdRLyM/
	 WzAJFtKLVP8WyzTiYFSeOqy/8rkaobsNLkIw0/2BzB4q3KiKxOYaT2bZ2urdKVRD1q
	 XQ/pv1TraRkIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3C9960B02;
	Tue,  2 Jun 2026 05:32:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C7B25F4
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 05:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B9E5981C2F
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 05:32:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HN_UWCJxjBOy for <buildroot@buildroot.org>;
 Tue,  2 Jun 2026 05:32:27 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1230; helo=mail-dl1-x1230.google.com;
 envelope-from=j@j-ernberg.se; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F413281C26
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F413281C26
Received: from mail-dl1-x1230.google.com (mail-dl1-x1230.google.com
 [IPv6:2607:f8b0:4864:20::1230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F413281C26
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 05:32:26 +0000 (UTC)
Received: by mail-dl1-x1230.google.com with SMTP id
 a92af1059eb24-137e75bcb5eso2395867c88.1
 for <buildroot@buildroot.org>; Mon, 01 Jun 2026 22:32:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780378346; cv=none;
 d=google.com; s=arc-20240605;
 b=HGSg0N6dABSAi/3BZ0AVgLPbCh0uU/KYA9AFrt/bpcVDDBPEhQ7E5E9/9vTVHuveYW
 zpMnixDWb9N/r4CzEtmGa6bbMkknBhiIF16t3vlZR7SECRJ6jsCFWzR+gQgVcnYgA+mr
 0tESwZlfenN/81dyuNB6lFwoQC0XiCPp+ZvEBtF+lxI7sQ0Ucj9q3b8G9ZjO0ROVdDMx
 Lln0eWyutIbXORWIV5wzc48VyquOjWDs+1vdovVH6qtvAyEzQgR3LNH6ll91CnQUc5F2
 Qign765LK7mdayAwd1tUUCz2qBMRyKbihHv/I6eDc3SKV/6EqGGWb+Czm/yMHyXQe40/
 RJHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=emSjwL+ODrhNoQXgTqnXlpg6k9ur1ZtSZoCOjYUdno8=;
 fh=T3LyqkbzWCjasITsFxEnGE3yC6ZplSmwni74CSU7fiU=;
 b=JVXcZvXM/tcx+h4MCcPXkvwCsgCe4OrAtDL8Y/BFxU7YYV14BTZZeVQKGxDupYdidf
 u4JyHhn4ARySEYgRY0dczwLcJ8LzXmCYRYCi2CDgrBS+UeFSmjiQXtvD7T42lstiaHpb
 Iw5jEjisyKdr3zfE94nvIyVuzBWhWWfH7XB+BNcreH/TZxanB1klA/9G4WCoyMp9tJyR
 VtY7vkQ0CrY3oETLldA08Uh2KxmdwThfSj9FRxoiYCLQsZ+BVVfJr+oZLMs/6eltyBDg
 cu6CchXJwp10hdvlFQMbY7HbBf1SMFzKvxxxLFBdALkDuK1QaKu2loBzadPSfO7AVyJ6
 HZkQ==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780378346; x=1780983146;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=emSjwL+ODrhNoQXgTqnXlpg6k9ur1ZtSZoCOjYUdno8=;
 b=GmerW10itxUaA8cMcMw2xkHvi/9lDLkBPqSu8cdHHZLcqvPGgRzusGyf+JNEzUHtib
 HWSahuwcOgW89DjBW8TalhRDLtvxeGNbvxubWbWteWJVGGtvBH4MQuo4phSiMw1ULXjs
 A9W3pA7kvgYNunddfcapAzesPNZ4wU5/FsoJAxLfNcVXVzpeGjlR1OtT7iyZyDgkkYu/
 akDqoO89WJu/fmuV0dbCnmbB9vrRSYk8wzIPrbqmORTZAKaBI+RxHPEhqb2HFzC7fIeR
 oIU+GoPuK2pqIAXXBWFuz69IHmVKB0SD8SaaKY/xYmcidFISa/a8bK/7dPPYokZCGcO3
 AdHQ==
X-Gm-Message-State: AOJu0YxP76JQWjyKknsSs4nDG88Mnys2Z7vvIvt9udU1CLdWQVpOcQKg
 32IQd2xrO23cR6Z1FRcDPuFQBUmb7dLtqBPZHJmAGj9xe1KjP4ljqs7qozhaRvQHezclh7gsC0w
 IiC558i0o4ZKzUuVlQzH/dATN1F3JTprHSXNtFUFgz+ZNb3oMp9YVO75vlg==
X-Gm-Gg: Acq92OGqhoiTTEoEpCkXgJyXvDX+WUyi2Imrtm4LcegsyCRV5v7R7AA6AvD9yfgHaZU
 xIFtslYDJcu0Of8eCQXtlFuR1jUn4kkJZs44QXVO11NHZuN/ia0PM3sctw/nW8Y2UpmWRE4Ct8h
 ZYQXpnp16g9QtA4ROrt+FYbcpYDh9YKrO3i6fgVqVUlFjU/OAtNzR6WrisMD373AnYTQjysV5De
 ckFOgmxyx/PdAAEeZ0vIh3u1/EYHaWK7PDh44gXchBUPo/doEovYr4aLtmUwU8NYE7/F5HBCEHT
 iwAsVSOj20n5IkhgLp4CaNz0LsAs
X-Received: by 2002:a05:7022:61b:b0:12d:b7e5:a691 with SMTP id
 a92af1059eb24-137d4026bcamr6290263c88.7.1780378345999; Mon, 01 Jun 2026
 22:32:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260601204735.888967-1-j@j-ernberg.se>
 <20260601204735.888967-6-j@j-ernberg.se>
 <76afaa08-abdd-4464-aef3-4a8c5afa4612@rnout.be>
In-Reply-To: <76afaa08-abdd-4464-aef3-4a8c5afa4612@rnout.be>
From: John Ernberg <j@j-ernberg.se>
Date: Tue, 2 Jun 2026 07:32:14 +0200
X-Gm-Features: AVHnY4Kohp1e4I0-Z2fVVkAok3DN1uXms6yoPS38Kmq5dunHEaXFta-JfXW8-3w
Message-ID: <CAAHg4ZjE9AvJQzqd_3QXJHiEvFskDdeHpVMNBP7nXcUvwrhxcA@mail.gmail.com>
To: Arnout Vandecappelle <arnout@rnout.be>
Cc: buildroot@buildroot.org, John Ernberg <john.ernberg@actia.se>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=j-ernberg-se.20251104.gappssmtp.com; s=20251104; t=1780378346; x=1780983146;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=emSjwL+ODrhNoQXgTqnXlpg6k9ur1ZtSZoCOjYUdno8=;
 b=a44hu+ZJutkH9ed8OdEQ09mY/9tkNfqFeyrZ1raO5YiaKIaP65Nl4/016HAUsrAjEn
 g87QFgZAqkku8yhbLMjabjcbpHpftXSKVJRglIUGe0LQ2eF9RFPcWNH0AUt8oZgUuHVj
 aLEWk9eglqa/wfo65JTqqWtlPbSWnSIM8t6AtlRGG42k6+QFArxHmriyEmUuhK8e57L5
 9STzG9QBVSY0X/VVjIN5DgSg3aRAmdRWeAd8yXq28mcakQshb1LDRQ39d6zymhd6zpmZ
 3T7ra9uc71POrMBPTqgFsqPQNW9rrn+O1Yc/+af+AmthpW8ghc64yQyyKU23DSY+FwuQ
 QCMA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=j-ernberg.se
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=a44hu+ZJ
Subject: Re: [Buildroot] [RFC PATCH 5/9] package/libcamera-apps: Only enable
 EGL if both epoxy and xlib_libX11 are selected
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

SGkgQXJub3V0LAoKT24gTW9uLCBKdW4gMSwgMjAyNiBhdCAxMToyNOKAr1BNIEFybm91dCBWYW5k
ZWNhcHBlbGxlIDxhcm5vdXRAcm5vdXQuYmU+IHdyb3RlOgo+Cj4KPgo+IE9uIDAxLzA2LzIwMjYg
MjI6NDcsIEpvaG4gRXJuYmVyZyB3cm90ZToKPiA+IFNpbmNlIHJlbGVhc2UgMC4yIG9mIHRoZSBy
cGljYW0tYXBwcyB0aGVzZSBkZXBlbmRlbmNpZXMgaGF2ZSBiZWVuIHJlcXVpcmVkCj4gPiBpZiBl
bmFibGVfZWdsPVRydWUgaXMgZ2l2ZW4gdG8gbWVzb24uIFsxXQo+ID4KPiA+IFRoZSBkZXBlbmRl
bmN5IGNoZWNrIHdhcyBicm9rZW4gc2luY2UgY29tbWl0IDNmYWMxNjNiOTMxNQo+ID4gKCJwYWNr
YWdlL2xpYmNhbWVyYS1hcHBzOiBidW1wIHRvIHZlcnNpb24gMS4xLjAiKSBpbiBlYXJseSAyMDIz
Lgo+ID4KPiA+IExpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9yYXNwYmVycnlwaS9ycGljYW0tYXBw
cy9jb21taXQvYzgzNTFhMDkxNzRmMTQzNDI0ODg0MDgxYTY5YjZkZDgwMThmNGJhMyNkaWZmLWEy
NDY4YTM5MDQwZjlmODgzZTViMDNlMTUyM2RkNGU3M2ZkNDNhZDllYTg3ZjYwMDc3MjQ3N2I4OTBj
ZGQ2NTVMMTgtUjIyCj4gPiBDYzogTWFyY3VzIEZvbGtlc3NvbiA8bWFyY3VzLmZvbGtlc3NvbkBn
bWFpbC5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKb2huIEVybmJlcmcgPGpAai1lcm5iZXJnLnNl
Pgo+ID4KPiA+IC0tLQo+ID4KPiA+IFJGQzogSSBjYW4ndCBmaWd1cmUgb3V0IGlmIHRoaXMgaXMg
dGhlIGNvcnJlY3Qgd2F5IHRvIGRvIHRoaXMga2luZCBvZiBjaGVjay4KPiA+IC0tLQo+ID4gICBw
YWNrYWdlL2xpYmNhbWVyYS1hcHBzL2xpYmNhbWVyYS1hcHBzLm1rIHwgNiArKy0tLS0KPiA+ICAg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiA+Cj4gPiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS9saWJjYW1lcmEtYXBwcy9saWJjYW1lcmEtYXBwcy5tayBiL3Bh
Y2thZ2UvbGliY2FtZXJhLWFwcHMvbGliY2FtZXJhLWFwcHMubWsKPiA+IGluZGV4IGRmN2JlNDE0
OTYuLmVlYTZlOThjMDAgMTAwNjQ0Cj4gPiAtLS0gYS9wYWNrYWdlL2xpYmNhbWVyYS1hcHBzL2xp
YmNhbWVyYS1hcHBzLm1rCj4gPiArKysgYi9wYWNrYWdlL2xpYmNhbWVyYS1hcHBzL2xpYmNhbWVy
YS1hcHBzLm1rCj4gPiBAQCAtMzYsMTAgKzM2LDggQEAgZWxzZQo+ID4gICBMSUJDQU1FUkFfQVBQ
U19DT05GX09QVFMgKz0gLURlbmFibGVfbGliYXY9ZGlzYWJsZWQKPiA+ICAgZW5kaWYKPiA+Cj4g
PiAtaWZlcSAoJChCUjJfUEFDS0FHRV9YT1JHNykseSkKPiA+IC1MSUJDQU1FUkFfQVBQU19ERVBF
TkRFTkNJRVMgKz0gXAo+ID4gLSAgICAgJChpZiAkKEJSMl9QQUNLQUdFX0xJQkVQT1hZKSxsaWJl
cG94eSkgXAo+ID4gLSAgICAgJChpZiAkKEJSMl9QQUNLQUdFX1hMSUJfTElCWDExKSx4bGliX2xp
YlgxMSkKPiA+ICtpZmVxICgkKEJSMl9QQUNLQUdFX1hPUkc3KSQoQlIyX1BBQ0tBR0VfTElCRVBP
WFkpJChCUjJfUEFDS0FHRV9YTElCX0xJQlgxMSkseXl5KQo+Cj4gICBUaGUgWE9SRzcgY29uZGl0
aW9uIGlzIHJlZHVuZGFudCwgQlIyX1BBQ0tBR0VfWExJQl9MSUJYMTEgY2FuJ3QgYmUgc2VsZWN0
ZWQKPiB3aXRob3V0IGl0Lgo+CgpBaCwgSSdsbCBkcm9wIHRoYXQgcGFydCBmb3IgdjIuCgpUaGFu
a3MhIC8vIEpvaG4gRXJuYmVyZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
