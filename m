Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F40F7FCC066
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA168614A1;
	Fri,  6 Mar 2026 19:53:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fiUWkKVJal-k; Fri,  6 Mar 2026 19:53:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAD31613FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826800;
	bh=79Kp+ml6eLBvNJaJhXPgKJuWLXPwhVIst+qhbB6yhIo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Jx/VF+PLwnyjM6NvWQwQjRWoL67HD9cFPMB89YV8g8fAG+rvnjkJr12jPvkDV3lWJ
	 EPZJhqn22f82FRjj0Gglc50HfSLg83NSx0/8Ot1fNKk+47kSfShuyLoxqRlJ1GXWEq
	 YYqX/sVoxDzj79rtQV2hKoIAMsXuZzT1hMHEQ3XuRIKAASZ50hhCym/gpO2AAdV2Io
	 DNxrVwHnKmc3dWbcIy7oHoIf4ktEOJSkWTeFrLrl44f0gE5uNpCAzd0IlJq12nc2DD
	 5qtwWl8K+Rkg+5Xqu8oAhkb4BA4ARqXsvRzt2cKF2yhLio40BOVjPtPqI022H+Iq2c
	 mmjKNAnh589lw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAD31613FF;
	Fri,  6 Mar 2026 19:53:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 53B3F169
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3999B83D65
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9eA61pvzilR5 for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:53:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3288E83D56
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3288E83D56
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3288E83D56
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:14 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-439b8a3f2bcso4674148f8f.3
 for <buildroot@buildroot.org>; Fri, 06 Mar 2026 11:53:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772826792; x=1773431592;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Bg38UC2vHKjDsxfkV0H5tlRhjPaGxC2l9ou9c0FVADo=;
 b=alK5dhr/6QuRsAQGu0qIIkSHY3QxQTPZNoO4YQ/ZuGwWFmMOhd3fToigXNW7PQvdho
 +mgb+lD9vkvboXzC9sN44RWRRnH5LYc+KL1jujdtLUe2ZP/F5HeQ3h+YyJjdFaIXYC7d
 bAv+/YWEgXtkfgdqcpB5aAgTF+vksXCSzmukWYH7oqImYqmuNLSaEQW/tET04HLEHC/M
 X8z2iA9VF1Dq2jnZGldGyY7Sp7HYnfpSqPBW2lPLYWsGr9AJ6OA2tSgeqqrMtMT5S1cZ
 3OTdufHHLYwlsSaX8Qd81GjsWfsJfKRtqcD4nC0O3wHKtiOlx4el9+chu3S3iX7YQygy
 HrUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXT2zb5QvfzVYwiPxz/8VHnrQfvBICkh7S2HcDkl/8AFrHo0zTqhgzpEnwdsdKbzzQxdSboyxsfS5k=@buildroot.org
X-Gm-Message-State: AOJu0Yxqdr+ap5y2QwMomRFR1VxTKOeXkjP3Kh5QwJ4wQofY9hRq5XTq
 sb+rvo/hyaJbaB/Lo5jWTYscfl/4QZP1QUCMmGaJCYf7OV3BgcGIcyv4tTmN/qKoqLo=
X-Gm-Gg: ATEYQzypS6W1CafSyo7KHYitOobpuRJ21+PltzblGx4snU88P5L2xIaufID8dQz/v2E
 wl/SsesYT5jVuLQZLFYx9toiMGwJb36cY6emY55IutMv/LIBcRRuXPHfwMublcMjykAvXDI9P53
 C2YxOei9+DjWS3sKQMNjS60U+aQS4zeruHxXYDQ55WffMlfG4gwJaMrZ6NJ35VZS40U1K99wHNQ
 uZ1nQ4KGzgct/dqcTwzlIQAy3FtUid1WnJ4LUB6lwmM9A3tht13Fe+jo460k0EOjo6wZ9wCNEoi
 2WKqpX3fwvYtr10Uqlv9SaiMTQFgLR8XSKna8BPPTKgQUSCwr1dRQTsDoQgE/7tJVUQo9/gGTAa
 tKeVaobjQxG7IQyCRge3Ncd9TwTcK0zBE07DjidFrELB+Jk53tYHfAnBqTyqkl6F0QSmXOG15QX
 t2CBIuMEHyPSiZ+8o=
