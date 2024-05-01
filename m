Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B335EC4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 22:03:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E86080FAF;
	Wed,  1 May 2024 22:03:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jHyGZSJNoCMc; Wed,  1 May 2024 22:03:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7412F82160
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7412F82160;
	Wed,  1 May 2024 22:03:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BB8621BF384
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 22:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A5BBA82160
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 22:03:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6nJHF2UDt3t2 for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 22:03:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B16F680FAF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B16F680FAF
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B16F680FAF
 for <buildroot@buildroot.org>; Wed,  1 May 2024 22:03:17 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-41ba1ba55ebso40654545e9.1
 for <buildroot@buildroot.org>; Wed, 01 May 2024 15:03:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714600995; x=1715205795;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sx9ZpRR1axvWktHGVnjEBZAKIVd7JNEF6bpfWsfvrOQ=;
 b=c8qmjWSTAx2JQF6fHe49VHliywuGCxWtja2DsCK9cdMJG9p1BYJ3Xh/MgPAKyR9CA+
 4BwieJc1V9PzRADkgP7wfXUfPxKLtQaOw/HGKiHW8S4ISqwM0MCjv6DxAIN11eavDdHH
 FDJJfevfjf8KxMkTifWzpN7QgRYVrbuudkmQD0vOWzT4nSh9W5iM7T1ydciIfqNv9rub
 dX6beOKqndCGnWNB9gm69G8+joVPH18MEf0QLl8Uigs1kE5flgQ+waZtbSgocMHWekH2
 oVyAef0gyejzbJIu2S8IaRE1Qr+xGGVSM7LmaQcV1/ynN3cp/6ZlzYkvpu+vyCCatu+c
 rRyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVirY2IaZx7PYLb9W9WN1Jm4EUMy5T6bKsGaL/BjgISbz27hmf31xkBq+7Pb9r5g88ShGjcsIOJKhwAAqsSEn2eUkGbZAyyQ==
X-Gm-Message-State: AOJu0Yz7rClr3baBpqR5dNsM3s+tomYv8SVwET/3op4YAyzmCUPzjvN3
 p2t7DjeKsLsqtWO2cK+3tN1uIrpN5meBAyUvwX69PIkLS6ueM66k2K+5j3ze0Lg=
X-Google-Smtp-Source: AGHT+IEuCkVwH+YsWX3Vbq+oktL+P9vlIfPQBq2XxNeUZmCOMR35UnyG8KC3Agae/ERiXkjtN+noAw==
X-Received: by 2002:a05:600c:458e:b0:41b:143b:5c2d with SMTP id
 r14-20020a05600c458e00b0041b143b5c2dmr206846wmo.28.1714600995291; 
 Wed, 01 May 2024 15:03:15 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 v17-20020a05600c471100b0041abdaf8c6asm3427059wmo.13.2024.05.01.15.03.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 May 2024 15:03:15 -0700 (PDT)
Message-ID: <a885533d-2158-408f-8b65-7432c0d055e2@smile.fr>
Date: Thu, 2 May 2024 00:03:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Lukasz Tekieli <tekieli.lukasz@gmail.com>, buildroot@buildroot.org
References: <20240501190441.496683-1-tekieli.lukasz@gmail.com>
Content-Language: fr
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240501190441.496683-1-tekieli.lukasz@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1714600995; x=1715205795;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sx9ZpRR1axvWktHGVnjEBZAKIVd7JNEF6bpfWsfvrOQ=;
 b=f+GpGmkSB+4leStkLZKH6OFNIc5qCBQdZkE+QLNRS2YTADkn9BdtUTY0Y8HBwy1GIy
 gWm0Q403Xo4qKAPw7q+fd6cPN82iAUj+njkiBa1IuWZWOXLCUkFhtUv7oPT6fadfSmBP
 SrN6p4+IxJJdp8BPcC7VVTsVjFbWCDcFxEZQvykHOGjl1U9k3HsdxNS6IsQNE2cS4ggO
 uFzkMZCFQw3kkeXqFHivtLJ61kJ0GlEsV2/jIs3+FgrvqsBqw3R5FbnUeKgRy59VDk6s
 hBfcDqU+t9z73WqyhrWAoNTHaF75zw23p+bZQE0rCAb/kdqPUlU17UJkYjOA1+P/vCj0
 fvAQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=f+GpGmkS
