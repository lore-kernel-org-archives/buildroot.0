Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D0AC369C2
	for <buildroot@archiver.kernel.org>; Fri, 25 Apr 2025 08:19:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20F5583CAE;
	Fri, 25 Apr 2025 08:19:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2H75DfUVFNnE; Fri, 25 Apr 2025 08:19:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAF1D83CB1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAF1D83CB1;
	Fri, 25 Apr 2025 08:19:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A2AF9127
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 08:19:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9471A434B7
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 08:19:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bgk_SOtFHdF8 for <buildroot@buildroot.org>;
 Fri, 25 Apr 2025 08:19:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.214.179;
 helo=mail-pl1-f179.google.com; envelope-from=maxime.leroys@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C2DA943657
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2DA943657
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C2DA943657
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 08:19:23 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-227d6b530d8so21567555ad.3
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 01:19:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745569163; x=1746173963;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3usW6Y7H1zFWNvR+ziYfz+hczHSeYnHcxzcYIEEiL/Q=;
 b=L/wAXiuvBhNOi2i0j7HtZI5l9g1jSFWvjKoMy1Mw+auUAQ9eePXSx40yzWrHfTVqsq
 vh9g6EuQKAvGy0ajSC6yab6oea03EGvT/NTWpAVC/61zj7bB5in/4GFwp1e2/+zdMAVb
 byL3qfrZxQRnA/qpGWn1zyQYs4eQsMHLfNKalXWu0FYGPDv46vITmywfHnTBsimOYz48
 sOmzwkO75AUkHGdZ1R3D0vQbxzVhWsMCY9LgeQBVdYMSmFIbY1XYoVuFtsm5BApUbbrZ
 9x9lNd7dKj46nxPBzwumpIVyPVPl6C4E4wC73LhDu5eqGp9Fj/Sbd7lezOpK1qLAr2vX
 wRZA==
X-Gm-Message-State: AOJu0YyfNDsLZXwzI9rcv7FkOyNpYbYz3iplA7uginJkpmAiuXUXjnRx
 8kS7/ht9SwK5fFEq0M3wmcM8/aENaAAtKknrjOLQln7qmQcCATu16GKcpfM07aSAynGE4KGhO/d
 kXf9cRcdcwMLIReu5BtGBCYtF75M=
X-Gm-Gg: ASbGncuda1d4Ldav2oInQAWYUxLuj+dmDwfpBX976r22wsMRamM1GtFGFKZvBNaMwrn
 aIZXvC+e6+VdyT0KAm+DRPPooCjoDQZyQrKw55zzwYrW6HXmNmAOoqV+q5YpBsgCxvmrarqWoh0
 cpgIZhUozx3mMJrK00EfI=
X-Google-Smtp-Source: AGHT+IEZDL/kYafA5mr2a7ikApJFA/5ddHheDsUlplvm8gBdTY96TWQbe0mB0RfG0UWbCT4Rs55d6jXVEKejuqscw+o=
X-Received: by 2002:a17:903:252:b0:221:7b4a:476c with SMTP id
 d9443c01a7336-22dbf5f0015mr20870925ad.18.1745569163066; Fri, 25 Apr 2025
 01:19:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250328084743.8759-1-maxime@leroys.fr>
 <20250403153950.6407-1-maxime@leroys.fr>
 <20250403153950.6407-3-maxime@leroys.fr> <20250424235146.4ab41fce@windsurf>
In-Reply-To: <20250424235146.4ab41fce@windsurf>
From: Maxime Leroy <maxime@leroys.fr>
Date: Fri, 25 Apr 2025 10:19:12 +0200
X-Gm-Features: ATxdqUEpe7hrD6c_v4uhLpv0jC8Mdj96522K2sweINADQt654WQcgLKdNDUJy8E
Message-ID: <CAHHRULU-eMVN53TCpOxC=rXqOV731eq2iXWn5g0wGUDg-FKJbg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Vincent Jardin <vjardin@free.fr>,
 Robin Jarry <robin@jarry.cc>, Julien Olivain <ju.o@free.fr>
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
Subject: Re: [Buildroot] [PATCH v4 2/3] package/grout: new package
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

