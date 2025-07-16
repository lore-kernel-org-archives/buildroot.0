Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C8E7C83F22
	for <buildroot@archiver.kernel.org>; Wed, 16 Jul 2025 13:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AEE983DDE;
	Wed, 16 Jul 2025 13:35:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fEaEF6tu1-0h; Wed, 16 Jul 2025 13:35:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5101D83DD6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5101D83DD6;
	Wed, 16 Jul 2025 13:35:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8AE1F1514
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 13:35:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7BB7060AAE
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 13:35:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jXDe7ITkVRya for <buildroot@buildroot.org>;
 Wed, 16 Jul 2025 13:35:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=gero.schwaericke@sevenlab.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 704D860634
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 704D860634
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 704D860634
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 13:35:31 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-6077dea37easo11691519a12.3
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 06:35:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752672929; x=1753277729;
 h=in-reply-to:references:from:to:cc:subject:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=4g3EEdsbLk5SwldJexXacth33EP1QpzHVBk/gRmdRRs=;
 b=lxP6JfheXr5bPNxXTwuGAxuFby0P036aUzWCN9BdiAMv2dmo1pdk0GmtTGivZ4Smv3
 Ua9pT0rs0ddhE2MxNbyU/xbfRsOwcZ1Qw10pf2O/9gEyIK4hI8uvlJ6Un4IuwtS/JiDR
 DYZ8+QHTpnf7GO1u06sOoikUHLId3Gn/bjGjyG7xgWGBVHo21g7n+tdjnrolJ3aWGRcR
 LdC8uNzNT4QTgAOSGgHttZwNmDp7P68vYu3YZMqUzmlJDGIvwPyY6U9N+jmjBgaKTn67
 RKfmsl7LYvDooWUExLyR4RBP93eIgjHe86a1xt0oWYZXzFyHPS9bG9Lxx59vykJxIcRE
 07JQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkiFfq5WgByuNER5wOW6Hh2g0aTZAKtIOEHQY9q32KkBOEl0nOnccmjoyXS2rO0nR5HhugpzlKO4g=@buildroot.org
X-Gm-Message-State: AOJu0YwPxB9Qq8rq4bvYHrzVqiPNkXQToogBv/oG10xh4zaqHjHzXf88
 rlL/N6tHoZMUG9HhIBBll53cC36QfFifPA2NrQbnosEdFEv6cCTdetH6Y4ZL1sQmnrWQGVP/yUA
 3XOpb
X-Gm-Gg: ASbGnctPwvrGbzdXmNzhXQWjnsfLlyHpH4V75fJPxE5VROCoYryZWHfTj48KOoY17Z+
 5aJqIySEpsakNiLyFJ+ThpoXpPSGtPiEU/s++yLtQa84Ccq9SMFeoI5d/QhR9iF6CJr4aFXb3BW
 aQbneruYuOdcl266UecwHA/LOTfZQbStBXg5h4bniGXe63A0gsMLNhLz9P81W0PkYbD4F4uAezG
 SpqA6/t9EK76mU+OD490SC9vwazgrWVKvlSQAAiWTZyvx2JBLBS9G7HOYSTVdmIjCwqq1mpGtLC
 bt47aPtdyxPfY/rPtdM31paQ2UTp3q9W6fBg5+L0aLThz9M8Rbc0XHDoBGdyz0KgNed/2KahRHc
 K7HE89ffTkYl4YFpmOiZpqRoafinK7ETOnAH+5kQh/yrMnA==
X-Google-Smtp-Source: AGHT+IEaMsXB2u8ETTqGZ8KxkHW/KQSCsnG7K2jtP4jR4r/blKNPcru3YjoL1J28S0+qSut1rgiYfg==
X-Received: by 2002:a05:6402:278f:b0:601:fd36:6ee1 with SMTP id
 4fb4d7f45d1cf-612858138e5mr2477615a12.0.1752672929265; 
 Wed, 16 Jul 2025 06:35:29 -0700 (PDT)