X-Received: by 2002:a05:6000:2302:b0:439:b62d:be86 with SMTP id
 ffacd0b85a97d-439da8955bemr6079688f8f.47.1772826792031; 
 Fri, 06 Mar 2026 11:53:12 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae2b9d8sm6038575f8f.21.2026.03.06.11.53.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 11:53:11 -0800 (PST)
To: =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  6 Mar 2026 20:53:10 +0100
Message-ID: <20260306195311.7751-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260228090327.1810619-1-lazzer@gmail.com>
References: <20260228090327.1810619-1-lazzer@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772826792; x=1773431592; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bg38UC2vHKjDsxfkV0H5tlRhjPaGxC2l9ou9c0FVADo=;
 b=bFjHZJ3iHtrdyR7OgiFth2pb/EYD66u5QqGBj4NRknVoR5Y5NR5JKYMOKMOiWj3RAd
 nkCeKxE7LRFJmqXvyDl+ISPxkLeW+ETGiGI+LHa2/6A+ida57EUBX0fNbrmCOHUbPIk3
 ZNYDZ5816Sk/wuGqs96diEF5ld25WsZsrgp8km3JnkwSk+xEf+dfyS6K0Kl9A0Z9WnHO
 Jlp8rstNhAa8QQyR3dXFsk+fWHQAoMEZnNnEayho2EtoetOdBm5LIpe1lScTQFWElxGs
 m+siuYHK/mgwvJ0Uxe8XXHGROySxHiVKBQS2uUFLb5V5f/SQmqY/bBiJ9+cO2s4moaEB
 b9jA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bFjHZJ3i
Subject: Re: [Buildroot] [PATCH 1/1] package/libssh: Security bump to 0.11.4
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

