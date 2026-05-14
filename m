Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C6AACD4F25
	for <buildroot@archiver.kernel.org>; Thu, 14 May 2026 16:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE66860F15;
	Thu, 14 May 2026 16:37:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Fc1QO3yNOtz; Thu, 14 May 2026 16:37:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB07D60F12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778776676;
	bh=lSA9K4ZxMoChq4Dg55ALBFuu/zGhsl1rvq1DkZPe39U=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rnO9HIeS8M5/ncP6Y/HvVrG5XbxRUO7OetlNbVXqbL8mKviag+xvjeOHJQ9wLbDR8
	 dZcG4zSzVKjOEplC2vmmA9wqstG8PT8B7iud++4lTLNbhLJC+ZRt7cnzU2eOPm95KP
	 vjwSCgkWJGNYpDGDZz6OQnP5Glb+ilCk9kT/sXKK8aQ6Iof+MfsD4j7hFu7uR0+KQQ
	 h0pNDxQ4btM0p9dzZF03dLyq6arTHtweXWX9rbRVFDlYSzx18xbIoMfqRgxhja1Wng
	 tOscf/lhr4meno/G+eQHRjfKTJtGe6IZ0PN8OMYgM1cxh8xgMxaJsNRPP9iQCbRJDD
	 mwqc1oQ1J56eA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB07D60F12;
	Thu, 14 May 2026 16:37:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DC23C36F
 for <buildroot@buildroot.org>; Thu, 14 May 2026 16:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD7B060F12
 for <buildroot@buildroot.org>; Thu, 14 May 2026 16:37:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yxpDnTy9iXB8 for <buildroot@buildroot.org>;
 Thu, 14 May 2026 16:37:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::336; helo=mail-ot1-x336.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E4D3760F11
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4D3760F11
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E4D3760F11
 for <buildroot@buildroot.org>; Thu, 14 May 2026 16:37:53 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-7dca4debedaso7690019a34.2
 for <buildroot@buildroot.org>; Thu, 14 May 2026 09:37:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778776672; cv=none;
 d=google.com; s=arc-20240605;
 b=EvEXegm0LJI7ljwtrmdmd4QSipGRNBmykXI8gIzSjF8hZ7z1spDtWA78W5I8c6L6/v
 7UjG59izDu2Fw+cfiTyqP/dGBZTwYAySnNfktXjFz7hBGhaCimXBFHu0khSDmcRfSFEc
 rO89c4rwZjStDmYjFTxqUq2BtvH7+NJYprVwCHBsIZkP/Tc6wHLIuDHkDrjjKMY9YDD4
 YrAdwkzkZ6gFowgE0zwgM3lNtbWxj6zWRfH7QkTP160zj2ga7FUTn1gFAMHBiDViOsTG
 7+BrklO4Cm2RpXBvgT5ipxTb56mvTOo0Hzei1JNP3t6qzW82cTv++AHsnT1hG1P/TLqC
 O/oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Dg1U3DWGsA8DfqCeOgV9iuNHYVYojacKRhJJCiXmOQo=;
 fh=0GRJY/pWDmB51lOCmu59XBGuXkQM1AYhXpIlLDrM0qw=;
 b=aMiumrIL5bX5M0vnsHIzPGZHZCXMhQqFYuL6yC8U4OQXV2PMGjknPDYTWtQrxH427v
 lP3kxfyQZ4ewLczPQ/iuV/w9onDt/WJHInHlORD32Gv+wEbMNdyfCITycNcA/KSTJp33
 qivX9lNupaTV1BGMiqlWOVkqO3gdyRacq8h0eeiCyFmtLuMn9tRufFIMqSPncX2CapDe
 fYivGnyslJ2XXfLt7xWEfUPUYQmCo8gX5xcf3f1dMDgNTNV51ZFYT8cPsT6q/lSBZ2/Y
 uKAJkIRpukunyL2xO5msfeIWH01k2JLyNAFFzK723+SmqjGTC9ZwJwVOV++dxYhGB7HN
 lPJQ==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778776672; x=1779381472;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Dg1U3DWGsA8DfqCeOgV9iuNHYVYojacKRhJJCiXmOQo=;
 b=CdZ2pf9G+QPBUJ4ea+jbPO3s8tgYPq+NMetYt+z0McB6gkh12+4dV3juMQBkSfPzOF
 4E61dk/RSzJPTVEVwI1f3BeVuizvhkfJv9LGQNz+nayhJ79Q3xmSfUp8eVQDBqt4KPF2
 ntJgyemphat3/15GPvgOnkOQUj3vbF9Fc35e8Mahb7yJ1jxONtFAez1+V6BB6yBjSUPJ
 IcsSwHhQ46pgxhtQRr7HDazuxgzGVNuVMtvDZ4mDKuU0WZbYo5MI2+pHJZsskq//LrSG
 adPJGLHHIL2DInTSg3h1VNVLFk3gVfUWzEXI2chnu4L4Uv6suznEo49S6W3KzqDXAqjd
 /ONQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9FvxFKtRTorJHOzsYhV/1mw4W/iKyQl2VoyMKzx/v2sRgnAjVHQm6LroScIf7U1BNhKIK8eJBUilA=@buildroot.org