Received: from localhost ([2a02:8109:8a91:de00:4226:6562:cd55:1257])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-611c976ec04sm8665124a12.60.2025.07.16.06.35.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jul 2025 06:35:28 -0700 (PDT)
Mime-Version: 1.0
Date: Wed, 16 Jul 2025 15:35:28 +0200
Message-Id: <DBDIP7YD1MDH.2ZH98MITNKUJW@sevenlab.de>
Cc: "Colin Foster" <colin.foster@in-advantage.com>
To: "Marcus Hoffmann" <buildroot@bubu1.eu>, <buildroot@buildroot.org>
From: =?utf-8?q?Gero_Schw=C3=A4ricke?= <gero.schwaericke@sevenlab.de>
X-Mailer: aerc 0.20.1-26-gcbffbc9ac803
References: <20250715160149.2886803-1-gero.schwaericke@sevenlab.de>
 <d0473d32-8362-4c92-be5e-1cb82c370c4e@bubu1.eu>
In-Reply-To: <d0473d32-8362-4c92-be5e-1cb82c370c4e@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sevenlab-de.20230601.gappssmtp.com; s=20230601; t=1752672929; x=1753277729;
 darn=buildroot.org; 
 h=in-reply-to:references:from:to:cc:subject:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4g3EEdsbLk5SwldJexXacth33EP1QpzHVBk/gRmdRRs=;
 b=ZxocvUtvD0yUaTpZxlFJa2K8FskfdxJDnlEqEt1K+cb5d/faegys1uzMo+Q6xAbWs/
 Ao7wJpK51Ft3SsT1PFwfYOFQBWVfJKop3tH4yThBS5Q+ophsdYqwsxQiy5uOKpaD5YaZ
 721Gp/vQi6v8200vbqfeiMsIztjMjVm7GBD4O1AgH5eCibAbpCJvIwZ9yT674tagOQ6f
 3Afo9RmKq2hnON+c8o50J3oq+KKKGsX3W4MMqycgfMMGaDuHWZa8ffdAhabAW3S9rPeR
 VE1d+sYFivORI9ULrzN/ABkE8Bz6Q2bwHXn23J+2YXTUg/Yf1LUBq+mGYClDv1OD6Ub1
 /tbA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=sevenlab.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=sevenlab-de.20230601.gappssmtp.com
 header.i=@sevenlab-de.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=ZxocvUtv
Subject: Re: [Buildroot] [PATCH] package/rauc-hawkbit-updater: fix missing
 user
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