SW4gcmVwbHkgb2Y6Cj4gQ1ZFLTIwMjUtMTQ4MjE6IGxpYnNzaCBsb2FkcyBjb25maWd1cmF0aW9u
IGZpbGVzIGZyb20gdGhlIEM6XGV0YyBkaXJlY3RvcnkKPiBvbiBXaW5kb3dzCj4gQ1ZFLTIwMjYt
MDk2NDogU0NQIFByb3RvY29sIFBhdGggVHJhdmVyc2FsIGluIHNzaF9zY3BfcHVsbF9yZXF1ZXN0
KCkKPiBDVkUtMjAyNi0wOTY1OiBQb3NzaWJsZSBEZW5pYWwgb2YgU2VydmljZSB3aGVuIHBhcnNp
bmcgdW5leHBlY3RlZAo+IGNvbmZpZ3VyYXRpb24gZmlsZXMKPiBDVkUtMjAyNi0wOTY2OiBCdWZm
ZXIgdW5kZXJmbG93IGluIHNzaF9nZXRfaGV4YSgpIG9uIGludmFsaWQgaW5wdXQKPiBDVkUtMjAy
Ni0wOTY3OiBTcGVjaWFsbHkgY3JhZnRlZCBwYXR0ZXJucyBjb3VsZCBjYXVzZSBEb1MKPiBDVkUt
MjAyNi0wOTY4OiBPT0IgUmVhZCBpbiBzZnRwX3BhcnNlX2xvbmduYW1lKCkKPiBsaWJzc2gtMjAy
Ni1zZnRwLWV4dGVuc2lvbnM6IFJlYWQgYnVmZmVyIG92ZXJydW4gd2hlbiBoYW5kbGluZyBTRlRQ
Cj4gZXh0ZW5zaW9ucwo+IAo+IFNpZ25lZC1vZmYtYnk6IE1hdHRpYXMgV2Fsc3Ryw7ZtIDxsYXp6
ZXJAZ21haWwuY29tPgoKQXBwbGllZCB0byAyMDI1LjAyLnggJiAyMDI1LjExLnguIFRoYW5rcwoK
PiAtLS0KPiAgcGFja2FnZS9saWJzc2gvbGlic3NoLmhhc2ggfCAyICstCj4gIHBhY2thZ2UvbGli
c3NoL2xpYnNzaC5tayAgIHwgMiArLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJzc2gvbGlic3No
Lmhhc2ggYi9wYWNrYWdlL2xpYnNzaC9saWJzc2guaGFzaAo+IGluZGV4IDFjMTVkNzdhNDUuLmYy
NTkyNjE0NDQgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9saWJzc2gvbGlic3NoLmhhc2gKPiArKysg
Yi9wYWNrYWdlL2xpYnNzaC9saWJzc2guaGFzaAo+IEBAIC0xLDUgKzEsNSBAQAo+ICAjIExvY2Fs
bHkgY2FsY3VsYXRlZCBhZnRlciBjaGVja2luZyBwZ3Agc2lnbmF0dXJlCj4gICMgaHR0cHM6Ly93
d3cubGlic3NoLm9yZy9maWxlcy8wLjExL2xpYnNzaC0wLjExLjMudGFyLnh6LmFzYwo+ICAjIHdp
dGgga2V5IDg4QTIyOEQ4OUIwN0MyQzc3RDBDNzgwOTAzRDVERjhDRkREM0U4RTcKPiAtc2hhMjU2
ICA3ZDhhMTM2MWJiMDk0ZWMzZjUxMTk2NGU3OGE1YTRkYmE2ODliNTk4NmUxMTJhZmFiZTRmNGQw
ZDZjNjEyNWMzICBsaWJzc2gtMC4xMS4zLnRhci54ego+ICtzaGEyNTYgIDAwMmFjMzIwZTNkNjZj
OWUxMDBlYzY1NzZlM2U4NGFhMGM0ODk0OWVmZGUzYmY1YjQwYTI4MDI5OTIyOTc3MDEgIGxpYnNz
aC0wLjExLjQudGFyLnh6Cj4gIHNoYTI1NiAgMTY1NjE4NmU5NTFkYjFjMDEwYTg0ODU0ODFmYTk0
NTg3ZjdlNTNhMjZkMjQ5NzZiZWY5Nzk0NWFkMGM0ZGY1YSAgQ09QWUlORwo+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL2xpYnNzaC9saWJzc2gubWsgYi9wYWNrYWdlL2xpYnNzaC9saWJzc2gubWsKPiBp
bmRleCAzYzdlNzdhMjA2Li41NmRlNjZkNmVhIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbGlic3No
L2xpYnNzaC5tawo+ICsrKyBiL3BhY2thZ2UvbGlic3NoL2xpYnNzaC5tawo+IEBAIC01LDcgKzUs
NyBAQAo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAKPiAgTElCU1NIX1ZFUlNJT05fTUFK
T1IgPSAwLjExCj4gLUxJQlNTSF9WRVJTSU9OID0gJChMSUJTU0hfVkVSU0lPTl9NQUpPUikuMwo+
ICtMSUJTU0hfVkVSU0lPTiA9ICQoTElCU1NIX1ZFUlNJT05fTUFKT1IpLjQKPiAgTElCU1NIX1NP
VVJDRSA9IGxpYnNzaC0kKExJQlNTSF9WRVJTSU9OKS50YXIueHoKPiAgTElCU1NIX1NJVEUgPSBo
dHRwczovL3d3dy5saWJzc2gub3JnL2ZpbGVzLyQoTElCU1NIX1ZFUlNJT05fTUFKT1IpCj4gIExJ
QlNTSF9MSUNFTlNFID0gTEdQTC0yLjEKPiAtLSAKPiAyLjQzLjAKPiAKPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
