Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 838A5C54E41
	for <buildroot@archiver.kernel.org>; Wed,  6 Mar 2024 09:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DEF2405F7;
	Wed,  6 Mar 2024 09:35:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZUDAHbILhzjE; Wed,  6 Mar 2024 09:34:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2612405CB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B2612405CB;
	Wed,  6 Mar 2024 09:34:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B62C41BF3DA
 for <buildroot@lists.busybox.net>; Wed,  6 Mar 2024 09:34:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AFE4560829
 for <buildroot@lists.busybox.net>; Wed,  6 Mar 2024 09:34:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vQ7rEsGzDwfo for <buildroot@lists.busybox.net>;
 Wed,  6 Mar 2024 09:34:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 314506080E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 314506080E
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 314506080E
 for <buildroot@buildroot.org>; Wed,  6 Mar 2024 09:34:56 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2d269b2ff48so23634341fa.3
 for <buildroot@buildroot.org>; Wed, 06 Mar 2024 01:34:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709717694; x=1710322494;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Irb8cnMVaORqFWjDXk9aKhV2/rdgXIgRb8KW4RskJU8=;
 b=UKjBAV206or9ZAt2bioPb0YGzNbXRNTz+CkT+Xaq/SeAs8BMETSwF5F6DV9pWD03kh
 OIAn/0t7xHE2cRaFHvubNX9h151McCSWi2NYO0E8Hzz7LcpAz5ADwMPwFMJvD8LQTexP
 9caMSjxDSXlx4+WxUQqZFPHTNJ5yH49G3VaXKDxYHtcGMmhutVOnv62sQE9nDEg2A4hh
 ApqZw4xA09l3NNr+ZeM+7vrBHR9uAbQGwW8QxBa32a1dZHpcE67KCx+m9JT3zfb7lgXJ
 wqFj1Flhg7WnjqxSlpOSVNmg7wPIeZEmPk6AJpMfS5ME+IYSWcajOv6BJigoHkNjxZOa
 1VUA==
X-Gm-Message-State: AOJu0YzDgTfkLYN7PDUIyxlI8l72W/kJo06W2vS+KghqwBZocY16hK3N
 da0PdPwN/ItsHLCWkn6djEuT6bzNwzB1ZBNXSc7QBOM3q/HwwsKViw1/sa8qXiAWTVAhFJ1QiAL
 LEzCokjHBfEhj3D3PJofEOqD0Bv+WPAz0c/s=
X-Google-Smtp-Source: AGHT+IFt2/uKZJHFkh6zFHIy11rxpcpZm7rqpjHayYKoZc+wBk2oUYpThKEHI9HHGb2j/DjFXMaB8+bBnxrOuH+WAl0=
X-Received: by 2002:a2e:a796:0:b0:2d2:f394:fc19 with SMTP id
 c22-20020a2ea796000000b002d2f394fc19mr4111149ljf.27.1709717693416; Wed, 06
 Mar 2024 01:34:53 -0800 (PST)
MIME-Version: 1.0
References: <20240305135724.1146746-1-fontaine.fabrice@gmail.com>
 <87msrbyfzi.fsf@48ers.dk>
