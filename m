Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30597C30653
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 15:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D590760E9A;
	Wed,  3 Jul 2024 15:03:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iEL_GF6lcmgM; Wed,  3 Jul 2024 15:03:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 122CA6081F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 122CA6081F;
	Wed,  3 Jul 2024 15:03:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4FD8B1BF2CC
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 15:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4803C83F85
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 15:03:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zP4eR8KHLsY4 for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 15:03:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com;
 envelope-from=lancethepants@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B141582CB7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B141582CB7
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B141582CB7
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 15:03:46 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-70aaab1cb72so3828283b3a.0
 for <buildroot@buildroot.org>; Wed, 03 Jul 2024 08:03:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720019026; x=1720623826;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=33RoJv0coE9gVRXiXcUGZGGezP1UuM71Qux/m8ldims=;
 b=a04oGdcaP3emfYuMIP8uqIT1h22ZCcbyVMw0qXB6GwNEXqcePXm63PgdkRSMuhYSLQ
 xPi8RKoYfpy5FHxCphjoZO+8uzMf1jfJ8EJWrEoAPxhV3N0dN5QebspJGt0n9Hy3S2wR
 EjmHLsZgjnyxeawtJOJkItXo+eidryxzksMbhR21GBSPT9wKcvHewf5JxIk6xrh4/qkL
 UFgC7YJggoAEFyPJEIMzDQQCZ2Lr0xPT7RUnrsRfse/AJaTIw3uIShmB9IhLo8jQ5t1E
 EO5jxCSszeKDOIzfYxjFzQ/zh0qePsbeZTn6fWv4KA/S/PYy7hg7D5Pjbrb7lQexgd5m
 NGmA==
X-Gm-Message-State: AOJu0YyRAQbaUUp1RvA1hc7wzFB3Ww/10z8Zx96g82xTTfoFyoE4IrX1
 G41lepNsnDA1hvI+sZEM13V9caXAjrI0cPrHeqF1fHjdk51068gi
X-Google-Smtp-Source: AGHT+IG8qR2RTozcK/Nyc0J8npPk81jIHLyQUMnJc/XtznxgHfFPG1YXHbmxQ98I63CgBKMq61APFA==
X-Received: by 2002:a05:6a00:8d6:b0:706:6b38:f065 with SMTP id
 d2e1a72fcca58-70aaad605aamr18298117b3a.18.1720019024726; 
 Wed, 03 Jul 2024 08:03:44 -0700 (PDT)
Received: from [192.168.10.161] ([199.119.84.5])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70801f57d7dsm10836301b3a.13.2024.07.03.08.03.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jul 2024 08:03:44 -0700 (PDT)
Message-ID: <179f54c1-ed3c-4cdb-8110-71116525a6ac@gmail.com>
Date: Wed, 3 Jul 2024 09:03:42 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Heiko Thiery <heiko.thiery@gmail.com>
References: <5e6129b8-9672-efd0-32c7-18d0defcad21@gmail.com>
 <CAEyMn7bdo1UPCxy5pRi-SXsTgjy_o9wYkPZ+CgYrh7CPDgUd0w@mail.gmail.com>
From: Lance Fredrickson <lancethepants@gmail.com>
Autocrypt: addr=lancethepants@gmail.com; keydata=
 xjMEYXonzxYJKwYBBAHaRw8BAQdAarNDvmvbhGq/APN1zdGTpi6kPzps2qgQvmGOA10v/cDN
 K0xhbmNlIEZyZWRyaWNrc29uIDxsYW5jZXRoZXBhbnRzQGdtYWlsLmNvbT7CkQQTFggAORYh
 BEL55oGrzdK3LE+GnEk/TYZKRbHIBQJheifPBQkFo5qAAhsDBQsJCAcCBhUICQoLAgUWAgMB
 AAAKCRBJP02GSkWxyJz7AQDJJ6JRlv/941HI2wfF0wHXfaQMlxswxREAs1oNYGMJEwD+PV8F
 ET9rM95hft350hoxE+eQXj8Qqs5RQBbqNbFY5QnOOARheifPEgorBgEEAZdVAQUBAQdAgF6v
 nztQf05OavT+K/KZLg9MBYGFTcF+Q90IgHpC2l4DAQgHwn4EGBYIACYWIQRC+eaBq83StyxP
 hpxJP02GSkWxyAUCYXonzwUJBaOagAIbDAAKCRBJP02GSkWxyPZoAQD8/ZBL6cYlHB8oFDxe
 Y1Ia+Wofr0qk7kmw1yWjweyx2gD/VhdRXzKCSLXg6mDDqEzo1hcUztKmZ+L67IswDhVhVwI=
