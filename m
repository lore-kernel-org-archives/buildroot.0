Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF1CDC41513
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 08:51:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BD1660731;
	Mon, 15 Jul 2024 08:51:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id neSdglYrgD9M; Mon, 15 Jul 2024 08:51:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46ACD606EB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46ACD606EB;
	Mon, 15 Jul 2024 08:51:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C66641BF3C9
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 08:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3EB881191
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 08:51:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zmrxMlAOXefS for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 08:51:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6F0FD8118D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F0FD8118D
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6F0FD8118D
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 08:51:08 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-427ad8bd88eso5151385e9.2
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 01:51:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721033467; x=1721638267;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CmlPpITXfiYO76UbZcKXZLnqWefEexaHbEtfnamxAvk=;
 b=AC/gbMX1xWEdhFV6dfOGR2n/NJLj1dyVCLHLvEnYjEFZVlnuQNyJDsm5LjvsTNrJmp
 T+asi+mC3CfBAWsiHQkvSBFFSg/3mPGeKAD9E9MDkxOKPvJAJGLz5pz1dPinh3x7M7WS
 pbMiqTu2fx53gSyACMoBTwHvDe2Xz4EuRbHfcrmLXhoeiDO/ay33q+Ju2mn2Jmtke/Yb
 ZZ9bsgVpU4Rt9zVHlE5Du1YUbBBYKWqPiK/OcvfJHTeeJ87St7BNHVyiKrTIc2YfqrX3
 P7OejczJlrpoIWtam8iii0s3PuXKNmFedmn0ehU/7Zfg0ITQeW6SHRoBN2C0wri0TWbc
 PPgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3r+3dVckp9byoxNxtY0lo7F00aNe1Ba/hcx+qyrCIBBSS+lUCRLRW2ZQefjdYGTC/UrVML+INo3E2tdiZvBznSEn/Fy6qbA==
X-Gm-Message-State: AOJu0YxX9WbdgNgRUyyAZbF3sDa/fXubPi3laQxpgRc7y07JX1Kk63Hv
 Uj8OMcGYo2cVHporTuVbhU2abJts496l6n3/V/5cYgOVWMNSG0O0VE7BjFeIJKE=
X-Google-Smtp-Source: AGHT+IFpC5s+MYfXhoOBuk/p2w7Yfe78bj+uZtKduK+vHG3tOEQNl6On+5wR6aPgFdSuORx5scCWMg==
X-Received: by 2002:a05:600c:49aa:b0:425:7ac6:970d with SMTP id
 5b1f17b1804b1-426707f7e06mr121583015e9.28.1721033466748; 
 Mon, 15 Jul 2024 01:51:06 -0700 (PDT)
Received: from [10.8.0.42] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680dabf151sm5676332f8f.29.2024.07.15.01.51.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 01:51:06 -0700 (PDT)
Message-ID: <50c04b02-5140-4c0c-b06d-e80eca7564af@mind.be>
Date: Mon, 15 Jul 2024 10:51:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 buildroot@buildroot.org
References: <20240704-ztext-v3-1-9195d06c8bd0@gmx.net>
Content-Language: en-GB
In-Reply-To: <20240704-ztext-v3-1-9195d06c8bd0@gmx.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1721033467; x=1721638267; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CmlPpITXfiYO76UbZcKXZLnqWefEexaHbEtfnamxAvk=;
 b=etcuSP+BMlT5HndDLuiND/2hdU0D8I0Jvrktr1q/pdBCnwwp3G3R6MW0B9bijotCrt
 0tETRm3+xQCbNcjZXDMl9XdBm9bahgbmhi98TNk29VEOTdQ0g8zJSmnGex2CtLbVIFvy
 SV/NUezZEnlYoFyf+QTGqJTpypCHOXIenFP24I5DaRJgmecONiV0k9CRcNoFLbFsH0D3
 eN9EGqqMAT1aUUBmfx7+E4jXaYlFZAz2wd77GSNgROCB7j9mWhUS1n3eWh+ThoKGWLpk
 Hunxv+OQ8h4Ra6H+oQsOlE540g9/OZXzUZtNjc/8mYRH6VUz37RhByw/hXV11pVLORgt
 JLXQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=etcuSP+B