In-Reply-To: <87msrbyfzi.fsf@48ers.dk>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 6 Mar 2024 10:34:41 +0100
Message-ID: <CAPi7W82jVPEsNxiUTWs03mDwJYBAsRxkGg0WGgO_2ENfBEcvPw@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709717694; x=1710322494; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Irb8cnMVaORqFWjDXk9aKhV2/rdgXIgRb8KW4RskJU8=;
 b=eGV13J1A40Uiy8W++u0X921uz8zchX5USXozaLkG0zW8xO03kOL/x9BHw6vD0bca+p
 vTmWQaYPnA5LkJTLF59GVrC0BqmfI/jQoavp3RewhHjiX0pPWSxhBDxLNghtrDSOWgYy
 hzBl5fsIlmvwyikkqnfYoveIEVKn6sKOuFgikQ1md9alwk+Q2FkuhaF8BW+XjOGr34ZU
 nuTGwjoHPYgp8isAU2bJMLkrs0SFhHZ+2dRo8muaETWNev2qFb9TfdPUWZOg4JjPBqH9
 3/Nzcml9DpmvFg1zIG006GN6X+VXJFkpc73xG37Gmh/eSfXWvXqrP025ihltTs8KZGAK
 OGgA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=eGV13J1A
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/policycoreutils: fix build with BR2_TIME_BITS_64
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgbWVyLiA2IG1hcnMgMjAyNCDDoCAwODozMCwgUGV0ZXIgS29yc2dhYXJkIDxwZXRlckBrb3Jz
Z2FhcmQuY29tPiBhIMOpY3JpdCA6Cj4KPiA+Pj4+PiAiRmFicmljZSIgPT0gRmFicmljZSBGb250
YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+IHdyaXRlczoKPgo+ICA+IERvIG5vdCBy
ZW1vdmUgX0ZJTEVfT0ZGU0VUX0JJVFM9NjQgZnJvbSBDRkxBR1MgYW5kIENQUEZMQUdTIHRvIGF2
b2lkIHRoZQo+ICA+IGZvbGxvd2luZyBidWlsZCBmYWlsdXJlIHdpdGggQlIyX1RJTUVfQklUU182
NCByYWlzZWQgc2luY2UgY29tbWl0Cj4gID4gM2M0MjdjNjQ3MjY1NjBlYTE3NDMyODJhM2ZkYjc4
ZjViMjg2OTJlYjoKPgo+ICA+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSAvaG9tZS9mYWJyaWNlL2J1
aWxkcm9vdC9vdXRwdXQvaG9zdC9taXBzLWJ1aWxkcm9vdC1saW51eC1nbnUvc3lzcm9vdC91c3Iv
aW5jbHVkZS9mZWF0dXJlcy5oOjM5NCwKPiAgPiAgICAgICAgICAgICAgICAgIGZyb20gL2hvbWUv
ZmFicmljZS9idWlsZHJvb3Qvb3V0cHV0L2hvc3QvbWlwcy1idWlsZHJvb3QtbGludXgtZ251L3N5
c3Jvb3QvdXNyL2luY2x1ZGUvZXJybm8uaDoyNSwKPiAgPiAgICAgICAgICAgICAgICAgIGZyb20g
cHAuYzoyMDoKPiAgPiAvaG9tZS9mYWJyaWNlL2J1aWxkcm9vdC9vdXRwdXQvaG9zdC9taXBzLWJ1
aWxkcm9vdC1saW51eC1nbnUvc3lzcm9vdC91c3IvaW5jbHVkZS9mZWF0dXJlcy10aW1lNjQuaDoy
Njo1OiBlcnJvcjogI2Vycm9yICJfVElNRV9CSVRTPTY0IGlzIGFsbG93ZWQgb25seSB3aXRoIF9G
SUxFX09GRlNFVF9CSVRTPTY0Igo+ICA+ICAgIDI2IHwgIyAgIGVycm9yICJfVElNRV9CSVRTPTY0
IGlzIGFsbG93ZWQgb25seSB3aXRoIF9GSUxFX09GRlNFVF9CSVRTPTY0Igo+ICA+ICAgICAgIHwg
ICAgIF5+fn5+Cj4KPiAgPiBJbmRlZWQsIHRoaXMgTEZTIHdvcmthcm91bmQgd2FzIHRoZXJlIHNp
bmNlIHRoZSBhZGRpdGlvbiBvZiB0aGUgcGFja2FnZQo+ICA+IGluIGNvbW1pdCBjYjMyOGY3N2Y4
ZjA3YmZkODlkNmI2OTM4NWM5NDFhN2IyODE3MzJiICBhbmQgaXMgb25seSBuZWVkZWQKPiAgPiB0
byBmaXggYSBidWlsZCBmYWlsdXJlIHdpdGggdGhlIG9sZCBjb2Rlc291cmNlcnktYXJtIHRvb2xj
aGFpbiBmcm9tIDIwMTQKPiAgPiB3aGljaCB1c2VzIGdsaWJjIDwgMi4yMy4gYXMgZ2xpYmMgMi4y
MyB3YXMgcmVsZWFzZWQgaW4gRmVicnVhcnkgMjAxNjoKPiAgPiBodHRwczovL3NvdXJjZXdhcmUu
b3JnL2dsaWJjL3dpa2kvUmVsZWFzZS8yLjIzLCBkcm9wIHRoaXMgd29ya2Fyb3VuZCBhcwo+ICA+
IGFscmVhZHkgZG9uZSBmb3IgbGlic2VsaW51eCBpbiBjb21taXQKPiAgPiBjMWZhOWJjMmY3YTRl
NTQ4MWVkZjRmY2U1YzAzZGQ0NTg2MmZlNzJjLiBBIGZvbGxvdy11cCBwYXRjaCB3aWxsIGFsc28K
PiAgPiBkcm9wIGNvZGVzb3VyY2VyeS1hcm0gdG9vbGNoYWluLgo+Cj4gID4gRml4ZXM6IDNjNDI3
YzY0NzI2NTYwZWExNzQzMjgyYTNmZGI3OGY1YjI4NjkyZWIKPiAgPiAgLSBObyBhdXRvYnVpbGRl
ciBmYWlsdXJlcyAoeWV0KQo+Cj4gID4gU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8
Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4gID4gLS0tCj4gID4gQ2hhbmdlcyB2MSAtPiB2
MjoKPiAgPiAgLSBBbHNvIGZpeCBob3N0IHBhY2thZ2UKPgo+ICA+ICBwYWNrYWdlL3BvbGljeWNv
cmV1dGlscy9wb2xpY3ljb3JldXRpbHMubWsgfCAxNyArKy0tLS0tLS0tLS0tLS0tLQo+ICA+ICAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKPgo+ICA+IGRp
ZmYgLS1naXQgYS9wYWNrYWdlL3BvbGljeWNvcmV1dGlscy9wb2xpY3ljb3JldXRpbHMubWsgYi9w
YWNrYWdlL3BvbGljeWNvcmV1dGlscy9wb2xpY3ljb3JldXRpbHMubWsKPiAgPiBpbmRleCA1Njg4
OTI0MmUzLi4zYWQ3ZTlhNWIzIDEwMDY0NAo+ICA+IC0tLSBhL3BhY2thZ2UvcG9saWN5Y29yZXV0
aWxzL3BvbGljeWNvcmV1dGlscy5tawo+ICA+ICsrKyBiL3BhY2thZ2UvcG9saWN5Y29yZXV0aWxz
L3BvbGljeWNvcmV1dGlscy5tawo+ICA+IEBAIC0xMSw3ICsxMSw3IEBAIFBPTElDWUNPUkVVVElM
U19MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQo+ICA+ICBQT0xJQ1lDT1JFVVRJTFNfQ1BFX0lEX1ZF
TkRPUiA9IHNlbGludXhwcm9qZWN0Cj4KPiAgPiAgUE9MSUNZQ09SRVVUSUxTX0RFUEVOREVOQ0lF
UyA9IGxpYnNlbWFuYWdlIGxpYmNhcC1uZyAkKFRBUkdFVF9OTFNfREVQRU5ERU5DSUVTKQo+ICA+
IC1QT0xJQ1lDT1JFVVRJTFNfTUFLRV9PUFRTID0gTERMSUJTPSQoVEFSR0VUX05MU19MSUJTKQo+
ICA+ICtQT0xJQ1lDT1JFVVRJTFNfTUFLRV9PUFRTID0gJChUQVJHRVRfQ09ORklHVVJFX09QVFMp
IExETElCUz0kKFRBUkdFVF9OTFNfTElCUykKPgo+ICA+ICBpZmVxICgkKEJSMl9QQUNLQUdFX0xJ
TlVYX1BBTSkseSkKPiAgPiAgUE9MSUNZQ09SRVVUSUxTX0RFUEVOREVOQ0lFUyArPSBsaW51eC1w
YW0KPiAgPiBAQCAtMjgsMTQgKzI4LDYgQEAgaWZlcSAoJChCUjJfUEFDS0FHRV9MSU5VWF9QQU0p
JChCUjJfUEFDS0FHRV9BVURJVCkseXkpCj4gID4gIFBPTElDWUNPUkVVVElMU19NQUtFX09QVFMg
Kz0gTFNQUF9QUklWPXkKPiAgPiAgZW5kaWYKPgo+ICA+IC0jIFVuZGVmaW5pbmcgX0ZJTEVfT0ZG
U0VUX0JJVFMgaGVyZSBiZWNhdXNlIG9mIGEgImJ1ZyIgd2l0aCBnbGliYyBmdHMuaAo+ICA+IC0j
IGxhcmdlIGZpbGUgc3VwcG9ydC4KPiAgPiAtIyBTZWUgaHR0cHM6Ly9idWd6aWxsYS5yZWRoYXQu
Y29tL3Nob3dfYnVnLmNnaT9pZD01NzQ5OTIgZm9yIG1vcmUgaW5mb3JtYXRpb24KPiAgPiAtUE9M
SUNZQ09SRVVUSUxTX01BS0VfT1BUUyArPSBcCj4gID4gLSAgICAkKFRBUkdFVF9DT05GSUdVUkVf
T1BUUykgXAo+ICA+IC0gICAgQ0ZMQUdTPSIkKFRBUkdFVF9DRkxBR1MpIC1VX0ZJTEVfT0ZGU0VU
X0JJVFMiIFwKPiAgPiAtICAgIENQUEZMQUdTPSIkKFRBUkdFVF9DUFBGTEFHUykgLVVfRklMRV9P
RkZTRVRfQklUUyIKPiAgPiAtCj4gID4gIFBPTElDWUNPUkVVVElMU19NQUtFX0RJUlMgPSBcCj4g
ID4gICAgICBobGwgbG9hZF9wb2xpY3kgbmV3cm9sZSBydW5faW5pdCBcCj4gID4gICAgICBzZWNv
biBzZW1vZHVsZSBzZXN0YXR1cyBzZXRmaWxlcyBcCj4gID4gQEAgLTU5LDE0ICs1MSw5IEBAIGVu
ZGVmCj4KPiAgPiAgSE9TVF9QT0xJQ1lDT1JFVVRJTFNfREVQRU5ERU5DSUVTID0gaG9zdC1saWJz
ZW1hbmFnZQo+Cj4gID4gLSMgVW5kZWZpbmluZyBfRklMRV9PRkZTRVRfQklUUyBoZXJlIGJlY2F1
c2Ugb2YgYSAiYnVnIiB3aXRoIGdsaWJjIGZ0cy5oCj4gID4gLSMgbGFyZ2UgZmlsZSBzdXBwb3J0
Lgo+ICA+IC0jIFNlZSBodHRwczovL2J1Z3ppbGxhLnJlZGhhdC5jb20vc2hvd19idWcuY2dpP2lk
PTU3NDk5MiBmb3IgbW9yZSBpbmZvcm1hdGlvbgo+ICA+IC0jIFdlIGFsc28gbmVlZCB0byBwYXNz
IFBSRUZJWCBiZWNhdXNlIGl0IGRlZmF1bHRzIHRvICQoREVTVERJUikvdXNyCj4gID4gKyMgV2Ug
bmVlZCB0byBwYXNzIFBSRUZJWCBiZWNhdXNlIGl0IGRlZmF1bHRzIHRvICQoREVTVERJUikvdXNy
Cj4KPiBIbW0sIHRoaXMgZG9lc24ndCBhcHBseSBiZWNhdXNlIHdlIGRvbid0IGhhdmUgdGhhdCAn
V2UgYWxzbyBuZWVkIHRvIHBhc3MKPiBQUkVGSVggYmVjYXVzZSBpdCBkZWZhdWx0cyB0byAkKERF
U1RESVIpL3VzcicgbGluZSAtIFdoZXJlIGRvZXMgdGhhdAo+IGNvbWUgZnJvbT8KClN0cmFuZ2Us
IHRoaXMgbGluZSBpcyBpbiBtYXN0ZXI6Cmh0dHBzOi8vZ2l0LmJ1aWxkcm9vdC5uZXQvYnVpbGRy
b290L3RyZWUvcGFja2FnZS9wb2xpY3ljb3JldXRpbHMvcG9saWN5Y29yZXV0aWxzLm1rI242NQoK
Pgo+Cj4gLS0KPiBCeWUsIFBldGVyIEtvcnNnYWFyZAoKQmVzdCBSZWdhcmRzLAoKRmFicmljZQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