X-Gm-Message-State: AOJu0YwrXVStnQIvOXaCZ+Ch1dQbLa9/hvM4AC8x/UlRs6CVhHytFj10
 4rzlLuvPVAVbhXi7jp4v/1YgUvrY2vmigmpQQlk8mxYMxQf7hXSSkv7YTzzL6TdYcu+whIV/hUo
 dRXr5YwQzdrcrhkuFfsLkwD96QV2dJuw=
X-Gm-Gg: Acq92OGI4ujsWIRNgE8jaH4YNxOHvH+UnWWd3VzDGup7Jhb5oSzVXW96GIhzU6aCxdK
 /zwFDz21Z79J4n5b++edPw0FMdtIXsuTTSpv0pUPNZD7FS0v+f5bQ1JGDf9h/bSOuc1SMALffLv
 WzDBOhnEZZAaVNsDGP3hWg1ZLR8rjSRekjVAcSv64Ulm/U5iClDp8jlhgIqOAgII+OW24M6sXXO
 dVaTOeTlne2boo7ve4L49lP41tqxpnY8rIYgVlSHYbrs0YU6aV1kZGdawi/6mIyzu+kdusoKRxG
 nEbk
X-Received: by 2002:a05:6820:4dc9:b0:696:70f0:7ada with SMTP id
 006d021491bc7-69c9429452emr116188eaf.11.1778776672657; Thu, 14 May 2026
 09:37:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260512-radeonsi-aco-compiler-v1-1-6557627f3d55@anodize.com>
 <ce2f40c6-1c9b-4aaa-be5d-9699ada1da3e@smile.fr>
In-Reply-To: <ce2f40c6-1c9b-4aaa-be5d-9699ada1da3e@smile.fr>
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Thu, 14 May 2026 09:37:16 -0700
X-Gm-Features: AVHnY4K7sGyirGfkuRYLq9dGxoPf0gMKl3cMB5kBnbnXX4JJqDNqmftckixUOR8
Message-ID: <CAMWSM7h4zNQ2z1roRwHHQzDDv-+COL5pLe-GKGmZvkzrZut5qQ@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
Cc: Joseph Kogut <joseph@anodize.com>, buildroot@buildroot.org, 
 Bernd Kuhls <bernd@kuhls.net>, Romain Naour <romain.naour@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778776672; x=1779381472; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dg1U3DWGsA8DfqCeOgV9iuNHYVYojacKRhJJCiXmOQo=;
 b=fCM49U6t+EljKN92p1uvdTDUP8rIqMJGKFQ+Sk+BaK21JB5YqSeg4uxqoyTpXd0qo5
 sI0i5uB6PfrD7LozCUD16HEV4rlYm9ZD/0dPaFyq2tGMhSfGVVXahu64OqTsW6RTq2F6
 hC/6T9ZB2EAXEYl+CrCspzK9rQ7nYsQPUnayRwXC96XTSwMNPAfEYjVuDPsu9yUX0t6n
 2G0KGMnCrqofBEV/qegkxBlxZJe9eOZuajz6K5GMMmv/vVFfnf5mhWs52xqzxDlBTjj7
 yxLbg+lRAZpDS2mtpiKkxuvlLenity5W/9I4VvgPWPv0sesS4kcm2myRAu7h4G/QMCa9
 uJYQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=fCM49U6t
