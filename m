Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0475C3DA6E
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 17:30:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CE3981DF8;
	Wed,  3 Jan 2024 17:30:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CE3981DF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UVN2ay3zu8Ow; Wed,  3 Jan 2024 17:30:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D09281E2D;
	Wed,  3 Jan 2024 17:29:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D09281E2D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 59F031BF4E6
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 17:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3FEBD60AB3
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 17:29:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FEBD60AB3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xVJqpEfLM7B9 for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 17:29:56 +0000 (UTC)
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 255D360AAE
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 17:29:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 255D360AAE
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-50ea9daac4cso428730e87.3
 for <buildroot@buildroot.org>; Wed, 03 Jan 2024 09:29:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704302993; x=1704907793;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yxw9vKK5sV5klU5jrRhx1PhKylZs1cHYu/8unMtSleY=;
 b=VObfYC1egIX3YbS6AM24ar+CxjvLIvC4ZtqbkQMC+Pn618vuNMobs9PPll8BYQBdcW
 yMgSuTbe+1uFasbFKfsAs94zDlSaU9++E8SoVs923uN8CpF5S2MpkCujpKT/iL6oLffa
 OLeE0JE9xQ1CjBcy9WXhVrRyD/tmIP4/MNUWmAVUcG/DHlg2U+W+p1RXCUAMBWEhlGX/
 /bDcHGB8MFQ81qCLraGnBCirJxX5rDEWlBa22KIkLP1Zbwgn4KntMF2SdaHMVWKtvcSe
 OlG2wATiiny+euMQ1UcgW1E/YCqrtjUO1PvWZ1qJyoXNEM2+nqkc5krPFwlry3HCB/L2
 cKgA==
X-Gm-Message-State: AOJu0Yyde3GWfzPN+oL5AT9aXXNGhMsPkH2qF6Scnnm4aKaE5P+xdgdA
 rBlampSMGKuDBU58jpJ1EWg3X44LCNFYMZwmxYFIZ5vaHnH5nagvoxw626W+
X-Google-Smtp-Source: AGHT+IGn4AVWGDAM4O2vb8K89yeT8O1iH2dQ7EgozCaP8KNhClQ7ROwYNeSw3J8loidWxDBOIyKdQ7VOkP5OzJZ28/w=
X-Received: by 2002:a19:670b:0:b0:50e:3dcd:3ae7 with SMTP id
 b11-20020a19670b000000b0050e3dcd3ae7mr8418269lfc.34.1704302993374; Wed, 03
 Jan 2024 09:29:53 -0800 (PST)
MIME-Version: 1.0
References: <20240103172619.1156235-1-adam.duskett@amarulasolutions.com>
In-Reply-To: <20240103172619.1156235-1-adam.duskett@amarulasolutions.com>
From: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Wed, 3 Jan 2024 10:29:42 -0700
Message-ID: <CAHDQB6OMbvoMTqcW4U_su7_O+8f58rDT_f1xEz5B5NeBKGitjg@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1704302993; x=1704907793;
 darn=buildroot.org; 
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yxw9vKK5sV5klU5jrRhx1PhKylZs1cHYu/8unMtSleY=;
 b=XoMWHPlo8JS1qBkgQwxg4ga10hXK4TLaKmIjxM7VPpEpqd08uwPqUATIEN5M8pzoKj
 7ENYy7M7rHHy69L1sM2qGltrLwFtCimWoWfBzV7Ljw9v+Nqza1xrbw9k30DLaFkNCZC5
 KTLCijPH9oqrUw3B5paaJMflEkP4mZZjA4bKE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=XoMWHPlo
Subject: Re: [Buildroot] [PATCH 1/1] package/fcft: disable uClibc support
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

