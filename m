Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC499CD1292
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 20:31:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A940A41521;
	Sun,  7 Apr 2024 20:31:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fKHJlVVskjZP; Sun,  7 Apr 2024 20:31:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 403FE41529
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 403FE41529;
	Sun,  7 Apr 2024 20:31:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0C2151BF3F6
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 20:31:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C26C81B0A
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 20:30:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vscn9N6IHnPn for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 20:30:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BE62981ADE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE62981ADE
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BE62981ADE
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 20:30:56 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4166ccac75cso2636105e9.0
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 13:30:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712521854; x=1713126654;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7aeMZ80+oVR9e4oLpFnXVv/YYv68xfeodumZx0FAvYQ=;
 b=EdUVopSRtvATb1JESeM1pZx+mIDrPesLmbp5PrwMABgwAQaU4QYN8Hnxk2JjxkkWRQ
 3TyZwajVQ8JnTBgmunGWpnnhqujOV+Z8Htvra2hhrpVQxKmt+jjvwRh9UqiSkmUOyQ4J
 fA5Gn8azWxf+nk2/f0oh7/4Tx7dSxMdTkW2YIshASeOR/MuK3OxXrMqMa/Gq1Q//V4pO
 mr9/aRmNxGV2nShS7tXTX34Gp+XvZHZ0M8r5JYbshpjOOaPTFga67JoYZlukMRzZE+AP
 ta/WMBwVkWCmJY7TWCU18hda8FlA0uHah5lTKLOOEi+uhiidrDqbHysBFMoAg391NO+S
 mofQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPWXRk/IUL0g+p7MIBKp+w/RrXeZ5pUzU7UapEZmX/LF3E7+j9fIs2XbxpV3WiABudNhpjjyoR+2i/1+snpj73hAKAGYTkug==
X-Gm-Message-State: AOJu0Ywbr+Yr/EXJNwP1TL+GDke5yxqId5eQQsMyi/wDr58rQMxjPd/B
 qMRaRU5XvtzR4KIKxiPmXz4qosoujaiJCwV8wurytLgNe+1AjMRXaVtzr6NAsLo=
X-Google-Smtp-Source: AGHT+IGocbWGOzgnfhQ1XFpiKynlZN0ubDgHAJLNTpz9TWCywmYBFhrYiaDnxKefyNX7JGlYB6y6pQ==
X-Received: by 2002:a05:600c:3551:b0:416:6344:8948 with SMTP id
 i17-20020a05600c355100b0041663448948mr1259814wmq.2.1712521854270; 
 Sun, 07 Apr 2024 13:30:54 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 h15-20020a05600c314f00b00416509d7d95sm4024901wmo.37.2024.04.07.13.30.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Apr 2024 13:30:53 -0700 (PDT)
Message-ID: <58478029-3c92-497e-bb31-4a1f1119afd4@mind.be>
Date: Sun, 7 Apr 2024 22:30:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
References: <20240407103512.1112712-1-romain.naour@smile.fr>
Content-Language: en-GB
In-Reply-To: <20240407103512.1112712-1-romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712521854; x=1713126654; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7aeMZ80+oVR9e4oLpFnXVv/YYv68xfeodumZx0FAvYQ=;
 b=hDXARmCoCqk2oMpscpeeuxNHTJTX2bufFQJ01GGhKmKieDNh4LMdl4rlArwVqT2/QK
 WRas7tlr17CIdCAw0XmpodviefvomtjQujTrkTYo1oFPa3KFenO3qLClY4s1+z7CAErg
 a/RHHAoUKFDY3wiqmhbQRvOIbcTc1YzHvZ7aZheqvaudxk8/mGNsByWXhesL4tenK0Cv
 u+Qfg5PjVTUVpHXDJTqTW9t1suJjb7nEVjBMugoNuRWX7e9UW9p3o1OgTrCxeD1Gosct
 IILjaWHXprOz5FOxk3nM10OQEt/sRO7JyzPeWvLO6nlCRSTXFO7LXD01FiiPfEumLREF
 Movg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hDXARmCo
