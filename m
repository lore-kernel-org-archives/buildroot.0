Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3446C3DA45
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 10:25:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A9744149F;
	Wed, 10 Jul 2024 10:25:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j0cTMeGDfyyB; Wed, 10 Jul 2024 10:25:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6BE6413CB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6BE6413CB;
	Wed, 10 Jul 2024 10:25:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 818881BF86B
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 10:25:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D92060EB8
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 10:25:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qoq4Uu5prHut for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 10:25:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0B13A60762
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B13A60762
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0B13A60762
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 10:25:11 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-52e9a550e9fso660044e87.0
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 03:25:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720607109; x=1721211909;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fffns+0wpEXQ9e+GzcXdv7KsDa0H+UPaxJmGgbJFCks=;
 b=lhVcXZUUJnoT3tuKShf2Ad+xtNWoBMZJq1tVz4gy7uheQfi+U5WyNOTWbp/Mthu+wt
 oWTAY7ETgE+uBepKvDzI6k+AFgT6IDLx5AszmBjnz4iST6Oik7XQaXTGZbEFLxhvHm/l
 13dEv/88rGiWnkchVV+ylFvX0nuzu1dPd6KmYidTy5qwD2GZU4ORpM8hMSu/rFWPK8OY
 UrUmEeIZSl9JGGNEMWjBVAK68PX3A5J6ZYMcPOSfh8dn1aA4PC29CtYu+/jBJUFNVPwZ
 QuoYlcoHeOuaQWSIhBYfVnkXAjZbV259Q2dByOFQIV0xyBtttxhxWsGkUAlsj+wTL+LL
 hP5A==
X-Gm-Message-State: AOJu0YwDR8Qs/bmw4yQnqe9ffGF/B6frfBtE5B7nM9SVM7GhAPIi9Npg
 8Baq/5SvL1IbOxJe8ejKuXFO8z2TlZk3fwczqJaC6i5Nt80N4cBm3fT3aANuHnT1Gjdz4mpJktj
 4j1KvodBvFkBREC4KcbvPOO+H47N4zd38
X-Google-Smtp-Source: AGHT+IHA0vkbjt7+I9bytxXb89b9DPleHj8Ee/fxyWxwJqZSmB7ZdAd73ZzLWPkNEVtsfKxTq5xpBZCNU2gDv8vlpkQ=
X-Received: by 2002:ac2:5b9e:0:b0:52c:a070:944 with SMTP id
 2adb3069b0e04-52eb9d8fd3fmr1278033e87.23.1720607108735; Wed, 10 Jul 2024
 03:25:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240619073252.411472-1-yegorslists@googlemail.com>
In-Reply-To: <20240619073252.411472-1-yegorslists@googlemail.com>
Date: Wed, 10 Jul 2024 12:27:35 +0200
Message-ID: <CAGm1_ktR5h+VeV37voAzZ8jTugdMg=wWdzVWqSBN2w8Bi19uqQ@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1720607109; x=1721211909; darn=buildroot.org; 
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fffns+0wpEXQ9e+GzcXdv7KsDa0H+UPaxJmGgbJFCks=;
 b=X9iIf6E7T1ehpNT65C5mhcX0bDkvOdWxbUfiSD+BvIxTgXJrkozFKUZeA5Kx8hZSg2
 hhWcXAYebL8XJJk48hs2oPTV1zIEZiFlv3nf1zD0bvabOgvcfkVJ0y1HQFVwCmpJyJVN
 Fykpci3llKu+L2naHra47mDQbYngrd8WlNAcPNepo4PZqKJtnfVNZp8TW7k/zFA7fCsy
 RVtkxra0DBs+i3A9p+d0BmlEvf83bcmikFGAs49ezlqvermNASRz0W2c84CdS2Kbio52
 f6lpd10czscxwaUC4PIX00pCC/vjJ/onEDaNy+wczVrds5CyDTSr9GvkZFmQh2aT8hY9
 A02Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=X9iIf6E7