SGVsbG8gVGhvbWFzLAoKVGhhbmtzIGZvciB0aGUgcmV2aWV3IGFuZCB0aGUgbW9kaWZpY2F0aW9u
cy4KCkxlIGpldS4gMjQgYXZyLiAyMDI1IMOgIDIzOjUxLCBUaG9tYXMgUGV0YXp6b25pCjx0aG9t
YXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiBhIMOpY3JpdCA6Cj4KPiBIZWxsbyBNYXhpbWUsCj4K
PiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghIEkgaGF2ZSBhcHBsaWVkIGl0LCBhZnRlciBkb2luZyBh
IG51bWJlciBvZgo+IGNoYW5nZXMsIHNlZSBiZWxvdy4KPgo+IE9uIFRodSwgIDMgQXByIDIwMjUg
MTc6Mzk6NDkgKzAyMDAKPiBNYXhpbWUgTGVyb3kgPG1heGltZUBsZXJveXMuZnI+IHdyb3RlOgo+
Cj4gPiBkaWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKPiA+IGluZGV4IDFjODRm
OTU5NDMuLjFjYmJmODI5YzUgMTAwNjQ0Cj4gPiAtLS0gYS9ERVZFTE9QRVJTCj4gPiArKysgYi9E
RVZFTE9QRVJTCj4gPiBAQCAtMjM4NCw2ICsyMzg0LDkgQEAgRjogICAgICBwYWNrYWdlL2xpYnRy
YWNlZXZlbnQvCj4gPiAgRjogICBwYWNrYWdlL2xpYnRyYWNlZnMKPiA+ICBGOiAgIHBhY2thZ2Uv
bGludXgtdG9vbHMvbGludXgtdG9vbC1ydGxhLm1rLmluCj4gPgo+ID4gK046ICAgTWF4aW1lIExl
cm95IDxtYXhpbWVAbGVyb3lzLmZyPgo+ID4gK0Y6ICAgcGFja2FnZS9ncm91dAo+Cj4gICAgICAg
ICAgICAgICAgICAgICAgXl4gTml0OiBtaXNzaW5nIGZpbmFsIHNsYXNoLgo+Cj4KPiA+IGRpZmYg
LS1naXQgYS9wYWNrYWdlL2dyb3V0L0NvbmZpZy5pbiBiL3BhY2thZ2UvZ3JvdXQvQ29uZmlnLmlu
Cj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMC4uYTM5YzMyODNl
Ygo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvcGFja2FnZS9ncm91dC9Db25maWcuaW4KPiA+
IEBAIC0wLDAgKzEsMTMgQEAKPiA+ICtjb25maWcgQlIyX1BBQ0tBR0VfR1JPVVQKPiA+ICsgICAg
IGJvb2wgImdyb3V0Igo+ID4gKyAgICAgZGVwZW5kcyBvbiBCUjJfRU5BQkxFX0xPQ0FMRQo+Cj4g
SSByZWFsbHkgd2Fzbid0IHN1cmUgYWJvdXQgdGhpcyBkZXBlbmRlbmN5LCBiZWNhdXNlIHRoYXQg
ZG9lc24ndAo+IGd1YXJhbnRlZSB5b3UgdGhhdCBhIFVURi04IGxvY2FsZSBpcyBwcmVzZW50LCBv
bmx5IHRoYXQgdGhlIHRvb2xjaGFpbgo+IGhhcyBsb2NhbGUgc3VwcG9ydCwgd2hpY2ggaXMgZGlm
ZmVyZW50LiBTbyBJIGRyb3BwZWQgdGhpcyBkZXBlbmRlbmN5LgoKR3JvdXQgbmVlZHMgdG8gaGF2
ZSBVVEYtOCBsb2NhbCBwcmVzZW50IHRvIHJ1biwgZWxzZSBpdCBkb2Vzbid0IHByb3Blcmx5IHN0
YXJ0LgoKPgo+IEhvd2V2ZXIsIHlvdSBoYWQgZm9yZ290dGVuIHRvIHJlcGxpY2F0ZSB0aGUgZGVw
ZW5kZW5jaWVzIG9mIHRoZSBvcHRpb25zCj4geW91IHNlbGVjdCwgc28gSSBoYWQgdG8gYWRkOgo+
Cj4gKyAgICAgICBkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0RQREtfQVJDSF9TVVBQT1JUUyAjIGRw
ZGsKPiArICAgICAgIGRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFEUyAjIGRwZGsK
PiArICAgICAgIGRlcGVuZHMgb24gQlIyX1VTRV9NTVUgIyBkcGRrLCBudW1hY3RsLCBsaWJlY29s
aSwgdXRpbC1saW51eC1zbWFydGNvbHMsIGxpYmNhcAo+ICsgICAgICAgZGVwZW5kcyBvbiBCUjJf
VE9PTENIQUlOX0dDQ19BVF9MRUFTVF80XzkgIyBkcGRrCj4gKyAgICAgICBkZXBlbmRzIG9uIEJS
Ml9UT09MQ0hBSU5fSEVBREVSU19BVF9MRUFTVF80XzE5ICMgZHBkawo+ICsgICAgICAgZGVwZW5k
cyBvbiBCUjJfVE9PTENIQUlOX1VTRVNfR0xJQkMgIyBkcGRrCj4gKyAgICAgICBkZXBlbmRzIG9u
IEJSMl9UT09MQ0hBSU5fSEFTX0FUT01JQyAjIG51bWFjdGwKPiArICAgICAgIGRlcGVuZHMgb24g
IUJSMl9TVEFUSUNfTElCUyAjIGxpYmVjb2xpCj4gKyAgICAgICBkZXBlbmRzIG9uIEJSMl9VU0Vf
V0NIQVIgIyBsaWJlY29saQoKVGhhbmtzLiBJIGFtIG5vdCB2ZXJ5IGZhbWlsaWFyIGFib3V0IGRl
cGVuZGVuY2llcyB3aXRoIGJ1aWxkcm9vdC4KSSB3YXMgcGxhbm5pbmcgdG8gY2hhbmdlICdzZWxl
Y3Qgb24nIHRvIGRlcGVuZHMgb24gJ0RQREsnIG9uIGEgVjQgc2VyaWUuCgpJIHRob3VnaHQgaGF2
aW5nIGEgZGVwZW5kZW5jaWVzIHdpdGggRFBESywgd2lsbCBiZSBlbm91Z2ggdG8gaW5oZXJpdApv
ZiB0aGlzIG9uZS4KSWYgSSB1bmRlcnN0YW5kIHdlbGwsIHRoZXNlIG9uZXMgc2hvdWxkIGJlIHJl
cGxpY2F0ZWQuCgo+Cj4gPiArICAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfRFBESwo+ID4gKyAgICAg
c2VsZWN0IEJSMl9QQUNLQUdFX0xJQkVWRU5UCj4gPiArICAgICBzZWxlY3QgQlIyX1BBQ0tBR0Vf
TlVNQUNUTAo+ID4gKyAgICAgc2VsZWN0IEJSMl9QQUNLQUdFX0xJQkVDT0xJCj4gPiArICAgICBz
ZWxlY3QgQlIyX1BBQ0tBR0VfVVRJTF9MSU5VWAo+ID4gKyAgICAgc2VsZWN0IEJSMl9QQUNLQUdF
X1VUSUxfTElOVVhfTElCU01BUlRDT0xTCj4KPiBsaWJjYXAgd2FzIG1pc3NpbmcgaGVyZSwgaXQg
aXMgcmVxdWlyZWQgYnkgZ3JvdXQsIHNvIEkgYWRkZWQ6Cj4KPiArICAgICAgIHNlbGVjdCBCUjJf
UEFDS0FHRV9MSUJDQVAKPgoKSW4gZmFjdCwgbGliY2FwIGRlcGVuZGVuY2llcyB3YXMgaW50cm9k
dWNlZCB3aXRoIGdyb3V0IDkuMSByZWxlYXNlZC4KSXQgd2FzIG5vdCBuZWVkZWQgZm9yIGdyb3V0
IDkuMC4gVGhhbmtzIGZvciB0aGUgdXBncmFkZS4KCgo+IChhdCB0aGUgcHJvcGVyIGxvY2F0aW9u
IHRvIHByZXNlcnZlIGFscGhhYmV0aWMgb3JkZXJpbmcpCj4KPiA+ICsgICAgIGhlbHAKPiA+ICsg
ICAgICAgR3JhcGggcm91dGVyIGJhc2VkIG9uIERQREsKPiA+ICsKPiA+ICsgICAgICAgTk9URTog
Z3JvdXQgbmVlZHMgYSB3b3JraW5nIFVURi04IGxvY2FsZSAoQlIyX0dFTkVSQVRFX0xPQ0FMRSkK
Pgo+IFRoZSBDb25maWcuaW4gY29tbWVudCBhYm91dCB0aGUgZGVwZW5kZW5jaWVzIHdhcyBtaXNz
aW5nLCBzbyBJIGFkZGVkCj4gdGhpczoKPgo+ICtjb21tZW50ICJncm91dCBuZWVkcyBhIGdsaWJj
IHRvb2xjaGFpbiB3LyBkeW5hbWljIGxpYnJhcnksIHRocmVhZHMsIHdjaGFyLCBnY2MgPj0gNC45
LCBoZWFkZXJzID49IDQuMTkiCj4gKyAgICAgICBkZXBlbmRzIG9uIEJSMl9VU0VfTU1VCj4gKyAg
ICAgICBkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0RQREtfQVJDSF9TVVBQT1JUUwo+ICsgICAgICAg
ZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hBU19BVE9NSUMKPiArICAgICAgIGRlcGVuZHMgb24g
IUJSMl9UT09MQ0hBSU5fSEFTX1RIUkVBRFMgfHwgXAo+ICsgICAgICAgICAgICAgICAhQlIyX1RP
T0xDSEFJTl9VU0VTX0dMSUJDIHx8IFwKPiArICAgICAgICAgICAgICAgIUJSMl9UT09MQ0hBSU5f
R0NDX0FUX0xFQVNUXzRfOSB8fCBcCj4gKyAgICAgICAgICAgICAgICFCUjJfVE9PTENIQUlOX0hF
QURFUlNfQVRfTEVBU1RfNF8xOQo+Cj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9ncm91dC9ncm91
dC5tayBiL3BhY2thZ2UvZ3JvdXQvZ3JvdXQubWsKPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4g
PiBpbmRleCAwMDAwMDAwMDAwLi5hNzVhZjI3OTc4Cj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysg
Yi9wYWNrYWdlL2dyb3V0L2dyb3V0Lm1rCj4gPiBAQCAtMCwwICsxLDI0IEBACj4gPiArIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMKPiA+ICsjCj4gPiArIyBncm91dAo+ID4gKyMKPiA+ICsjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIwo+ID4gKwo+ID4gK0dST1VUX1ZFUlNJT04gPSAwLjkuMAo+Cj4gU2lu
Y2UgMC45LjEgd2FzIG91dCwgSSB1c2VkIHRoaXMgb25lIGluc3RlYWQuCj4KPiA+ICtHUk9VVF9T
SVRFID0gaHR0cHM6Ly9naXRodWIuY29tL0RQREsvZ3JvdXQvYXJjaGl2ZS9yZWZzL3RhZ3MKPiA+
ICtHUk9VVF9TT1VSQ0UgPSB2JChHUk9VVF9WRVJTSU9OKS50YXIuZ3oKPgo+IEkgdXNlZCB0aGUg
Z2l0aHViIG1hY3JvIGluc3RlYWQsIGJlY2F1c2UgeW91J3JlIGFueXdheSB1c2luZyB0aGUKPiBh
dXRvLWdlbmVyYXRlZCB0YXJiYWxsOgo+Cj4gK0dST1VUX1NJVEUgPSAkKGNhbGwgZ2l0aHViLERQ
REssZ3JvdXQsdiQoR1JPVVRfVkVSU0lPTikpCj4KPiA+ICtHUk9VVF9MSUNFTlNFID0gQlNELTMt
Q2xhdXNlCj4gPiArR1JPVVRfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKPiA+ICsKPiA+ICsjIEF2
b2lkIHVzaW5nIGJ1aWxkcm9vdCBjb21taXQgaGFzaAo+ID4gK0dST1VUX0NPTkZfRU5WICs9IEdS
T1VUX1ZFUlNJT049JChHUk9VVF9WRVJTSU9OKQo+ID4gKwo+ID4gK0dST1VUX0RFUEVOREVOQ0lF
UyA9IFwKPiA+ICsgICAgIGhvc3QtcGtnY29uZiBcCj4gPiArICAgICBkcGRrIFwKPgo+IEkgYWRk
ZWQgbGliY2FwIGhlcmUuCj4KPiA+ICsgICAgIGxpYmV2ZW50IFwKPiA+ICsgICAgIG51bWFjdGwg
XAo+ID4gKyAgICAgbGliZWNvbGkgXAo+ID4gKyAgICAgdXRpbC1saW51eAo+ID4gKwo+ID4gKyQo
ZXZhbCAkKG1lc29uLXBhY2thZ2UpKQo+Cj4gQXBwbGllZCB3aXRoIGFsbCB0aG9zZSBjaGFuZ2Vz
LCB0aGFua3MhCgpUaGFua3MgVGhvbWFzLgoKPgo+IFRob21hcwo+IC0tCj4gVGhvbWFzIFBldGF6
em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJu
ZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCj4gaHR0cHM6Ly9ib290bGluLmNvbQoKCgotLSAK
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpNYXhpbWUgTGVyb3kKbWF4aW1lQGxlcm95
cy5mcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
