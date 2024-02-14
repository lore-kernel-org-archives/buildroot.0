Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B429BC48BC4
	for <buildroot@archiver.kernel.org>; Wed, 14 Feb 2024 11:26:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 507CB415A2;
	Wed, 14 Feb 2024 11:26:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1aYnPD2NgSGZ; Wed, 14 Feb 2024 11:26:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FFA6415B5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FFA6415B5;
	Wed, 14 Feb 2024 11:26:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AD1D31BF3C0
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 11:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A584941776
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 11:26:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IRc4nkBM-vIm for <buildroot@lists.busybox.net>;
 Wed, 14 Feb 2024 11:26:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=alexander.sverdlin@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 62E7940298
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62E7940298
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 62E7940298
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 11:26:01 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-33b401fd72bso3546127f8f.3
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 03:26:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707909959; x=1708514759;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AelXB5ASB95WMV2Vw1wOzEtV+UM4hVRjs/Nhmff+Wqc=;
 b=QkavxV+lPxX1JtYzhjGTlBG+j7CH+n8luQ7+jmmVXtrCO94p3pmnbf6tlpw4ObDB0d
 CdeQ9E2W77MbfEw/v7aRVroKL+UyxkTmz2PfR84G551UqVudIam2gPZIptKMvh3W5ksH
 uRJyf/AOP4nkiH91vDZ8+gwSxWD1JZspcor94Nffi5RVmasxsWMSBjspUBH7Om2AN89T
 dpeBD3y1pRYmFynggASTubT+ABbJNp7ATiQ88v0E3B2g8i9hVm0hDjWiCjAcZyIajGue
 Km/HwUAQEgy8B6BbF/EXeQ3NCC6o8wb3RY/XsU8v6wNq0vpRk3+FuFSg9ZKOBEb6ALRF
 VIQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrLLMB4kuzJ42Bnbvprq2gXCQWYkIlH277v7nV1GJ+swFpm4PoBLzlKyzFT3+fQ5Kn89FZSTWDNlAg6usATihKpTomD99zkw==
X-Gm-Message-State: AOJu0YzE5NjYT1wVoSI8e2OE0jjI3jahqI1nM49WS9A43oxEXHSDlzyY
 db9DwfWP7Vwa9E9xliORyEuu1UfexYIfhgxoKaw6aXbzJzPTOl7KxJRB46lWIOY=
X-Google-Smtp-Source: AGHT+IFdr/G/JX3Meds5wONUJmOm3vwnC+iCUCrpg0dlJg5vIr9ZYt3cHY3WZ3hKFwHThV4iDgJ6vQ==
X-Received: by 2002:a5d:6105:0:b0:33b:302:c08 with SMTP id
 v5-20020a5d6105000000b0033b03020c08mr1818033wrt.43.1707909959259; 
 Wed, 14 Feb 2024 03:25:59 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWCkWXmsuFkphlPk0mm6v7XKHwJd723iB8wABr0qgyG/83mcrQiTMU1B7Re2u1q4Ln+kd5Ll1BgJCq6x1BuQUym9CnEpg8rxA==
