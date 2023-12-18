Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2713C46CA2
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 18:56:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7505B4190E;
	Mon, 18 Dec 2023 18:56:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7505B4190E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wf7fLU0ryNJl; Mon, 18 Dec 2023 18:56:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C085418A3;
	Mon, 18 Dec 2023 18:56:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C085418A3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 561661BF20B
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 18:54:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D69F4056F
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 18:54:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D69F4056F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tw_2JLhsBrxC for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 18:54:51 +0000 (UTC)
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 08DC240527
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 18:54:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08DC240527
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-5cd68a0de49so2538227a12.2
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 10:54:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702925690; x=1703530490;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T5UbPLQDb2STTD0+YYhDpqapn/2VSKKjNUcopgaVriU=;
 b=I23mVxl01z2hWfIjlJ1Mq8PpzoMCTxJXzMlHOCv9i3cZ0JP0HrtNbjDPqnFdf98jv1
 9BpIxZkhj1SwunK1JG2r/dz8vN+3dMtMXa7ht4jq1RGGFk6PnRuttu+D57xj+rxuhN6G
 ZCvZF1PCNUT3IfFfDtuU0jYeqXG6xEEKgr3K8bLQTTQ7bB4rp5eTYj4y693DsZv//e+Q
 PaiTvhizlU5S5jwHZJIHQGZxp1OP7CFm9yGAlFXDrQyIhcM0xKUoDET0BZLQknsRRxhh
 sP0syIp/xQqJztn6Xi63gxL7US6hE16I3v1k2FoNEc1GnM5JL9y5E4+Q8gGRq/+CmBj1
 c8zg==
X-Gm-Message-State: AOJu0YzKr+/XGbLF1sf35KnguaLevLZDJpZNBkxoLNy4YF2Pil1V1NWl
 P3eMNZaralucu0DQGzXS5Nn+xPdWo9yKRyQLz7U=
X-Google-Smtp-Source: AGHT+IHsFcd7DzaeysvFLGaiXCPwsc9TMGR5cd74H3cJl061aYrwbRC64myFEC+DcsFjMAhZsw1KYg==
X-Received: by 2002:a05:6a20:3ca6:b0:190:3991:e0f2 with SMTP id
 b38-20020a056a203ca600b001903991e0f2mr21256566pzj.65.1702925689928; 
 Mon, 18 Dec 2023 10:54:49 -0800 (PST)
Received: from DESKTOP-OI0KN2B.amarulasolutions.com ([174.27.209.61])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a17090ac00500b00285cc7a867esm21890580pjt.0.2023.12.18.10.54.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 10:54:49 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 11:54:33 -0700
Message-ID: <20231218185440.506995-7-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218185440.506995-1-adam.duskett@amarulasolutions.com>
References: <20231218185440.506995-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702925690; x=1703530490;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T5UbPLQDb2STTD0+YYhDpqapn/2VSKKjNUcopgaVriU=;
 b=ouo0gj0cUKlgsNxTjxuBpcUyRLB3v28eSEAe770UXakGy8NFAJaZwg8e50+2qxWhsL
 LmF6axQZ94GupXb3YLtvyWHE8XOpMnzcbdmMx8R/4ZqgJh8gU84ELUPHxg9oBEXSTEii
 0nMf8nfVeFXNd74l/FZ8gOHgGrr0KPFWWKSQs=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=ouo0gj0c