QWxsOwoKT24gV2VkLCBKYW4gMywgMjAyNCBhdCAxMDoyNuKAr0FNIEFkYW0gRHVza2V0dAo8YWRh
bS5kdXNrZXR0QGFtYXJ1bGFzb2x1dGlvbnMuY29tPiB3cm90ZToKPgo+IHVDbGliYyBzdXBwb3J0
IGRvZXMgbm90IGluY2x1ZGUgdGhlIHRocmVhZHMuaCBoZWFkZXIgZmlsZSB0aGF0IGZjZnQuYyBp
bmNsdWRlcwo+IG9uIGxpbmUgOC4KPgo+IE11c2wgYW5kIEdsaWJDLCBob3dldmVyLCBkbyBpbmNs
dWRlIHRoZSB0aHJlYWRzIGhlYWRlciBmaWxlLiBBcyBzdWNoLCBpdCBpcwo+IG9ubHkgbmVjZXNz
YXJ5IHRvIHR1cm4gb2ZmIHN1cHBvcnQgZm9yIHVDbGliYy4gRnVydGhlcm1vcmUsIHRoZSBvbmx5
IHBhY2thZ2UKPiB0aGF0IGN1cnJlbnRseSBzZWxlY3RzICBCUjJfUEFDS0FHRV9GQ0ZUIGlzIEJS
Ml9QQUNLQUdFX0ZPT1QuIFRoaXMgcGF0Y2ggYWxzbwo+IHVwZGF0ZXMgdGhlICJmb290IiBwYWNr
YWdlIHRvIG1hdGNoIHRoZSBkZXBlbmRlbmNpZXMgb2YgQlIyX1BBQ0tBR0VfRkNGVC4KPgo+IEFs
c28sIHVwZGF0ZSB0aGUgY29tbWVudCBmb3IgQlIyX1BBQ0tBR0VfRkNGVCBhbmQgQlIyX1BBQ0tB
R0VfRk9PVCB0byBtZW50aW9uCj4gdGhhdCBhIGdsaWJjIG9mIHRoZSBtdXNsIHRvb2xjaGFpbiBp
cyBuZWVkZWQuIFRoZSB3b3JkaW5nIG9mIHRoZSBtZXNzYWdlCj4gYm9ycm93cyBmcm9tIHRoZSBs
aXF1aWQtZHNwIHBhY2thZ2UsIHdpdGggdGhlIHdvcmQgInJlcXVpcmVkIiBiZWluZyBzdWJzdGl0
dXRlZAo+IGZvciB0aGUgd29yZCAibmVlZHMiIGFzIHRoZSB3b3JkICJuZWVkcyIgYWxyZWFkeSBl
eGlzdGVkIGZvciB0aGUgZmlmdGggYW5kIGZvb3QKVGhpcyBzaG91bGQgcmVhZCAiZmNmdCBhbmQg
Zm9vdCI7IGhvd2V2ZXIsIEdyYW1tYXJseSBjaGFuZ2VkIGZjZnQgdG8KZm9vdC4gSWYgeW91IHdp
c2ggZm9yIG1lIHRvCnNlbmQgYSB2MiwgcGxlYXNlIGxldCBtZSBrbm93LCBhbmQgSSB3aWxsIGJl
IGhhcHB5IHRvIGRvIHNvLgoKPiBwYWNrYWdlcy4KPgo+IEZpeGVzOgo+IGh0dHA6Ly9hdXRvYnVp
bGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzFiMmRkYTMyYTkwZDdkYjgxMTdlZWRlMDlmNDZkNDRj
ZmZlNjA5OTMKPiBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy81ZjAzYmI1
YzBjMTA3YTJiOTA4YmU5NzQ0MjFhZTBhMDMyZDRkZDg5Cj4gaHR0cDovL2F1dG9idWlsZC5idWls
ZHJvb3QubmV0L3Jlc3VsdHMvMzFhMWYwMjI0MTRhOGExODg4Y2FjNGE1Y2QxNzYxMjU3ZDBmMjE5
Ngo+IGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzQ1MjI3ODFlMDQ0OGIz
MjViNTRlOTNiYmZiMjBmODI5NWVhNzA2MWQKPgo+IFNpZ25lZC1vZmYtYnk6IEFkYW0gRHVza2V0
dCA8YWRhbS5kdXNrZXR0QGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+IC0tLQo+ICBwYWNrYWdlL2Zj
ZnQvQ29uZmlnLmluIHwgNCArKystCj4gIHBhY2thZ2UvZm9vdC9Db25maWcuaW4gfCA0ICsrKy0K
PiAgMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS9mY2Z0L0NvbmZpZy5pbiBiL3BhY2thZ2UvZmNmdC9Db25maWcu
aW4KPiBpbmRleCBiNjU1MTVhM2YxLi5kNmRhMTAxZDUxIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uv
ZmNmdC9Db25maWcuaW4KPiArKysgYi9wYWNrYWdlL2ZjZnQvQ29uZmlnLmluCj4gQEAgLTEsNSAr
MSw2IEBACj4gIGNvbmZpZyBCUjJfUEFDS0FHRV9GQ0ZUCj4gICAgICAgICBib29sICJmY2Z0Igo+
ICsgICAgICAgZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX1VTRVNfR0xJQkMgfHwgQlIyX1RPT0xD
SEFJTl9VU0VTX01VU0wgIyB0aHJlYWRzLmgKPiAgICAgICAgIGRlcGVuZHMgb24gQlIyX1RPT0xD
SEFJTl9IQVNfVEhSRUFEUwo+ICAgICAgICAgc2VsZWN0IEJSMl9QQUNLQUdFX0ZPTlRDT05GSUcK
PiAgICAgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9GUkVFVFlQRQo+IEBAIC00OCw1ICs0OSw2IEBA
IGNvbmZpZyBCUjJfUEFDS0FHRV9GQ0ZUX1NWR19TVVBQT1JUCj4KPiAgZW5kaWYgIyBCUjJfUEFD
S0FHRV9GQ0ZUCj4KPiAtY29tbWVudCAiZmNmdCBuZWVkcyBhIHRvb2xjaGFpbiB3LyB0aHJlYWRz
Igo+ICtjb21tZW50ICJmY2Z0IG5lZWRzIGEgZ2xpYmMgb3IgbXVzbCB0b29sY2hhaW4gdy8gdGhy
ZWFkcyIKPiArICAgICAgIGRlcGVuZHMgb24gIShCUjJfVE9PTENIQUlOX1VTRVNfR0xJQkMgfHwg
QlIyX1RPT0xDSEFJTl9VU0VTX01VU0wpCj4gICAgICAgICBkZXBlbmRzIG9uICFCUjJfVE9PTENI
QUlOX0hBU19USFJFQURTCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZm9vdC9Db25maWcuaW4gYi9w
YWNrYWdlL2Zvb3QvQ29uZmlnLmluCj4gaW5kZXggMjRiM2Y3ODgyMS4uYTg4NzY2ZmNhNiAxMDA2
NDQKPiAtLS0gYS9wYWNrYWdlL2Zvb3QvQ29uZmlnLmluCj4gKysrIGIvcGFja2FnZS9mb290L0Nv
bmZpZy5pbgo+IEBAIC0xLDYgKzEsNyBAQAo+ICBjb25maWcgQlIyX1BBQ0tBR0VfRk9PVAo+ICAg
ICAgICAgYm9vbCAiZm9vdCIKPiAgICAgICAgIGRlcGVuZHMgb24gIUJSMl9TVEFUSUNfTElCUyAj
IHdheWxhbmQKPiArICAgICAgIGRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9VU0VTX0dMSUJDIHx8
IEJSMl9UT09MQ0hBSU5fVVNFU19NVVNMICMgZmNmdAo+ICAgICAgICAgZGVwZW5kcyBvbiBCUjJf
VE9PTENIQUlOX0hBU19USFJFQURTICMgZmNmdCwgd2F5bGFuZAo+ICAgICAgICAgc2VsZWN0IEJS
Ml9QQUNLQUdFX0ZDRlQKPiAgICAgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9GT05UQ09ORklHCj4g
QEAgLTMyLDUgKzMzLDYgQEAgY29uZmlnIEJSMl9QQUNLQUdFX0ZPT1RfVEhFTUVTCj4KPiAgZW5k
aWYgIyBCUjJfUEFDS0FHRV9GT09UCj4KPiAtY29tbWVudCAiZm9vdCBuZWVkcyBhIHRvb2xjaGFp
biB3LyBkeW5hbWljIGxpYnJhcnksIHRocmVhZHMiCj4gK2NvbW1lbnQgImZvb3QgbmVlZHMgYSBn
bGliYyBvciBtdXNsIHRvb2xjaGFpbiB3LyBkeW5hbWljIGxpYnJhcnksIHRocmVhZHMiCj4gKyAg
ICAgICBkZXBlbmRzIG9uICEoQlIyX1RPT0xDSEFJTl9VU0VTX0dMSUJDIHx8IEJSMl9UT09MQ0hB
SU5fVVNFU19NVVNMKQo+ICAgICAgICAgZGVwZW5kcyBvbiAhQlIyX1RPT0xDSEFJTl9IQVNfVEhS
RUFEUyB8fCBCUjJfU1RBVElDX0xJQlMKPiAtLQo+IDIuNDMuMAo+Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
