Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BDB2C5B555
	for <buildroot@archiver.kernel.org>; Fri,  6 Jun 2025 13:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2304B820F1;
	Fri,  6 Jun 2025 13:43:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3hhpD4o8qTtf; Fri,  6 Jun 2025 13:43:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48C4681E79
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48C4681E79;
	Fri,  6 Jun 2025 13:43:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DA4681A4
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 13:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CBE0940194
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 13:43:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fngkCUkpJfji for <buildroot@buildroot.org>;
 Fri,  6 Jun 2025 13:43:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=fred.lefranc.evs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D5998400AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5998400AB
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D5998400AB
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 13:43:27 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-ad89f9bb725so390937966b.2
 for <buildroot@buildroot.org>; Fri, 06 Jun 2025 06:43:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749217406; x=1749822206;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xpkQR91g8OQ6SJ4EfVOby+NDaa1fgLF5yLp0Hyuf5ug=;
 b=XU46X6ZIxqTfh5enmh5Btu8VfPpJq2pFX1OdHEg+3Z5nOt4jL/pVu8V6ZyiV3W1cCj
 ecK4RGWZxFKOWfEOPEx3SSOHY7JN6kLqhwFyxVboHR1UC8LNaHinGWb9pOL6sOIGcgx/
 1txEYJWSTr7KXzpzKtjVymIoP2u0QMW4BCe1daLrsW1AE9Ofm7KtMfAZTij9ay6cO2C2
 2LsKLnlAgbI/4KM9ogn6+v3bCVyZsL2saGae4WltjqKpVA02I46QIGs7ufYE87DthkFG
 v+lYTJCm8IFWt21376WbK7KnD3J3hwsRMqU9dTYbOUpfEAealoR0YTW6/VXeRuPLY41Z
 3UmQ==
X-Gm-Message-State: AOJu0Yxk/kiXWSXLrhjqvFXbdETozIKcwQoIE5cv2uoc7D8AFnxQ27k8
 YlVkb48oEEJ2hs3H4O+b1IU0gSmoOeC2SRzl/ki0XODNaNmRjzlLrEDM1s5Lj1I1rttLMXDWJ9Z
 u3tiCVvOksu2Ab+Y151JkqocslppS5mHPIIoA
X-Gm-Gg: ASbGnct9sygfbS9xrV01ZOijz/12kOoOHuHdHZGwh/ZzRi5Lw+NPmn7GutH6T2Pxzti
 n8k2KTPqPu3aNka9tpzdturx8x8vb8Dwsd0MHCbFcuaAwcwBakwe/zOa9VSqoakj2UyCHMWu/go
 waEiOfGPNdEneiZS0pzKEq2HyomzMGhuW4Qw==
X-Google-Smtp-Source: AGHT+IEKg0gtOdkgvbVKgj87g6jjErwZRG44DHrRei9YnA/MrNGyZ2g/vGukH1egMX3pudbt3vR5B3ZqWQNM4Y+aat0=
X-Received: by 2002:a17:907:3f26:b0:ade:9fb:b0ad with SMTP id
 a640c23a62f3a-ade1a8d9af4mr302490666b.2.1749217405479; Fri, 06 Jun 2025
 06:43:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAGkXw1Up7cdAP2J8cBOsm8oXzjD=3Yu-qQOVjvPYehwCY_1SZg@mail.gmail.com>
In-Reply-To: <CAGkXw1Up7cdAP2J8cBOsm8oXzjD=3Yu-qQOVjvPYehwCY_1SZg@mail.gmail.com>
From: Fred Lefranc <fred.lefranc.evs@gmail.com>
Date: Fri, 6 Jun 2025 15:43:14 +0200
X-Gm-Features: AX0GCFuwSMBendR9B_rJAYiuLNAFlJEceOuJJy6LUKtvAiLmnUO_o3MEvwuaB9g
Message-ID: <CAGkXw1V1t1GRHFn_+=zLyp3TnTe0BXvhGmcGiX8NS3US1N8DFA@mail.gmail.com>
To: buildroot@buildroot.org
Cc: Maxim Kochetkov <fido_max@inbox.ru>, Julien Olivain <ju.o@free.fr>, 
 Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749217406; x=1749822206; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xpkQR91g8OQ6SJ4EfVOby+NDaa1fgLF5yLp0Hyuf5ug=;
 b=IY0aBQvTM9+iwxY+XFzXFfqY64za3wb3ZMc88MO+SX4R2uY8n/oh28TkgJqUo3RmoC
 p7XnTY4NgEQkUwIXyVI/fwrmb6N9uk8VSmN76+3DFJgUyNQFhuSPlt7yg4z/v8Mlz5Xz
 3fTWIIF01AL8TaeWsJx1Np+4LSUpJ+rs5oAhFwqDQilJ8I0gIED/aF4NLt9WegXjajy1
 WaEX8sXUdr+St1E3MYeKwOu2OldHLm5cPG1n2G1yzMOH8BuZKzXGt5E4/zxd/kIix/AL
 pLxvItgFidQxM5tac1H5hOqGaw7wPe38djNu1NhZbTdQgFF89I3KiDITx8RmxFV070ql
 gQpw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IY0aBQvT
Subject: Re: [Buildroot] [PATCH 001/386] package/libmodsecurity: security
 bump to 3.0.14
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