Subject: Re: [Buildroot] [PATCH v3] Config.in: ban textrels on musl
 toolchains
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ICBIaSBKLiwKCiAgW0JUVyBhcmUgeW91IE9LIHdpdGggbWUgY2FsbGluZyB5b3UgIkouIj8gSXQg
ZmVlbHMgYSBiaXQgd2VpcmQuLi5dCgpPbiAwNC8wNy8yMDI0IDIwOjA1LCBKLiBOZXVzY2jDpGZl
ciB2aWEgYnVpbGRyb290IHdyb3RlOgo+IG11c2wtbGliYyBkb2Vzbid0IHN1cHBvcnQgVEVYVFJF
THNbMV0gYW5kIHByb2dyYW1zIHdpdGggVEVYVFJFTHMgd2lsbAo+IGNyYXNoIG9uIHN0YXJ0LXVw
IHVuZGVyIG11c2wuCj4gCj4gVGhpcyBwYXRjaCBmb3JiaWRzIHRoZSB1c2Ugb2YgVEVYVFJFTHMg
b24gbXVzbCwgYnV0IGFkZHMgYW4gb3B0aW9uIHRvCj4gZWl0aGVyIGZvcmJpZCB0aGVtIG9uIG90
aGVyIGxpYmNzIGFzIHdlbGwsIG9yIGFsbG93IHRoZW0gb24gbXVzbC4KPiAKPiBbMV06IGh0dHBz
Oi8vd3d3Lm9wZW53YWxsLmNvbS9saXN0cy9tdXNsLzIwMjAvMDkvMjUvNAo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEouIE5ldXNjaMOkZmVyIDxqLm5ldXNjaGFlZmVyQGdteC5uZXQ+Cj4gLS0tCj4gQ2hh
bmdlcyBpbiB2MzoKPiAtIGRyb3AgbWljcm9weXRob24gcGF0Y2ggKGFscmVhZHkgbWVyZ2VkKQo+
IC0gcmV3cml0ZSB0byBwb3NpdGl2ZSBsb2dpYywgYXMgc3VnZ2VzdGVkIGJ5IFlhbm4gRS4gTU9S
SU4KPiAtIExpbmsgdG8gdjI6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDA1MjktenRl
eHQtdjItMC04Mjk4NTAzMmYxNjlAZ214Lm5ldAo+IAo+IENoYW5nZXMgaW4gdjI6Cj4gLSBTbGln
aHRseSBkaWZmZXJlbnQgd29yZGluZwo+IC0gRW5hYmxlIHRoZSBvcHRpb24gYnkgZGVmYXVsdCBv
biBtdXNsIHRvb2xjaGFpbnMKPiAtIEFkZCBwYXRjaCB0byBmaXggYnVpbGQgb2YgbWljcm9weXRo
b24KPiAKPiBMaW5rIHRvIHYxOgo+IC0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MDQx
OS16dGV4dC12MS0xLWE4ZDVjMmNmY2Y1N0BnbXgubmV0Cj4gLS0tCj4gCj4gSSdtIG5vdCBzdXJl
IGFib3V0IHRoZSBLY29uZmlnIGhlbHAgdGV4dCBmb3IgQlIyX0xJTktfQUxMT1dfVEVYVFJFTC4K
PiBQZXJoYXBzIGl0IGNvdWxkIGJlIHdyaXR0ZW4gYSBsaXR0bGUgbmljZXIuCj4gCj4gCj4gdjM6
Cj4gLSByZXdyaXRlIHRvIHBvc2l0aXZlIGxvZ2ljLCBhcyBzdWdnZXN0ZWQgYnkgWWFubiBFLiBN
T1JJTgo+IC0gYWRqdXN0IHRoZSBuYW1lIGFuZCBoZWxwIHRleHQgYWNjb3JkaW5nbHkKPiAKPiB2
MjoKPiAtIHNsaWdodGx5IGRpZmZlcmVudCB3b3JkaW5nCj4gLSBkZWZhdWx0IHRvIHllcyBvbiBt
dXNsIHRvb2xjaGFpbnMKPiAtIGZpeCBjaGVjay1wYWNrYWdlIHdhcm5pbmdzCj4gLSBkZXBlbmRz
IG9uIEJSMl9TSEFSRURfTElCUyAtPiBkZXBlbmRzIG9uICFCUjJfU1RBVElDX0xJQlMKPiAtLS0K
PiAgIENvbmZpZy5pbiAgICAgICAgICAgfCAxNCArKysrKysrKysrKysrKwo+ICAgcGFja2FnZS9N
YWtlZmlsZS5pbiB8ICA0ICsrKysKPiAgIDIgZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygr
KQo+IAo+IGRpZmYgLS1naXQgYS9Db25maWcuaW4gYi9Db25maWcuaW4KPiBpbmRleCBiZGY1ZmE4
NjQ3Li5jOGI1MmMwZDc0IDEwMDY0NAo+IC0tLSBhL0NvbmZpZy5pbgo+ICsrKyBiL0NvbmZpZy5p
bgo+IEBAIC05MTAsNiArOTEwLDIwIEBAIGVuZGNob2ljZQo+ICAgY29tbWVudCAiUkVMb2NhdGlv
biBSZWFkIE9ubHkgKFJFTFJPKSBuZWVkcyBzaGFyZWQgbGlicmFyaWVzIgo+ICAgCWRlcGVuZHMg
b24gIUJSMl9TSEFSRURfTElCUwo+IAo+ICtjb25maWcgQlIyX0xJTktfQUxMT1dfVEVYVFJFTAo+
ICsJYm9vbCAiQWxsb3cgdGV4dCBzZWN0aW9uIHJlbG9jYXRpb25zIChURVhUUkVMcykiCj4gKwlk
ZWZhdWx0IHkgICMgTGVnYWN5Cj4gKwlkZXBlbmRzIG9uICFCUjJfVE9PTENIQUlOX1VTRVNfTVVT
TAo+ICsJZGVwZW5kcyBvbiAhQlIyX1NUQVRJQ19MSUJTCj4gKwloZWxwCj4gKwkgIEVuYWJsZSB0
aGlzIG9wdGlvbiB0byBhbGxvdyBURVhUUkVMcy4gT3RoZXJ3aXNlICIteiB0ZXh0IiB3aWxsIGJl
Cj4gKwkgIHBhc3NlZCB0byB0aGUgbGlua2VyIHRvIGRldGVjdCB0aGVtIGFuZCB0aHJvdyBhbiBl
cnJvciBpZiB0aGV5IG9jY3VyLgo+ICsKPiArCSAgVEVYVFJFTHMgYXJlIG5vdCBzdXBwb3J0ZWQg
b24gbXVzbC1saWJjJ3MgZHluYW1pYyBsb2FkZXIgYW5kIHdpbGwKPiArCSAgcmVzdWx0IGluIGEg
cnVuLXRpbWUgY3Jhc2g6Cj4gKwo+ICsJICAgIGh0dHBzOi8vd3d3Lm9wZW53YWxsLmNvbS9saXN0
cy9tdXNsLzIwMjAvMDkvMjUvNAo+ICsKPiAgIGNvbmZpZyBCUjJfRk9SVElGWV9TT1VSQ0VfQVJD
SF9TVVBQT1JUUwo+ICAgCWJvb2wKPiAgIAlkZWZhdWx0IHkKPiBkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9NYWtlZmlsZS5pbiBiL3BhY2thZ2UvTWFrZWZpbGUuaW4KPiBpbmRleCA1NDc2MjM0YzdlLi4z
ZjFhMWQzYTM1IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvTWFrZWZpbGUuaW4KPiArKysgYi9wYWNr
YWdlL01ha2VmaWxlLmluCj4gQEAgLTE0OSw2ICsxNDksMTAgQEAgZW5kaWYKPiAKPiAgIFRBUkdF
VF9MREZMQUdTID0gJChjYWxsIHFzdHJpcCwkKEJSMl9UQVJHRVRfTERGTEFHUykpCj4gCj4gK2lm
ZXEgKCQoQlIyX0xJTktfQUxMT1dfVEVYVFJFTCksKQo+ICtUQVJHRVRfTERGTEFHUyArPSAteiB0
ZXh0Cj4gK2VuZGlmCgogIEFmdGVyIHNvbWUgZGlzY3Vzc2lvbiwgd2UgY29uY2x1ZGVkIHRoYXQg
d2UgZG9uJ3Qgc2VlIHRoZSBwb2ludCBvZiBtYWtpbmcgdGhpcyAKYSB1c2VyLXNldHRhYmxlIENv
bmZpZy5pbiBvcHRpb24uIEl0IHNob3VsZCBiZSBjb21wbGV0ZWx5IGluIHRoZSBNYWtlZmlsZS5p
biwgCndpdGggYSBjb21tZW50IGV4cGxhaW5pbmcgd2h5LiBTbyBzb21ldGhpbmcgbGlrZSB0aGlz
ICh1bnRlc3RlZCEpOgoKIyBtdXNsJ3MgZHluYW1pYyBsb2FkZXIgZG9lc24ndCBzdXBwb3J0IERU
X1RFWFRSRUwsIHdoaWNoIHJlc3VsdHMgaW4gYSBydW50aW1lCiMgY3Jhc2ggaWYgaXQgZ2V0cyB1
c2VkLiBUaGUgIi16IHRleHQiIGxpbmtlciBvcHRpb24gaXNzdWVzIGEgYnVpbGQtdGltZSBlcnJv
cgojIHdoZW4gRFRfVEVYUkVMIGlzIHVzZWQsIHNvIHdlIGNhcHR1cmUgdGhlIHByb2JsZW0gZWFy
bGllci4KaWZlcSAoJChCUjJfVE9PTENIQUlOX1VTRVNfTVVTTCkkKEJSMl9TVEFUSUNfTElCUyks
eXkpClRBUkdFVF9MREZMQUdTICs9IC0jbCwteix0ZXh0CmVuZGlmCgogIE5vdGUgYWxzbyB0aGF0
IHdlIHVzZSAtV2wsLXosLi4uIGV2ZXJ5d2hlcmUgZWxzZSB0byBwYXNzIHRoZSAteiBvcHRpb25z
IHRvIHRoZSAKbGlua2VyLiBNYXliZSB0aGF0J3MgYmVjYXVzZSBvbGRlciBHQ0MgZG9uJ3QgdW5k
ZXJzdGFuZCAtei4gQnV0IGFueXdheSwgdG8gYmUgCmNvbnNpc3RlbnQsIGxldCdzIGRvIHRoZSBz
YW1lIGhlcmUuCgogIENhbiB5b3UgdGVzdCB0aGUgYWJvdmUgdmVyc2lvbiBhbmQgcmVzdWJtaXQ/
IE9oLCBhbmQgcGxlYXNlIGFsc28gaW4gdGhlIGNvbW1pdCAKbWVzc2FnZSBnaXZlIGFuIGV4YW1w
bGUgb2YgaG93IHlvdSBjYW4gdGVzdCBpdCAoZS5nLiBieSByZW1vdmluZyB0aGUgbWljcm9weXRv
biAKcGF0Y2ggYW5kIGJ1aWxkaW5nIG1pY3JvcHl0b24gdW5kZXIgbXVzbD8pCgogIFJlZ2FyZHMs
CiAgQXJub3V0Cgo+ICsKPiAgICMgQnkgZGVzaWduLCBfRk9SVElGWV9TT1VSQ0UgcmVxdWlyZXMg
Z2NjIG9wdGltaXphdGlvbiB0byBiZSBlbmFibGVkLgo+ICAgIyBUaGVyZWZvcmUsIHdlIG5lZWQg
dG8gcGFzcyBfRk9SVElGWV9TT1VSQ0UgYW5kIHRoZSBvcHRpbWl6YXRpb24gbGV2ZWwKPiAgICMg
dGhyb3VnaCB0aGUgc2FtZSBtZWNoYW5pc20sIGkuZSBjdXJyZW50bHkgdGhyb3VnaCBDRkxBR1Mu
IFBhc3NpbmcKPiAKPiAtLS0KPiBiYXNlLWNvbW1pdDogM2ViYzdjNjlkNTY0MzBjMzRlYmE0Yzg2
OWQxZDRmZTRkMWU4ZGU1NQo+IGNoYW5nZS1pZDogMjAyNDA0MTctenRleHQtNWFjY2JhYjYxYzBh
Cj4gCj4gQmVzdCByZWdhcmRzLAo+IC0tCj4gSi4gTmV1c2Now6RmZXIgPGoubmV1c2NoYWVmZXJA
Z214Lm5ldD4KPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+
IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