Subject: Re: [Buildroot] [PATCH v12 00/16] Add support for AM62x-SK HS-FS
 devices
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
Cc: =?UTF-8?Q?Gero_Schw=C3=A4ricke?= <gero.schwaericke@grandcentrix.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwNy8wNC8yMDI0IDEyOjM0LCBSb21haW4gTmFvdXIgd3JvdGU6Cj4gVGhpcyBzZXJpZXMg
YWltcyBpbml0aWFsbHkgdG8gZml4IEFNNjJ4LVNLIEhTLUZTIGRldmljZXMgYnV0IGRvaW5nIHNv
Cj4gd291bGQgcmVxdWlyZXMgYWRkaW5nIGEgVEkgbGVnYWN5IHRvb2wgInRpLWszLWNvcmUtc2Vj
ZGV2IiBpbnRvIEJ1aWxkcm9vdC4KPiB0aS1rMy1jb3JlLXNlY2RldiBpcyByZXBsYWNlZCBieSB1
LWJvb3QncyBiaW5tYW4gdG9vbCBzaW5jZSB2MjAyMy4xMCByZWxlYXNlCj4gb2YgdS1ib290Lgo+
IAo+IEluc3RlYWQsIHdlIGJ1bXAgdGhlIEJTUCB0byB1c2UgdGhlIGxhdGVzdCB1LWJvb3QgcmVs
ZWFzZSAoMjAyNC4wMSkgdG8gdXNlCj4gYmlubWFuLiBEb2luZyBzbyByZXF1aXJlcyB0byByZXdv
cmsgdGhlIFRJIEszIFNvQyBzdXBwb3J0IGluIEJ1aWxkcm9vdC4KPiAKPiBUaGlzIG5ldyB2ZXJz
aW9uICh2MTIpIG9mIHRoaXMgc2VyaWVzIHJlbW92ZSB0aGUgdGktazMgcGFja2FnZSBhbmQKPiBh
bGwgU09DIGFuZCBTRUNUWVBFIG9wdGlvbnMuIEFzIHN1Z2dlc3RlZCBieSBNaWNoYWVsIFdhbGxl
LCBjb3B5IHRoZQo+IGRlZmF1bHQgdGlib290My5iaW4gYW5kIHN5c2Z3Lml0YiAoaWYgYW55KSBp
ZiBubyBjdXN0b20gZmlsZSBuYW1lIGlzCj4gcHJvdmlkZWQgb24gdGhlIGRlZmNvbmZpZy4gU2lu
Y2Ugc3VjaCBmaWxlIG5hbWUgY2FuIGJlIGN1c3RvbWl6ZWQsCj4gdGhlIHVzZXIgbXVzdCBwcm92
aWRlIHRoZSBjb21wbGV0ZSBmaXJtd2FyZSBuYW1lIGlmIG5vdCB1c2luZyB0aGUKPiBkZWZhdWx0
IG9uZS4KPiAKPiBodHRwOi8vbGlzdHMuYnVzeWJveC5uZXQvcGlwZXJtYWlsL2J1aWxkcm9vdC8y
MDI0LUFwcmlsLzY4ODk0My5odG1sCj4gCj4gV2l0aCB0aGUgYWR2aWNlIG9mIEFuZHJlYXMgRGFu
bmVuYmVyZyAoVEkgSzMgYXJjaGl0ZWN0KSwgd2Ugc3dpdGNoCj4gQU02MngvQU02MkF4L0FNNjR4
IHRvIEhTLUZTIGJ5IGRlZmF1bHQuCj4gCj4gVGVzdHMgcGVyZm9ybWVkIG9uIGVhcmxpZXIgcmV2
aXNpb24gb2YgdGhpcyBzZXJpZXM6Cj4gCj4gKiBjb21waWxlZCB0aV9hbTYyeF9za19kZWZjb25m
aWcKPiAgICAqIHN1Y2Nlc3MKPiAqIGJvb3RlZCBvbiBBTTYyeCBTSyBFVk0gKEUzKQo+ICAgICog
c3VjY2Vzcwo+ICAgICogbm8gb2J2aW91cyBlcnJvcnMgaW4gZG1lc2cKPiAKPiBUZXN0ZWQtYnk6
IEdlcm8gU2Nod8Okcmlja2UgPGdlcm8uc2Nod2Flcmlja2VAZ3JhbmRjZW50cml4Lm5ldD4KPiAK
PiBEYXJpbyBCaW5hY2NoaSAoMTApOgo+ICAgIGJvb3QvdGktazMtcjUtbG9hZGVyOiBkcm9wIGhh
c2ggZm9yIHZlcnNpb24gMjAyMi4xMAo+ICAgIGJvb3QvdGktazMtcjUtbG9hZGVyOiBhZGQgQlIy
X1RBUkdFVF9USV9LM19SNV9MT0FERVJfVVNFX0JJTk1BTiBvcHRpb24KPiAgICBib290L3Vib290
OiBhZGQgQlIyX1RBUkdFVF9VQk9PVF9VU0VfQklOTUFOIG9wdGlvbgo+ICAgIGJvb3QvdGktazMt
cjUtbG9hZGVyOiBpbnN0YWxsIHRpYm9vdDMuYmluIGFuZCBzeXNmdy5pdGIgdG8KPiAgICAgIEJJ
TkFSSUVTX0RJUgo+ICAgIGNvbmZpZ3MvdGlfYW02Mnhfc2tfZGVmY29uZmlnOiBidW1wIFUtQm9v
dCB2ZXJzaW9uIHRvIDIwMjQuMDEKPiAgICBjb25maWdzL3RpX2FtNjJ4X3NrX2RlZmNvbmZpZzog
YnVtcCBMaW51eCB2ZXJzaW9uIHRvIDYuNi4xOAo+ICAgIGJvYXJkL3RpL2FtNjJ4LXNrOiBnZW5l
cmFsaXplIHBvc3QtYnVpbGQuc2gKPiAgICBib2FyZC90aS9hbTYyeC1zazogbW92ZSBwb3N0LWJ1
aWxkLnNoIHRvIGJvYXJkL3RpL2NvbW1vbi9hbTZ4eAo+ICAgIGNvbmZpZ3MvdGlfYW02NHhfc2tf
ZGVmY29uZmlnOiBidW1wIFUtQm9vdCB2ZXJzaW9uIHRvIDIwMjQuMDEKPiAgICBjb25maWdzL3Rp
X2FtNjR4X3NrX2RlZmNvbmZpZzogYnVtcCBMaW51eCB2ZXJzaW9uIHRvIDYuNi4xOAo+IAo+IFJv
bWFpbiBOYW91ciAoNik6Cj4gICAgYm9hcmQvdGkvYW02ezIsNH14LXNrOiBhZGQgYXJtLXRydXN0
ZWQtZmlybXdhcmUgdjIuNyBoYXNoCj4gICAgYm9vdC91Ym9vdDogcmVuYW1lIFRJX0szX0RNIG9w
dGlvbiB0byBjb3ZlciBmdXJ0aGVyIFRJIEszIFNvQ3Mgc3VwcG9ydAo+ICAgIGJvb3QvdWJvb3Q6
IHJlbW92ZSBCUjJfVEFSR0VUX1VCT09UX1RJX0szX0RNX1NPQ05BTUUKPiAgICBib290L3RpLWsz
LWltYWdlLWdlbjogcmVtb3ZlIHBhY2thZ2UKPiAgICBib290L3RpLWszLXI1LWxvYWRlcjogcmVt
b3ZlIEJSMl9UQVJHRVRfVElfSzNfUjVfTE9BREVSX1VTRV9CSU5NQU4KPiAgICBwYWNrYWdlL3Rp
LWszOiBzd2l0Y2ggQU02MngvQU02MkF4L0FNNjR4IHRvIEhTLUZTIGJ5IGRlZmF1bHQKCiAgUGF0
Y2hlcyAxLTUgYXBwbGllZCB0byBtYXN0ZXIuIEFuZCB0aGVyZSBJIHN0b3BwZWQsIGR1ZSB0byB0
aGUgU1dTRlcgdHlwby4gSSAKY291bGQgaGF2ZSBmaXhlZCBpdCB1cCBteXNlbGYgYnV0IGl0J3Mg
cmVhbGx5IGV2ZXJ5IHBhdGNoIHRoYXQgbmVlZHMgdG8gYmUgCnVwZGF0ZWQuLi4KCgogIFJlZ2Fy
ZHMsCiAgQXJub3V0Cgo+IAo+ICAgQ29uZmlnLmluLmxlZ2FjeSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgMTUgKysrKwo+ICAgREVWRUxPUEVSUyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgIDIgLQo+ICAgYm9hcmQvdGkvYW02Mngtc2svZ2VuaW1hZ2UuY2ZnICAg
ICAgICAgICAgICAgIHwgIDcgKy0KPiAgIC4uLi9hcm0tdHJ1c3RlZC1maXJtd2FyZS5oYXNoICAg
ICAgICAgICAgICAgICB8ICAyICsKPiAgIC4uLi9wYXRjaGVzL2xpbnV4LWhlYWRlcnMvbGludXgt
aGVhZGVycy5oYXNoICB8ICAxICsKPiAgIGJvYXJkL3RpL2FtNjJ4LXNrL3BhdGNoZXMvbGludXgv
bGludXguaGFzaCAgICB8ICAyICsKPiAgIC4uLi90aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9h
ZGVyLmhhc2ggICAgICB8ICAyICsKPiAgIGJvYXJkL3RpL2FtNjR4LXNrL2dlbmltYWdlLmNmZyAg
ICAgICAgICAgICAgICB8ICA3ICstCj4gICAuLi4vYXJtLXRydXN0ZWQtZmlybXdhcmUuaGFzaCAg
ICAgICAgICAgICAgICAgfCAgMiArCj4gICAuLi4vcGF0Y2hlcy9saW51eC1oZWFkZXJzL2xpbnV4
LWhlYWRlcnMuaGFzaCAgfCAgMSArCj4gICBib2FyZC90aS9hbTY0eC1zay9wYXRjaGVzL2xpbnV4
L2xpbnV4Lmhhc2ggICAgfCAgMiArCj4gICAuLi4vdGktazMtcjUtbG9hZGVyL3RpLWszLXI1LWxv
YWRlci5oYXNoICAgICAgfCAgMSArCj4gICBib2FyZC90aS9jb21tb24vYW02eHgvcG9zdC1idWls
ZC5zaCAgICAgICAgICAgfCA1OCArKysrKysrKysrKysrKwo+ICAgYm9vdC9Db25maWcuaW4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgLQo+ICAgYm9vdC90aS1rMy1pbWFnZS1n
ZW4vQ29uZmlnLmluICAgICAgICAgICAgICAgIHwgNzcgLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAg
Ym9vdC90aS1rMy1pbWFnZS1nZW4vdGktazMtaW1hZ2UtZ2VuLmhhc2ggICAgIHwgIDMgLQo+ICAg
Ym9vdC90aS1rMy1pbWFnZS1nZW4vdGktazMtaW1hZ2UtZ2VuLm1rICAgICAgIHwgNTQgLS0tLS0t
LS0tLS0tLQo+ICAgYm9vdC90aS1rMy1yNS1sb2FkZXIvQ29uZmlnLmluICAgICAgICAgICAgICAg
IHwgMzMgKysrKysrKysKPiAgIGJvb3QvdGktazMtcjUtbG9hZGVyL3RpLWszLXI1LWxvYWRlci5o
YXNoICAgICB8ICAxIC0KPiAgIGJvb3QvdGktazMtcjUtbG9hZGVyL3RpLWszLXI1LWxvYWRlci5t
ayAgICAgICB8IDQwICsrKysrKysrKy0KPiAgIGJvb3QvdWJvb3QvQ29uZmlnLmluICAgICAgICAg
ICAgICAgICAgICAgICAgICB8IDM1ICsrKysrLS0tLQo+ICAgYm9vdC91Ym9vdC91Ym9vdC5tayAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgMTIgKystCj4gICBjb25maWdzL3RpX2FtNjJ4X3Nr
X2RlZmNvbmZpZyAgICAgICAgICAgICAgICAgfCAyMSArKy0tLQo+ICAgY29uZmlncy90aV9hbTY0
eF9za19kZWZjb25maWcgICAgICAgICAgICAgICAgIHwgMjAgKysrLS0KPiAgIDI0IGZpbGVzIGNo
YW5nZWQsIDIyMSBpbnNlcnRpb25zKCspLCAxNzggZGVsZXRpb25zKC0pCj4gICBjcmVhdGUgbW9k
ZSAxMDA2NDQgYm9hcmQvdGkvYW02Mngtc2svcGF0Y2hlcy9hcm0tdHJ1c3RlZC1maXJtd2FyZS9h
cm0tdHJ1c3RlZC1maXJtd2FyZS5oYXNoCj4gICBjcmVhdGUgbW9kZSAxMjAwMDAgYm9hcmQvdGkv
YW02Mngtc2svcGF0Y2hlcy9saW51eC1oZWFkZXJzL2xpbnV4LWhlYWRlcnMuaGFzaAo+ICAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IGJvYXJkL3RpL2FtNjJ4LXNrL3BhdGNoZXMvbGludXgvbGludXguaGFz
aAo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGJvYXJkL3RpL2FtNjJ4LXNrL3BhdGNoZXMvdGktazMt
cjUtbG9hZGVyL3RpLWszLXI1LWxvYWRlci5oYXNoCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgYm9h
cmQvdGkvYW02NHgtc2svcGF0Y2hlcy9hcm0tdHJ1c3RlZC1maXJtd2FyZS9hcm0tdHJ1c3RlZC1m
aXJtd2FyZS5oYXNoCj4gICBjcmVhdGUgbW9kZSAxMjAwMDAgYm9hcmQvdGkvYW02NHgtc2svcGF0
Y2hlcy9saW51eC1oZWFkZXJzL2xpbnV4LWhlYWRlcnMuaGFzaAo+ICAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGJvYXJkL3RpL2FtNjR4LXNrL3BhdGNoZXMvbGludXgvbGludXguaGFzaAo+ICAgY3JlYXRl
IG1vZGUgMTAwNjQ0IGJvYXJkL3RpL2FtNjR4LXNrL3BhdGNoZXMvdGktazMtcjUtbG9hZGVyL3Rp
LWszLXI1LWxvYWRlci5oYXNoCj4gICBjcmVhdGUgbW9kZSAxMDA3NTUgYm9hcmQvdGkvY29tbW9u
L2FtNnh4L3Bvc3QtYnVpbGQuc2gKPiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBib290L3RpLWszLWlt
YWdlLWdlbi9Db25maWcuaW4KPiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBib290L3RpLWszLWltYWdl
LWdlbi90aS1rMy1pbWFnZS1nZW4uaGFzaAo+ICAgZGVsZXRlIG1vZGUgMTAwNjQ0IGJvb3QvdGkt
azMtaW1hZ2UtZ2VuL3RpLWszLWltYWdlLWdlbi5tawo+IAo+IC0tCj4gMi40NC4wCj4gCj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3Qg
bWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