UGxlYXNlIGlnbm9yZSB0aGUgcGF0Y2gsIHRoZSB0aXRsZSBoYXMgYmVlbiBmb3JtYXR0ZWQgaW5j
b3JyZWN0bHkuCgpBIG5ldyB2ZXJzaW9uIHdpbGwgY29tZS4gU29ycnkgZm9yIHRoZSBpbmNvbnZl
bmllbmNlCgpGcmVkCgpPbiBGcmksIEp1biA2LCAyMDI1IGF0IDM6MzbigK9QTSBGcmVkIExlZnJh
bmMgPGZyZWQubGVmcmFuYy5ldnNAZ21haWwuY29tPiB3cm90ZToKPgo+IENoYW5nZWxvZzogaHR0
cDovL3d3dy5oYXByb3h5Lm9yZy9kb3dubG9hZC8yLjYvc3JjL0NIQU5HRUxPRwo+IFNpZ25lZC1v
ZmYtYnk6IEZyZWQgTGVmcmFuYyA8ZnJlZC5sZWZyYW5jK2V2c0BnbWFpbC5jb20+Cj4gLS0tCj4g
IHBhY2thZ2UvaGFwcm94eS9oYXByb3h5Lmhhc2ggfCA0ICsrLS0KPiAgcGFja2FnZS9oYXByb3h5
L2hhcHJveHkubWsgICB8IDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9oYXByb3h5L2hhcHJveHku
aGFzaCBiL3BhY2thZ2UvaGFwcm94eS9oYXByb3h5Lmhhc2gKPiBpbmRleCA3NDM5MGMyZmY1Li40
MmYzNDBmYTgwIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvaGFwcm94eS9oYXByb3h5Lmhhc2gKPiAr
KysgYi9wYWNrYWdlL2hhcHJveHkvaGFwcm94eS5oYXNoCj4gQEAgLTEsNSArMSw1IEBACj4gLSMg
RnJvbTogaHR0cDovL3d3dy5oYXByb3h5Lm9yZy9kb3dubG9hZC8yLjYvc3JjL2hhcHJveHktMi42
LjE1LnRhci5nei5zaGEyNTYKPiAtc2hhMjU2ICA0MWY4ZTE2OTVlOTJmYWZkZmZlMzk2OTBhNjg5
OTNmMWEwZjVmN2YwNjkzMWE5OWU5YTE1M2Y3NDllYTM5Y2ZkCj4gIGhhcHJveHktMi42LjE1LnRh
ci5nego+ICsjIEZyb206IGh0dHA6Ly93d3cuaGFwcm94eS5vcmcvZG93bmxvYWQvMi42L3NyYy9o
YXByb3h5LTIuNi4yMi50YXIuZ3ouc2hhMjU2Cj4gK3NoYTI1NiAgNGMwNzk3ZjQ1MGY5OTdkYzI4
N2QyYzdhYWZhN2EwZTViN2EyZDcxNTkzYTJjZDU4ZTY2NGU4ZjNhZWE2MTRmYQo+ICBoYXByb3h5
LTIuNi4yMi50YXIuZ3oKPiAgIyBMb2NhbGx5IGNvbXB1dGVkOgo+ICBzaGEyNTYgIDA3MTdjYTUx
ZmNlYWEyNWFjOWU1Y2NjNjJlMGM3MjdkY2YyNzc5NjA1NzIwMWZiNWZkZWQ1NmEyNWZmNmNhMjgK
PiAgTElDRU5TRQo+ICBzaGEyNTYgIDVkZjA3MDA3MTk4OTg5YzYyMmY1ZDQxZGU4ZDcwM2U3YmVm
M2QwZTc5ZDYyZTI0MzMyZWU3MzlhNDUyYWY2MmEKPiAgZG9jL2xncGwudHh0Cj4gZGlmZiAtLWdp
dCBhL3BhY2thZ2UvaGFwcm94eS9oYXByb3h5Lm1rIGIvcGFja2FnZS9oYXByb3h5L2hhcHJveHku
bWsKPiBpbmRleCA2MWE5ZWJlYmU0Li43NzE5NWQ5NjZiIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uv
aGFwcm94eS9oYXByb3h5Lm1rCj4gKysrIGIvcGFja2FnZS9oYXByb3h5L2hhcHJveHkubWsKPiBA
QCAtNSw3ICs1LDcgQEAKPiAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPgo+ICBIQVBST1hZX1ZF
UlNJT05fTUFKT1IgPSAyLjYKPiAtSEFQUk9YWV9WRVJTSU9OID0gJChIQVBST1hZX1ZFUlNJT05f
TUFKT1IpLjE1Cj4gK0hBUFJPWFlfVkVSU0lPTiA9ICQoSEFQUk9YWV9WRVJTSU9OX01BSk9SKS4y
Mgo+ICBIQVBST1hZX1NJVEUgPSBodHRwOi8vd3d3LmhhcHJveHkub3JnL2Rvd25sb2FkLyQoSEFQ
Uk9YWV9WRVJTSU9OX01BSk9SKS9zcmMKPiAgSEFQUk9YWV9MSUNFTlNFID0gR1BMLTIuMCsgYW5k
IExHUEwtMi4xKyB3aXRoIGV4Y2VwdGlvbnMKPiAgSEFQUk9YWV9MSUNFTlNFX0ZJTEVTID0gTElD
RU5TRSBkb2MvbGdwbC50eHQgZG9jL2dwbC50eHQKPiAtLQo+IDIuMjUuMQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
