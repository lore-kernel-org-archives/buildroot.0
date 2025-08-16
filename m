Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 376BDCA0EE4
	for <buildroot@archiver.kernel.org>; Sat, 16 Aug 2025 09:53:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAAB461291;
	Sat, 16 Aug 2025 09:53:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2dNCkY8SNMBh; Sat, 16 Aug 2025 09:53:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D45D6126C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D45D6126C;
	Sat, 16 Aug 2025 09:53:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A90C2196
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 09:53:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F60D41370
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 09:53:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7hIt6bnNm4oT for <buildroot@buildroot.org>;
 Sat, 16 Aug 2025 09:53:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4865140C31
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4865140C31
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4865140C31
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 09:53:39 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-55ce521e3f4so2861108e87.1
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 02:53:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755338017; x=1755942817;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oFSkBM5d0LNKOyvZrsXtkBkUoaPY49l/PFoNSuLQjo4=;
 b=Nkui9eyVVhZAx9p23aVzVjO2cLAS7GeskZ1si5WDOcE9OaJCAOvFm9lQKVh5k7Ab5g
 Ol6265/VWaAhcdz9VY/+2xuoyB963RIHG0q9ByI50NyHNWCrKoaV3FKoe7Lz3350pX/B
 hvumrpnMtnsr0WBRDemFO8OaCda7t/QvKDHXMmtPzMOLy1WjaomxGiscqCB5/skZeM9n
 frL9Ufmauh34GAuwxJn1cdoq1svM/jU9ESvTudolpzEAmlhD4TZptUen4nq6B4Rt+YRk
 xAVNoU530eA4dD8MrmjDzIH4oDO2tDZeUgx7sgKdu5T2oRYrEEMfcmEYqRJZtxOLMszp
 G83A==
X-Gm-Message-State: AOJu0YxySlnVPU/+/xWwAZoAoi6bvHCg1I0frJVFx0Y8CKCVgqckUMPa
 z3lEdYu2iu8gNTTVebIKlYRnPdHolOEtMOO/y/xQG6qL4qIv8XubxD0dUfjAS93yPTLMfx1k/Fi
 icXJ4TmzyovBnBwPqgOdiSvUsbhXGzyw=
X-Gm-Gg: ASbGncvh/h5+YqcxVocEOiHzgzc57a1KiRzWZrc++T7oxprn5SSBUXlbPXcXOz8tBgh
 SgZC1HNMdjDME+ENBqR8qixm0+A1RA15ijJUOCcDuvh2dA6Npovr6MHsMRowu1oGbblVuoM8LFF
 I0nNoJdm8iZvqIYyFBMsGO9Cskw0LJt7RObNSyaF2AGWSpI5MFfhbIjr2uKNOgs2ZcV5YOF4Qfx
 oNqr06c
X-Google-Smtp-Source: AGHT+IFyE5p4w4wQdOVPymeN8Eu60CnkWeLdOE1x3fxdpgWjWZsqdeUArzqYO0WdwnUdPfcG6qCDt/hrczMpYgZf4xg=
X-Received: by 2002:a2e:bc24:0:b0:30b:d17b:26aa with SMTP id
 38308e7fff4ca-33409869ba2mr16960401fa.2.1755338016462; Sat, 16 Aug 2025
 02:53:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250815215049.1127002-1-thomas.petazzoni@bootlin.com>
In-Reply-To: <20250815215049.1127002-1-thomas.petazzoni@bootlin.com>
Date: Sat, 16 Aug 2025 11:53:24 +0200
X-Gm-Features: Ac12FXzSZg6Umc_pIibmTqwUCpq15xUES7-xHEMiCDi2m4-dCteuHJTQBXfZwII
Message-ID: <CAGm1_kvSqyMhvDJvXb39snSTzvBrGjz32Qi4NMyJKm523P=92A@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Daniel Sangue <daniel.sangue@sangue.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1755338017; x=1755942817; darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oFSkBM5d0LNKOyvZrsXtkBkUoaPY49l/PFoNSuLQjo4=;
 b=mVafafFxEzfbU887Av7ZOAKqUX+O+3s3cTs/ompz8qBQlRO/YKA/piRMpwVEwrAGEG
 xM+++PAwUI35mj49H3uKocah7tSrAhGoM4iru+bBEmKoaKD1ROVCzlvZ/nu29pFd+56e
 Scm7c8W5IqHjWgUfYDyfd4HzVuu1FLZw5N3E4iczBjqWoKwiAQtQtZeC8eaiXJjZqUMQ
 Dda1YDjN07Ebz5zZQHCZ/JwuBJQfBCcPOjOvynTKM9Sy7FKNom/CrqiMaNAj+AiDkKwa
 hOQ2OrrTex6Sv2nd8sHLPq5bDsHadOyn2DLXhb3yjZKSneCp0IhWDIapEH8qOtscgyMa
 g4Vw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mVafafFx
