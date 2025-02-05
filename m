Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9622C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 15:05:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 832A14252E;
	Wed,  5 Feb 2025 15:05:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IJeVpqa9zvcp; Wed,  5 Feb 2025 15:05:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 309454178C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 309454178C;
	Wed,  5 Feb 2025 15:05:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 90E53CD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8010681196
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:05:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MbLZ-NrQ-ost for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 15:05:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E700081184
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E700081184
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E700081184
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:05:39 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43675b1155bso78700155e9.2
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 07:05:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738767938; x=1739372738;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v2elR47AhlmnCEAmSBsAsSLBWJxCQpufcaFRrzvoi38=;
 b=Ht8+K+O/ejn58T2pK8P1iLvI4dcvgS7Xb0fXSbPoVTmMuzG8dkTdAhPnPVF0BAfOBD
 D0h9lTjQ2Rr1Kel/Wto7kTWHHBBguLpV+031x5T0TSKdzdolxo7YH0KVxjZA+dhejOAl
 xzmt9Opi/L+6NzdMLz++6s6ffoBaVjaXwtzO5y3m0/ARRfMk86kyxvgi02qkrkFDm49V
 7KfUSm2TKtsIbdR3bNKXsYpc/jT0rbM08eyzV99QuPoJg8WbmhBFyqF7y8AZXdfAX9/B
 GR9ZrYbFUtTHg7RheSRAiwLFJedx/lItP7cRV6lGrvW48T1mNEnooR/sDc0D4QsO02lV
 x9Zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVT4mqSZq1TpjSkj1mtlZfoz0Taux+zAbNaYyd123k9UCSc9BxVWOXe+hPODKdTWE0b+t2pMv83VPg=@buildroot.org
X-Gm-Message-State: AOJu0Ywa0wwj90e4hdYEvK9achJq8C52LiWjS+gKV4Fepf2A4bo6kJoQ
 7qXcUIM2iT3rgvYN7Q5C4XMmONE41rDJy2DOPm6UP3V7yY9tvhioLYYl1urFm/fWdSJMoLHfFQs
 qoew99g==
X-Gm-Gg: ASbGncsbXDn1Huc1js7wLYiy05Vm8GbNR8Q4X25nXn3FXrSmvPyAZdma2TewrYO3aFq
 k3DGeujpMDFYoZSVV+RsdagqIX1PkMpbuvSjXwF6RddtbhscMsMCl6Qku8eHvMRUExi6iD8aFek
 tfltB4t/x9t9exeVVjKvEXXCcAf1OddDSQeSfjj4bJxKPjYe2I5ulUjiL37kMvblQZ4x8Q5L3Ad
 d6XVqO7hA3Srks4gsnx2Pxpcl4rPL5VE3PIf4yyBZNIZnVgp1c2isiu5jWxgcukGE4Ca7CwZWzw
 dsT/IBg0T6cSSxQkAbt9P13peeX4kz56pxT7wUT6rj/1VfU4JWDYTDyH
X-Google-Smtp-Source: AGHT+IEygtfArdzHboPsVrwn17B/3hCjQX+KXv/smey7zcjXCKG2fn1c+R1KE2Q+fP4WuLThBUYWLw==
X-Received: by 2002:a5d:5f4c:0:b0:385:fae2:f443 with SMTP id
 ffacd0b85a97d-38db48d5d49mr2020472f8f.34.1738767937719; 
 Wed, 05 Feb 2025 07:05:37 -0800 (PST)
Received: from [172.16.2.119] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c102d2esm19333018f8f.33.2025.02.05.07.05.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 07:05:37 -0800 (PST)
Message-ID: <812a3d07-e2f0-46a0-9724-82171a1f7afb@smile.fr>
Date: Wed, 5 Feb 2025 16:05:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Vladimir Oltean <olteanv@gmail.com>, buildroot@buildroot.org
Cc: Brandon Maier <Brandon.Maier@collins.com>,
 Rabeeh Khoury <rabeeh@solid-run.com>, Josua Mayer <josua@solid-run.com>,
 Ioana Ciornei <ciorneiioana@gmail.com>
