Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 412A0C282EC
	for <buildroot@archiver.kernel.org>; Wed,  5 Mar 2025 22:41:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55C5F60F1B;
	Wed,  5 Mar 2025 22:41:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6ALBe4LIEPAW; Wed,  5 Mar 2025 22:41:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8CE960BF9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8CE960BF9;
	Wed,  5 Mar 2025 22:41:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8AFF9E2E
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 22:41:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6DDBC40527
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 22:41:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2yPFSht50hiT for <buildroot@buildroot.org>;
 Wed,  5 Mar 2025 22:41:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8F3E840D7D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F3E840D7D
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8F3E840D7D
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 22:41:06 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43bdcd0d97dso390525e9.3
 for <buildroot@buildroot.org>; Wed, 05 Mar 2025 14:41:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741214464; x=1741819264;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B2CCx1fRXmKu3E6TmtHYjVmCAfgfsEcX1JDMthsiqCs=;
 b=hTd+klYC0S8J4Egb8qwbnqTzGjPaY11fIQlLx7+qsu4ns5K3Sv9HvXGdjbjgxWxhmU
 cyMmO7TGwi9ujosL2/JVUZz7tX5QmmQkmfbhNUbwCHwc8/Mvi/aDQcHLoATLiwkNxtxY
 SKeWg5Qv0BN2qZg0sxnn3KDEIV98igSDcrLEp8rOaPsqps2tbIiIvtebGbIJxlWPJJr/
 QI5x+hKcSfosRJCKnUtmyn3depn3H+caDl75pUuhKHLe7z9/in4OqZ4Fv0caKoLiG3F8
 3gPDO7fv69w3/eeRCkAvtgKXpYZ+OW1D1ohLtCAsJQZnx/9K+JJRvDn9XH5H1EXIawj3
 /gIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWykFMGajqGeULTMf0/ZdyxEXKK2B4JEDsZxT2F/DcOmtSlgM5fkXJIrVfQXO+gpok9CcA3YqRioQ=@buildroot.org
X-Gm-Message-State: AOJu0YzHpvU9CQhn1HvvXxd/z+CVdB8eNlsaDG63yeaEBrpiazQHBnjh
 IFtKlRGwH0IkuINBc2GhkNdTFyiph1mOg3yz+FwoaOiBIKhzBPZ9mPhlDM2J8SeQ0gBAkajiM+U
 Q
X-Gm-Gg: ASbGnctKVl/Wr0hAXcTxBHbqxSJ+1kuEcy8VXtnpHVdsu2JOoTSL1U5MzKeE9vbCRhi
 LOP2+EDJUyOEjFiunZxeuSLm33ABgnDym8q01h+hkCfOpAcwjqHaHKZfnItlB32y1VaNqSyD2T0
 dk/crhwUtEQXX9iNj17Fa/5CsfcZMI1iYXnXcCr4cF768SyLYEuVA0umhNM/6HabPS1l4+sRl+X
 k0TChyGJC+pGcw+08c7JnIe0bLrwHf/Mr6vqgAnKd4xyZS5acYAsACVaEcRgzHNIsckyc5coJeV
 zbXYYVfoi88SsDXDibK5NaXDRwlyPV6cUvO3Us/3FxzgLq5tOSZ/CgCYdGslYgxd91AmSFKDBU6
 nPyzvpAw0XtXschUzqEB10CIGtq7mMaYxqw2z2V6/MwkzcinV0QPcyGTLM5JXK9Cb8j1Jkcuszr
 LI+n68
X-Google-Smtp-Source: AGHT+IHZdCeL9/MgebrWeVsL8kfaFdwA6DMzUBUBSG4D/WK1XwwB6ruluPXBgmJfWpgOJ5ubjpK/pg==
X-Received: by 2002:a5d:584b:0:b0:38f:3073:708 with SMTP id
 ffacd0b85a97d-3911f731a2bmr4801125f8f.3.1741214464488; 
 Wed, 05 Mar 2025 14:41:04 -0800 (PST)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bdd8c28f5sm505995e9.9.2025.03.05.14.41.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Mar 2025 14:41:04 -0800 (PST)
