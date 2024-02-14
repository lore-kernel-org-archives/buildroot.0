Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69033C48BC4
	for <buildroot@archiver.kernel.org>; Wed, 14 Feb 2024 10:58:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2311F60EBC;
	Wed, 14 Feb 2024 10:58:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A1i_TQL9Cb3U; Wed, 14 Feb 2024 10:58:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D6A260EEE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D6A260EEE;
	Wed, 14 Feb 2024 10:58:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 846451BF5B4
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 10:58:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F5ED820B6
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 10:58:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1xzAp0rvfpUo for <buildroot@lists.busybox.net>;
 Wed, 14 Feb 2024 10:58:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=alexander.sverdlin@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CBCC882085
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBCC882085
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CBCC882085
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 10:58:53 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40fd72f7125so43559955e9.1
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 02:58:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707908331; x=1708513131;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/cvT8rpgtQ2rhnuMy+xp5nOTno9vSgvWG2IhHkwDMc4=;
 b=s2u9W7iFHd01ga1xmtRZ/2lKzT8B2Q0B/QWFbAhYPZDDoNcZx2uxdNDRhpGxl81UAa
 faurAdPDpkXoOkQF4Mc5eh/PbFIzWDIjOM2jJat6z8Q3yIkTzNaAb7xTIejgPIu3PHNe
 +EMzzgPo4AmjZ2JTu7ofYo4V9D3j94+hRo8jW6GH6oLreBSt2Z8KAnFq86mueX87nEsb
 IRkz36fUyoe+Wrb0dK62q1aUz8ZGsxVBu8J9ntY5Zx5atjoYHrOVqQPwOPQcg3SXIKMs
 kLczQk6G29vCfIXyH50zexqu6XcFSKna18tsOnIVQrVaxAY33h7ckeOuDrI2l8Nw9D1Q
 OGYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4ia7ZDYYzLD41XeFLtHEkM9HE/ycMziB9EmUcg9uZ3HQuNPyiDkwOD/HrAJ3BwZYyaQ5++MMymbpF1RC+AhKL3YE9yy+Vdg==
X-Gm-Message-State: AOJu0Ywe1a2/9ld/Gz0vscpmPeqP/0N/sv9tt3JbdqnS1gbM4YjUf61A
 9Yhx4LeXvAzqJGQ9p6U4qu20BoeVAXP61mRxJJRDPU9kBi72HZ+C
X-Google-Smtp-Source: AGHT+IF5kzkZk5kEdpO75uUTy0XO49KeSI9YvL8OFGeiWL2UXffFL2RQnYyoyLsP1LyptbTq0y8CdQ==
X-Received: by 2002:a05:600c:3b26:b0:410:e860:c01f with SMTP id
 m38-20020a05600c3b2600b00410e860c01fmr1738527wms.1.1707908331431; 
 Wed, 14 Feb 2024 02:58:51 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWJ3xG87wROXrgm29LnHlTwEsgJDM7rqyzEQPOyKbV0DFMeiYQbEF89kLV/xwMMFLkEuhNWvAAtdPQD0o0JQ0o4ULV1letVAw==
