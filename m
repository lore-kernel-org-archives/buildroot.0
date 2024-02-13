Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 908F3C48260
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 18:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2757D80DCF;
	Tue, 13 Feb 2024 18:56:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f_3s4bIOJYGo; Tue, 13 Feb 2024 18:56:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D86380F48
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D86380F48;
	Tue, 13 Feb 2024 18:56:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DBB111BF2C3
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 18:56:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C8DD360BBE
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 18:56:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SiWgZr8EqhFR for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 18:56:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=alexander.sverdlin@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 84CA160A65
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84CA160A65
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 84CA160A65
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 18:56:26 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-411d253098eso3559205e9.3
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 10:56:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707850584; x=1708455384;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WxGBMcuoRPvmzuNmwXj3VNy5hNajaHW3xgi69aWVsUw=;
 b=rxj9VNfQAEfJ3TFXuqxjYy+KabNZU4NPPp9FtVmRdJf357HKS4p1dBeRHmVaaf839z
 DDrc1OHzqieBhWK6CSB74w4jVF3k66YHhokz/RxZiOQ7/nzoiJ6B3AfBGJ7j3IUqsOYk
 M9JoAwJuJS3YP0c/ReSYroHPD1/ACYDbh9KB5/A25VtMeByNa/z68saUE6oVrZBoTwQk
 dLDFhf4hOTv0YdaZTmkbDruQYprYNalc2qZK7wk+bKys+zwbLi2N6M0+m8Cyx3xAYv3I
 eXpG1Q9WbT4DsRTr7d9M1O8/Leg1EuMLheqjPZrFB/aBPVMkxUHnlOE75kBlkjVMRvpd
 vpJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDuNOMaqV3nW4x8KNZ/bcgaShm4TwBQVO6AjQ/baste5+KJcIcklCFtbPgOhbTLqcIoWVa0FnjVx83237umg4s/+aeoahRTA==
X-Gm-Message-State: AOJu0YxDUnqx/Fem99hutcze/2qvkRxdcWbxaOPNEidpPbQRzi7YAwqT
 xvM+gK81S6eRiFWTGXtRE4HQE0Uox7YfglTt/1jVZJAicNEGhBpU
X-Google-Smtp-Source: AGHT+IFn4sFb7gd8z2wIs+kjuHgr5cNkXeM3QYAC2jiXfIcWzfkLlP0nHC3VBcKYzS0P5FEhFINktQ==
X-Received: by 2002:a05:600c:4f0e:b0:410:e90e:8317 with SMTP id
 l14-20020a05600c4f0e00b00410e90e8317mr489732wmq.27.1707850584285; 
 Tue, 13 Feb 2024 10:56:24 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWH2HhyOsO77/Gv/Fi5AbdPrtHqqpHHlucGIWOdkIIaSxGEzcRsAupyLXYWOxijV68mkKaEzqQc/u6Y4EVJSRoFixxEbSxPQw==