Message-ID: <61c8736a-f625-4845-8b71-bb191b5d2b8e@smile.fr>
Date: Wed, 5 Mar 2025 23:41:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
Cc: Spenser Gilliland <spenser@gillilanding.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250224114736.1525367-1-fiona.klute@gmx.de>
 <9900d4d1-834c-4430-b7da-7642a6f60b02@smile.fr>
Content-Language: fr
In-Reply-To: <9900d4d1-834c-4430-b7da-7642a6f60b02@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1741214464; x=1741819264; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=B2CCx1fRXmKu3E6TmtHYjVmCAfgfsEcX1JDMthsiqCs=;
 b=M39kuTmW2jccQIz5QfRVv3JTAMxCfRrgnGttedYZuNTue68KN50+B7leURWGFGnarN
 or+U6lKhqCLuh4Si20Uh4vIKqP5uxjtF09cc2YsVh5iCV14HMFA276UtxaxBLKpAqEK+
 cDmRsL60Ks+HJYGcXs98A5LsZNSmpjtS53nG4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=M39kuTmW
Subject: Re: [Buildroot] [PATCH v2 1/1] package/mesa3d-demos: fix build
 failure on musl
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMDUvMDMvMjAyNSDDoCAyMzowMCwgUm9tYWluIE5hb3VyIGEgw6ljcml0wqA6Cj4gSGVsbG8g
RmlvbmEsIEFsbCwKPiAKPiBMZSAyNC8wMi8yMDI1IMOgIDEyOjQ3LCBGaW9uYSBLbHV0ZSB2aWEg
YnVpbGRyb290IGEgw6ljcml0wqA6Cj4+IEZyb206ICJGaW9uYSBLbHV0ZSAoV0lXQSkiIDxmaW9u
YS5rbHV0ZUBnbXguZGU+Cj4+Cj4+IFBhdGNoIGhhcyBiZWVuIG9uIHVwc3RyZWFtIG1haW4gZm9y
IGNsb3NlIHRvIDIgeWVhcnMuCj4+Cj4+IFRoZSAidWludCIgdXNlIHdhcyBpbnRyb2R1Y2VkIHdp
dGggWzFdIGFuZCBbMl0sIHJlbGVhc2VkIHdpdGgKPj4gbWVzYTNkLWRlbW9zIDkuMC4wIGZyb20g
TWFyY2ggMjAyMywgYW5kIGFkZGVkIHRvIEJ1aWxkcm9vdCB3aXRoIGNvbW1pdAo+PiA4MDMwNGQ5
OTExICJwYWNrYWdlL21lc2EzZC1kZW1vczogYnVtcCB2ZXJzaW9uIHRvIDkuMC4wIi4KPj4KPj4g
WzFdIGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL2RlbW9zLy0vY29tbWl0Lzgx
M2ViZWY3NjcxZjBlNTRkMWI1NWJlOWUxNWFlNTU4NmIyYjllYjEKPj4gWzJdIGh0dHBzOi8vZ2l0
bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL2RlbW9zLy0vY29tbWl0LzVhYWE3ZmFlYjRkZTk0OTc1
MzU3Mzg4MzBlNmViYjhmMTAwNzE4NzcKPj4KPj4gU2lnbmVkLW9mZi1ieTogRmlvbmEgS2x1dGUg
KFdJV0EpIDxmaW9uYS5rbHV0ZUBnbXguZGU+Cj4+IC0tLQo+PiBDaGFuZ2VzIHYxIC0+IHYyOiBB
ZGQgZGV0YWlscyBvbiB3aGVuIHRoZSBidWcgd2FzIGludHJvZHVjZWQgaW50bwo+PiBtZXNhM2Qt
ZGVtb3MgYW5kIEJ1aWxkcm9vdCB0byBjb21taXQgbWVzc2FnZS4KPiAKPiBDYW4geW91IHByb3Zp
ZGUgYSBkZWZjb25maWcgdGhhdCByZXByb2R1Y2UgdGhpcyBidWlsZCBpc3N1ZT8KPiBJdCBzZWVt
cyB0aGUgYXV0b2J1aWxkZXJzIGFyZSBub3QgYWJsZSB0byB0cmlnZ2VyIGl0Ogo+IAo+IGh0dHBz
Oi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvP2xpYmM9bXVzbCYmcmVhc29uPW1lc2EzZC1kZW1v
cy05LjAuMAo+IAo+IEknbSBub3QgYWJsZSB0byByZXByb2R1Y2UgaXQgdXNpbmcgYSB4ODZfNjQg
bXVzbCB0b29sY2hhaW4gYW5kIHZ1bGthaW4gc3VwcG9ydAo+IGVuYWJsZWQgaW4gbWVzYTNkICh3
YXlsYW5kIGVuYWJsZWQpOgo+IAo+IEJSMl9UT09MQ0hBSU5fRVhURVJOQUxfQk9PVExJTl9YODZf
NjRfQ09SRV9JN19NVVNMX1NUQUJMRT15Cj4gQlIyX1BBQ0tBR0VfV0FZTEFORD15Cj4gQlIyX1BB
Q0tBR0VfTUVTQTNEX0xMVk09eQo+IEJSMl9QQUNLQUdFX01FU0EzRF9HQUxMSVVNX0RSSVZFUl9J
OTE1PXkKPiBCUjJfUEFDS0FHRV9NRVNBM0RfVlVMS0FOX0RSSVZFUl9TV1JBU1Q9eQo+IEJSMl9Q
QUNLQUdFX01FU0EzRF9WVUxLQU5fRFJJVkVSX1ZJUlRJTz15Cj4gQlIyX1BBQ0tBR0VfTUVTQTNE
X0RFTU9TPXkKCkkgY2FuIHJlcHJvZHVjZSBvbmx5IGlmIHZ1bGthbi1sb2FkZXIgcGFja2FnZSBp
cyBidWlsdCBiZWZvcmUgbWVzYTNkLWRlbW9zIHBhY2thZ2UuCgpJdCBzZWVtcyB0aGUgdnVsa2Fu
IHN1cHBvcnQgaXMgbm90IHByb3Blcmx5IGhhbmRsZWQgaW4gbWVzYTNkLWRlbW9zLm1rIHVzaW5n
Ci1EdnVsa2FuPWVuYWJsZWQgb3IgLUR2dWxrYW49ZGlzYWJsZWQKCkNhbiB5b3UgaGF2ZSBhIGxv
b2s/CgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gCj4gQmVzdCByZWdhcmRzLAo+IFJvbWFpbgo+
IAo+IAo+Pgo+PiAgLi4ua2FuLXdzaS11c2UtdW5zaWduZWQtaW5zdGVhZC1vZi11aW50LnBhdGNo
IHwgNjggKysrKysrKysrKysrKysrKysrKwo+PiAgMSBmaWxlIGNoYW5nZWQsIDY4IGluc2VydGlv
bnMoKykKPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL21lc2EzZC1kZW1vcy8wMDAzLXZ1
bGthbi13c2ktdXNlLXVuc2lnbmVkLWluc3RlYWQtb2YtdWludC5wYXRjaAo+Pgo+PiBkaWZmIC0t
Z2l0IGEvcGFja2FnZS9tZXNhM2QtZGVtb3MvMDAwMy12dWxrYW4td3NpLXVzZS11bnNpZ25lZC1p
bnN0ZWFkLW9mLXVpbnQucGF0Y2ggYi9wYWNrYWdlL21lc2EzZC1kZW1vcy8wMDAzLXZ1bGthbi13
c2ktdXNlLXVuc2lnbmVkLWluc3RlYWQtb2YtdWludC5wYXRjaAo+PiBuZXcgZmlsZSBtb2RlIDEw
MDY0NAo+PiBpbmRleCAwMDAwMDAwMDAwLi4xNjBkYzkwMTBkCj4+IC0tLSAvZGV2L251bGwKPj4g
KysrIGIvcGFja2FnZS9tZXNhM2QtZGVtb3MvMDAwMy12dWxrYW4td3NpLXVzZS11bnNpZ25lZC1p
bnN0ZWFkLW9mLXVpbnQucGF0Y2gKPj4gQEAgLTAsMCArMSw2OCBAQAo+PiArRnJvbSAzZjRkNWZm
MzRlMDYxZjNkNDdiOWNmMjhiZmYyZmM1ODhkOGM1MzI2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQo+PiArRnJvbTogcHN5a29zZSA8YWxpY2VAYXlheWEuZGV2Pgo+PiArRGF0ZTogVGh1LCAyMyBN
YXIgMjAyMyAyMToxODo1NiArMDAwMAo+PiArU3ViamVjdDogW1BBVENIXSB2dWxrYW4vd3NpOiB1
c2UgdW5zaWduZWQgaW5zdGVhZCBvZiB1aW50Cj4+ICsKPj4gK3VpbnQgaXMgbm90IGEgc3RhbmRh
cmQgdHlwZSBuYW1lIGFuZCBmYWlscyB0byBidWlsZCBhZ2FpbnN0IG11c2wgbGliYwo+PiArCj4+
ICtSZXZpZXdlZC1ieTogRXJpayBGYXllLUx1bmQgPGVyaWsuZmF5ZS1sdW5kQGNvbGxhYm9yYS5j
b20+Cj4+ICtVcHN0cmVhbTogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvZGVt
b3MvLS9jb21taXQvM2Y0ZDVmZjM0ZTA2MWYzZDQ3YjljZjI4YmZmMmZjNTg4ZDhjNTMyNgo+PiAr
U2lnbmVkLW9mZi1ieTogRmlvbmEgS2x1dGUgKFdJV0EpIDxmaW9uYS5rbHV0ZUBnbXguZGU+Cj4+
ICstLS0KPj4gKyBzcmMvdnVsa2FuL3dzaS93YXlsYW5kLmMgfCAxNCArKysrKysrLS0tLS0tLQo+
PiArIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4+ICsK
Pj4gK2RpZmYgLS1naXQgYS9zcmMvdnVsa2FuL3dzaS93YXlsYW5kLmMgYi9zcmMvdnVsa2FuL3dz
aS93YXlsYW5kLmMKPj4gK2luZGV4IDQ0NGQyYmI4MS4uNTk1OGQyODNhIDEwMDY0NAo+PiArLS0t
IGEvc3JjL3Z1bGthbi93c2kvd2F5bGFuZC5jCj4+ICsrKysgYi9zcmMvdnVsa2FuL3dzaS93YXls
YW5kLmMKPj4gK0BAIC0xMjgsNyArMTI4LDcgQEAgZGlzcGF0Y2hfa2V5KHhrYl9rZXljb2RlX3Qg
eGtiX2tleSwgZW51bSB3bF9rZXlib2FyZF9rZXlfc3RhdGUgc3RhdGUpCj4+ICsgfQo+PiArIAo+
PiArIHN0YXRpYyB2b2lkCj4+ICstaGFuZGxlX2tleSh1aW50IGtleSwgZW51bSB3bF9rZXlib2Fy
ZF9rZXlfc3RhdGUgc3RhdGUpCj4+ICsraGFuZGxlX2tleSh1bnNpZ25lZCBrZXksIGVudW0gd2xf
a2V5Ym9hcmRfa2V5X3N0YXRlIHN0YXRlKQo+PiArIHsKPj4gKyAgICB4a2Jfa2V5Y29kZV90IHhr
Yl9rZXkgPSBrZXkgKyA4Owo+PiArICAgIHN0cnVjdCBpdGltZXJzcGVjIHRpbWVyID0gezB9Owo+
PiArQEAgLTE1MSwxNSArMTUxLDE1IEBAIGhhbmRsZV9rZXkodWludCBrZXksIGVudW0gd2xfa2V5
Ym9hcmRfa2V5X3N0YXRlIHN0YXRlKQo+PiArIH0KPj4gKyAKPj4gKyBzdGF0aWMgdm9pZAo+PiAr
LWtleSh2b2lkICpkYXRhLCBzdHJ1Y3Qgd2xfa2V5Ym9hcmQgKmtleWJvYXJkLCB1aW50IHNlcmlh
bCwKPj4gKy0gICAgdWludCB0aW1lLCB1aW50IGtleSwgZW51bSB3bF9rZXlib2FyZF9rZXlfc3Rh
dGUgc3RhdGUpCj4+ICsra2V5KHZvaWQgKmRhdGEsIHN0cnVjdCB3bF9rZXlib2FyZCAqa2V5Ym9h
cmQsIHVuc2lnbmVkIHNlcmlhbCwKPj4gKysgICAgdW5zaWduZWQgdGltZSwgdW5zaWduZWQga2V5
LCBlbnVtIHdsX2tleWJvYXJkX2tleV9zdGF0ZSBzdGF0ZSkKPj4gKyB7Cj4+ICsgICAgaGFuZGxl
X2tleShrZXksIHN0YXRlKTsKPj4gKyB9Cj4+ICsgCj4+ICsgc3RhdGljIHZvaWQKPj4gKy1tb2Rp
ZmllcnModm9pZCAqZGF0YSwgc3RydWN0IHdsX2tleWJvYXJkICprZXlib2FyZCwgdWludCBzZXJp
YWwsCj4+ICstICAgIHVpbnQgbW9kc19kZXByZXNzZWQsIHVpbnQgbW9kc19sYXRjaGVkLCB1aW50
IG1vZHNfbG9ja2VkLCB1aW50IGdyb3VwKQo+PiArK21vZGlmaWVycyh2b2lkICpkYXRhLCBzdHJ1
Y3Qgd2xfa2V5Ym9hcmQgKmtleWJvYXJkLCB1bnNpZ25lZCBzZXJpYWwsCj4+ICsrICAgIHVuc2ln
bmVkIG1vZHNfZGVwcmVzc2VkLCB1bnNpZ25lZCBtb2RzX2xhdGNoZWQsIHVuc2lnbmVkIG1vZHNf
bG9ja2VkLCB1bnNpZ25lZCBncm91cCkKPj4gKyB7Cj4+ICsgICAgeGtiX3N0YXRlX3VwZGF0ZV9t
YXNrKGtleWJvYXJkX2RhdGEueGtiX3N0YXRlLCBtb2RzX2RlcHJlc3NlZCwgbW9kc19sYXRjaGVk
LAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICBtb2RzX2xvY2tlZCwgMCwgMCwgZ3JvdXAp
Owo+PiArQEAgLTE4NCw3ICsxODQsNyBAQCBrZXltYXAodm9pZCAqZGF0YSwgc3RydWN0IHdsX2tl
eWJvYXJkICprZXlib2FyZCwKPj4gKyB9Cj4+ICsgCj4+ICsgc3RhdGljIHZvaWQKPj4gKy1lbnRl
cih2b2lkICpkYXRhLCBzdHJ1Y3Qgd2xfa2V5Ym9hcmQgKmtleWJvYXJkLCB1aW50IHNlcmlhbCwK
Pj4gKytlbnRlcih2b2lkICpkYXRhLCBzdHJ1Y3Qgd2xfa2V5Ym9hcmQgKmtleWJvYXJkLCB1bnNp
Z25lZCBzZXJpYWwsCj4+ICsgICAgICAgc3RydWN0IHdsX3N1cmZhY2UgKnN1cmZhY2UsIHN0cnVj
dCB3bF9hcnJheSAqa2V5cykKPj4gKyB7Cj4+ICsgICAgdWludDMyX3QgKmtleTsKPj4gK0BAIC0x
OTQsNyArMTk0LDcgQEAgZW50ZXIodm9pZCAqZGF0YSwgc3RydWN0IHdsX2tleWJvYXJkICprZXli
b2FyZCwgdWludCBzZXJpYWwsCj4+ICsgfQo+PiArIAo+PiArIHN0YXRpYyB2b2lkCj4+ICstbGVh
dmUodm9pZCAqZGF0YSwgc3RydWN0IHdsX2tleWJvYXJkICprZXlib2FyZCwgdWludCBzZXJpYWws
Cj4+ICsrbGVhdmUodm9pZCAqZGF0YSwgc3RydWN0IHdsX2tleWJvYXJkICprZXlib2FyZCwgdW5z
aWduZWQgc2VyaWFsLAo+PiArICAgICAgIHN0cnVjdCB3bF9zdXJmYWNlICpzdXJmYWNlKQo+PiAr
IHsKPj4gKyAgICBzdHJ1Y3QgaXRpbWVyc3BlYyB0aW1lciA9IHswfTsKPj4gKy0tIAo+PiArR2l0
TGFiCj4+ICsKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