Subject: Re: [Buildroot] [PATCH 1/1] configs/visionfive2_defconfig: add
 hashes for linux/opensbi/u-boot
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
Cc: Francois Dugast <francois.dugast.foss@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gTHVrYXN6LAoKTGUgMDEvMDUvMjAyNCDDoCAyMTowNCwgTHVrYXN6IFRla2llbGkgYSDD
qWNyaXTCoDoKPiBFbmFibGUgQlIyX0RPV05MT0FEX0ZPUkNFX0NIRUNLX0hBU0hFUyBhbmQgc2V0
IHRoZSBwYXRjaCBkaXJlY3RvcnkuCj4gCj4gU2lnbmVkLW9mZi1ieTogTHVrYXN6IFRla2llbGkg
PHRla2llbGkubHVrYXN6QGdtYWlsLmNvbT4KCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpC
ZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gLS0tCj4gIGJvYXJkL3Zpc2lvbmZpdmUyL3BhdGNoZXMv
bGludXgtaGVhZGVycy9saW51eC1oZWFkZXJzLmhhc2ggfCAxICsKPiAgYm9hcmQvdmlzaW9uZml2
ZTIvcGF0Y2hlcy9saW51eC9saW51eC5oYXNoICAgICAgICAgICAgICAgICB8IDIgKysKPiAgYm9h
cmQvdmlzaW9uZml2ZTIvcGF0Y2hlcy9vcGVuc2JpL29wZW5zYmkuaGFzaCAgICAgICAgICAgICB8
IDIgKysKPiAgYm9hcmQvdmlzaW9uZml2ZTIvcGF0Y2hlcy91Ym9vdC91Ym9vdC5oYXNoICAgICAg
ICAgICAgICAgICB8IDIgKysKPiAgY29uZmlncy92aXNpb25maXZlMl9kZWZjb25maWcgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8IDIgKysKPiAgNSBmaWxlcyBjaGFuZ2VkLCA5IGluc2Vy
dGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTIwMDAwIGJvYXJkL3Zpc2lvbmZpdmUyL3BhdGNoZXMv
bGludXgtaGVhZGVycy9saW51eC1oZWFkZXJzLmhhc2gKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGJv
YXJkL3Zpc2lvbmZpdmUyL3BhdGNoZXMvbGludXgvbGludXguaGFzaAo+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgYm9hcmQvdmlzaW9uZml2ZTIvcGF0Y2hlcy9vcGVuc2JpL29wZW5zYmkuaGFzaAo+ICBj
cmVhdGUgbW9kZSAxMDA2NDQgYm9hcmQvdmlzaW9uZml2ZTIvcGF0Y2hlcy91Ym9vdC91Ym9vdC5o
YXNoCj4gCj4gZGlmZiAtLWdpdCBhL2JvYXJkL3Zpc2lvbmZpdmUyL3BhdGNoZXMvbGludXgtaGVh
ZGVycy9saW51eC1oZWFkZXJzLmhhc2ggYi9ib2FyZC92aXNpb25maXZlMi9wYXRjaGVzL2xpbnV4
LWhlYWRlcnMvbGludXgtaGVhZGVycy5oYXNoCj4gbmV3IGZpbGUgbW9kZSAxMjAwMDAKPiBpbmRl
eCAwMDAwMDAwMDAwLi41ODA4ZDkyYWZlCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2JvYXJkL3Zp
c2lvbmZpdmUyL3BhdGNoZXMvbGludXgtaGVhZGVycy9saW51eC1oZWFkZXJzLmhhc2gKPiBAQCAt
MCwwICsxIEBACj4gKy4uL2xpbnV4L2xpbnV4Lmhhc2gKPiBcIE5vIG5ld2xpbmUgYXQgZW5kIG9m
IGZpbGUKPiBkaWZmIC0tZ2l0IGEvYm9hcmQvdmlzaW9uZml2ZTIvcGF0Y2hlcy9saW51eC9saW51
eC5oYXNoIGIvYm9hcmQvdmlzaW9uZml2ZTIvcGF0Y2hlcy9saW51eC9saW51eC5oYXNoCj4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi5jY2FkODA2OGRkCj4gLS0tIC9k
ZXYvbnVsbAo+ICsrKyBiL2JvYXJkL3Zpc2lvbmZpdmUyL3BhdGNoZXMvbGludXgvbGludXguaGFz
aAo+IEBAIC0wLDAgKzEsMiBAQAo+ICsjIExvY2FsbHkgY2FsY3VsYXRlZAo+ICtzaGEyNTYgIDlh
YzMyMmQ4NWJjZjk4YTA0NjY3ZDkyOWY1YzI2NjZiMTViZDU4YzZjMmQ2OGRkNTEyYzcyYWNiY2Vk
MDdkMDQgIGxpbnV4LTYuOC4yLnRhci54ego+IGRpZmYgLS1naXQgYS9ib2FyZC92aXNpb25maXZl
Mi9wYXRjaGVzL29wZW5zYmkvb3BlbnNiaS5oYXNoIGIvYm9hcmQvdmlzaW9uZml2ZTIvcGF0Y2hl
cy9vcGVuc2JpL29wZW5zYmkuaGFzaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAw
MDAwMDAwMC4uYmM0MDU4YWJlNgo+IC0tLSAvZGV2L251bGwKPiArKysgYi9ib2FyZC92aXNpb25m
aXZlMi9wYXRjaGVzL29wZW5zYmkvb3BlbnNiaS5oYXNoCj4gQEAgLTAsMCArMSwyIEBACj4gKyMg
TG9jYWxseSBjYWxjdWxhdGVkCj4gK3NoYTI1NiAgMzE5YjYyYTQxODZmYmNlOWI4MWEwYzVmMGVj
OWYwMDNhMTBjODA4Mzk3YTcyMTM4YmM5NzQ1ZDliODdiMWViMSAgb3BlbnNiaS0xLjQudGFyLmd6
Cj4gZGlmZiAtLWdpdCBhL2JvYXJkL3Zpc2lvbmZpdmUyL3BhdGNoZXMvdWJvb3QvdWJvb3QuaGFz
aCBiL2JvYXJkL3Zpc2lvbmZpdmUyL3BhdGNoZXMvdWJvb3QvdWJvb3QuaGFzaAo+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uOTdhMmI0ZWFmOQo+IC0tLSAvZGV2L251
bGwKPiArKysgYi9ib2FyZC92aXNpb25maXZlMi9wYXRjaGVzL3Vib290L3Vib290Lmhhc2gKPiBA
QCAtMCwwICsxLDIgQEAKPiArIyBMb2NhbGx5IGNhbGN1bGF0ZWQKPiArc2hhMjU2ICAxOGE4NTNm
ZTM5ZmFkN2FkMDNhOTBjYzJkNDI3NWFlYWVkNmRhNjk3MzVkZWZhYzM0OTJiODA1MDg4NDNkZDRh
ICB1LWJvb3QtMjAyNC4wNC50YXIuYnoyCj4gZGlmZiAtLWdpdCBhL2NvbmZpZ3MvdmlzaW9uZml2
ZTJfZGVmY29uZmlnIGIvY29uZmlncy92aXNpb25maXZlMl9kZWZjb25maWcKPiBpbmRleCA2OWM0
NGRmYmRkLi5iYjhhYjA4MmFmIDEwMDY0NAo+IC0tLSBhL2NvbmZpZ3MvdmlzaW9uZml2ZTJfZGVm
Y29uZmlnCj4gKysrIGIvY29uZmlncy92aXNpb25maXZlMl9kZWZjb25maWcKPiBAQCAtMSw0ICsx
LDYgQEAKPiAgQlIyX3Jpc2N2PXkKPiArQlIyX0dMT0JBTF9QQVRDSF9ESVI9ImJvYXJkL3Zpc2lv
bmZpdmUyL3BhdGNoZXMiCj4gK0JSMl9ET1dOTE9BRF9GT1JDRV9DSEVDS19IQVNIRVM9eQo+ICBC
UjJfU1lTVEVNX0RIQ1A9ImV0aDAiCj4gIEJSMl9ST09URlNfT1ZFUkxBWT0iYm9hcmQvdmlzaW9u
Zml2ZTIvb3ZlcmxheSIKPiAgQlIyX1JPT1RGU19QT1NUX0lNQUdFX1NDUklQVD0iYm9hcmQvdmlz
aW9uZml2ZTIvcG9zdC1pbWFnZS5zaCIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
