Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62EE3CD1296
	for <buildroot@archiver.kernel.org>; Tue,  9 Apr 2024 11:36:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 13A67402E5;
	Tue,  9 Apr 2024 11:36:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C8X_esz5Y4Av; Tue,  9 Apr 2024 11:36:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBD3D40972
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBD3D40972;
	Tue,  9 Apr 2024 11:36:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 74B7F1BF3BB
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 11:36:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6EE0F409C9
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 11:36:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8XmPSH4xgPEo for <buildroot@lists.busybox.net>;
 Tue,  9 Apr 2024 11:36:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 05A04402E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05A04402E5
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 05A04402E5
 for <buildroot@buildroot.org>; Tue,  9 Apr 2024 11:36:04 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4166d6dab3dso15213275e9.0
 for <buildroot@buildroot.org>; Tue, 09 Apr 2024 04:36:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712662563; x=1713267363;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hklVl6X/n2XWIKyBWGnY6uYoHoPiB+zPDQmDxDGt6DQ=;
 b=vSKmcGfpLkwXngaDR7o6p8RQTtcseQ6fXmHhxTcnhn1yF/Uz9xz5xFTzmNeqtb02aD
 qBtENoXCIALx2fmSs6AGiwWTUjxwdF4QJniDrHmeC9Q+sOM9Ks0MQLESJJn9OKAFYdE5
 rFRfwUYCfoUHLhFBmfjoQPikCYeQTDByFGknAI+tA/k3EmoL+zJuBhhpmAOuEqhQIN1v
 5wFEyJo+HSy2Bk7yMJ4tlMhTyklG2rwtuPvFg8dl4yg/sMAcJhg3Tuou6Js/k/hDfjFJ
 TSB3yg4LrOmkSEXR+mYgR9pyzkEEyOUO39mjfoNrB7/UEzjxumto9/ZmO2j1MCfBjCqy
 nFdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyOQRs2UDWhg9uK1Acyu1Uzp+ilmBSdKIFjh8xPvXQDeT05q/AhsP1OEcdpsAisUMs3PO4Utc/yzFI7vm82NapwDjFhPsuTQ==
X-Gm-Message-State: AOJu0YyQw5CA6XKY4kIX5R5UDnnIRKrOHh3SiFbfHNHqE54bdhhQA/yT
 cEN1vOdOxf7zF8RniNic/m8LlaJKTIOj53bfIglHQj8GvSdQoRJgqbVwZx9pUhQ=
X-Google-Smtp-Source: AGHT+IESlDVIQ4pxE00UA1nCJNixYeuw6iUbyBLtFwE3mAiOTAc9teGoz9mWJQV692/6JKB4BiD8aQ==
X-Received: by 2002:a05:600c:4750:b0:416:3de5:133d with SMTP id
 w16-20020a05600c475000b004163de5133dmr6848478wmo.7.1712662562874; 
 Tue, 09 Apr 2024 04:36:02 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 fm11-20020a05600c0c0b00b00416b163e52bsm1273276wmb.14.2024.04.09.04.36.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Apr 2024 04:36:02 -0700 (PDT)
Message-ID: <36c61cb3-47ca-4801-81cc-245c63fa7b24@smile.fr>
Date: Tue, 9 Apr 2024 13:36:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org,
 =?UTF-8?Q?Gero_Schw=C3=A4ricke?= <gero.schwaericke@grandcentrix.net>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Anand Gadiyar <gadiyar@ti.com>, Xuanhao Shi <X15000177@gmail.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>
References: <20240407103512.1112712-1-romain.naour@smile.fr>
 <20240407103512.1112712-4-romain.naour@smile.fr>
 <691466c6-f6e9-455a-a956-7bd9e7eb59d4@mind.be>