In-Reply-To: <CAEyMn7bdo1UPCxy5pRi-SXsTgjy_o9wYkPZ+CgYrh7CPDgUd0w@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720019026; x=1720623826; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=33RoJv0coE9gVRXiXcUGZGGezP1UuM71Qux/m8ldims=;
 b=KINLefJrbN5iciCCuBiHVtUpVaioAjHcj1X5gGLSezAWaQG48qaUTp4aNYdheiqBiX
 H4D3n6iX1i70hUFOWYHDywPdIHWkbU3i746dsoC4SVX9ZbXIuiGVNKQquNQleImY0h75
 b3ygSKHIh/y13xp19xTjkRDR0QlBRRjtj5uN4uRLowfAW4fAzvhjGsW5eET/wuDyuSh+
 iAdKvGUrUzDcFzYkcP7M7HkSrGf2vz/3M8kcbMmr+zNRLp//m3iJxgxrY8ZkdRzN4XVy
 mlL+B6pxbwogyhTV9icnqs9A9OsisH5r3y2x4vHLykY0wHgfoem8bfxy2p877TdaQrRM
 P02A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KINLefJr
Subject: Re: [Buildroot] 2023.05 host ccache detects avx512 and fails to buld
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
Cc: James Hilliard <james.hilliard1@gmail.com>, yann.morin.1998@free.fr,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SSd2ZSBqdXN0IGJlZW4gY2FycnlpbmcgdGhpcyBwYXRjaCB0aGF0IGRpc2FibGVkIEFWWDUxMi7C
oCBTZWVtZWQgbGlrZSAKbm90IGEgbG90IG9mIHBlb3BsZSB3ZXJlIHVzaW5nIGNjYWNoZS4KCmh0
dHBzOi8vZ2l0aHViLmNvbS90b21hdG82NC90b21hdG82NC9ibG9iL21hc3Rlci9zcmMvcGF0Y2hl
cy8wMDAxLWRpc2FibGUtY2NhY2hlLWF2NTEyLnBhdGNoCgpMYW5jZQoKT24gNy8zLzIwMjQgNDox
MiBBTSwgSGVpa28gVGhpZXJ5IHdyb3RlOgo+IEhpIExhbmNlLAo+Cj4KPiBBbSBGci4sIDkuIEp1
bmkgMjAyMyB1bSAyMDoxMSBVaHIgc2NocmllYiBMYW5jZSBGcmVkcmlja3Nvbgo+IDxsYW5jZXRo
ZXBhbnRzQGdtYWlsLmNvbT46Cj4+IE1pZ3JhdGluZyBteSBwcm9qZWN0IHRvIDIwMjMuMDUgSSdt
IGVuY291bnRlcmluZyBhbiBpc3N1ZSB3aGVuIGVuYWJsaW5nCj4+IGNjYWNoZSBjb21waWxlciBz
dXBwb3J0Lgo+Pgo+PiBJbiB0aGUgY21ha2UgYnVpbGQgaW52b2NhdGlvbiBJIHNlZQo+PiAtLSBQ
ZXJmb3JtaW5nIFRlc3QgSEFWRV9DX0FWWDUxMiAtIFN1Y2Nlc3MKPj4gYW5kIHRoZW4gYmxha2Uz
IGZhaWxzIHRvIGJ1aWxkCj4+Cj4+IFsgIDklXSBCdWlsZGluZyBDIG9iamVjdAo+PiBzcmMvdGhp
cmRfcGFydHkvYmxha2UzL0NNYWtlRmlsZXMvYmxha2UzLmRpci9ibGFrZTNfYXZ4NTEyLmMubwo+
PiAvdG1wL2NjeU5tMU5BLnM6Mzg0NDogRXJyb3I6IHVuc3VwcG9ydGVkIGluc3RydWN0aW9uIGB2
bW92ZHF1Jwo+Pgo+PiBJJ3ZlIHRyaWVkIGJvdGggaW4gVk0gKDEyOTAwayB1c2luZyB2aXJ0dWFs
Ym94KSBhbmQgb24gYW5jaWVudCBjb3JlaTUKPj4gYmFyZSBtZXRhbC4KPj4KPj4gVGhlIGZ1bm55
IHRoaW5nIGlzIEkgY2FuIG1hbnVhbGx5IGNvbXBpbGUgaXQgZmluZSB3aXRoLgo+PiBjbWFrZSBc
Cj4+IC1Xbm8tZGV2IFwKPj4gLURDTUFLRV9CVUlMRF9UWVBFPVJlbGVhc2UgXAo+PiAtRFpTVERf
RlJPTV9JTlRFUk5FVD1PTiBcCj4+IC1EUkVESVNfU1RPUkFHRV9CQUNLRU5EPU9GRiBcCj4+IC4v
Cj4+Cj4+IFRoZW4gSSB0cnkgYWRkaW5nIC1ESEFWRV9DX0FWWDUxMj1ubyB0byBjY2FjaGUubWsg
YW5kIGl0IHRoZW4gc3VjY2VlZHMuCj4+Cj4+IFNvIHNlZW1zIGxpa2Ugc29tZSBvcHRpb24gb3Ig
Y29tYmluYXRpb24gb2Ygb3B0aW9ucyBpcyBtYWtpbmcgY21ha2UKPj4gdGhpbmsgYXZ4NTEyIGlz
IHN1cHBvcnRlZCB3aGVuIGl0IGlzIG5vdC4KPgo+IFNpbmNlIHRoZSBwcm9ibGVtIGlzIHN0aWxs
IHByZXNlbnQgaW4gbWFzdGVyIEkgc3VzcGVjdCB5b3UgZGlkIG5vdAo+IGZpbmQgYSBzb2x1dGlv
biBmb3IgdGhpcz8KPgo+IFRoaXMgaXMgd2hhdCBJIGN1cnJlbnRseSBzZWUgb24gbXkgbWFjaGlu
ZS4KPgo+ICAgWzdtPj4+IGhvc3QtY2NhY2hlIDQuOC4yIENvbmZpZ3VyaW5nIFsyN20KPiA6Cj4g
Ogo+IC0tIFBlcmZvcm1pbmcgVGVzdCBIQVZFX0FTTV9TU0UyCj4gLS0gUGVyZm9ybWluZyBUZXN0
IEhBVkVfQVNNX1NTRTIgLSBGYWlsZWQKPiAtLSBQZXJmb3JtaW5nIFRlc3QgSEFWRV9DX1NTRTIK
PiAtLSBQZXJmb3JtaW5nIFRlc3QgSEFWRV9DX1NTRTIgLSBTdWNjZXNzCj4gLS0gUGVyZm9ybWlu
ZyBUZXN0IEhBVkVfQVNNX1NTRTQxCj4gLS0gUGVyZm9ybWluZyBUZXN0IEhBVkVfQVNNX1NTRTQx
IC0gRmFpbGVkCj4gLS0gUGVyZm9ybWluZyBUZXN0IEhBVkVfQ19TU0U0MQo+IC0tIFBlcmZvcm1p
bmcgVGVzdCBIQVZFX0NfU1NFNDEgLSBTdWNjZXNzCj4gLS0gUGVyZm9ybWluZyBUZXN0IEhBVkVf
QVNNX0FWWDIKPiAtLSBQZXJmb3JtaW5nIFRlc3QgSEFWRV9BU01fQVZYMiAtIEZhaWxlZAo+IC0t
IFBlcmZvcm1pbmcgVGVzdCBIQVZFX0NfQVZYMgo+IC0tIFBlcmZvcm1pbmcgVGVzdCBIQVZFX0Nf
QVZYMiAtIFN1Y2Nlc3MKPiAtLSBQZXJmb3JtaW5nIFRlc3QgSEFWRV9BU01fQVZYNTEyCj4gLS0g
UGVyZm9ybWluZyBUZXN0IEhBVkVfQVNNX0FWWDUxMiAtIEZhaWxlZAo+IC0tIFBlcmZvcm1pbmcg
VGVzdCBIQVZFX0NfQVZYNTEyCj4gLS0gUGVyZm9ybWluZyBUZXN0IEhBVkVfQ19BVlg1MTIgLSBT
dWNjZXNzCj4gLS0gUGVyZm9ybWluZyBUZXN0IEhBVkVfTkVPTgo+IC0tIFBlcmZvcm1pbmcgVGVz
dCBIQVZFX05FT04gLSBGYWlsZWQKPiAtLSBDb25maWd1cmluZyBkb25lICgxNi4wcykKPiAtLSBH
ZW5lcmF0aW5nIGRvbmUgKDAuMXMpCj4gQ01ha2UgV2FybmluZzoKPiAgICBNYW51YWxseS1zcGVj
aWZpZWQgdmFyaWFibGVzIHdlcmUgbm90IHVzZWQgYnkgdGhlIHByb2plY3Q6Cj4gOgo+IDoKPgo+
ICAgWzdtPj4+IGhvc3QtY2NhY2hlIDQuOC4yIEJ1aWxkaW5nIFsyN20KPiA6Cj4gOgo+IFsgIDEl
XSBCdWlsZGluZyBDIG9iamVjdCBzcmMvdGhpcmRfcGFydHkvYmxha2UzL0NNYWtlRmlsZXMvYmxh
a2UzLmRpci9ibGFrZTMuYy5vCj4gWyAgMiVdIEdlbmVyYXRpbmcgQVVUSE9SUy5odG1sCj4gWyAg
MyVdIEJ1aWxkaW5nIEMgb2JqZWN0Cj4gc3JjL3RoaXJkX3BhcnR5L2JsYWtlMy9DTWFrZUZpbGVz
L2JsYWtlMy5kaXIvYmxha2UzX2Rpc3BhdGNoX2NjYWNoZS5jLm8KPiBbICA0JV0gQnVpbGRpbmcg
QyBvYmplY3QKPiBzcmMvdGhpcmRfcGFydHkvQ01ha2VGaWxlcy90aGlyZF9wYXJ0eS5kaXIvYmFz
ZTMyaGV4LmMubwo+IFsgIDYlXSBCdWlsZGluZyBDIG9iamVjdAo+IHNyYy90aGlyZF9wYXJ0eS9i
bGFrZTMvQ01ha2VGaWxlcy9ibGFrZTMuZGlyL2JsYWtlM19wb3J0YWJsZS5jLm8KPiBbICA3JV0g
R2VuZXJhdGluZyBMSUNFTlNFLmh0bWwKPiBbICA4JV0gR2VuZXJhdGluZyBNQU5VQUwuaHRtbAo+
IFsgIDklXSBCdWlsZGluZyBDWFggb2JqZWN0Cj4gc3JjL3RoaXJkX3BhcnR5L0NNYWtlRmlsZXMv
dGhpcmRfcGFydHkuZGlyL2h0dHBsaWIuY3BwLm8KPiBbIDEzJV0gQnVpbGRpbmcgQyBvYmplY3QK
PiBzcmMvdGhpcmRfcGFydHkvYmxha2UzL0NNYWtlRmlsZXMvYmxha2UzLmRpci9ibGFrZTNfc3Nl
Mi5jLm8KPiBbIDEzJV0gR2VuZXJhdGluZyBjY2FjaGUuMS50bXAKPiBbIDEzJV0gQnVpbGRpbmcg
Q1hYIG9iamVjdAo+IHNyYy90aGlyZF9wYXJ0eS9DTWFrZUZpbGVzL3RoaXJkX3BhcnR5LmRpci9m
b3JtYXQuY3BwLm8KPiBbIDE0JV0gQnVpbGRpbmcgQyBvYmplY3QKPiBzcmMvdGhpcmRfcGFydHkv
Ymxha2UzL0NNYWtlRmlsZXMvYmxha2UzLmRpci9ibGFrZTNfc3NlNDEuYy5vCj4gWyAxNiVdIEdl
bmVyYXRpbmcgTkVXUy5odG1sCj4gWyAxNyVdIEJ1aWxkaW5nIEMgb2JqZWN0Cj4gc3JjL3RoaXJk
X3BhcnR5L2JsYWtlMy9DTWFrZUZpbGVzL2JsYWtlMy5kaXIvYmxha2UzX2F2eDIuYy5vCj4gWyAx
OCVdIEJ1aWxkaW5nIENYWCBvYmplY3Qgc3JjL3RoaXJkX3BhcnR5L0NNYWtlRmlsZXMvdGhpcmRf
cGFydHkuZGlyL3VybC5jcHAubwo+IFsgMTklXSBCdWlsZGluZyBDIG9iamVjdCBzcmMvdGhpcmRf
cGFydHkvQ01ha2VGaWxlcy90aGlyZF9wYXJ0eS5kaXIveHhoYXNoLmMubwo+IFsgMjIlXSBCdWls
ZGluZyBDIG9iamVjdAo+IHNyYy90aGlyZF9wYXJ0eS9DTWFrZUZpbGVzL3RoaXJkX3BhcnR5LmRp
ci9nZXRvcHRfbG9uZy5jLm8KPiBbIDIyJV0gQnVpbGRpbmcgQyBvYmplY3QKPiBzcmMvdGhpcmRf
cGFydHkvYmxha2UzL0NNYWtlRmlsZXMvYmxha2UzLmRpci9ibGFrZTNfYXZ4NTEyLmMubwo+IFsg
MjMlXSBCdWlsZGluZyBDIG9iamVjdAo+IHNyYy90aGlyZF9wYXJ0eS9DTWFrZUZpbGVzL3RoaXJk
X3BhcnR5LmRpci94eGhfeDg2ZGlzcGF0Y2guYy5vCj4gWyAyMyVdIEJ1aWx0IHRhcmdldCBkb2Mt
aHRtbAo+IFsgMjQlXSBHZW5lcmF0aW5nIGNjYWNoZS4xCj4gWyAyNCVdIEJ1aWx0IHRhcmdldCBk
b2MtbWFuLXBhZ2UKPiBbIDI0JV0gQnVpbHQgdGFyZ2V0IGRvYwo+IC90bXAvY2NtUUZ3NXkuczog
QXNzZW1ibGVyIG1lc3NhZ2VzOgo+IC90bXAvY2NtUUZ3NXkuczo4OTM4NjogRXJyb3I6IHVuc3Vw
cG9ydGVkIGluc3RydWN0aW9uIGB2bW92ZHF1Jwo+IC90bXAvY2NtUUZ3NXkuczo4OTQwMDogRXJy
b3I6IHVuc3VwcG9ydGVkIGluc3RydWN0aW9uIGB2bW92ZHF1Jwo+IC90bXAvY2NtUUZ3NXkuczo4
OTQ2NDogRXJyb3I6IHVuc3VwcG9ydGVkIGluc3RydWN0aW9uIGB2bW92ZHF1Jwo+IC90bXAvY2Nt
UUZ3NXkuczo4OTUxODogRXJyb3I6IHVuc3VwcG9ydGVkIGluc3RydWN0aW9uIGB2bW92ZHF1Jwo+
IC90bXAvY2NtUUZ3NXkuczo4OTUyNTogRXJyb3I6IHVuc3VwcG9ydGVkIGluc3RydWN0aW9uIGB2
bW92ZHF1Jwo+IC90bXAvY2NtUUZ3NXkuczoxMjM5Mzg6IEVycm9yOiB1bnN1cHBvcnRlZCBpbnN0
cnVjdGlvbiBgdm1vdmRxdScKPiAvdG1wL2NjbVFGdzV5LnM6MTIzOTUzOiBFcnJvcjogdW5zdXBw
b3J0ZWQgaW5zdHJ1Y3Rpb24gYHZtb3ZkcXUnCj4KPiBJIGRpZCBhIGJpc2VjdCBhbmQgZm91bmQg
dGhhdCBjb21taXQKPiA3MDg3ZTUyODZkODQxOWY0NjI1ZjVmNmU1MmFhODQ1NjdjNmI3ZWQwIGlu
dHJvZHVjZWQgdGhlIHByb2JsZW0uIEl0Cj4gd2FzIGEgYnVtcCBmcm9tIDMuNy4xMiB0byA0Ljcu
NCBhbmQgaXQgdXNlcyB0aGUgY21ha2UgaW5mcmFzdHJ1Y3R1cmUKPiBpbnN0ZWFkIG9mCj4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
