Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C3DEC48BC4
	for <buildroot@archiver.kernel.org>; Sat, 17 Feb 2024 10:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67D3683FC7;
	Sat, 17 Feb 2024 10:28:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JYXg-MF1SxiK; Sat, 17 Feb 2024 10:28:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CBDF83FC2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CBDF83FC2;
	Sat, 17 Feb 2024 10:28:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4DE411BF841
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 10:28:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45B1D41B42
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 10:28:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DuipSUlz835B for <buildroot@lists.busybox.net>;
 Sat, 17 Feb 2024 10:28:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F1F1541B40
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1F1541B40
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F1F1541B40
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 10:28:41 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-5101cd91017so3750785e87.2
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 02:28:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708165719; x=1708770519;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xcu7OqhlfgV69KFTVpZClxzCuGNuEkYs8oZTRhwV+4Y=;
 b=Q4s7szO0xCff7051e8WEPQZTaxAxpK4SV4IK+UfemuH4w8m2XJ1Iv5tzf89HlCaC8u
 0Ei3t6OCzxHTWu7rih38X3Q5Pznse/FN7aZ8NwYBoxMNHCk8tXLpRmqQqQoe8LJKvV2G
 6O5pVqZ9PL+vveBLlK+vz31XFl2JhMto0yEviSfyBger6muIQKZtDburBUg0QwRlffYQ
 24zqEvvjNz5ayceUKjx/liapYhMyz1KqExypsUOIDFUgL+mLuN/v3ho33KZVfNrNo9yB
 h704F/qxiA3Jd6Ty2y5MYm126XfRaqCSoSGOM6zz7YVSRr1AYIc+0Kr0vSFyoALp7S0i
 Lh3Q==
X-Gm-Message-State: AOJu0YybfdSKu+wZRmDZxRGTAYKPLzRS3gPJQHBPoyWlKsT9fVQtxu5I
 Ge81RkCyFx+is4v0EPKYgfWOH1107gSrVk+25qJosn+yi0bEcMvZFo2QNsDqOCx1CGAwF2ZY0Xj
 vUp8=
X-Google-Smtp-Source: AGHT+IERtF/uYf0PkNqwWGkdAg2NoxYmFCwh/ojLp8kSlgScUZd+aAc3EPeF8fujcFyGIgrTwWRgnA==
X-Received: by 2002:ac2:5a4c:0:b0:512:9e78:a070 with SMTP id
 r12-20020ac25a4c000000b005129e78a070mr1347839lfn.49.1708165718947; 
 Sat, 17 Feb 2024 02:28:38 -0800 (PST)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com.
 [209.85.218.51]) by smtp.gmail.com with ESMTPSA id
 tj1-20020a170907c24100b00a3d1b3c5f1esm858103ejc.77.2024.02.17.02.28.37
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Feb 2024 02:28:38 -0800 (PST)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-a26ed1e05c7so388899766b.2
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 02:28:37 -0800 (PST)
X-Received: by 2002:a17:906:2a90:b0:a3e:1ab9:b6a1 with SMTP id
 l16-20020a1709062a9000b00a3e1ab9b6a1mr738394eje.21.1708165717135; Sat, 17 Feb
 2024 02:28:37 -0800 (PST)
MIME-Version: 1.0
References: <CA+h8R2qSV+Yd=HDfNKKFvERdWRTdsXxpsnZe9DHG26pEigphaQ@mail.gmail.com>
In-Reply-To: <CA+h8R2qSV+Yd=HDfNKKFvERdWRTdsXxpsnZe9DHG26pEigphaQ@mail.gmail.com>
Date: Sat, 17 Feb 2024 02:28:25 -0800
X-Gmail-Original-Message-ID: <CA+h8R2r7ihf8rrQBatVh1=SdMJk2QtaNtzba00wefr19yZmHug@mail.gmail.com>
Message-ID: <CA+h8R2r7ihf8rrQBatVh1=SdMJk2QtaNtzba00wefr19yZmHug@mail.gmail.com>
To: Buildroot Mailing List <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1708165719; x=1708770519; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xcu7OqhlfgV69KFTVpZClxzCuGNuEkYs8oZTRhwV+4Y=;
 b=1a10BA9sflQR26YxPPTAz5bmAXpT3twDZK6R83zaQRd9r6WhIsLFXEfgeiBHXUwXqo
 +DNnfcEXhWx/M8tFii5u2nUHv1z07sFji9Xw2OBiWq5F1CzvR2nNKn0Zqt0X/4d+KliG
 MB9KyByS+F4ViDGt10kaXL+4GtSuW1J1535CjtqIk4SMKQhGN44qmaFtHN+m0gFiEaD7
 I++tcC6YAT52a60ecoTXNFw5j20o8IcL4ZHiTyKdRBsZGoSUqRBfB3gxlIeypE5VjDZV
 8mbgOF/Bh0YWk7zTngZC3MuRZkmHfzqjMYby14YGLEQCo1p5lPnvlTA9sxWGeP2HFyua
 f1DA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=1a10BA9s
