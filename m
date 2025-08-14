Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F237CA0EE6
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 20:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D02BD80CC5;
	Thu, 14 Aug 2025 20:31:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E1Wju22tAa6K; Thu, 14 Aug 2025 20:31:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5572080A95
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5572080A95;
	Thu, 14 Aug 2025 20:31:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 41DF2228
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:31:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 27A2B80BF5
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:31:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7QxDzpM1HFTW for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 20:31:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6E5DA80A00
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E5DA80A00
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6E5DA80A00
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:31:24 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3b9dc52c430so698890f8f.0
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 13:31:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755203482; x=1755808282;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KnZiMGaLj2d7oc7zqEsxje4DHAwnlRBNMxe4g7I0Mxk=;
 b=EU9n5HlFd91lcNyWjKNZk2BhGp4ivy+frSgdikcGW/+00oyrIdYNqkb0DUT0UMRs43
 S0mjqK80NAtZTOvVh53RQVa4h7pkcdr+fpACnK4QlxtEQA/22JLg70S1xP4wu64tHA6M
 v8xpQlqnLN+H8AG3IrY5RdvROsWl8o8pnuu/YpqMJvIEa78xpsDOp6ibe72rNm0+RdmM
 7RlunAbztGE2e4j4S2RKOoPp34c/27NgWXpbuZXx82mkCXAnm3+ay6ZwFdJ/D37FboIm
 AfgBKAOg4zeVzGsLahPcvtfLWTszYEvN+fsaWtrgPFX3F2dgOnml3YFBXmKUXdE4p/lE
 p89g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXheo/FRzz0ciOusZ2lQwm2WwF2MJ7Wbh6Jyh1dHti85r5ydnbd2Yf2pw3PZq31gzo3R1EW0fOAm24=@buildroot.org
X-Gm-Message-State: AOJu0Yxt9QSDCDfQ6Sf/bWdg4lvRoHSwovoWYM7kdRke7CtwFpYHO7i7
 yumMgZL0zNE8GHEwF24j0ptp4C5wfFYnptnEwznInLimCPbgmShcI6CcCaxD9hrjZ1RDy25dlS/
 LCbWQjdk=
X-Gm-Gg: ASbGncsiwiZ3rWq/ZNJfFs9AVL30AhU86vE6AueN/7HGP498b+3UPaiMcEQvxqlN4Jr
 TgXLk71YszjN3savAUxNiJA3d/n2XgQizbkfQQ7wJ7Bgn+0EW54Ua/bpV4N4JwYkqnHGdcwBu5P
 0c+DM1KxdyDCkXFEcnjX2irQgn/IVYYwQhFlEOopwy9BVrocvfJAzqIh+cyqB/Dx3qaV9JRB2de
 0Sm0mQRcNF2BfzxUOawDKRmemGQIiLmM3vhMBDY/5H1ytrytSYwJ6UhrlA/qVOzbmFpWBkjzGhc
 nXlrdaswgn//cWhCZXM7CUAI/KwywhI1Z+TSYtzzDQKm7L5XcLbZMuIkxNmzlGKan7kkijz8Y2m
 TfFsWtZednRYgkQ==
X-Google-Smtp-Source: AGHT+IHJdepQPu1n4C8eTT8Ah0UJxAEkTzA7+CwYZYUV1Hy7uXi/UdPRa8HItKSq3PzM7hz/ZKd1PA==
X-Received: by 2002:a05:6000:4212:b0:3b9:1056:dfad with SMTP id
 ffacd0b85a97d-3ba50c8cc70mr3444985f8f.3.1755203482214; 
 Thu, 14 Aug 2025 13:31:22 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1c78b410sm35065145e9.24.2025.08.14.13.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 13:31:21 -0700 (PDT)
To: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 14 Aug 2025 22:31:20 +0200
Message-ID: <20250814203120.2814661-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250729-cmake4-v2-1-24fd7677de1c@bootlin.com>
References: <20250729-cmake4-v2-1-24fd7677de1c@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755203482; x=1755808282; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KnZiMGaLj2d7oc7zqEsxje4DHAwnlRBNMxe4g7I0Mxk=;
 b=dTqhgYlB1VExELCQ2BcEhPhoLBLmbP4u4RQhoz1+K2qZnWWzrz1+b/FEj9iBdrfWAw
 T17ubO5dKGPQI5Vz2CwEb7GiaGz6wJhpeTl1zyyi/J9H6Cr2W+t5DEFYlEMRN571lLt1
 HQdrnlxGhNF4yiW5Ar5AZj/rj1XJ8Zgp5ylHtf/xmHn8cH1ZVUrrqUejPjQQs8PiZ3Uz
 CzllU0bMsdHAhxmU/JZ/YyYMgOkgRXTVQes48TccsvK0DoMrPjGMaeBRx1tknBNvHQqF
 G5PVVAzHjHxyJ6xWVABXtUqJuv+uN0N94H/HWapTWDxo6FNrT64/zezsGesc7YCeJeiW
 lhVw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=dTqhgYlB
Subject: Re: [Buildroot] [PATCH v2 1/2] package/cjson: fix cmake 4
 compatibility
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