Subject: Re: [Buildroot] [PATCH] package/libftdi1: bump version to fix
 pkg-config file installation
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCBBdWcgMTUsIDIwMjUgYXQgMTE6NTDigK9QTSBUaG9tYXMgUGV0YXp6b25pCjx0aG9t
YXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IFNpbmNlIHRoZSBidW1wIG9mIGxp
YmZ0ZGkxIHRvIHZlcnNpb24gdjEuNS00OC1nMjJiNDY2N2E4IGluIGNvbW1pdAo+IGQ4MTczZTA4
NGViOWNjZDcwMGI5NjRlMWI4MTE3Yjk2ZTBmZWQzODcsIHRoZSBsaWJmdGRpMS5wYyBmaWxlIGlz
Cj4gaW5zdGFsbGVkIGluICQoU1RBR0lOR19ESVIpL3BrZ2NvbmZpZy9saWJmdGRpMS5wYyBpbnN0
ZWFkIG9mCj4gJChTVEFHSU5HX0RJUikvbGliL3BrZ2NvbmZpZy9saWJmdGRpMS5wYywgbWFraW5n
IGl0ICJpbnZpc2libGUiIHRvCj4gcGtnLWNvbmZpZy4gVGhpcyBpcyB0dXJuIGNhdXNlcyBmbGFz
aHJvbSB0byBub3QgZmluZCBsaWJmdGRpMSBhbmQKPiBmYWlsaW5nIHRvIGJ1aWxkIHdoZW4gbGli
ZnRkaTEgaXMgbmVlZGVkLgo+Cj4gVGhpcyBpc3N1ZSBpcyBjYXVzZSBieSBDTUFLRV9JTlNUQUxM
X0xJQkRJUiBiZWluZyBlbXB0eSBpbiBsaWJmdGRpMSdzCj4gQ01ha2VMaXN0cy50eHQsIHdoaWNo
IGluIHR1cm4gaXMgZHVlIHRvIGluY2x1ZGUoR05VSW5zdGFsbERpcnMpIGJlaW5nCj4gbWlzc2lu
Zy4gVGhpcyBoYXMgYmVlbiBmaXhlZCB1cHN0cmVhbSBhIGZldyBjb21taXRzIGxhdGVyLCBzbyBy
YXRoZXIKPiB0aGFuIGJhY2twb3J0aW5nIGEgcGF0Y2gsIGxldCdzIGp1c3QgdXBkYXRlIHRvIHRo
ZSBjb21taXQgY29udGFpbmluZwo+IHRoZSBmaXgsIDVlNjc0MDNjNGZiNTUzNmEyZWZmZTJlOTEx
ODFkZDczYTJjZmY5MWIuIFRoZSBsaXN0IG9mIGNoYW5nZXMKPiB1cHN0cmVhbSBpczoKPgo+IDVl
Njc0MDNjNGZiNTUzNmEyZWZmZTJlOTExODFkZDczYTJjZmY5MWIgY21ha2U6IGZpeCBidWlsZGlu
ZyBzdGF0aWMgbGliIG9uIHdpbmRvd3MvbXN2Ywo+IDJlNzE0ZWVjMTM3Zjg2Y2ExOTUwNDU3ZDgy
MjZkOGNiOWI3MWM0OTUgbXN2YzogcXVpZXQgdW5pbnRlcmVzdGluZyB3YXJuaW5ncwo+IGQ5NmRi
ZWE4ODczNzNmMjY3NTVlOTg3M2I0YWIwMjBmOTIyYjdjM2IgZml4IHVuaXQgdmFyIHdhcm5pbmcg
aWYgZnRkaV9yZWFkX2VlcHJvbV9sb2NhdGlvbiByZXR1cm5lZCBlcnJvciwgZGF0YSB3b3VsZCBu
b3QgYmUgaW5pdGlhbGl6ZWQKPiBkMzFlM2Q1Njk3ZWFjYmU4N2NkMzEwYjViY2U2MTVmM2Q4NDI2
Y2MwIGNtYWtlOiBmaXggZWxzZWlmIHN0YXRlbWVudAo+IGMyYjdjMjVlMTI3MjIyMmMxNzE5ZGFl
YTU3NjEwOTNmYmM5YzMwMTAgbXN2YzogZml4IHNoYWRvd2VkIHZhcmlhYmxlIHdhcm5pbmcKPiBj
NDk2MmMzOGExYWI0NzBmYmRjODM1YzIzMTU2N2JkNTgyZWI1YTVhIG1zdmM6IGZpeCB3YXJuaW5n
cyBieSB1c2luZyBhbGwgZW51bSB2YWx1ZXMgaW4gY2FzZSBzdGF0ZW1lbnRzCj4gMmE5OTIzMDZj
MGFjZjkzOGIyOWZhMGNkNWZiYzE2MGUyNDQyNDIwOSBBZGQgU0hBUkVETElCUyBvcHRpb24KPiAx
ODQ5OWEyZmE0OTZjMjBlNWUzNTU5MGJiODllYjcwMWZhOWZkZmVhIElnbm9yZSBWU0NvZGUgdGVt
cCBmb2xkZXIKPiA3Njc2ZmI1OWVjZDlmYWM5ZTVlYTM5NDM5OTA1YzkyM2VlN2VlOGM5IHB5dGhv
bi9DTWFrZUxpc3RzLnR4dDogcmV3b3JrIHBvbGljeSBDTVAwMDc4Cj4gY2ZhZWM3M2UwYTVhZDlk
MDVkNjJmMWY1YzM5M2FiMWM1OWJhNzcxYiBDKysgd3JhcHBlcjogZ2V0IHJpZCBvZiB0aGUgQm9v
c3QgZGVwZW5kZW5jeQo+IDEyYThkZTBkYWJhMDgxNjIyN2M3MDEwZmMxYjg0ZDBhYmY3MGE1MDAg
LmVkaXRvcmNvbmZpZzogZml4IGluc2VydF9maW5hbF9uZXdsaW5lIG9wdGlvbgo+IDNkNzI5MzY1
MTQ4MzEzMGFmOWU4YzVmZTY4NWQyOGIyMjZiYWE5OWIgSWdub3JlIGNsYW5nZCBzcGVjaWZpYyBm
aWxlcwo+IDcyZTBlMWU0MDEyNmEyYTk0OThmYjI0OWNhMjZhNzI3YmQ2NzAxMzkgZXhhbXBsZXMv
YXN5bmMuYzogcmVtb3ZlIHVudXNlZCBpbmNsdWRlcwo+IGJmY2RlYTI4NmRmODE2NjBiOTgwYTNi
YzkxOTAyYjU5NzBmZjYzNDcgZXhhbXBsZXMvYXN5bmMuYzogZml4IHNvbWV0aW1lcy11bmluaXRp
YWxpemVkIHdhcm5pbmcKPgo+IChZZXMgdGhlIGNvbW1pdCBjb250YWluaW5nIHRoZSBmaXggaXMg
dGl0bGVkICJjbWFrZTogZml4IGJ1aWxkaW5nCj4gc3RhdGljIGxpYiBvbiB3aW5kb3dzL21zdmMi
LCBidXQgYmVjYXVzZSBpdCBhZGRzCj4gaW5jbHVkZShHTlVJbnN0YWxsRGlycyksIGl0IGFsc28g
Zml4ZXMgb3VyIHByb2JsZW0pLgo+Cj4gRml4ZXM6Cj4KPiAgIGh0dHBzOi8vYXV0b2J1aWxkLmJ1
aWxkcm9vdC5uZXQvcmVzdWx0cy8zNjAwYTliN2YzMjNiNDYxMGFjNjdmZWI3MTcxYzBlMTBiNjM4
M2Q3Lwo+Cj4gQ2M6IFllZ29yIFllZnJlbW92IDx5ZWdvcnNsaXN0c0Bnb29nbGVtYWlsLmNvbT4K
PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3Rs
aW4uY29tPgoKUmV2aWV3ZWQtYnk6IFllZ29yIFllZnJlbW92IDx5ZWdvcnNsaXN0c0Bnb29nbGVt
YWlsLmNvbT4KCj4gLS0tCj4gIHBhY2thZ2UvbGliZnRkaTEvbGliZnRkaTEuaGFzaCB8IDIgKy0K
PiAgcGFja2FnZS9saWJmdGRpMS9saWJmdGRpMS5tayAgIHwgMiArLQo+ICAyIGZpbGVzIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9wYWNr
YWdlL2xpYmZ0ZGkxL2xpYmZ0ZGkxLmhhc2ggYi9wYWNrYWdlL2xpYmZ0ZGkxL2xpYmZ0ZGkxLmhh
c2gKPiBpbmRleCA0MTRiMGFmMGVkLi5lMTEwZGE2YjViIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uv
bGliZnRkaTEvbGliZnRkaTEuaGFzaAo+ICsrKyBiL3BhY2thZ2UvbGliZnRkaTEvbGliZnRkaTEu
aGFzaAo+IEBAIC0xLDUgKzEsNSBAQAo+ICAjIExvY2FsbHkgY29tcHV0ZWQKPiAtc2hhMjU2ICA5
ZmYzYjA4NDVlZDQxMGVkOTQwYTYxOTBmYzRjMTFkNTQ5NjE3ZGUzZGQ0ZTRjNGE5NTkyNjhlYjky
MGMxOGVjICBsaWJmdGRpMS12MS41LTQ4LWcyMmI0NjY3YThjM2JjNDgzNDk0YmE3MzViYTRhZTRk
NWNiOGEwZjAzLWdpdDQudGFyLmd6Cj4gK3NoYTI1NiAgZTg1ZjExNjFkMTlmNjBiNTcwNzUxZjNj
OGJlMzM0ZDMwOWM3MTBlNWY3N2VmOWFmZGMwZWFhMmM0ZmE3M2M5NSAgbGliZnRkaTEtdjEuNS02
Mi1nNWU2NzQwM2M0ZmI1NTM2YTJlZmZlMmU5MTE4MWRkNzNhMmNmZjkxYi1naXQ0LnRhci5nego+
Cj4gICMgSGFzaCBmb3IgbGljZW5zZSBmaWxlczoKPiAgc2hhMjU2ICA1MjRmNDY0MjhiZjcyYmI4
YzZhY2ZlY2E0OTA5NTUxZmQyZTBiZGJiNTMwNTQwNmQzODM4MmY0MDU2MDk1YzU2ICBMSUNFTlNF
Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGliZnRkaTEvbGliZnRkaTEubWsgYi9wYWNrYWdlL2xp
YmZ0ZGkxL2xpYmZ0ZGkxLm1rCj4gaW5kZXggOGE2ZGI1ODQ3Ni4uMzFmZmExYWNhMyAxMDA2NDQK
PiAtLS0gYS9wYWNrYWdlL2xpYmZ0ZGkxL2xpYmZ0ZGkxLm1rCj4gKysrIGIvcGFja2FnZS9saWJm
dGRpMS9saWJmdGRpMS5tawo+IEBAIC00LDcgKzQsNyBAQAo+ICAjCj4gICMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjCj4KPiAtTElCRlRESTFfVkVSU0lPTiA9IHYxLjUtNDgtZzIyYjQ2NjdhOGMzYmM0
ODM0OTRiYTczNWJhNGFlNGQ1Y2I4YTBmMDMKPiArTElCRlRESTFfVkVSU0lPTiA9IHYxLjUtNjIt
ZzVlNjc0MDNjNGZiNTUzNmEyZWZmZTJlOTExODFkZDczYTJjZmY5MWIKPiAgTElCRlRESTFfU0lU
RSA9IGdpdDovL2RldmVsb3Blci5pbnRyYTJuZXQuY29tL2xpYmZ0ZGkKPiAgTElCRlRESTFfSU5T
VEFMTF9TVEFHSU5HID0gWUVTCj4gIExJQkZUREkxX0RFUEVOREVOQ0lFUyA9IGhvc3QtcGtnY29u
ZiBsaWJ1c2IKPiAtLQo+IDIuNTAuMQo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
