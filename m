Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A4C2C48260
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 18:45:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A4A281E3B;
	Tue, 13 Feb 2024 18:45:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DTWp6W783_iS; Tue, 13 Feb 2024 18:45:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17F9381E3E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17F9381E3E;
	Tue, 13 Feb 2024 18:45:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5833A1BF2C3
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 18:45:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4561E407ED
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 18:45:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PJojf_mnYqov for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 18:45:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=alexander.sverdlin@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 147B0407B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 147B0407B9
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 147B0407B9
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 18:45:17 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-33b2960ff60so13522f8f.1
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 10:45:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707849916; x=1708454716;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vJlfndlVF0MJQENpIVGya6lR6SnOHfYj3qRHhr1c3AM=;
 b=l0sYUqWlgkynNQow2RufVyh4bAcuFlcz0ulA5mHD3IgaIbHVcIq9rXaCRP1Ij+Nu3u
 hFprjI1cbcgB8SHD3k7iFqdHqlNYjNuWKCob/vmWshlbEQFxA8xiykJAT8IOThQBG1we
 slotdP4sRMZ4Wi0d/2w7G8AkuxP2PaLZrfrqsY5NhVzkteMEDbBrkxr9lTpX8SmL/inm
 6hNdRQXSG3Paqya2vRRHYOFhRhjX+FX1/v9OPZXXvCm5niK/fsNbXjAdzOUswBJPu1YU
 lrdb85JuLbol0MkynPN0zTG09mt5vMA1Dv/ku5VEI+ySrkn7wkfy+jHSLLpLjxfT6KhA
 CduA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVI36It4yRhWL5Q2nHiwJAqgI5Id9BdQO5hoK/LVN+TCXDhYL8+s/GTqCBbfps7Y9sW/xIVch79rBA8TuTvtpldV69jrjrFYQ==
X-Gm-Message-State: AOJu0Yx8RgaUnq75TZz0+T3nr3A48kVlSl61Fp/Hl6R6vPoHZo9qNtSV
 e2ZBDUHK2CDKxavWObppKIQeA6CLHGAC45OjoqgW1hc+HVTUqTEr
X-Google-Smtp-Source: AGHT+IEuSpXTgrSyXh1xsEq0jY4HqVXAukz9kpkYEniPDunw7W4KKyaprztIjrpFswwRF11Kfo9rxw==
X-Received: by 2002:a5d:4530:0:b0:33c:e55b:a4a4 with SMTP id
 j16-20020a5d4530000000b0033ce55ba4a4mr171567wra.29.1707849915691; 
 Tue, 13 Feb 2024 10:45:15 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVIM3qhHVuZiZ3gV69HMVII9pHPTOtfu4+t1YCEnDxp4g/CqyyKI35QvsmhyiheZ2/LT4go87GcrazND7Gxj1RLEZwIDX9T1A==
Received: from giga-mm-2.home ([2a02:1210:8690:9300:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 a4-20020a05600c224400b00410ebcf8180sm5367296wmm.43.2024.02.13.10.45.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 10:45:15 -0800 (PST)
Message-ID: <08881a814bf7466c4130ff4d137415b54c007808.camel@gmail.com>
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Date: Tue, 13 Feb 2024 19:45:14 +0100
In-Reply-To: <20240213172817.2872849-3-romain.naour@smile.fr>
References: <20240213172817.2872849-1-romain.naour@smile.fr>
 <20240213172817.2872849-3-romain.naour@smile.fr>
Autocrypt: addr=alexander.sverdlin@gmail.com; prefer-encrypt=mutual;
 keydata=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
User-Agent: Evolution 3.50.4 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707849916; x=1708454716; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vJlfndlVF0MJQENpIVGya6lR6SnOHfYj3qRHhr1c3AM=;
 b=fFwrk9jyB3893l7Mr6yCAcz3e3WAotEi65t0hUTHhB6j94dV/U16Y7WsEmsqd5UBca
 TeXpNVLhIz+EHP5pYDeEn8QUnvFswYol1PPXfyGvQ+IbyGpc+rPOZazs7yO1+spw4Al9
 IV24ZkrUNcvBkhF9FmPEyJxOq4y1vwweXRnxZZqlLE3zl4DqVhnJ9VWUvX+K1JnO+qB8
 Ujwq8o8jsJpFXz2lvZABdZ9MvxMhoSxCQopBpwSO+cIgzBy3I3WrnKNsnXlBaVuN4o9N
 neLlLCt6Y1U1hjoFKY6rXHInP1NaoWO+3jsuWzaZCXDDb7oRd75CpILooQNP11d9Jnp9
 ZM7w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=fFwrk9jy
Subject: Re: [Buildroot] [PATCH 02/21] configs/ti_am62x_sk_defconfig: fix
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
bXVzdCBiZQo+ICJrMy1hbTYyeCIgbm90ICJrMyIuCj4gCj4gwqAgbWV0YS10aSB1c2VzIHRoZSBP
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
LWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4KCmluZGVlZCwKUmV2aWV3
ZWQtYnk6IEFsZXhhbmRlciBTdmVyZGxpbiA8YWxleGFuZGVyLnN2ZXJkbGluQGdtYWlsLmNvbT4K
Cj4gLS0tCj4gT24gU0stVERBNFZNLCBzdWNoIGVycm9yIGxlYWRzIHRvIGEgcnVudGltZSBib290
IGNyYXNoLgo+IC0tLQo+IMKgY29uZmlncy90aV9hbTYyeF9za19kZWZjb25maWcgfCAyICstCj4g
wqAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvY29uZmlncy90aV9hbTYyeF9za19kZWZjb25maWcgYi9jb25maWdzL3RpX2FtNjJ4
X3NrX2RlZmNvbmZpZwo+IGluZGV4IGY4ODI1MmE4OWMuLmMzYWQ1NTVhODEgMTAwNjQ0Cj4gLS0t
IGEvY29uZmlncy90aV9hbTYyeF9za19kZWZjb25maWcKPiArKysgYi9jb25maWdzL3RpX2FtNjJ4
X3NrX2RlZmNvbmZpZwo+IEBAIC0yMSw3ICsyMSw3IEBAIEJSMl9UQVJHRVRfQVJNX1RSVVNURURf
RklSTVdBUkVfUExBVEZPUk09ImszIgo+IMKgQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FS
RV9UQVJHRVRfQk9BUkQ9ImxpdGUiCj4gwqBCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJF
X0JMMzJfT1BURUU9eQo+IMKgQlIyX1RBUkdFVF9PUFRFRV9PUz15Cj4gLUJSMl9UQVJHRVRfT1BU
RUVfT1NfUExBVEZPUk09ImszIgo+ICtCUjJfVEFSR0VUX09QVEVFX09TX1BMQVRGT1JNPSJrMy1h
bTYyeCIKPiDCoEJSMl9UQVJHRVRfVElfSzNfSU1BR0VfR0VOPXkKPiDCoEJSMl9UQVJHRVRfVElf
SzNfSU1BR0VfR0VOX1NPQ19BTTYyWD15Cj4gwqBCUjJfVEFSR0VUX1RJX0szX1I1X0xPQURFUj15
CgotLSAKQWxleGFuZGVyIFN2ZXJkbGluLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