SW4gcmVwbHkgb2Y6Cj4gQWRkIGEgcGF0Y2ggZml4aW5nIGNtYWtlIDQgY29tcGF0aWJpbGl0eSwg
Zm91bmQgaW4gdXBzdHJlYW0gcHVsbAo+IHJlcXVlc3QgIzkzNS4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBCZW5vw650IE1vbmluIDxiZW5vaXQubW9uaW5AYm9vdGxpbi5jb20+CgpBcHBsaWVkIHRvIDIw
MjUuMDUueC4gVGhhbmtzCgo+IC0tLQo+ICAuLi4vMDAwMS1tYWtlX2NvbXBhdGlibGVfd2l0aF9j
bWFrZV80LjAucGF0Y2ggICAgICB8IDM0ICsrKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxl
IGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9janNv
bi8wMDAxLW1ha2VfY29tcGF0aWJsZV93aXRoX2NtYWtlXzQuMC5wYXRjaCBiL3BhY2thZ2UvY2pz
b24vMDAwMS1tYWtlX2NvbXBhdGlibGVfd2l0aF9jbWFrZV80LjAucGF0Y2gKPiBuZXcgZmlsZSBt
b2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAuLjFmZTVjZDQzZWYxMGRlMzY2YzI4MWM4ODgwNTlkOGU2NzRlNTNkMmEKPiAtLS0gL2Rldi9u
dWxsCj4gKysrIGIvcGFja2FnZS9janNvbi8wMDAxLW1ha2VfY29tcGF0aWJsZV93aXRoX2NtYWtl
XzQuMC5wYXRjaAo+IEBAIC0wLDAgKzEsMzQgQEAKPiArRnJvbSA1OGJjN2M4MjNjMmUzOWYxYTYy
NmVjNGRhODY5NTJiYzY4MTliZDZiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+ICtGcm9tOiBN
YXJrdXMgVmlldGggPG12aWV0aEB0ZWNoZmFrLnVuaS1iaWVsZWZlbGQuZGU+Cj4gK0RhdGU6IFN1
biwgMzAgTWFyIDIwMjUgMTE6MTI6MDcgKzAyMDAKPiArU3ViamVjdDogW1BBVENIXSBNYWtlIGNv
bXBhdGlibGUgd2l0aCBDTWFrZSA0LjAgV2hlbiB0cnlpbmcgdG8gYnVpbGQgd2l0aAo+ICsgQ01h
a2UgNC4wLCB0aGUgZm9sbG93aW5nIGVycm9yIGlzIHNob3duOgo+ICsKPiArQ01ha2UgRXJyb3Ig
YXQgQ01ha2VMaXN0cy50eHQ6MiAoY21ha2VfbWluaW11bV9yZXF1aXJlZCk6Cj4gKyAgQ29tcGF0
aWJpbGl0eSB3aXRoIENNYWtlIDwgMy41IGhhcyBiZWVuIHJlbW92ZWQgZnJvbSBDTWFrZS4KPiAr
Cj4gKyAgVXBkYXRlIHRoZSBWRVJTSU9OIGFyZ3VtZW50IDxtaW4+IHZhbHVlLiAgT3IsIHVzZSB0
aGUgPG1pbj4uLi48bWF4PiBzeW50YXgKPiArICB0byB0ZWxsIENNYWtlIHRoYXQgdGhlIHByb2pl
Y3QgcmVxdWlyZXMgYXQgbGVhc3QgPG1pbj4gYnV0IGhhcyBiZWVuIHVwZGF0ZWQKPiArICB0byB3
b3JrIHdpdGggcG9saWNpZXMgaW50cm9kdWNlZCBieSA8bWF4PiBvciBlYXJsaWVyLgo+ICsKPiAr
ICBPciwgYWRkIC1EQ01BS0VfUE9MSUNZX1ZFUlNJT05fTUlOSU1VTT0zLjUgdG8gdHJ5IGNvbmZp
Z3VyaW5nIGFueXdheS4KPiArCj4gK1RoaXMgY2hhbmdlIHJhaXNlcyB0aGUgbWluaW11bSByZXF1
aXJlZCBDTWFrZSB2ZXJzaW9uIHRvIDMuNSBhbmQgdGh1cyBtYWtlcyB0aGUgcHJvamVjdCBjb21w
YXRpYmxlIHdpdGggQ01ha2UgNC4wCj4gKwo+ICtTaWduZWQtb2ZmLWJ5OiBCZW5vw650IE1vbmlu
IDxiZW5vaXQubW9uaW5AYm9vdGxpbi5jb20+Cj4gK1Vwc3RyZWFtOiBodHRwczovL2dpdGh1Yi5j
b20vRGF2ZUdhbWJsZS9jSlNPTi9wdWxsLzkzNQo+ICstLS0KPiArIENNYWtlTGlzdHMudHh0IHwg
MiArLQo+ICsgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4g
Kwo+ICtkaWZmIC0tZ2l0IGEvQ01ha2VMaXN0cy50eHQgYi9DTWFrZUxpc3RzLnR4dAo+ICtpbmRl
eCAzNmE2Y2I1Ny4uOTQyOGRhNTggMTAwNjQ0Cj4gKy0tLSBhL0NNYWtlTGlzdHMudHh0Cj4gKysr
KyBiL0NNYWtlTGlzdHMudHh0Cj4gK0BAIC0xLDUgKzEsNSBAQAo+ICsgc2V0KENNQUtFX0xFR0FD
WV9DWUdXSU5fV0lOMzIgMCkKPiArLWNtYWtlX21pbmltdW1fcmVxdWlyZWQoVkVSU0lPTiAzLjAp
Cj4gKytjbWFrZV9taW5pbXVtX3JlcXVpcmVkKFZFUlNJT04gMy41KQo+ICsgCj4gKyBwcm9qZWN0
KGNKU09OCj4gKyAgICAgVkVSU0lPTiAxLjcuMTgKPiAKPiAtLSAKPiAyLjUwLjEKPiAKPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