SGkgTWFyY3VzLAoKT24gVHVlIEp1bCAxNSwgMjAyNSBhdCA4OjAyIFBNIENFU1QsIE1hcmN1cyBI
b2ZmbWFubiB3cm90ZToKPiBIaSBHZXJvLAo+Cj4gSSBmb3VuZCBhbG1vc3QgZXhhY3RseSB0aGlz
IGNoYW5nZSBpbiBvdXIgbG9jYWwgcGF0Y2hlcyByZWNlbnRseSBidXQgCj4gZGlkbid0IGdldCBh
cm91bmQgdG8gdXBzdHJlYW1pbmcgdGhpcyB5ZXQuLi4gb29wcy4KPgo+IFNtYWxsIG5vdGUgYmVs
b3cgZm9yIHNvbWV0aGluZyB0aGF0IHNob3VsZCBwcm9iYWJseSBiZSBjaGFuZ2VkIGZvciAKPiBj
b25zaXN0ZW5jeS4KPgo+IE9uIDE1LjA3LjI1IDE4OjAwLCBHZXJvIFNjaHfDpHJpY2tlIHdyb3Rl
Ogo+PiBTeXN0ZW1kIHN1cHBvcnQgZm9yIHRoZSBSQVVDIGhhd2tiaXQgdXBkYXRlciB3YXMgYWRk
ZWQgaW4KPj4gCj4+ICAgIDRhYTdhNGFkOGEgKHBhY2thZ2UvcmF1Yy1oYXdrYml0LXVwZGF0ZXI6
IGFkZCBzeXN0ZW1kIG9wdGlvbmFsIGRlcGVuZGVuY3ksIDIwMjQtMDctMTApCj4+IAo+PiBUaGlz
IGluc3RhbGxzIHRoZSBSQVVDIGhhd2tiaXQgdXBkYXRlciBzZXJ2aWNlLCB3aGljaCBleGVjdXRl
cyBhcyB1c2VyCj4+ICJyYXVjLWhhd2tiaXQiIFsxXSwgd2hpY2ggZG9lc24ndCBleGlzdCBieSBk
ZWZhdWx0Lgo+PiAKPj4gWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9yYXVjL3JhdWMtaGF3a2JpdC11
cGRhdGVyL2Jsb2IvMjcxMWMwZTAyNzgxZWI5ZDk3Mjg1Yzg3MTk3ZjFiYWZlZjc1ZDBkMS9zY3Jp
cHQvcmF1Yy1oYXdrYml0LXVwZGF0ZXIuc2VydmljZQo+PiAKPj4gU2lnbmVkLW9mZi1ieTogR2Vy
byBTY2h3w6RyaWNrZSA8Z2Vyby5zY2h3YWVyaWNrZUBzZXZlbmxhYi5kZT4KPgo+IFJldmlld2Vk
LWJ5OiBNYXJjdXMgSG9mZm1hbm4gPGJ1aWxkcm9vdEBidWJ1MS5ldT4KPj4gLS0tCj4+ICAgcGFj
a2FnZS9yYXVjLWhhd2tiaXQtdXBkYXRlci9yYXVjLWhhd2tiaXQtdXBkYXRlci5tayB8IDQgKysr
Kwo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPj4gCj4+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL3JhdWMtaGF3a2JpdC11cGRhdGVyL3JhdWMtaGF3a2JpdC11cGRhdGVyLm1rIGIv
cGFja2FnZS9yYXVjLWhhd2tiaXQtdXBkYXRlci9yYXVjLWhhd2tiaXQtdXBkYXRlci5tawo+PiBp
bmRleCBkYTFjMDIwYmI2Li41ZWU4NDE0YjkxIDEwMDY0NAo+PiAtLS0gYS9wYWNrYWdlL3JhdWMt
aGF3a2JpdC11cGRhdGVyL3JhdWMtaGF3a2JpdC11cGRhdGVyLm1rCj4+ICsrKyBiL3BhY2thZ2Uv
cmF1Yy1oYXdrYml0LXVwZGF0ZXIvcmF1Yy1oYXdrYml0LXVwZGF0ZXIubWsKPj4gQEAgLTE1LDYg
KzE1LDEwIEBAIFJBVUNfSEFXS0JJVF9VUERBVEVSX0NGTEFHUyA9ICQoVEFSR0VUX0NGTEFHUykg
LXN0ZD1jOTkKPj4gICBpZmVxICgkKEJSMl9QQUNLQUdFX1NZU1RFTUQpLHkpCj4+ICAgUkFVQ19I
QVdLQklUX1VQREFURVJfREVQRU5ERU5DSUVTICs9IHN5c3RlbWQKPj4gICBSQVVDX0hBV0tCSVRf
VVBEQVRFUl9DT05GX09QVFMgKz0gLURzeXN0ZW1kPWVuYWJsZWQKPj4gKyMgcmF1Yy1oYXdrYml0
LXVwZGF0ZXIuc2VydmljZSB1c2VzIHRoaXMgdXNlciBhbmQgZ3JvdXAKPj4gK2RlZmluZSBSQVVD
X0hBV0tCSVRfVVBEQVRFUl9VU0VSUwo+PiArCXJhdWMtaGF3a2JpdCAtMSByYXVjLWhhd2tiaXQg
LTEgISAtIC0gLSBSQVVDIEhhd2tiaXQgVXBkYXRlcgo+Cj4gT3RoZXIgX1VTRVJTIGRlZmluaXRp
b25zIGluIGJ1aWxkcm9vdCBhbGwgdXNlICogaW5zdGVhZCBvZiAhIGZvciB0aGUgCj4gcGFzc3dv
cmQgZmllbGQuIE5vdCBzdXJlIGlmIHRoYXQgbWFrZXMgYW55IGRpZmZlcmVuY2UgaW4gcGFzc3dv
cmQgYnV0IAo+IChmcm9tIHNoYWRvdyg1KSkgdGhlIGNvbnZlbnRpb24gc2VlbXMgdG8gYmUgdGhh
dCB0aGUgJyEnIHByZWZpeCBpcyAKPiBzcGVjaWZpY2FsbHkgZm9yIGxvY2tlZCBhY2NvdW50cy4K
PgoKVGhhbmtzIGZvciB0aGUgaGludCEgSSBjb3JyZWN0ZWQgdGhpcyBpbiB2MiBvZiB0aGUgcGF0
Y2guCgpCZXN0LApHZXJvCgo+PiArZW5kZWYKPj4gICBlbHNlCj4+ICAgUkFVQ19IQVdLQklUX1VQ
REFURVJfQ09ORl9PUFRTICs9IC1Ec3lzdGVtZD1kaXNhYmxlZAo+PiAgIGVuZGlmCj4KPiBCZXN0
LAo+IE1hcmN1cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
