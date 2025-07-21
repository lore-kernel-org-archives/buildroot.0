Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D5AC83F26
	for <buildroot@archiver.kernel.org>; Mon, 21 Jul 2025 15:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3482F4175E;
	Mon, 21 Jul 2025 15:48:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rZ0gudUFPa6J; Mon, 21 Jul 2025 15:48:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26BCE4137F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26BCE4137F;
	Mon, 21 Jul 2025 15:48:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 48A1DDA
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 15:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4614641387
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 15:48:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bZGi2JQt2jQy for <buildroot@buildroot.org>;
 Mon, 21 Jul 2025 15:48:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 32C1D412D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32C1D412D7
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 32C1D412D7
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 15:48:19 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-ae35f36da9dso884003566b.0
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 08:48:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753112897; x=1753717697;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WP1d5yGfrJMyedvCgGSOpRNaLYmeY1hOAKvdm968NCM=;
 b=VrMqR1LHUYIvgzmUjVuzfjWsTU1wmfXLn2tipGXtuIvHTqwQdMr5ON/BmrAYa2ydfQ
 hPWruQmV9tcYILoKNbrSVBusUOGjR0/wkohYePXAQespaKdkQuAWLjanVH/tGg+5+56o
 kyuLVdomCtAnsz6/kghuz3NXeTvY+KtbTyvUuH1WhuUctSYcMVLZyyXpz007s/z1vP8C
 n1r0+Pl0XigrvFTd4F/ZWFjKXmHG891NdkU4sTOEWq2BX0eyXBpmFeGNOJgMmgUH0qyq
 IB+MvhSrojokMxqXRT4UtFYT/TRQzUFNyNN1XPjxo2KvBWzG5g0od4xBBkgooHA45iXo
 lCGw==
X-Gm-Message-State: AOJu0YwDo4ZBUGQWey2OspCJqx5yQxkG+RssCNL4XofG7HaFc27IbmyU
 xKOmxGVXcqmVwsjepw5BGyj6QzPsYibincROj09nihvypOP2Fk2EmUQblQKsyb8um54zmChGtRi
 CNCLU
X-Gm-Gg: ASbGncsLUojhewKzm6+44WkdKWTTWGIGU7ajHPUxNgBFMwzdVD+BKeqT8juqEZLmGbC
 W219ShP9koBLABCmpX2yIJbI8dWrqShLHrUp0M5sTrbjrxz+ofhUKUTMtk6UtAUiRUG2svc4EJI
 4uVgKc0YEYByvssNX/Ymz+/O+KCnPSHR+XqRe7JiBsFGL7u41cy9/bGrpjt7J7BGLL1yUA7GT8r
 PuiQo2E72CDtcUW0DELh7+EOde+oP2FhtQLx/StZ8kAOYui2fy0UUEelip1Xs6yEolCkaDAbYY3
 lXvjFTJyT4ZN/57wQBn1AhkJJ8lgmp99+O3EkdpB7uKg64USAdgt/vvnU2EbyxjzZDt0ZvlYRpF
 tI0Db4lvn37urtYCG3nlWJsg=
X-Google-Smtp-Source: AGHT+IEZ5Xt+XAV+N5x+gIiZxac/tn+ZdjSfaWCkvoKIWkeXdCTSpIvT6HPSIvhUEgSv9kmvchol8Q==
X-Received: by 2002:a17:907:3eaa:b0:ad8:a41a:3cd2 with SMTP id
 a640c23a62f3a-ae9cddce21dmr2219847466b.16.1753112896563; 
 Mon, 21 Jul 2025 08:48:16 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aec6c79a089sm696433666b.20.2025.07.21.08.48.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 08:48:14 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 224125F8B5;
 Mon, 21 Jul 2025 16:48:14 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Mon, 21 Jul 2025 16:48:06 +0100
Message-ID: <20250721154812.787883-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250721154812.787883-1-alex.bennee@linaro.org>
References: <20250721154812.787883-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753112897; x=1753717697; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WP1d5yGfrJMyedvCgGSOpRNaLYmeY1hOAKvdm968NCM=;
 b=hcESN6XzEehNZ1gAwbavKf1QBHSX8bMWOvj3DmGu4FY9k+vnVjHIhE2sqr4P/lZoHW
 ChDsp+FWh1/L6laj6uyX3t8qYTv6oka3NhiwmXhSWpZpWcsgFNr++gc/Evq+LOrQswXj
 JTjv1N4yZMOSDF2IwQwIKXCXf8ZBXnB8hPt3KhQz/53AS9e0XsQZtgErhz78wLnEoTdt
 jvgsFVOxrxcYO4bNwVKH98I2B4ycd5rU9t0LthrFQD0mYWnYJbc7oyVXIFdkyqVF45y3
 UqPxWNnS597bgbiTxqd+GI+xzPddNU7CL1YtfLWhrYNr0BHSEs3IglQKrp1zxF4eEOUw
 KvRA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=hcESN6Xz