Content-Language: fr
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <691466c6-f6e9-455a-a956-7bd9e7eb59d4@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712662563; x=1713267363;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hklVl6X/n2XWIKyBWGnY6uYoHoPiB+zPDQmDxDGt6DQ=;
 b=cRexyj6OV4Dt2HhOtYaOkWhHuw7ykqySH4Tq281naZG/kK2OZ2FsKAmNwxboO4MYlh
 tcw/OKm9f/DVPmBRpuwiPbTbHnJ1LIvTf5ULwJpo6qvPBOZrAUblJo82h2GDkUR3Z8Pq
 2EgyMShYPdxv1d9+JwpllMYVo1GvwiB+eC30KJjHF3XegV09F1QTsNc0yF/lwhE4mi7V
 MtNQHV68cp3h5LM7u5wxAhRp3Ng52dytHUhK2FAmbuqpJOQifbc1ubMASMMe3twd83Zt
 RguiQ0TEnLnlIB/pUhjV6Eyc/zD/RL3cwKYoM0AYpfgdm2SkHanFqdnU21jMouFu604F
 zwPw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=cRexyj6O
Subject: Re: [Buildroot] [PATCH v12 03/16] boot/uboot: rename TI_K3_DM
 option to cover further TI K3 SoCs support
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

SGVsbG8gQXJub3V0LAoKTGUgMDcvMDQvMjAyNCDDoCAyMjowMSwgQXJub3V0IFZhbmRlY2FwcGVs
bGUgYSDDqWNyaXTCoDoKPiAKPiAKPiBPbiAwNy8wNC8yMDI0IDEyOjM0LCBSb21haW4gTmFvdXIg
d3JvdGU6Cj4+IEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNfVElfSzNfRE0gb3B0aW9uIGhhcyBiZWVu
IGludHJvZHVjZWQgaW5pdGlhbGx5IHRvCj4+IHN1cHBvcnQgY2VydGFpbiBUSSBLMyBkZXZpY2Vz
IHN1Y2ggYXMgQU02MnggYW5kIEFNNjJBeCB0aGF0IHJlcXVpcmUgYQo+PiBEZXZpY2UgTWFuYWdl
ciAoRE0pIGZpcm13YXJlLgo+Pgo+PiBUaGlzIG9wdGlvbiBuZWVkcyB0byBiZSByZW5hbWVkIHRv
IHVzZSBhIG1vcmUgZ2VuZXJpYyBuYW1lIGluIG9yZGVyCj4+IHRvIGNvdmVyIGZ1cnRoZXIgVEkg
SzMgU29DcyBzdXBwb3J0IGFsb25nIHdpdGggdGhlIG5ldyB1LWJvb3QgYmlubWFuCj4+IHRvb2wg
dGhhdCB3aWxsIGJlIGFkZGVkIGluIGZvbGxvd3VwIHBhdGNoLiBXaXRoIGJpbm1hbiBlbmFibGVk
IGluCj4+IHUtYm9vdCBvbiBUSSBLMyBTb0MsIHRpLWszLWJvb3QtZmlybXdhcmUgaXMgbmVlZGVk
IGF0IGJ1aWxkdGltZSB0bwo+PiBwcm92aWRlIHRpLXN5c2Z3IChTeXN0ZW0gRmlybXdhcmUpIGZv
ciBhbGwgVEkgSzMgU29DIGFsb25nIHdpdGggRGV2aWNlCj4+IE1hbmFnZXIgKERNKSBmaXJtd2Fy
ZSBmb3IgQU02MnggYW5kIEFNNjJBeCBkZXZpY2VzLgo+Pgo+PiBXaXRoIGJpbm1hbiBzdXBwb3J0
IGVuYWJsZWQsIHdlIGRvbid0IG5lZWQgdG8gcHJvdmlkZSB0aGUgcGF0aCBvZiB0aGUKPj4gRGV2
aWNlIE1hbmFnZXIgZmlybXdhcmUgYW55bW9yZSAoc2VlIFsyXSkuCj4+IFdlIGNhbiByZW1vdmUg
RE09IjxETSBmaXJtd2FyZT4ueGVyNWYiIGZyb20gVUJPT1RfTUFLRV9PUFRTLgo+PiBJdCBhbHNv
IG1lYW5zIHRoYXQgd2UgY2FuIGFsc28gcmVtb3ZlIEJSMl9UQVJHRVRfVUJPT1RfVElfSzNfRE1f
U09DTkFNRQo+PiB1c2VkIHRvIGRlZmluZSBETSBwYXRoLgo+Pgo+PiDCoMKgCj4+IERNPSQoQklO
QVJJRVNfRElSKS90aS1kbS8kKFVCT09UX1RJX0szX0RNX1NPQ05BTUUpL2lwY19lY2hvX3Rlc3Ri
X21jdTFfMF9yZWxlYXNlX3N0cmlwLnhlcjVmCj4+Cj4+IEZvciBub3csIGtlZXAgQlIyX1RBUkdF
VF9VQk9PVF9USV9LM19ETV9TT0NOQU1FIGFuZCBETSBvbmx5IHdoZW4KPj4gdGktazMtaW1hZ2Ut
Z2VuIGlzIHVzZWQuIFdlIG5lZWQgdG8gdXBkYXRlIHRpX2FtNjJ4X3NrX2RlZmNvbmZpZwo+PiB0
byB1c2UgYmlubWFuIGJlZm9yZSByZW1vdmluZyB0aGVtIGFsb25nIHdpdGggdGktazMtaW1hZ2Ut
Z2VuLgo+Pgo+PiBbMV0gNTJjZTYwNmMwNWVlM2FjODY5ZjgwODcyOTJiYzNkYmIwZDI1Yjc5Ygo+
PiBbMl0KPj4gaHR0cHM6Ly9zb2Z0d2FyZS1kbC50aS5jb20vcHJvY2Vzc29yLXNkay1saW51eC9l
c2QvQU02MlgvMDlfMDFfMDBfMDgvZXhwb3J0cy9kb2NzL2xpbnV4L0ZvdW5kYXRpb25hbF9Db21w
b25lbnRzL1UtQm9vdC9VRy1HZW5lcmFsLUluZm8uaHRtbAo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBS
b21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4KPj4gLS0tCj4+IMKgIENvbmZpZy5p
bi5sZWdhY3nCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgOCArKysrKysrKwo+PiDCoCBi
b290L3Vib290L0NvbmZpZy5pbsKgwqDCoMKgwqDCoMKgwqDCoCB8IDIzICsrKysrKysrKysrKysr
LS0tLS0tLS0tCj4+IMKgIGJvb3QvdWJvb3QvdWJvb3QubWvCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
wqAgNCArKystCj4+IMKgIGNvbmZpZ3MvdGlfYW02Mnhfc2tfZGVmY29uZmlnIHzCoCAyICstCj4+
IMKgIDQgZmlsZXMgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCj4+
Cj4+IGRpZmYgLS1naXQgYS9Db25maWcuaW4ubGVnYWN5IGIvQ29uZmlnLmluLmxlZ2FjeQo+PiBp
bmRleCBkMDAxOTZlMDhiLi40MDg0ZmZhNTE2IDEwMDY0NAo+PiAtLS0gYS9Db25maWcuaW4ubGVn
YWN5Cj4+ICsrKyBiL0NvbmZpZy5pbi5sZWdhY3kKPj4gQEAgLTE0Niw2ICsxNDYsMTQgQEAgZW5k
aWYKPj4gwqAgwqAgY29tbWVudCAiTGVnYWN5IG9wdGlvbnMgcmVtb3ZlZCBpbiAyMDI0LjA1Igo+
PiDCoCArY29uZmlnIEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNfVElfSzNfRE0KPj4gK8KgwqDCoCBi
b29sICJ1LWJvb3QgVEkgSzMgRE0gb3B0aW9uIGhhcyBiZWVuIHJlbmFtZWQuIgo+PiArwqDCoMKg
IHNlbGVjdCBCUjJfTEVHQUNZCj4+ICvCoMKgwqAgc2VsZWN0IEJSMl9UQVJHRVRfVUJPT1RfTkVF
RFNfVElfSzNfQk9PVF9GSVJNV0FSRQo+PiArwqDCoMKgIGhlbHAKPj4gK8KgwqDCoMKgwqAgVGhl
IFRJIEszIERldmljZSBNYW5hZ2VyIGlzIGFscmVhZHkgaW5jbHVkZWQgaW4KPj4gK8KgwqDCoMKg
wqAgdGktazMtYm9vdC1maXJtd2FyZS4KPj4gKwo+PiDCoCBjb25maWcgQlIyX1BBQ0tBR0VfRkxV
VFRFUl9HQUxMRVJZCj4+IMKgwqDCoMKgwqAgYm9vbCAiZmx1dHRlci1nYWxsZXJ5IHJlbW92ZWQi
Cj4+IMKgwqDCoMKgwqAgc2VsZWN0IEJSMl9MRUdBQ1kKPj4gZGlmZiAtLWdpdCBhL2Jvb3QvdWJv
b3QvQ29uZmlnLmluIGIvYm9vdC91Ym9vdC9Db25maWcuaW4KPj4gaW5kZXggMzliM2YyYzgxYi4u
ZTMxMGMwOTIxNyAxMDA2NDQKPj4gLS0tIGEvYm9vdC91Ym9vdC9Db25maWcuaW4KPj4gKysrIGIv
Ym9vdC91Ym9vdC9Db25maWcuaW4KPj4gQEAgLTI0MCwxOCArMjQwLDIzIEBAIGNvbmZpZyBCUjJf
VEFSR0VUX1VCT09UX05FRURTX09QVEVFX1RFRQo+PiDCoMKgwqDCoMKgwqDCoCBVLUJvb3QsIGFu
ZCB0aGF0IHRoZSBURUUgdmFyaWFibGUgcG9pbnRpbmcgdG8gT1BURUUncwo+PiDCoMKgwqDCoMKg
wqDCoCB0ZWUuZWxmLCBpcyBwYXNzZWQgZHVyaW5nIHRoZSBCdWlsZHJvb3QgYnVpbGQuCj4+IMKg
IC1jb25maWcgQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19USV9LM19ETQo+PiAtwqDCoMKgIGJvb2wg
IlUtQm9vdCBuZWVkcyBUSSBLMyBEZXZpY2UgTWFuYWdlciAoRE0pIgo+PiAtwqDCoMKgICMgV2Ug
dXNlIHRoZSBTb0Mgc2VsZWN0aW9uIGRlZmluZWQgZm9yIHRoZSB0aS1rMy1pbWFnZS1nZW4KPj4g
LcKgwqDCoCAjIHBhY2thZ2UKPj4gLcKgwqDCoCBkZXBlbmRzIG9uIEJSMl9UQVJHRVRfVElfSzNf
SU1BR0VfR0VOCj4+IC3CoMKgwqAgZGVwZW5kcyBvbiBCUjJfVEFSR0VUX1RJX0szX0lNQUdFX0dF
Tl9TT0NfQU02MkFYIHx8Cj4+IEJSMl9UQVJHRVRfVElfSzNfSU1BR0VfR0VOX1NPQ19BTTYyWAo+
PiArY29uZmlnIEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNfVElfSzNfQk9PVF9GSVJNV0FSRQo+PiAr
wqDCoMKgIGJvb2wgIlUtQm9vdCBuZWVkcyB0aS1rMy1ib290LWZpcm13YXJlIgo+PiArwqDCoMKg
IGRlcGVuZHMgb24gQlIyX1RBUkdFVF9USV9LM19CT09UX0ZJUk1XQVJFCj4gCj4gwqBJIGd1ZXNz
IHRoYXQgaWYgdGktazMtYm9vdC1maXJtd2FyZSBpcyBzZWxlY3RlZCwgd2UgY2FuIHByZXR0eSBt
dWNoIGFzc3VtZSB0aGF0Cj4gVS1Cb290IG5lZWRzIGl0LCBubz8gU28gSSB0aGluayB0aGlzIGVu
dGlyZSBjb25maWcgb3B0aW9uIGNhbiBiZSByZW1vdmVkLCBzbyBpdAo+IGdldHMgZW5hYmxlZCBh
dXRvbWF0aWNhbGx5IGlmIHRpLWszLWJvb3QtZmlybXdhcmUgaXMgZW5hYmxlZC4KPiAKPj4gwqDC
oMKgwqDCoCBoZWxwCj4+IC3CoMKgwqDCoMKgIFNvbWUgVEkgSzMgZGV2aWNlcyBuZWVkIHRoZSBE
ZXZpY2UgTWFuYWdlciAoRE0pIGZpcm13YXJlIHRvCj4+IC3CoMKgwqDCoMKgIGJlIGF2YWlsYWJs
ZSBmb3IgdGhlIFUtQm9vdCBidWlsZC4KPj4gK8KgwqDCoMKgwqAgVEkgSzMgZGV2aWNlcyBuZWVk
cyBhdCBsZWFzdCB0aS1zeXNmdyAoU3lzdGVtIEZpcm13YXJlKSB3aGVuCj4+ICvCoMKgwqDCoMKg
IGJ1aWx0IHdpdGggdS1ib290J3MgYmlubWFuIHRvb2wuCj4+IMKgIC1pZiBCUjJfVEFSR0VUX1VC
T09UX05FRURTX1RJX0szX0RNCj4+ICvCoMKgwqDCoMKgIFNvbWUgVEkgSzMgZGV2aWNlcyB1c2lu
ZyBhIHNwbGl0IGZpcm13YXJlIGJvb3QgZmxvdyAoQU02MiwKPj4gK8KgwqDCoMKgwqAgajcyMWUp
IGFsc28gbmVlZCB0aGUgRGV2aWNlIE1hbmFnZXIgKERNKSBmaXJtd2FyZSB0byBiZQo+PiArwqDC
oMKgwqDCoCBhdmFpbGFibGUgZm9yIHRoZSBVLUJvb3QgYnVpbGQuCj4+IMKgICtpZiBCUjJfVEFS
R0VUX1VCT09UX05FRURTX1RJX0szX0JPT1RfRklSTVdBUkUKPiAKPiDCoEkuZS4gdGhpcyBjb3Vs
ZCBqdXN0IGJlCj4gCj4gaWYgQlIyX1RBUkdFVF9USV9LM19CT09UX0ZJUk1XQVJFCgpJbmRlZWQs
IEkgd2FzIGRpc3RyYWN0ZWQgYnkgQlIyX1RBUkdFVF9VQk9PVF9USV9LM19ETV9TT0NOQU1FIHRo
YXQgaXMgc3RpbGwgdXNlZAp1bnRpbCB0aGUgQU02eCBkZWZjb25maWcgYXJlIHVwZGF0ZWQgdG8g
dXNlIGJpbm1hbi4KCkknbGwgcG9zdCBhIGZvbGxvd3VwIHBhdGNoIHRvIGNvbXBsZXRlIHRoZSBy
ZXdvcmsuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gCj4gCj4gwqBSZWdhcmRzLAo+IMKgQXJu
b3V0Cj4gCj4+ICsKPj4gKyMgVElfSzNfRE1fU09DTkFNRSBpcyBvbmx5IG5lZWRlZCB3aGVuIHRp
LWszLWltYWdlLWdlbiBpcyB1c2VkIGZvcgo+PiArIyBUSSBLMyBkZXZpY2VzIHVzaW5nIHRoZSBE
ZXZpY2UgTWFuYWdlciAoRE0pIGZpcm13YXJlLgo+PiArIyBXZSB1c2UgdGhlIFNvQyBzZWxlY3Rp
b24gZGVmaW5lZCBmb3IgdGhlIHRpLWszLWltYWdlLWdlbgo+PiArIyBwYWNrYWdlLgo+PiDCoCBj
b25maWcgQlIyX1RBUkdFVF9VQk9PVF9USV9LM19ETV9TT0NOQU1FCj4+IMKgwqDCoMKgwqAgc3Ry
aW5nCj4+IMKgwqDCoMKgwqAgZGVmYXVsdCAiYW02MmF4eCIgaWYgQlIyX1RBUkdFVF9USV9LM19J
TUFHRV9HRU5fU09DX0FNNjJBWAo+PiBkaWZmIC0tZ2l0IGEvYm9vdC91Ym9vdC91Ym9vdC5tayBi
L2Jvb3QvdWJvb3QvdWJvb3QubWsKPj4gaW5kZXggNDkxZjY1NGNlYy4uNDdmYjQxOWU5MiAxMDA2
NDQKPj4gLS0tIGEvYm9vdC91Ym9vdC91Ym9vdC5tawo+PiArKysgYi9ib290L3Vib290L3Vib290
Lm1rCj4+IEBAIC0xOTQsMTEgKzE5NCwxMyBAQCBVQk9PVF9ERVBFTkRFTkNJRVMgKz0gb3B0ZWUt
b3MKPj4gwqAgVUJPT1RfTUFLRV9PUFRTICs9IFRFRT0kKEJJTkFSSUVTX0RJUikvdGVlLmVsZgo+
PiDCoCBlbmRpZgo+PiDCoCAtaWZlcSAoJChCUjJfVEFSR0VUX1VCT09UX05FRURTX1RJX0szX0RN
KSx5KQo+PiAraWZlcSAoJChCUjJfVEFSR0VUX1VCT09UX05FRURTX1RJX0szX0JPT1RfRklSTVdB
UkUpLHkpCj4+IMKgIFVCT09UX1RJX0szX0RNX1NPQ05BTUUgPSAkKGNhbGwgcXN0cmlwLCQoQlIy
X1RBUkdFVF9VQk9PVF9USV9LM19ETV9TT0NOQU1FKSkKPj4gwqAgVUJPT1RfREVQRU5ERU5DSUVT
ICs9IHRpLWszLWJvb3QtZmlybXdhcmUKPj4gK2lmbmVxICgkKFVCT09UX1RJX0szX0RNX1NPQ05B
TUUpLCkKPj4gwqAgVUJPT1RfTUFLRV9PUFRTICs9Cj4+IERNPSQoQklOQVJJRVNfRElSKS90aS1k
bS8kKFVCT09UX1RJX0szX0RNX1NPQ05BTUUpL2lwY19lY2hvX3Rlc3RiX21jdTFfMF9yZWxlYXNl
X3N0cmlwLnhlcjVmCj4+IMKgIGVuZGlmCj4+ICtlbmRpZgo+PiDCoCDCoCBpZmVxICgkKEJSMl9U
QVJHRVRfVUJPT1RfTkVFRFNfT1BFTlNCSSkseSkKPj4gwqAgVUJPT1RfREVQRU5ERU5DSUVTICs9
IG9wZW5zYmkKPj4gZGlmZiAtLWdpdCBhL2NvbmZpZ3MvdGlfYW02Mnhfc2tfZGVmY29uZmlnIGIv
Y29uZmlncy90aV9hbTYyeF9za19kZWZjb25maWcKPj4gaW5kZXggMzdkZjdhOTNmNy4uYjI4MTQ1
MjZiYiAxMDA2NDQKPj4gLS0tIGEvY29uZmlncy90aV9hbTYyeF9za19kZWZjb25maWcKPj4gKysr
IGIvY29uZmlncy90aV9hbTYyeF9za19kZWZjb25maWcKPj4gQEAgLTM3LDcgKzM3LDcgQEAgQlIy
X1RBUkdFVF9VQk9PVF9CT0FSRF9ERUZDT05GSUc9ImFtNjJ4X2V2bV9hNTMiCj4+IMKgIEJSMl9U
QVJHRVRfVUJPT1RfTkVFRFNfRFRDPXkKPj4gwqAgQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19PUEVO
U1NMPXkKPj4gwqAgQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19BVEZfQkwzMT15Cj4+IC1CUjJfVEFS
R0VUX1VCT09UX05FRURTX1RJX0szX0RNPXkKPj4gK0JSMl9UQVJHRVRfVUJPT1RfTkVFRFNfVElf
SzNfQk9PVF9GSVJNV0FSRT15Cj4+IMKgICMgQlIyX1RBUkdFVF9VQk9PVF9GT1JNQVRfQklOIGlz
IG5vdCBzZXQKPj4gwqAgQlIyX1RBUkdFVF9VQk9PVF9GT1JNQVRfSU1HPXkKPj4gwqAgQlIyX1RB
UkdFVF9VQk9PVF9TUEw9eQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