Subject: [Buildroot] [PATCH v2 07/13] package/flutter-engine: Add profile
 runtime mode selection
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlcmUgYXJlIG9ubHkgdHdvIHBvc3NpYmxlIG1vZGVzIGZvciBGbHV0dGVyOiBEZWJ1ZyBhbmQg
cmVsZWFzZS4gSG93ZXZlciwKdGhlcmUgaXMgYSB0aGlyZCBtb2RlIGF2YWlsYWJsZSB0byB1c2Vy
czogcHJvZmlsZS4KCkFzIEZsdXR0ZXIgcHJvamVjdHMgY2FuIGJlIHByZXR0eSBoZWF2eSBhbmQg
Y29uc3VtZSBhIGxvdCBvZiByZXNvdXJjZXMsIGl0IGlzCm5lY2Vzc2FyeSB0byBhbGxvdyB1c2Vy
cyB0byBwcm9maWxlIHRoZWlyIEZsdXR0ZXIgYXBwbGljYXRpb24gZHVyaW5nCmRldmVsb3BtZW50
LgoKQWRkIGEgbmV3IGNob2ljZTogRkxVVFRFUl9FTkdJTkVfUlVOVElNRV9NT0RFX1BST0ZJTEUu
IElmIHVuc2VsZWN0ZWQsIHRoZQpnbG9iYWwgb3B0aW9uIEJSMl9FTkFCTEVfUlVOVElNRV9ERUJV
RyBkZXRlcm1pbmVzIHdoZXRoZXIgdG8gYnVpbGQgRmx1dHRlcgppbiByZWxlYXNlIG9yIGRlYnVn
IG1vZGUuCgpTaWduZWQtb2ZmLWJ5OiBBZGFtIER1c2tldHQgPGFkYW0uZHVza2V0dEBhbWFydWxh
c29sdXRpb25zLmNvbT4KLS0tCiBwYWNrYWdlL2ZsdXR0ZXItZW5naW5lL0NvbmZpZy5pbiAgICAg
ICAgIHwgMjUgKysrKysrKysrKysrKysrKysrKysrKysrCiBwYWNrYWdlL2ZsdXR0ZXItZW5naW5l
L2ZsdXR0ZXItZW5naW5lLm1rIHwgIDQgKysrLQogMiBmaWxlcyBjaGFuZ2VkLCAyOCBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9mbHV0dGVyLWVuZ2lu
ZS9Db25maWcuaW4gYi9wYWNrYWdlL2ZsdXR0ZXItZW5naW5lL0NvbmZpZy5pbgppbmRleCAyZWM1
YjkwZmZkLi4zYzkyZTQwZjc0IDEwMDY0NAotLS0gYS9wYWNrYWdlL2ZsdXR0ZXItZW5naW5lL0Nv
bmZpZy5pbgorKysgYi9wYWNrYWdlL2ZsdXR0ZXItZW5naW5lL0NvbmZpZy5pbgpAQCAtMzksNiAr
MzksMzEgQEAgY29uZmlnIEJSMl9QQUNLQUdFX0ZMVVRURVJfRU5HSU5FCiAKIAkgIGh0dHBzOi8v
Z2l0aHViLmNvbS9mbHV0dGVyL2VuZ2luZQogCitpZiBCUjJfUEFDS0FHRV9GTFVUVEVSX0VOR0lO
RQorCitjb25maWcgRkxVVFRFUl9FTkdJTkVfUlVOVElNRV9NT0RFX1BST0ZJTEUKKwlib29sICJl
bmFibGUgcHJvZmlsaW5nIgorCWhlbHAKKwkgIFNvbWUgZGVidWdnaW5nIGFiaWxpdHkgaXMgbWFp
bnRhaW5lZOKAlGVub3VnaCB0byBwcm9maWxlIHlvdXIKKwkgIGFwcHMgcGVyZm9ybWFuY2UuIFBy
b2ZpbGUgbW9kZSBpcyBkaXNhYmxlZCBvbiB0aGUgZW11bGF0b3IKKwkgIGFuZCBzaW11bGF0b3Is
IGJlY2F1c2UgdGhlaXIgYmVoYXZpb3IgaXMgbm90IHJlcHJlc2VudGF0aXZlCisJICBvZiByZWFs
IHBlcmZvcm1hbmNlLiBQcm9maWxlIG1vZGUgaXMgc2ltaWxhciB0byByZWxlYXNlIG1vZGUsCisJ
ICB3aXRoIHRoZSBmb2xsb3dpbmcgZGlmZmVyZW5jZXM6CisKKwkgIC0gU29tZSBzZXJ2aWNlIGV4
dGVuc2lvbnMsIHN1Y2ggYXMgdGhlIG9uZSB0aGF0IGVuYWJsZXMgdGhlCisJICAgIHBlcmZvcm1h
bmNlIG92ZXJsYXksIGFyZSBlbmFibGVkLgorCisJICAtIFRyYWNpbmcgaXMgZW5hYmxlZCwgYW5k
IHRvb2xzIHN1cHBvcnRpbmcgc291cmNlLWxldmVsCisJICAgIGRlYnVnZ2luZyAoc3VjaCBhcyBE
ZXZUb29scykgY2FuIGNvbm5lY3QgdG8gdGhlIHByb2Nlc3MuCisKKwkgIElmIHRoaXMgb3B0aW9u
IGlzIGxlZnQgdW5zZWxlY3RlZCwgdGhlIGdsb2JhbCBvcHRpb24KKwkgIEJSMl9FTkFCTEVfUlVO
VElNRV9ERUJVRyBkZXRlcm1pbmVzIHdoZXRoZXIgdG8gYnVpbGQgRmx1dHRlcgorCSAgaW4gcmVs
ZWFzZSBvciBkZWJ1ZyBtb2RlLgorCisJICBodHRwczovL2RvY3MuZmx1dHRlci5kZXYvdGVzdGlu
Zy9idWlsZC1tb2RlcyNwcm9maWxlCisKK2VuZGlmCisKIGNvbW1lbnQgImZsdXR0ZXItZW5naW5l
IG5lZWRzIGFuIE9wZW5HTCBvciBPcGVuR0xFUyBiYWNrZW5kIgogCWRlcGVuZHMgb24gQlIyX1BB
Q0tBR0VfRkxVVFRFUl9FTkdJTkVfQVJDSF9TVVBQT1JUUwogCWRlcGVuZHMgb24gIUJSMl9QQUNL
QUdFX0hBU19MSUJHTCAmJiAhQlIyX1BBQ0tBR0VfSEFTX0xJQkdMRVMKZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvZmx1dHRlci1lbmdpbmUvZmx1dHRlci1lbmdpbmUubWsgYi9wYWNrYWdlL2ZsdXR0ZXIt
ZW5naW5lL2ZsdXR0ZXItZW5naW5lLm1rCmluZGV4IDM0NWY2YmYyNWUuLjBiNGZkZmFlMDkgMTAw
NjQ0Ci0tLSBhL3BhY2thZ2UvZmx1dHRlci1lbmdpbmUvZmx1dHRlci1lbmdpbmUubWsKKysrIGIv
cGFja2FnZS9mbHV0dGVyLWVuZ2luZS9mbHV0dGVyLWVuZ2luZS5tawpAQCAtNTIsNyArNTIsOSBA
QCBGTFVUVEVSX0VOR0lORV9UQVJHRVRfQVJDSCA9IHg2NAogRkxVVFRFUl9FTkdJTkVfVEFSR0VU
X1RSSVBQTEUgPSB4ODZfNjQtdW5rbm93bi1saW51eC1nbnUKIGVuZGlmCiAKLWlmZXEgKCQoQlIy
X0VOQUJMRV9SVU5USU1FX0RFQlVHKSx5KQoraWZlcSAoJChGTFVUVEVSX0VOR0lORV9SVU5USU1F
X01PREVfUFJPRklMRSkseSkKK0ZMVVRURVJfRU5HSU5FX1JVTlRJTUVfTU9ERT1wcm9maWxlCitl
bHNlIGlmZXEgKCQoQlIyX0VOQUJMRV9SVU5USU1FX0RFQlVHKSx5KQogRkxVVFRFUl9FTkdJTkVf
UlVOVElNRV9NT0RFPWRlYnVnCiBlbHNlCiBGTFVUVEVSX0VOR0lORV9SVU5USU1FX01PREU9cmVs
ZWFzZQotLSAKMi40My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