Subject: Re: [Buildroot] build failure on Ubuntu 22.04 LTS: TIME_BITS=64 is
 allowed only with FILE_OFFSET_BITS=64
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpUaGUgZml4IEkgaW5jbHVkZWQgaW4gdGhlIGUtbWFpbCBiZWxvdyBkb2VzIG5vdCB3b3Jr
IGluIGFsbCBjYXNlcy4KClRoaXMgd29ya3MgdG8gc3BlY2lmaWNhbGx5IGZpeCB0aGUgc3VkbyBi
dWlsZCBmYWlsdXJlIG9uIFVidW50dSAyMi4wNC40IExUUzoKCk9uIFNhdCwgRmViIDE3LCAyMDI0
IGF0IDE6MzLigK9BTSBDaHJpc3RpYW4gU3Rld2FydCA8Y2hyaXN0aWFuQGFwZXJ0dXJlLnVzPiB3
cm90ZToKPgo+IE9uIGEgZnJlc2ggVWJ1bnR1IDIyLjA0LjQgTFRTIFZNOgo+Cj4gZ2l0IGNsb25l
IGh0dHBzOi8vZ2l0aHViLmNvbS9idWlsZHJvb3QvYnVpbGRyb290Cj4gY2QgYnVpbGRyb290Cj4K
PiAjIG1hc3RlciBhcyBvZiB0aGlzIGUtbWFpbAo+IGdpdCBjaGVja291dCA2YzQ1NTUwNWViNWVk
OGVkNWJiZjA5MGYyYmZiNjI0MWM5ZjE1M2EyCj4KPiBjYXQgPDxFT0YgPj4gZGVmY29uZmlnCj4g
QlIyX2FybT15Cj4gQlIyX2NvcnRleF9hNz15Cj4gQlIyX0JJTlVUSUxTX1ZFUlNJT05fMl80MV9Y
PXkKPiBCUjJfR0NDX1ZFUlNJT05fMTNfWD15Cj4gQlIyX1RPT0xDSEFJTl9CVUlMRFJPT1RfQ1hY
PXkKPiBCUjJfQ0NBQ0hFPXkKPiBCUjJfUEFDS0FHRV9TVURPPXkKPiBFT0YKPgo+IG1ha2UgZGVm
Y29uZmlnIEJSMl9ERUZDT05GSUc9ZGVmY29uZmlnCj4KPiAjIGZhaWxzIHdpdGggZXJyb3Igc2hv
d24gYmVsb3cKPiBtYWtlIHN1ZG8KPgoKSGVyZSBpcyBhbiBhbHRlcm5hdGl2ZSBmaXggd2hpY2gg
cGF0Y2hlcyBTdWRvIHNwZWNpZmljYWxseToKCkZyb20gM2UzOTI2MGVhNWVlMTZkOTUzNjNmNTFk
NTY4NDQ0NzYzNjI2OTA5NiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKRnJvbTogQ2hyaXN0aWFu
IFN0ZXdhcnQgPGNocmlzdGlhbkBhcGVydHVyZS51cz4KRGF0ZTogU2F0LCAxNyBGZWIgMjAyNCAw
MToxNjowOSAtMDgwMApTdWJqZWN0OiBbUEFUQ0hdIHBhY2thZ2Uvc3Vkbzogc2V0IEZJTEVfT0ZG
U0VUX0JJVFMgYW5kIFRJTUVfQklUUyBmb3IgaG9zdAogbWtzaWdsaXN0CgpBZGQgZmxhZ3MgZm9y
IDY0IGJpdCB0aW1lc3RhbXBzIHdoZW4gYnVpbGRpbmcgaG9zdCBta3NpZ2xpc3QuCgotRF9GSUxF
X09GRlNFVF9CSVRTPTY0IC1EX1RJTUVfQklUUz02NAoKQnVpbGQgZmFpbHVyZSBmaXhlZDoKCi91
c3IvaW5jbHVkZS9mZWF0dXJlcy10aW1lNjQuaDoyNjo1OiBlcnJvcjogI2Vycm9yICJfVElNRV9C
SVRTPTY0IGlzCmFsbG93ZWQgb25seSB3aXRoIF9GSUxFX09GRlNFVF9CSVRTPTY0IgogICAyNiB8
ICMgICBlcnJvciAiX1RJTUVfQklUUz02NCBpcyBhbGxvd2VkIG9ubHkgd2l0aCBfRklMRV9PRkZT
RVRfQklUUz02NCIKCkZpeGVzOiBodHRwczovL2dpdGh1Yi5jb20vc2tpZmZvcy9Ta2lmZk9TL2lz
c3Vlcy8zMDYKClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBTdGV3YXJ0IDxjaHJpc3RpYW5AYXBl
cnR1cmUudXM+Ci0tLQogLi4uZS5pbi1zZXQtVElNRV9CSVRTLWFuZC1GSUxFX09GRlNFVF9CLnBh
dGNoIHwgMjggKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDI4IGluc2VydGlv
bnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NApwYWNrYWdlL3N1ZG8vMDAwMS1saWItdXRpbC1NYWtl
ZmlsZS5pbi1zZXQtVElNRV9CSVRTLWFuZC1GSUxFX09GRlNFVF9CLnBhdGNoCgpkaWZmIC0tZ2l0
IGEvcGFja2FnZS9zdWRvLzAwMDEtbGliLXV0aWwtTWFrZWZpbGUuaW4tc2V0LVRJTUVfQklUUy1h
bmQtRklMRV9PRkZTRVRfQi5wYXRjaApiL3BhY2thZ2Uvc3Vkby8wMDAxLWxpYi11dGlsLU1ha2Vm
aWxlLmluLXNldC1USU1FX0JJVFMtYW5kLUZJTEVfT0ZGU0VUX0IucGF0Y2gKbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uZmI4NDAwMmMyNAotLS0gL2Rldi9udWxsCisrKyBi
L3BhY2thZ2Uvc3Vkby8wMDAxLWxpYi11dGlsLU1ha2VmaWxlLmluLXNldC1USU1FX0JJVFMtYW5k
LUZJTEVfT0ZGU0VUX0IucGF0Y2gKQEAgLTAsMCArMSwyOCBAQAorRnJvbSA3YTAwNzRhODIyNDgy
MjgwNjIwNTQ0NzZiZDMxN2I5YTQwYWY1OGRkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bTogQ2hyaXN0aWFuIFN0ZXdhcnQgPGNocmlzdGlhbkBhcGVydHVyZS51cz4KK0RhdGU6IFNhdCwg
MTcgRmViIDIwMjQgMDI6MjI6NDYgLTA4MDAKK1N1YmplY3Q6IFtQQVRDSF0gbGliL3V0aWwvTWFr
ZWZpbGUuaW46IHNldCBUSU1FX0JJVFMgYW5kIEZJTEVfT0ZGU0VUX0JJVFMgdG8KKyA2NAorCitG
aXhlcyBhIGJ1aWxkIGZhaWx1cmUgYnVpbGRpbmcgbWtzaWdsaXN0IG9uIFVidW50dSAyMi4wNC40
IExUUy4KKworU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIFN0ZXdhcnQgPGNocmlzdGlhbkBhcGVy
dHVyZS51cz4KKy0tLQorIGxpYi91dGlsL01ha2VmaWxlLmluIHwgMSArCisgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspCisKK2RpZmYgLS1naXQgYS9saWIvdXRpbC9NYWtlZmlsZS5pbiBi
L2xpYi91dGlsL01ha2VmaWxlLmluCitpbmRleCAwNTQ1NWY3MDEuLmE4Yzg0ODg4YiAxMDA2NDQK
Ky0tLSBhL2xpYi91dGlsL01ha2VmaWxlLmluCisrKysgYi9saWIvdXRpbC9NYWtlZmlsZS5pbgor
QEAgLTcyLDYgKzcyLDcgQEAgQ1BQREVGUyA9IC1EX1BBVEhfU1VET19DT05GPVwiQHN1ZG9fY29u
ZkBcIgorIENQUEZMQUdTID0gLUkkKGluY2RpcikgLUkkKHRvcF9idWlsZGRpcikgLUkuIC1JJChz
cmNkaXIpICQoQ1BQREVGUykgXAorICAgICAgICAgQENQUEZMQUdTQCAtRERFRkFVTFRfVEVYVF9E
T01BSU49XCJAUEFDS0FHRV9OQU1FQFwiCisgSE9TVENQUEZMQUdTID0gLUkkKGluY2RpcikgLUkk
KHRvcF9idWlsZGRpcikgLUkuIC1JJChzcmNkaXIpICQoQ1BQREVGUykgXAorKyAgICAgICAgICAg
LURfVElNRV9CSVRTPTY0IC1EX0ZJTEVfT0ZGU0VUX0JJVFM9NjQgXAorICAgICAgICAgICAgQENQ
UEZMQUdTX0ZPUl9CVUlMREAgLURERUZBVUxUX1RFWFRfRE9NQUlOPVwiQFBBQ0tBR0VfTkFNRUBc
IgorCisgIyBVc3VhbGx5IC1PIGFuZC9vciAtZworLS0KKzIuNDMuMQorCi0tIAoyLjQzLjEKCgou
Li4gYWdhaW4gSSBhbSBub3Qgc3VyZSBpZiB0aGlzIGlzIHRoZSByaWdodCB3YXkgdG8gZml4IHRo
aXMuCgpCZXN0IHJlZ2FyZHMsCkNocmlzdGlhbiBTdGV3YXJ0Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