Received: from giga-mm-1.home ([2a02:1210:8690:9300:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 jh2-20020a05600ca08200b00410e6a6403esm1563858wmb.34.2024.02.14.02.58.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 02:58:51 -0800 (PST)
Message-ID: <c95f7fe59e46de29a3d96a9ca4ae354c0fb3ea45.camel@gmail.com>
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Date: Wed, 14 Feb 2024 11:58:50 +0100
In-Reply-To: <20240213172817.2872849-17-romain.naour@smile.fr>
References: <20240213172817.2872849-1-romain.naour@smile.fr>
 <20240213172817.2872849-17-romain.naour@smile.fr>
Autocrypt: addr=alexander.sverdlin@gmail.com; prefer-encrypt=mutual;
 keydata=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
User-Agent: Evolution 3.50.4 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707908331; x=1708513131; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/cvT8rpgtQ2rhnuMy+xp5nOTno9vSgvWG2IhHkwDMc4=;
 b=jN8SP5qVbijhXgfRBbmcr775foba3ZtD0paM2eDNHIuZ725VLVnweSo1NqKC1k3kki
 BxeHvIeRaD68lzF811IHXxqHgO0XlHWG7JABAMLtJeRw+T/zViR282GRRFwG27+Ruugg
 EJPU2z6ZamEJBkcg2eXbjorIZrBDNXKt7aNymJZhMYSgz6m01xT7RNaD0hZgEPKj+cAW
 u4GP2uzKjKjpJif4y70lbFK5eNHGT5dg8s1wW64T1SMPO26wAMzAq0K1BYNhXVoGkqVK
 vAUqAW+XLtFv4/hESZZyQaupCIJiu6Jc0pPJkn3jrkJNhYRWZIuvosTHrT9kPN++jOSu
 AJLg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=jN8SP5qV
Subject: Re: [Buildroot] [PATCH 16/21] boot/uboot: enable TI K3 Device
 Manager (DM) for j721e
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
dXIgd3JvdGU6Cj4gVGhlIFRJIEszIERldmljZSBNYW5hZ2VyIChETSkgc3VwcG9ydCBmb3IgSjcy
MUUgaXMgbmVlZGVkIHRvIGJvb3QKPiBEUkE4MjkvVERBNFZNIFNvQy4KPiAKPiBodHRwczovL3d3
dy50aS5jb20vcHJvZHVjdC9UREE0Vk3CoChTb0MpCj4gaHR0cHM6Ly93d3cudGkuY29tL3Rvb2wv
UFJPQ0VTU09SLVNESy1KNzIxRcKgKFRJIFNESykKPiBodHRwczovL3d3dy50aS5jb20vdG9vbC9T
Sy1UREE0Vk3CoChUREE0Vk0gcHJvY2Vzc29yIHN0YXJ0ZXIga2l0KQo+IGh0dHBzOi8vYmVhZ2xl
Ym9hcmQub3JnL2FpLTY0wqAoQmVhZ2xlQm9uZSBBSS02NCBTQkMpCj4gCj4gU2lnbmVkLW9mZi1i
eTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+CgpSZXZpZXdlZC1ieTogQWxl
eGFuZGVyIFN2ZXJkbGluIDxhbGV4YW5kZXIuc3ZlcmRsaW5AZ21haWwuY29tPgoKPiAtLS0KPiDC
oGJvb3QvdWJvb3QvQ29uZmlnLmluIHwgMyArKy0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYm9vdC91Ym9vdC9Db25m
aWcuaW4gYi9ib290L3Vib290L0NvbmZpZy5pbgo+IGluZGV4IDc1ODZmMjRjOTAuLjgzN2YxNjA1
YjcgMTAwNjQ0Cj4gLS0tIGEvYm9vdC91Ym9vdC9Db25maWcuaW4KPiArKysgYi9ib290L3Vib290
L0NvbmZpZy5pbgo+IEBAIC0yNDUsNyArMjQ1LDggQEAgY29uZmlnIEJSMl9UQVJHRVRfVUJPT1Rf
TkVFRFNfVElfSzNfRE0KPiDCoAkjIFdlIHVzZSB0aGUgU29DIHNlbGVjdGlvbiBkZWZpbmVkIGZv
ciB0aGUgdGktazMtYm9vdC1maXJtd2FyZQo+IMKgCSMgcGFja2FnZQo+IMKgCWRlcGVuZHMgb24g
QlIyX1RBUkdFVF9USV9LM19CT09UX0ZJUk1XQVJFCj4gLQlkZXBlbmRzIG9uIEJSMl9UQVJHRVRf
VElfSzNfQk9PVF9GSVJNV0FSRV9TT0NfQU02MkFYIHx8IEJSMl9UQVJHRVRfVElfSzNfQk9PVF9G
SVJNV0FSRV9TT0NfQU02MlgKPiArCWRlcGVuZHMgb24gQlIyX1RBUkdFVF9USV9LM19CT09UX0ZJ
Uk1XQVJFX1NPQ19BTTYyQVggfHwgQlIyX1RBUkdFVF9USV9LM19CT09UX0ZJUk1XQVJFX1NPQ19B
TTYyWCBcCj4gKwkJfHwgQlIyX1RBUkdFVF9USV9LM19CT09UX0ZJUk1XQVJFX1NPQ19KNzIxRQo+
IMKgCWhlbHAKPiDCoAnCoCBTb21lIFRJIEszIGRldmljZXMgbmVlZCB0aGUgRGV2aWNlIE1hbmFn
ZXIgKERNKSBmaXJtd2FyZSB0bwo+IMKgCcKgIGJlIGF2YWlsYWJsZSBmb3IgdGhlIFUtQm9vdCBi
dWlsZC4KCi0tIApBbGV4YW5kZXIgU3ZlcmRsaW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