Subject: Re: [Buildroot] [PATCH] package/attr: add missing libgen.h header
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQWxsLAoKT24gV2VkLCBKdW4gMTksIDIwMjQgYXQgOTozM+KAr0FNIDx5ZWdvcnNsaXN0c0Bn
b29nbGVtYWlsLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBZZWdvciBZZWZyZW1vdiA8eWVnb3JzbGlz
dHNAZ29vZ2xlbWFpbC5jb20+Cj4KPiBSZXNvbHZlcyB0aGUgZm9sbG93aW5nIGVycm9yIHdoZW4g
YnVpbGRpbmcgYWdhaW5zdCBNVVNMOgo+Cj4gdG9vbHMvYXR0ci5jOiBJbiBmdW5jdGlvbiAnbWFp
bic6Cj4gdG9vbHMvYXR0ci5jOjY5OjIwOiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2Yg
ZnVuY3Rpb24gJ2Jhc2VuYW1lJwo+IFstV2ltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQo+
ICAgIDY5IHwgICAgICAgICBwcm9nbmFtZSA9IGJhc2VuYW1lKGFyZ3ZbMF0pOwo+ICAgICAgIHwg
ICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+Cj4gdG9vbHMvYXR0ci5jOjY5OjE4OiBlcnJvcjog
YXNzaWdubWVudCB0byAnY2hhciAqJyBmcm9tICdpbnQnIG1ha2VzCj4gcG9pbnRlciBmcm9tIGlu
dGVnZXIgd2l0aG91dCBhIGNhc3QgWy1XaW50LWNvbnZlcnNpb25dCj4gICAgNjkgfCAgICAgICAg
IHByb2duYW1lID0gYmFzZW5hbWUoYXJndlswXSk7Cj4gICAgICAgfCAgICAgICAgICAgICAgICAg
IF4KPgo+IFVwc3RyZWFtOiBodHRwczovL2xpc3RzLm5vbmdudS5vcmcvYXJjaGl2ZS9odG1sL2Fj
bC1kZXZlbC8yMDI0LTAzL21zZzAwMDAwLmh0bWwKClRoZSBwYXRjaCB3YXMgbWVyZ2VkIFsxXSB1
cHN0cmVhbSBidXQgdGhlcmUgaXMgc3RpbGwgbm8gbmV3IHJlbGVhc2UuCgpbMV0gaHR0cHM6Ly9n
aXQuc2F2YW5uYWgubm9uZ251Lm9yZy9jZ2l0L2F0dHIuZ2l0L2NvbW1pdC8/aWQ9OGE4MGQ4OTVk
ZmQ3NzkzNzMzNjNjM2E0YjYyZWNjZTVhNTQ5ZWZiMgoKWWVnb3IKCj4gRml4ZXM6IGh0dHA6Ly9h
dXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzL2M2MTIwNjk2OGVkYTk5MTNlMzdlOTVhNjFk
YzNlMTAzOTk1MDNmY2QvCj4KPiBTaWduZWQtb2ZmLWJ5OiBZZWdvciBZZWZyZW1vdiA8eWVnb3Jz
bGlzdHNAZ29vZ2xlbWFpbC5jb20+Cj4gLS0tCj4gIC4uLi1taXNzaW5nLWxpYmdlbi5oLWluY2x1
ZGUtZm9yLWJhc2VuYS5wYXRjaCB8IDMxICsrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNo
YW5nZWQsIDMxIGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvYXR0
ci8wMDAzLXRvb2xzLWF0dHIuYy1BZGQtbWlzc2luZy1saWJnZW4uaC1pbmNsdWRlLWZvci1iYXNl
bmEucGF0Y2gKPgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2F0dHIvMDAwMy10b29scy1hdHRyLmMt
QWRkLW1pc3NpbmctbGliZ2VuLmgtaW5jbHVkZS1mb3ItYmFzZW5hLnBhdGNoIGIvcGFja2FnZS9h
dHRyLzAwMDMtdG9vbHMtYXR0ci5jLUFkZC1taXNzaW5nLWxpYmdlbi5oLWluY2x1ZGUtZm9yLWJh
c2VuYS5wYXRjaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uYjQw
MTIyOTdlNgo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL2F0dHIvMDAwMy10b29scy1h
dHRyLmMtQWRkLW1pc3NpbmctbGliZ2VuLmgtaW5jbHVkZS1mb3ItYmFzZW5hLnBhdGNoCj4gQEAg
LTAsMCArMSwzMSBAQAo+ICtGcm9tIGZlN2ZiYzJiNjY2ZjBkYWFkNWI3YmIwYjFlOGViMjI2MWNm
MTY1MzAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gK0Zyb206IFllZ29yIFllZnJlbW92IDx5
ZWdvcnNsaXN0c0Bnb29nbGVtYWlsLmNvbT4KPiArRGF0ZTogV2VkLCAxOSBKdW4gMjAyNCAwOToy
MTozNCArMDIwMAo+ICtTdWJqZWN0OiBbUEFUQ0hdIHRvb2xzL2F0dHIuYzogQWRkIG1pc3Npbmcg
bGliZ2VuLmggaW5jbHVkZSBmb3IgYmFzZW5hbWUoMykKPiArCj4gK0ZpeGVzIGNvbXBpbGF0aW9u
IGlzc3VlIHdpdGggbXVzbCBhbmQgbW9kZXJuIEM5OSBjb21waWxlcnMuCj4gKwo+ICtTZWU6IGh0
dHBzOi8vYnVncy5nZW50b28ub3JnLzkyNjI5NAo+ICsKPiArVXBzdHJlYW06IGh0dHBzOi8vbGlz
dHMubm9uZ251Lm9yZy9hcmNoaXZlL2h0bWwvYWNsLWRldmVsLzIwMjQtMDMvbXNnMDAwMDAuaHRt
bAo+ICsKPiArU2lnbmVkLW9mZi1ieTogWWVnb3IgWWVmcmVtb3YgPHllZ29yc2xpc3RzQGdvb2ds
ZW1haWwuY29tPgo+ICstLS0KPiArIHRvb2xzL2F0dHIuYyB8IDEgKwo+ICsgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspCj4gKwo+ICtkaWZmIC0tZ2l0IGEvdG9vbHMvYXR0ci5jIGIvdG9v
bHMvYXR0ci5jCj4gK2luZGV4IGYxMmU0YWYuLjZhM2MxZTkgMTAwNjQ0Cj4gKy0tLSBhL3Rvb2xz
L2F0dHIuYwo+ICsrKysgYi90b29scy9hdHRyLmMKPiArQEAgLTI4LDYgKzI4LDcgQEAKPiArICNp
bmNsdWRlIDxlcnJuby5oPgo+ICsgI2luY2x1ZGUgPHN0cmluZy5oPgo+ICsgI2luY2x1ZGUgPGxv
Y2FsZS5oPgo+ICsrI2luY2x1ZGUgPGxpYmdlbi5oPgo+ICsKPiArICNpbmNsdWRlIDxhdHRyL2F0
dHJpYnV0ZXMuaD4KPiArCj4gKy0tCj4gKzIuMzQuMQo+ICsKPiAtLQo+IDIuMzQuMQo+Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