References: <20241208143802.1048266-1-olteanv@gmail.com>
 <20241208143802.1048266-6-olteanv@gmail.com>
Content-Language: fr
In-Reply-To: <20241208143802.1048266-6-olteanv@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1738767938; x=1739372738; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=v2elR47AhlmnCEAmSBsAsSLBWJxCQpufcaFRrzvoi38=;
 b=odhr7QJuW0q6X4fRTvq26Z1grRx80p+ED1C2qzsCxUwDlotgPAOdCao8R5dJHKr6SW
 0JgFc/11SSomldezr3UOUmViwGpPUwywjf+Bso2rMJRqV851NyfJ1MDRHMc5fdytv287
 AWhjrOWB1TClI93ybplrcYQV97Z8+2iS1S2s8=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=odhr7QJu
Subject: Re: [Buildroot] [PATCH v2 05/11] package/qoriq-restool: new package
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

SGVsbG8sCgpMZSAwOC8xMi8yMDI0IMOgIDE1OjM3LCBWbGFkaW1pciBPbHRlYW4gYSDDqWNyaXTC
oDoKPiBJbnRyb2R1Y2UgYSBwYWNrYWdlIGZvciB0aGUgcmVzdG9vbCBwcm9ncmFtLCB3aGljaCBw
ZXJtaXRzIHRoZSB1c2VyIHRvCj4gbW9kaWZ5IHRoZSBuZXR3b3JrIGNvbmZpZ3VyYXRpb24gb2Yg
dGhlIERQQUEyIHN1YnN5c3RlbSBhbmQgY3JlYXRlIG9uZQo+IHRoYXQgaXMgYWRlcXVhdGUgdG8g
dGhlaXIgdXNlIGNhc2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogVmxhZGltaXIgT2x0ZWFuIDxvbHRl
YW52QGdtYWlsLmNvbT4KPiAtLS0KPiB2MS0+djI6IG5vbmUKPiAKPiAgREVWRUxPUEVSUyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKPiAgcGFja2FnZS9Db25maWcuaW4gICAg
ICAgICAgICAgICAgICAgICAgICB8ICAxICsKPiAgcGFja2FnZS9xb3JpcS1yZXN0b29sL0NvbmZp
Zy5pbiAgICAgICAgICB8IDIxICsrKysrKysrKysrKysrKysrKysrKwo+ICBwYWNrYWdlL3Fvcmlx
LXJlc3Rvb2wvcW9yaXEtcmVzdG9vbC5oYXNoIHwgIDMgKysrCj4gIHBhY2thZ2UvcW9yaXEtcmVz
dG9vbC9xb3JpcS1yZXN0b29sLm1rICAgfCAyNCArKysrKysrKysrKysrKysrKysrKysrKysKPiAg
NSBmaWxlcyBjaGFuZ2VkLCA1MCBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBw
YWNrYWdlL3FvcmlxLXJlc3Rvb2wvQ29uZmlnLmluCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNr
YWdlL3FvcmlxLXJlc3Rvb2wvcW9yaXEtcmVzdG9vbC5oYXNoCj4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCBwYWNrYWdlL3FvcmlxLXJlc3Rvb2wvcW9yaXEtcmVzdG9vbC5tawo+IAo+IGRpZmYgLS1naXQg
YS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwo+IGluZGV4IDQ0NjI4ZGIzYmVmNS4uZGJhNGJiYmIy
MWU2IDEwMDY0NAo+IC0tLSBhL0RFVkVMT1BFUlMKPiArKysgYi9ERVZFTE9QRVJTCj4gQEAgLTMz
MDUsNiArMzMwNSw3IEBAIE46CVZsYWRpbWlyIE9sdGVhbiA8b2x0ZWFudkBnbWFpbC5jb20+Cj4g
IEY6CXBhY2thZ2UvcW9yaXEtZGRyLXBoeS1iaW5hcnkvCj4gIEY6CXBhY2thZ2UvcW9yaXEtbWMt
YmluYXJ5Lwo+ICBGOglwYWNrYWdlL3FvcmlxLW1jLXV0aWxzLwo+ICtGOglwYWNrYWdlL3Fvcmlx
LXJlc3Rvb2wvCj4gIAo+ICBOOglWb2xrb3YgVmlhY2hlc2xhdiA8c3Y5OUBpbmJveC5ydT4KPiAg
RjoJcGFja2FnZS92NGwyZ3JhYi8KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9Db25maWcuaW4gYi9w
YWNrYWdlL0NvbmZpZy5pbgo+IGluZGV4IDUyYjI4ODcxZTk2ZC4uZGRiZTQxZTBmZjIwIDEwMDY0
NAo+IC0tLSBhL3BhY2thZ2UvQ29uZmlnLmluCj4gKysrIGIvcGFja2FnZS9Db25maWcuaW4KPiBA
QCAtNTk5LDYgKzU5OSw3IEBAIGVuZG1lbnUKPiAgCXNvdXJjZSAicGFja2FnZS9wcnUtc29mdHdh
cmUtc3VwcG9ydC9Db25maWcuaW4iCj4gIAlzb3VyY2UgInBhY2thZ2UvcHVsc2V2aWV3L0NvbmZp
Zy5pbiIKPiAgCXNvdXJjZSAicGFja2FnZS9xb3JpcS1jYWRlbmNlLWRwLWZpcm13YXJlL0NvbmZp
Zy5pbiIKPiArCXNvdXJjZSAicGFja2FnZS9xb3JpcS1yZXN0b29sL0NvbmZpZy5pbiIKPiAgCXNv
dXJjZSAicGFja2FnZS9yYXNwaS1ncGlvL0NvbmZpZy5pbiIKPiAgCXNvdXJjZSAicGFja2FnZS9y
ZG1hLWNvcmUvQ29uZmlnLmluIgo+ICAJc291cmNlICJwYWNrYWdlL3JlYWQtZWRpZC9Db25maWcu
aW4iCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcW9yaXEtcmVzdG9vbC9Db25maWcuaW4gYi9wYWNr
YWdlL3FvcmlxLXJlc3Rvb2wvQ29uZmlnLmluCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRl
eCAwMDAwMDAwMDAwMDAuLjNmMTgzNGE3ZGNlMAo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNr
YWdlL3FvcmlxLXJlc3Rvb2wvQ29uZmlnLmluCj4gQEAgLTAsMCArMSwyMSBAQAo+ICtjb25maWcg
QlIyX1BBQ0tBR0VfUU9SSVFfUkVTVE9PTAo+ICsJYm9vbCAicW9yaXEtcmVzdG9vbCIKPiArCWhl
bHAKPiArCSAgVGhlIERQQUEyIGFyY2hpdGVjdHVyZSBpbiBMYXllcnNjYXBlIFNvQ3MgY29uc2lz
dHMgb2YKPiArCSAgbmV0d29ya2luZyByZXNvdXJjZXMgdGhhdCBjYW4gYmUgYXNzZW1ibGVkIGlu
dG8gdmFyaW91cwo+ICsJICBudWdnZXRzIG9mIGZ1bmN0aW9uYWxpdHksIGNhbGxlZCAib2JqZWN0
cyIgKERQTUFDLCBEUE5JLAo+ICsJICBEUERNVVgsIERQU1cgZXRjKSwgYnkgdGhlIE1hbmFnZW1l
bnQgQ29tcGxleCAoTUMpIGZpcm13YXJlLgo+ICsKPiArCSAgVGhlIE1DIGZpcm13YXJlIHJlYWRz
IGEgZmlsZSBjYWxsZWQgRGF0YSBQYXRoIExheW91dCAoRFBMKQo+ICsJICB3aGljaCBkZXNjcmli
ZXMgdGhlIHNldCBvZiBuZXR3b3JraW5nIG9iamVjdHMgaXQgc2hvdWxkCj4gKwkgIGNyZWF0ZSBz
dGF0aWNhbGx5LCBhdCBib290IHRpbWUuCj4gKwo+ICsJICBUaGUgcmVzdG9vbCBwcm9ncmFtIGlz
IGFibGUgdG8gdGFsayB0byB0aGUgTWFuYWdlbWVudCBDb21wbGV4Cj4gKwkgIGF0IHJ1bnRpbWUg
YW5kIHBlcm1pdHMgdGhlIGR5bmFtaWMgcmVjb25maWd1cmF0aW9uIG9mCj4gKwkgIG5ldHdvcmtp
bmcgb2JqZWN0cywgYXMgd2VsbCBhcyBzYXZpbmcgdGhlIGN1cnJlbnQgY29uZmlndXJhdGlvbgo+
ICsJICBpbnRvIGEgbmV3IERQTCBmaWxlLiBXaXRob3V0IHRoZSByZXN0b29sIHByb2dyYW0sIHRo
ZSBvbmx5Cj4gKwkgIHBvc3NpYmxlIG5ldHdvcmtpbmcgY29uZmlndXJhdGlvbiBpcyB0aGF0IHNw
ZWNpZmllZCBpbiB0aGUKPiArCSAgYm9vdC10aW1lIERQTCBmaWxlLgoKJCAuL3V0aWxzL2NoZWNr
LXBhY2thZ2UgcGFja2FnZS9xb3JpcS1yZXN0b29sLyoKcGFja2FnZS9xb3JpcS1yZXN0b29sL0Nv
bmZpZy5pbjoxNTogaGVscCB0ZXh0OiA8dGFiPjwyIHNwYWNlcz48NjIgY2hhcnM+CihodHRwczov
L25pZ2h0bHkuYnVpbGRyb290Lm9yZy8jd3JpdGluZy1ydWxlcy1jb25maWctaW4pCnBhY2thZ2Uv
cW9yaXEtcmVzdG9vbC9Db25maWcuaW46MjE6IGhlbHAgdGV4dDogPHRhYj48MiBzcGFjZXM+PDYy
IGNoYXJzPgooaHR0cHM6Ly9uaWdodGx5LmJ1aWxkcm9vdC5vcmcvI3dyaXRpbmctcnVsZXMtY29u
ZmlnLWluKQoKCj4gKwo+ICsJICBodHRwczovL2dpdGh1Yi5jb20vbnhwLXFvcmlxL3Jlc3Rvb2wK
PiArCSAgaHR0cHM6Ly93d3cubnhwLmNvbS93ZWJhcHAvRG93bmxvYWQ/Y29sQ29kZT1EUEFBMlVN
ICMgc2lnbiBpbiByZXF1aXJlZAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3FvcmlxLXJlc3Rvb2wv
cW9yaXEtcmVzdG9vbC5oYXNoIGIvcGFja2FnZS9xb3JpcS1yZXN0b29sL3FvcmlxLXJlc3Rvb2wu
aGFzaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi5jMjMzMmQ5
YjI3ZWIKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9xb3JpcS1yZXN0b29sL3Fvcmlx
LXJlc3Rvb2wuaGFzaAo+IEBAIC0wLDAgKzEsMyBAQAo+ICsjIExvY2FsbHkgY2FsY3VsYXRlZAo+
ICtzaGEyNTYgIDBjZmNlZDMyY2FhNjE1MjY2ZmY2MzM5NDZkNDBhMzY2NjBjODU2ZDdlYjA1N2I4
MWRlMzkyNTcwZTEzNmM1ZTUgIHFvcmlxLXJlc3Rvb2wtbGYtNi42LjM2LTIuMS4wLnRhci5nego+
ICtzaGEyNTYgIDY4ZjRiMTVlY2MwODU3Mjk0MTliYzYwY2E2ZWVhZGNhNWFmMDIzN2JiZmVjNzkx
ZThhNzlkYTljOTQzZDQyZTkgIExJQ0VOU0UKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9xb3JpcS1y
ZXN0b29sL3FvcmlxLXJlc3Rvb2wubWsgYi9wYWNrYWdlL3FvcmlxLXJlc3Rvb2wvcW9yaXEtcmVz
dG9vbC5tawo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi40YTg5
YTgwYWZhNzAKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9xb3JpcS1yZXN0b29sL3Fv
cmlxLXJlc3Rvb2wubWsKPiBAQCAtMCwwICsxLDI0IEBACj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMKPiArIwo+ICsjIHFvcmlxLXJlc3Rvb2wKPiArIwo+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
Iwo+ICsKPiArUU9SSVFfUkVTVE9PTF9WRVJTSU9OID0gbGYtNi42LjM2LTIuMS4wCj4gK1FPUklR
X1JFU1RPT0xfU0lURSA9ICQoY2FsbCBnaXRodWIsbnhwLXFvcmlxLHJlc3Rvb2wsJChRT1JJUV9S
RVNUT09MX1ZFUlNJT04pKQo+ICtRT1JJUV9SRVNUT09MX0xJQ0VOU0UgPSBHUEwyLjAKPiArUU9S
SVFfUkVTVE9PTF9MSUNFTlNFX0ZJTEVTID0gQ09QWUlORwoKVGhlIGVxdWl2YWxlbnQgcGFja2Fn
ZSBmcm9tIG1ldGEtZnJlZXNjYWxlIGFjdHVhbGx5IGFkdmVydGlzZSBhIGR1YWwgbGljZW5zZToK
CiJCU0QtMy1DbGF1c2UgfCBHUEwtMi4wLW9yLWxhdGVyIgoKaHR0cHM6Ly9naXRodWIuY29tL0Zy
ZWVzY2FsZS9tZXRhLWZyZWVzY2FsZS9ibG9iLzFlYTJjYjM1OWIyYWI2ZmIyY2IwMWY5N2E5MDVl
MjdlNjkwOGRiNzkvcmVjaXBlcy1kcGFhMi9yZXN0b29sL3Jlc3Rvb2xfZ2l0LmJiI0wyCgpCZXN0
IHJlZ2FyZHMsClJvbWFpbgoKCj4gKwo+ICtRT1JJUV9SRVNUT09MX01BS0VfT1BUUyA9IFwKPiAr
CUNDPSIkKFRBUkdFVF9DQykiIFwKPiArCUNST1NTX0NPTVBJTEU9IiQoVEFSR0VUX0NST1NTKSIK
PiArCj4gK2RlZmluZSBRT1JJUV9SRVNUT09MX0JVSUxEX0NNRFMKPiArCWNkICQoQEQpICYmICQo
VEFSR0VUX01BS0VfRU5WKSAkKE1BS0UpICQoUU9SSVFfUkVTVE9PTF9NQUtFX09QVFMpCj4gK2Vu
ZGVmCj4gKwo+ICtkZWZpbmUgUU9SSVFfUkVTVE9PTF9JTlNUQUxMX1RBUkdFVF9DTURTCj4gKwkk
KFRBUkdFVF9NQUtFX0VOVikgJChNQUtFKSAtQyAkKEBEKSBERVNURElSPSQoVEFSR0VUX0RJUikg
cHJlZml4PS91c3IgaW5zdGFsbAo+ICtlbmRlZgo+ICsKPiArJChldmFsICQoZ2VuZXJpYy1wYWNr
YWdlKSkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