Received: from giga-mm-2.home ([2a02:1210:8690:9300:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 fc9-20020a05600c524900b00410727c315fsm12439269wmb.16.2024.02.13.10.56.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 10:56:23 -0800 (PST)
Message-ID: <a057c294ef3e451356440a8eda91f8dd15c4e6f6.camel@gmail.com>
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Date: Tue, 13 Feb 2024 19:56:22 +0100
In-Reply-To: <20240213172817.2872849-4-romain.naour@smile.fr>
References: <20240213172817.2872849-1-romain.naour@smile.fr>
 <20240213172817.2872849-4-romain.naour@smile.fr>
Autocrypt: addr=alexander.sverdlin@gmail.com; prefer-encrypt=mutual;
 keydata=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
User-Agent: Evolution 3.50.4 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707850584; x=1708455384; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WxGBMcuoRPvmzuNmwXj3VNy5hNajaHW3xgi69aWVsUw=;
 b=GqPs+VPvd/UsY/Ki/yhU2QgOpWkH35cy87NtcmXIcG+bqmpJxAxD7J4sNq1x6VXUtl
 bk1H5TnmDS4yvbk9Q0PBrS+LR+VroEMudQ6LTlQqjqIV9qV9eu8kV6N1+3zOrMpplbeq
 4cxMK0mU2khgM5kwK0jo92jODxktp0WSP0KlNcUsT4lA+X0+V07aF77hkQryPXHSscdj
 Rw3zeHJg6LbiRbU4oWkHYDJkxLck7osjIaNBBJD7ZEPF6GBsuKhQelGmFoaia4lWLR3m
 zdaCpuRGX9Rcod1G37KXkAKR3ZkrrX7WuKFp1a6vRoi7n1DOEPALCeFs4mJjDQJqqG2o
 o/0w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=GqPs+VPv
Subject: Re: [Buildroot] [PATCH 03/21] configs/ti_am64x_sk_defconfig: fix
 optee-os plateform
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

SGkgUm9tYWluLAoKT24gVHVlLCAyMDI0LTAyLTEzIGF0IDE4OjI3ICswMTAwLCBSb21haW4gTmFv
dXIgd3JvdGU6Cj4gQWNjb3JkaW5nIHRvIG1ldGEtdGksIHRoZSBvcHRlZS1vcyBwbGF0ZWZvcm0g
bXVzdCBiZQo+ICJrMy1hbTY0eCIgbm90ICJrMyIuCj4gCj4gwqAgbWV0YS10aSB1c2VzIHRoZSBP
UFRFRU1BQ0hJTkUgdG8gc2V0IG9wdGVlLW9zIHBsYXRmb3JtIFsxXS4KPiDCoCBtZXRhLXRpXSQg
Z2l0IGdyZXAgT1BURUVNQUNISU5FCj4gwqAgbWV0YS10aS1ic3AvY29uZi9tYWNoaW5lL2FtNDM3
eC1ocy1ldm0uY29uZjpPUFRFRU1BQ0hJTkUgPSAidGktYW00M3h4Igo+IMKgIG1ldGEtdGktYnNw
L2NvbmYvbWFjaGluZS9hbTU3eHgtaHMtZXZtLmNvbmY6T1BURUVNQUNISU5FID0gInRpLWFtNTd4
eCIKPiDCoCBtZXRhLXRpLWJzcC9jb25mL21hY2hpbmUvYmVhZ2xlcGxheS5jb25mOk9QVEVFTUFD
SElORSA9ICJrMy1hbTYyeCIKPiDCoCBtZXRhLXRpLWJzcC9jb25mL21hY2hpbmUvZHJhN3h4LWhz
LWV2bS5jb25mOk9QVEVFTUFDSElORSA9ICJ0aS1kcmE3eHgiCj4gwqAgbWV0YS10aS1ic3AvY29u
Zi9tYWNoaW5lL2luY2x1ZGUvYW02MmF4eC5pbmM6T1BURUVNQUNISU5FID0gImszLWFtNjJ4Igo+
IMKgIG1ldGEtdGktYnNwL2NvbmYvbWFjaGluZS9pbmNsdWRlL2FtNjJweHguaW5jOk9QVEVFTUFD
SElORSA9ICJrMy1hbTYyeCIKPiDCoCBtZXRhLXRpLWJzcC9jb25mL21hY2hpbmUvaW5jbHVkZS9h
bTYyeHguaW5jOk9QVEVFTUFDSElORSA9ICJrMy1hbTYyeCIKPiDCoCBtZXRhLXRpLWJzcC9jb25m
L21hY2hpbmUvaW5jbHVkZS9hbTY0eHguaW5jOk9QVEVFTUFDSElORSA9ICJrMy1hbTY0eCIKPiDC
oCBtZXRhLXRpLWJzcC9jb25mL21hY2hpbmUvaW5jbHVkZS9hbTY1eHguaW5jOk9QVEVFTUFDSElO
RSA9ICJrMy1hbTY1eCIKPiDCoCBtZXRhLXRpLWJzcC9jb25mL21hY2hpbmUvaW5jbHVkZS9qNzIw
MC5pbmM6T1BURUVNQUNISU5FID0gImszLWo3MjFlIgo+IMKgIG1ldGEtdGktYnNwL2NvbmYvbWFj
aGluZS9pbmNsdWRlL2o3MjFlLmluYzpPUFRFRU1BQ0hJTkUgPSAiazMtajcyMWUiCj4gwqAgbWV0
YS10aS1ic3AvY29uZi9tYWNoaW5lL2luY2x1ZGUvajcyMXMyLmluYzpPUFRFRU1BQ0hJTkUgPSAi
azMtajc4NHM0Igo+IMKgIG1ldGEtdGktYnNwL2NvbmYvbWFjaGluZS9pbmNsdWRlL2o3MjJzLmlu
YzpPUFRFRU1BQ0hJTkUgPSAiazMtYW02MngiCj4gwqAgbWV0YS10aS1ic3AvY29uZi9tYWNoaW5l
L2luY2x1ZGUvajc4NHM0LmluYzpPUFRFRU1BQ0hJTkUgPSAiazMtajc4NHM0Igo+IAo+IFsxXSBo
dHRwczovL2dpdC55b2N0b3Byb2plY3Qub3JnL21ldGEtYXJtL3RyZWUvbWV0YS1hcm0vcmVjaXBl
cy1zZWN1cml0eS9vcHRlZS9vcHRlZS1vcy5pbmM/aD00LjAuMyNuMjMKPiAKPiBTaWduZWQtb2Zm
LWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4KClJldmlld2VkLWJ5OiBB
bGV4YW5kZXIgU3ZlcmRsaW4gPGFsZXhhbmRlci5zdmVyZGxpbkBnbWFpbC5jb20+Cgo+IC0tLQo+
IE9uIFNLLVREQTRWTSwgc3VjaCBlcnJvciBsZWFkcyB0byBhIHJ1bnRpbWUgYm9vdCBjcmFzaC4K
PiAtLS0KPiDCoGNvbmZpZ3MvdGlfYW02NHhfc2tfZGVmY29uZmlnIHwgMiArLQo+IMKgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L2NvbmZpZ3MvdGlfYW02NHhfc2tfZGVmY29uZmlnIGIvY29uZmlncy90aV9hbTY0eF9za19kZWZj
b25maWcKPiBpbmRleCA0YmZkMzFmMGM4Li4wOTcxNzViZDhmIDEwMDY0NAo+IC0tLSBhL2NvbmZp
Z3MvdGlfYW02NHhfc2tfZGVmY29uZmlnCj4gKysrIGIvY29uZmlncy90aV9hbTY0eF9za19kZWZj
b25maWcKPiBAQCAtMjEsNyArMjEsNyBAQCBCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJF
X1BMQVRGT1JNPSJrMyIKPiDCoEJSMl9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkVfVEFSR0VU
X0JPQVJEPSJsaXRlIgo+IMKgQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9CTDMyX09Q
VEVFPXkKPiDCoEJSMl9UQVJHRVRfT1BURUVfT1M9eQo+IC1CUjJfVEFSR0VUX09QVEVFX09TX1BM
QVRGT1JNPSJrMyIKPiArQlIyX1RBUkdFVF9PUFRFRV9PU19QTEFURk9STT0iazMtYW02NHgiCj4g
wqBCUjJfVEFSR0VUX1RJX0szX0lNQUdFX0dFTj15Cj4gwqBCUjJfVEFSR0VUX1RJX0szX0lNQUdF
X0dFTl9TT0NfQU02NFg9eQo+IMKgQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVI9eQoKLS0gCkFs
ZXhhbmRlciBTdmVyZGxpbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