Received: from giga-mm-1.home ([2a02:1210:8690:9300:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 p11-20020a5d68cb000000b0033b66c2d61esm12072238wrw.48.2024.02.14.03.25.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 03:25:58 -0800 (PST)
Message-ID: <d0f4eafdd84a949ee8c53a25708b79e2373107c1.camel@gmail.com>
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Date: Wed, 14 Feb 2024 12:25:58 +0100
In-Reply-To: <20240213172817.2872849-18-romain.naour@smile.fr>
References: <20240213172817.2872849-1-romain.naour@smile.fr>
 <20240213172817.2872849-18-romain.naour@smile.fr>
Autocrypt: addr=alexander.sverdlin@gmail.com; prefer-encrypt=mutual;
 keydata=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
User-Agent: Evolution 3.50.4 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707909959; x=1708514759; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AelXB5ASB95WMV2Vw1wOzEtV+UM4hVRjs/Nhmff+Wqc=;
 b=gwqZsuhTR8s3KCZ1fF0kZdezTUFdiTcxTl1/+mC8TamJsoJl+t1ec2QRQDoCLVohVv
 RA+TFrBQ/4FS/pwlGMZu8VXNZMXqMpROAf9+Vo9DbkBysyALznSyNjj7JkMmE++57YFK
 IH2Ja9fQjOT+XUJRTxAf1RY3B3kfUHNOV0nbvWWZ4beVza+WpntUN8jvY0z9suyO5FIJ
 8+mvfcSBDxgt38s/2HlqyXtw7HfvbAruLccGYvdY8z+wXabpYOodC1nOy0QedHmwG9+P
 ZuHnwCvwuEEebx7Oy8TaddNNK82zAinD9S5CKsQT+61brZv2lpsjYKid5nUVFHXJAwKg
 wSEQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=gwqZsuhT
Subject: Re: [Buildroot] [PATCH 17/21] boot/ti-k3-boot-firmware: bump to
 version 09.02.00.004
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUm9tYWluLAoKT24gVHVlLCAyMDI0LTAyLTEzIGF0IDE4OjI4ICswMTAwLCBSb21haW4gTmFv
dXIgd3JvdGU6Cj4gUmVtb3ZlIHRoZSBjb21tZW50IGFib3V0IHRpLWszLWltYWdlLWdlbiBzaW5j
ZSB0aGlzIHRvb2wgaXMKPiBkZXByZWNhdGVkIGFuIHJlcGxhY2VkIGJ5IGJpbm1hbi4KPiAKPiB0
aS1rMy1pbWFnZS1nZW4gaGFzIGJlZW4gcmVtb3ZlZCBmcm9tIG1ldGEtdGkgWzFdLgo+IAo+IFsx
XSBodHRwczovL2dpdC55b2N0b3Byb2plY3Qub3JnL21ldGEtdGkvY29tbWl0Lz9pZD04MzU4MTFj
Zjg1ODY5MjZjZjc4YTk2MWQwOTBmNGU2MTUwNDMyMjM1Cj4gCj4gU2lnbmVkLW9mZi1ieTogUm9t
YWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+CgpSZXZpZXdlZC1ieTogQWxleGFuZGVy
IFN2ZXJkbGluIDxhbGV4YW5kZXIuc3ZlcmRsaW5AZ21haWwuY29tPgoKPiAtLS0KPiDCoGJvb3Qv
dGktazMtYm9vdC1maXJtd2FyZS90aS1rMy1ib290LWZpcm13YXJlLmhhc2ggfCAyICstCj4gwqBi
b290L3RpLWszLWJvb3QtZmlybXdhcmUvdGktazMtYm9vdC1maXJtd2FyZS5ta8KgwqAgfCA0ICst
LS0KPiDCoDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+
IAo+IGRpZmYgLS1naXQgYS9ib290L3RpLWszLWJvb3QtZmlybXdhcmUvdGktazMtYm9vdC1maXJt
d2FyZS5oYXNoIGIvYm9vdC90aS1rMy1ib290LWZpcm13YXJlL3RpLWszLWJvb3QtZmlybXdhcmUu
aGFzaAo+IGluZGV4IDk1MTMxMTgwZWYuLjkzOWJkMDc5NGEgMTAwNjQ0Cj4gLS0tIGEvYm9vdC90
aS1rMy1ib290LWZpcm13YXJlL3RpLWszLWJvb3QtZmlybXdhcmUuaGFzaAo+ICsrKyBiL2Jvb3Qv
dGktazMtYm9vdC1maXJtd2FyZS90aS1rMy1ib290LWZpcm13YXJlLmhhc2gKPiBAQCAtMSwzICsx
LDMgQEAKPiDCoCMgTG9jYWxseSBjYWxjdWxhdGVkCj4gwqBzaGEyNTbCoCBhYjIwZmZiZTdiYmE3
ZTk0YmUyNDZiMzQxN2QzM2E5MTRiM2YwN2MxNmM0N2VmNWE3Zjc2MDIzNDlhNjY2YTYxwqAgTElD
RU5TRS50aQo+IC1zaGEyNTbCoCA2MDMyYTI1OGNlNzMxZDk4NzU3NjExNWY1ZGU0NGM2NzdhNmIw
Y2Y4YmRkY2Q2MWE5YTI4NTI5MjhiZGZmZjkywqAgdGktbGludXgtZmlybXdhcmUtMDguMDYuMDAu
MDA2LnRhci54ego+ICtzaGEyNTbCoCA3MDFkNDAwYWMzM2IyODg1ZWMzNWQ3M2YwZDY2ZTUxODZl
M2MyZjcxZWYyODY3OTUwOGI1OGVmOTg2ODA0ZDM1wqAgdGktbGludXgtZmlybXdhcmUtMDkuMDIu
MDAuMDA0LnRhci54ego+IGRpZmYgLS1naXQgYS9ib290L3RpLWszLWJvb3QtZmlybXdhcmUvdGkt
azMtYm9vdC1maXJtd2FyZS5tayBiL2Jvb3QvdGktazMtYm9vdC1maXJtd2FyZS90aS1rMy1ib290
LWZpcm13YXJlLm1rCj4gaW5kZXggYzdjNWViMDgxOC4uZmIyOGQ4YWM0MSAxMDA2NDQKPiAtLS0g
YS9ib290L3RpLWszLWJvb3QtZmlybXdhcmUvdGktazMtYm9vdC1maXJtd2FyZS5tawo+ICsrKyBi
L2Jvb3QvdGktazMtYm9vdC1maXJtd2FyZS90aS1rMy1ib290LWZpcm13YXJlLm1rCj4gQEAgLTQs
OSArNCw3IEBACj4gwqAjCj4gwqAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+IMKgCj4gLSMgVGhl
IGhhc2ggMzQwMTk0ODAwYTU4MWJhZjk3NjM2MDM4NmRmYzdiNWFjYWI4ZDk0OCBkZWZpbmVkIGlu
IHRoZQo+IC0jIE1ha2VmaWxlIG9mIHRpLWszLWltYWdlLWdlbiBjb3JyZXNwb25kcyB0byB0aGUg
dGFnIDA4LjA2LjAwLjAwNi4KPiAtVElfSzNfQk9PVF9GSVJNV0FSRV9WRVJTSU9OID0gMDguMDYu
MDAuMDA2Cj4gK1RJX0szX0JPT1RfRklSTVdBUkVfVkVSU0lPTiA9IDA5LjAyLjAwLjAwNAo+IMKg
VElfSzNfQk9PVF9GSVJNV0FSRV9TSVRFID0gaHR0cHM6Ly9naXQudGkuY29tL2NnaXQvcHJvY2Vz
c29yLWZpcm13YXJlL3RpLWxpbnV4LWZpcm13YXJlL3NuYXBzaG90Cj4gwqBUSV9LM19CT09UX0ZJ
Uk1XQVJFX1NPVVJDRSA9IHRpLWxpbnV4LWZpcm13YXJlLSQoVElfSzNfQk9PVF9GSVJNV0FSRV9W
RVJTSU9OKS50YXIueHoKPiDCoFRJX0szX0JPT1RfRklSTVdBUkVfSU5TVEFMTF9JTUFHRVMgPSBZ
RVMKCi0tIApBbGV4YW5kZXIgU3ZlcmRsaW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