Subject: Re: [Buildroot] [PATCH RESEND] package/mesa3d: make LLVM optional
 for radeonsi
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUm9tYWluLAoKT24gVGh1LCBNYXkgMTQsIDIwMjYgYXQgNTo0M+KAr0FNIFJvbWFpbiBO
YW91ciB2aWEgYnVpbGRyb290CjxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cj4KPiBI
ZWxsbyBKb3NlcGgsCj4KPiBMZSAxMi8wNS8yMDI2IMOgIDIxOjI5LCBKb3NlcGggS29ndXQgYSDD
qWNyaXQgOgo+ID4gU2luY2UgbWVzYTNkIHYyNi4wIFswXSwgdGhlIEFDTyBjb21waWxlciBoYXMg
YmVlbiB0aGUgZGVmYXVsdCBvdmVyIExMVk0uCj4gPiBUaGlzIHNoYWRlciBjb21waWxlciBiYWNr
ZW5kIGhhcyBiZWVuIHVzZWQgZm9yIGV2ZW4gbG9uZ2VyIGJ5IHRoZSBSQURWCj4gPiB2dWxrYW4g
ZHJpdmVyLgo+ID4KPiA+IExldCdzIG1ha2UgTExWTSBvcHRpb25hbC4KPiA+Cj4gPiBbMF0gaHR0
cHM6Ly9jZ2l0LmZyZWVkZXNrdG9wLm9yZy9tZXNhL21lc2EvY29tbWl0Lz9pZD1lMjZjMjhmMzEx
Y2M1NDE2ZjZjN2Y1YjA5YTUzY2EyYjE0ZGZiOTU1Cj4KPiBQbGVhc2UgdXBkYXRlIHRvIHRoZSBu
ZXcgZ2l0bGFiIHJlcG9zaXRvcnk6Cj4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21l
c2EvbWVzYS8tL2NvbW1pdC9lMjZjMjhmMzExY2M1NDE2ZjZjN2Y1YjA5YTUzY2EyYjE0ZGZiOTU1
Cj4KCkRvbmUuCgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEpvc2VwaCBLb2d1dCA8am9zZXBoQGFu
b2RpemUuY29tPgo+ID4gLS0tCj4gPiAgcGFja2FnZS9tZXNhM2QvQ29uZmlnLmluIHwgMyArLS0K
PiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCj4gPgo+
ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbWVzYTNkL0NvbmZpZy5pbiBiL3BhY2thZ2UvbWVzYTNk
L0NvbmZpZy5pbgo+ID4gaW5kZXggNjZlYmUwNDM5NC4uMDg4ODFhZjViZCAxMDA2NDQKPiA+IC0t
LSBhL3BhY2thZ2UvbWVzYTNkL0NvbmZpZy5pbgo+ID4gKysrIGIvcGFja2FnZS9tZXNhM2QvQ29u
ZmlnLmluCj4gPiBAQCAtMjUyLDExICsyNTIsMTAgQEAgY29uZmlnIEJSMl9QQUNLQUdFX01FU0Ez
RF9HQUxMSVVNX0RSSVZFUl9SQURFT05TSQo+ID4gICAgICAgYm9vbCAiR2FsbGl1bSBSYWRlb24g
U0kgZHJpdmVyIgo+ID4gICAgICAgZGVwZW5kcyBvbiBCUjJfVVNFX01NVSAjIGxpYmRybQo+ID4g
ICAgICAgZGVwZW5kcyBvbiBCUjJfaTM4NiB8fCBCUjJfeDg2XzY0Cj4gPiAtICAgICBkZXBlbmRz
IG9uIEJSMl9QQUNLQUdFX01FU0EzRF9MTFZNCj4gPiAgICAgICBzZWxlY3QgQlIyX1BBQ0tBR0Vf
TUVTQTNEX0dBTExJVU1fRFJJVkVSCj4gPiAgICAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfTElCRFJN
X0FNREdQVQo+ID4gICAgICAgc2VsZWN0IEJSMl9QQUNLQUdFX0xJQkRSTV9SQURFT04KPiA+IC0g
ICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9MTFZNX0FNREdQVQo+ID4gKyAgICAgc2VsZWN0IEJSMl9Q
QUNLQUdFX0xMVk1fQU1ER1BVIGlmIEJSMl9QQUNLQUdFX01FU0EzRF9MTFZNCj4KPiBUaGlzIHN0
aWxsIHJlcXVpcmVzIHRvIHNldCBBTURfREVCVUc9dXNlbGx2bSBpbiB0aGUgZW52aXJvbm1lbnQg
dG8gcmVhbGx5IHVzZQo+IGxsdm0gY29tcGlsZXIgZm9yIHJhZGVvbnNpLiBCdXQgd2UgY2FuJ3Qg
cmVtb3ZlIHRoaXMgbGluZSBmb3IgdGhlIHNha2Ugb2YKPiByZXByb2R1Y2libGUgYnVpbGRzLgo+
CgpJJ20gbm90IHN1cmUgSSdtIGZvbGxvd2luZywgY2FuIHlvdSBoZWxwIG1lIHVuZGVyc3RhbmQg
d2hhdCB5b3UgbWVhbgphYm91dCByZXByb2R1Y2libGUgYnVpbGRzPyBEb2VzIHRoaXMgcmVxdWly
ZSBhbnkgYWN0aW9uIGZyb20gbWUgaGVyZT8KClNob3VsZCB3ZSBhZGQgYSBub3RlIHRvIHRoZSBj
b21taXQgb3IgS2NvbmZpZyBoZWxwIG1lc3NhZ2UgZXhwbGFpbmluZwp0aGF0IHRoZSBMTFZNIGNv
bXBpbGVyIHJlcXVpcmVzIGFuIGVudmlyb25tZW50IG92ZXJyaWRlIHRvIHVzZT8KCj4gUmV2aWV3
ZWQtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgo+Cj4gQmVzdCByZWdh
cmRzLAo+IFJvbWFpbgo+Cj4gPiAgICAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfRUxGVVRJTFMKPiA+
ICAgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9NRVNBM0RfTkVFRFNfRUxGVVRJTFMKPiA+ICAgICAg
IHNlbGVjdCBCUjJfUEFDS0FHRV9NRVNBM0RfUlVTVElDTF9TVVBQT1JURURfRFJJVkVSCj4gPgo+
ID4gLS0tCj4gPiBiYXNlLWNvbW1pdDogOTY4NGNiOWI0NDA2ZTAxNjgzYTliNTEzNjEwMGQ4MTA0
MGQ1NmFhMAo+ID4gY2hhbmdlLWlkOiAyMDI2MDUxMi1yYWRlb25zaS1hY28tY29tcGlsZXItYWU0
ZTY5N2Q0ODQ4Cj4gPgo+ID4gQmVzdCByZWdhcmRzLAo+ID4gLS0KPiA+IEpvc2VwaCBLb2d1dCA8
am9zZXBoQGFub2RpemUuY29tPgo+ID4KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gPiBidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwo+ID4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAoKQmVzdCwKSm9zZXBoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
