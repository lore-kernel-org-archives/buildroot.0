Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F304EE4987
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 09:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36E1440D87;
	Wed, 11 Sep 2024 09:44:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OjCUZTH9_3IA; Wed, 11 Sep 2024 09:44:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8D9941260
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8D9941260;
	Wed, 11 Sep 2024 09:44:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 346BB1BF3E5
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 09:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 22AED4038B
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 09:44:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mg3nesQ0cm6a for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 09:44:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 274C7400F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 274C7400F6
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 274C7400F6
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 09:44:15 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-535dc4ec181so6260252e87.3
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 02:44:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726047853; x=1726652653;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YTwNsHc4ooh2vIJUUMOeXnUBbcefVyvK+brQsdWKT58=;
 b=xCYnuGeKuLVmLZrNyHw1sAu/cuQQwpoEZgGUxCJjXlBQ6tEBkZDESYR1Iyv/YGTsNl
 0+0C1dmayrgan4Oinr7GXDHsAHKEe+tzfOGcS3cXFfZJL2yeRd7LcEUBEVy56g88Emf7
 RIBEYi+spBsGNJQ+4r8YaPh8HLqb9iXDGZQmKtxg60SyoQDogSy5zIpoxnhNoMv/2HA7
 ClHUG2wXZfTpsmph3Std7wLYdwC79n27r36Hg1yLXY+wIRFCTbRFveNwN/gU1htU9yRK
 K+hQukDWvDV6cMzzWCGtLQzU8iuTtZnPZXNvOnZpihpKkFn0d4WzcCWRdls7DPrXeyvv
 V2Rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGtTA7TMwMo3a2LXi7bNU6WC+v72UkF7WBoBbOTZz1Wm+AYh/lMk3VKkqZDpIiMeoyKR9we1RnBfc=@buildroot.org
X-Gm-Message-State: AOJu0Yz8FoT1007yY5tjZMAzzNmZ3/jlXbWDNfaI/cv1mFdB/FL+Qg1H
 mww9+n5xlKSD/8TlKtQ4Py1/Gcqpa31ThxICDVJPo7WoeUd2lCruxpSE2WaWCIc=
X-Google-Smtp-Source: AGHT+IFPXDBjTSyDqO9Z5144gIOW9xwMI0Cp56F6k/shwTEEDDncpJbojnsfUuzVJfWAi3NSjemntw==
X-Received: by 2002:a05:6512:b25:b0:52f:159:2dc5 with SMTP id
 2adb3069b0e04-536587fc053mr8228891e87.42.1726047853086; 
 Wed, 11 Sep 2024 02:44:13 -0700 (PDT)
Received: from [10.5.90.17]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5365f914008sm1520675e87.304.2024.09.11.02.44.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2024 02:44:12 -0700 (PDT)
Message-ID: <93c0a59a-f9b7-4dfb-92cc-d381f6aae6e5@smile.fr>
Date: Wed, 11 Sep 2024 11:44:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Waldemar Brodkorb <wbx@openadk.org>, buildroot@buildroot.org
References: <ZuFeS3LE0/MttrzN@waldemar-brodkorb.de>
Content-Language: fr
In-Reply-To: <ZuFeS3LE0/MttrzN@waldemar-brodkorb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1726047853; x=1726652653; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YTwNsHc4ooh2vIJUUMOeXnUBbcefVyvK+brQsdWKT58=;
 b=W1CpGbzZJGXORqk03hjWSQez91vtGuJwUmJgRCcfU4PDdD+oaNa7D9NxRonzxNT5q3
 BJKbdjyoAJblCKDf+j4k0DyYDx4XElme/TaF98Dn0gQczMK2Ab8PurkOHunrgks0uzrK
 tUt4cygiB/1il8sPmrZSpQtqrofNsKhdreRdc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=W1CpGbzZ