Subject: [Buildroot] [PATCH v3 5/9] package/kvm-unit-tests: bump to current
 master
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
Cc: Thomas Huth <huth@tuxfamily.org>, Cyril Bur <cyrilbur@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VXBkYXRlIHRvIHRoZSBjdXJyZW50IHZlcnNpb24gb2YgS1ZNIHVuaXQgdGVzdHMuIFRoZSBtYWlu
IGNoYW5nZXMKc2luY2UgdGhlIGxhc3QgY2hlY2sgcG9pbnQ6CgogIC0gZGVmYXVsdCBwYWdlIHNp
emUgdG8gNGsgKGluc3RlYWQgb2YgNjRrKQogIC0gc3VwcG9ydCBmb3Iga3ZtdG9vbCB0byBsYXVu
Y2ggdGVzdHMKClNpZ25lZC1vZmYtYnk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJv
Lm9yZz4KCi0tLQp2MwogIC0gcmV3b3JkIGNvbW1pdAogIC0gbW92ZSB0byBjdXJyZW50IG1hc3Rl
ciBzbyB3ZSBjYW4gdXNlIGt2bXRvb2wgYXMgd2VsbAogIC0gZGlkbid0IGFwcGx5IHRoX2h1dGgn
cyByLWIgYXMgbW92ZWQgdG8gbWFzdGVyCi0tLQogcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9rdm0t
dW5pdC10ZXN0cy5oYXNoIHwgMiArLQogcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9rdm0tdW5pdC10
ZXN0cy5tayAgIHwgNSArKy0tLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDQg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9rdm0tdW5p
dC10ZXN0cy5oYXNoIGIvcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9rdm0tdW5pdC10ZXN0cy5oYXNo
CmluZGV4IGQ0ZGI5ZjJiNzUuLjYyZDQ0NjY3YjMgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uva3ZtLXVu
aXQtdGVzdHMva3ZtLXVuaXQtdGVzdHMuaGFzaAorKysgYi9wYWNrYWdlL2t2bS11bml0LXRlc3Rz
L2t2bS11bml0LXRlc3RzLmhhc2gKQEAgLTEsNCArMSw0IEBACiAjIExvY2FsbHkgY29tcHV0ZWQK
LXNoYTI1NiAgODYzNjk5NGUxMDI0MDcwNWYxMGE5MTUwZWY2ODhhZTY4MzJkMGVhMGRjYzg4NjBj
ODI2YzY0NWVjZmMxMTY5ZiAga3ZtLXVuaXQtdGVzdHMtdjIwMjQtMDEtMDgudGFyLmJ6Mgorc2hh
MjU2ICBlYTJhYzMzMzc4NWIyMDg5NWVmMGNhMDNmYjA2ODg2NWRjZmQ2MmExNDk4YzJmMDhhNGIz
NzljNGNmNGRhNjMxICBrdm0tdW5pdC10ZXN0cy1mMDQ1ZWE1NjI3YTNhMmQ5ODAwZDAyODgyNjll
Y2QwNDRmYjQyOTE0LnRhci5negogc2hhMjU2ICBiM2M5Y2E5ZTI1N2YyZWFhZTA3MGNmMGNjZGY4
NzcwNzY0ZjA1YTk0N2EzOWE4MzVlNjMzNDEzNzUwYTU3NzdiICBDT1BZUklHSFQKIHNoYTI1NiAg
ODE3N2Y5NzUxMzIxMzUyNmRmMmNmNjE4NGQ4ZmY5ODZjNjc1YWZiNTE0ZDRlNjhhNDA0MDEwNTIx
Yjg4MDY0MyAgTElDRU5TRQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9rdm0t
dW5pdC10ZXN0cy5tayBiL3BhY2thZ2Uva3ZtLXVuaXQtdGVzdHMva3ZtLXVuaXQtdGVzdHMubWsK
aW5kZXggNzNkMjBkNmIyZS4uZGM2NDE2YjBlYiAxMDA2NDQKLS0tIGEvcGFja2FnZS9rdm0tdW5p
dC10ZXN0cy9rdm0tdW5pdC10ZXN0cy5taworKysgYi9wYWNrYWdlL2t2bS11bml0LXRlc3RzL2t2
bS11bml0LXRlc3RzLm1rCkBAIC00LDkgKzQsOCBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMKIAotS1ZNX1VOSVRfVEVTVFNfVkVSU0lPTiA9IDIwMjQtMDEtMDgKLUtWTV9VTklUX1RFU1RT
X1NPVVJDRSA9IGt2bS11bml0LXRlc3RzLXYkKEtWTV9VTklUX1RFU1RTX1ZFUlNJT04pLnRhci5i
ejIKLUtWTV9VTklUX1RFU1RTX1NJVEUgPSBodHRwczovL2dpdGxhYi5jb20va3ZtLXVuaXQtdGVz
dHMva3ZtLXVuaXQtdGVzdHMvLS9hcmNoaXZlL3YkKEtWTV9VTklUX1RFU1RTX1ZFUlNJT04pCitL
Vk1fVU5JVF9URVNUU19WRVJTSU9OID0gZjA0NWVhNTYyN2EzYTJkOTgwMGQwMjg4MjY5ZWNkMDQ0
ZmI0MjkxNAorS1ZNX1VOSVRfVEVTVFNfU0lURSA9ICQoY2FsbCBnaXRsYWIsa3ZtLXVuaXQtdGVz
dHMsa3ZtLXVuaXQtdGVzdHMsJChLVk1fVU5JVF9URVNUU19WRVJTSU9OKSkKIEtWTV9VTklUX1RF
U1RTX0xJQ0VOU0UgPSBHUEwtMi4wLCBMR1BMLTIuMAogS1ZNX1VOSVRfVEVTVFNfTElDRU5TRV9G
SUxFUyA9IENPUFlSSUdIVCBMSUNFTlNFCiAKLS0gCjIuNDcuMgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