Subject: Re: [Buildroot] [PATCH] package/qemu: update to 9.1.0
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gV2FsZGVtYXIsCgpMZSAxMS8wOS8yMDI0IMOgIDExOjA5LCBXYWxkZW1hciBCcm9ka29y
YiBhIMOpY3JpdMKgOgo+IFNlZSBoZXJlIGZvciBjaGFuZ2VzOgo+IGh0dHBzOi8vd2lraS5xZW11
Lm9yZy9DaGFuZ2VMb2cvOS4xCj4gCj4gVGhlIHN1cHBvcnQgZm9yIHRoZSBuaW9zMiBhcmNoaXRl
Y3R1cmUgZ290IHJlbW92ZWQuCgpXZSBuZWVkIHRvIHJlbW92ZSBob3N0LXFlbXUgZnJvbSB0aGUg
cWVtdV9uaW9zMl8xMG01MF9kZWZjb25maWcgb3Igc2ltcGx5IHJlbW92ZQp0aGlzIGRlZmNvbmZp
ZyBzaW5jZSB0aGUgcWVtdSBzdXBwb3J0IGlzIGdvbmUuCgpBYm91dCBxZW11IHBhY2thZ2UsIGl0
IHNlZW1zIHRoYXQgdGhlIHFlbXVfYWFyY2g2NF9zYnNhX2RlZmNvbmZpZyBkb2Vzbid0IGJvb3QK
YW55bW9yZSBbMV0gc2luY2UgdGhlIHFlbXUgdmVyc2lvbiBidW1wIDkuMCBbMl0uCgpbMV0KaHR0
cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icz9uYW1lPXFlbXVf
YWFyY2g2NF9zYnNhX2RlZmNvbmZpZysKClsyXQpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290
Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvMTAzYTU1MDI4Yzc1ZGFjZTMxMjQ3MGJhMDVhMTk3ODg2
YzZiNjEwMAoKSXQgc2VlbXMgdGhpcyBkZWZjb25maWcgbmVlZHMgYW4gQVRGL0VESzIgdXBkYXRl
IHRvIGJvb3Qgd2l0aCBxZW11ID49IDkuMC4KCkNhbiB5b3UgaGF2ZSBhIGxvb2s/CgpCZXN0IHJl
Z2FyZHMsClJvbWFpbgoKCj4gCj4gU2lnbmVkLW9mZi1ieTogV2FsZGVtYXIgQnJvZGtvcmIgPHdi
eEBvcGVuYWRrLm9yZz4KPiAtLS0KPiAgcGFja2FnZS9xZW11L0NvbmZpZy5pbiAgICAgIHwgNSAt
LS0tLQo+ICBwYWNrYWdlL3FlbXUvQ29uZmlnLmluLmhvc3QgfCAxIC0KPiAgcGFja2FnZS9xZW11
L3FlbXUuaGFzaCAgICAgIHwgMiArLQo+ICBwYWNrYWdlL3FlbXUvcWVtdS5tayAgICAgICAgfCAy
ICstCj4gIDQgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+
IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3FlbXUvQ29uZmlnLmluIGIvcGFja2FnZS9xZW11L0Nv
bmZpZy5pbgo+IGluZGV4IDYwOGU0ZDQyOWQuLjJkMTVhYjFlYTkgMTAwNjQ0Cj4gLS0tIGEvcGFj
a2FnZS9xZW11L0NvbmZpZy5pbgo+ICsrKyBiL3BhY2thZ2UvcWVtdS9Db25maWcuaW4KPiBAQCAt
MjUyLDExICsyNTIsNiBAQCBjb25maWcgQlIyX1BBQ0tBR0VfUUVNVV9UQVJHRVRfTUlQU04zMkVM
Cj4gIAloZWxwCj4gIAkgIE1JUFMgTjMyIGFyY2hpdGVjdHVyZSwgbGl0dGxlLWVuZGlhbi4KPiAg
Cj4gLWNvbmZpZyBCUjJfUEFDS0FHRV9RRU1VX1RBUkdFVF9OSU9TMgo+IC0JYm9vbCAibmlvczIi
Cj4gLQloZWxwCj4gLQkgIE5pb3MgSUkgYXJjaGl0ZWN0dXJlLgo+IC0KPiAgY29uZmlnIEJSMl9Q
QUNLQUdFX1FFTVVfVEFSR0VUX09SMUsKPiAgCWJvb2wgIm9yMWsiCj4gIAlzZWxlY3QgQlIyX1BB
Q0tBR0VfUUVNVV9GRFQgaWYgQlIyX1BBQ0tBR0VfUUVNVV9TWVNURU0KPiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS9xZW11L0NvbmZpZy5pbi5ob3N0IGIvcGFja2FnZS9xZW11L0NvbmZpZy5pbi5ob3N0
Cj4gaW5kZXggOGRkMGM3ZDExYi4uNGRiMTE0NDkwYSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3Fl
bXUvQ29uZmlnLmluLmhvc3QKPiArKysgYi9wYWNrYWdlL3FlbXUvQ29uZmlnLmluLmhvc3QKPiBA
QCAtOSw3ICs5LDYgQEAgY29uZmlnIEJSMl9QQUNLQUdFX0hPU1RfUUVNVV9BUkNIX1NVUFBPUlRT
Cj4gIAlkZWZhdWx0IHkgaWYgQlIyX21pY3JvYmxhemViZQo+ICAJZGVmYXVsdCB5IGlmIEJSMl9t
aXBzCj4gIAlkZWZhdWx0IHkgaWYgQlIyX21pcHNlbAo+IC0JZGVmYXVsdCB5IGlmIEJSMl9uaW9z
Mgo+ICAJZGVmYXVsdCB5IGlmIEJSMl9vcjFrCj4gIAlkZWZhdWx0IHkgaWYgQlIyX3Bvd2VycGMK
PiAgCWRlZmF1bHQgeSBpZiBCUjJfcG93ZXJwYzY0Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcWVt
dS9xZW11Lmhhc2ggYi9wYWNrYWdlL3FlbXUvcWVtdS5oYXNoCj4gaW5kZXggNDE5ZGQwZDFiMy4u
MTY5ZmUwNTA2OCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3FlbXUvcWVtdS5oYXNoCj4gKysrIGIv
cGFja2FnZS9xZW11L3FlbXUuaGFzaAo+IEBAIC0xLDQgKzEsNCBAQAo+ICAjIExvY2FsbHkgY29t
cHV0ZWQsIHRhcmJhbGwgdmVyaWZpZWQgd2l0aCBHUEcgc2lnbmF0dXJlCj4gLXNoYTI1NiAgYThj
M2Y1OTZhZWNlOTZkYTNiMDBjYWZiNzRiYWFmYTBkMTQ1MTVlYWZiOGVkMWVlM2Y3ZjVjMmQwZWJm
MDJiNiAgcWVtdS05LjAuMi50YXIueHoKPiArc2hhMjU2ICA4MTZiNzAyMmE4YmE3YzJhYzMwZTJl
MGNmOTczZTgyNmY2YmNjODUwNTMzOTYwMzIxMmM1ZWRlOGU5NGQ3ODM0ICBxZW11LTkuMS4wLnRh
ci54ego+ICBzaGEyNTYgIDZmMDRhZTgzNjRkMDA3OWExOTJiMTQ2MzVmNGIxZGEyOTRjZTE4NzI0
YzAzNGMzOWE2YTQxZDFiMDlkZjYxMDAgIENPUFlJTkcKPiAgc2hhMjU2ICBkYzYyNjUyMGRjZDUz
YTIyZjcyN2FmM2VlNDJjNzcwZTU2Yzk3YTY0ZmUzYWRiMDYzNzk5ZDhhYjAzMmZlNTUxICBDT1BZ
SU5HLkxJQgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3FlbXUvcWVtdS5tayBiL3BhY2thZ2UvcWVt
dS9xZW11Lm1rCj4gaW5kZXggMTZjZmYxM2QxOC4uZTlmNjUyMGQ4OSAxMDA2NDQKPiAtLS0gYS9w
YWNrYWdlL3FlbXUvcWVtdS5tawo+ICsrKyBiL3BhY2thZ2UvcWVtdS9xZW11Lm1rCj4gQEAgLTYs
NyArNiw3IEBACj4gIAo+ICAjIFdoZW4gdXBkYXRpbmcgdGhlIHZlcnNpb24sIGNoZWNrIHdoZXRo
ZXIgdGhlIGxpc3Qgb2Ygc3VwcG9ydGVkIHRhcmdldHMKPiAgIyBuZWVkcyB0byBiZSB1cGRhdGVk
Lgo+IC1RRU1VX1ZFUlNJT04gPSA5LjAuMgo+ICtRRU1VX1ZFUlNJT04gPSA5LjEuMAo+ICBRRU1V
X1NPVVJDRSA9IHFlbXUtJChRRU1VX1ZFUlNJT04pLnRhci54ego+ICBRRU1VX1NJVEUgPSBodHRw
czovL2Rvd25sb2FkLnFlbXUub3JnCj4gIFFFTVVfU0VMSU5VWF9NT0RVTEVTID0gcWVtdSB2aXJ0
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
