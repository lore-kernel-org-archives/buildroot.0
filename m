Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E4E3E77188
	for <buildroot@archiver.kernel.org>; Fri, 10 Jan 2025 14:19:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A665460B33;
	Fri, 10 Jan 2025 14:19:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MuEXR1EMjflc; Fri, 10 Jan 2025 14:19:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96EA860B70
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96EA860B70;
	Fri, 10 Jan 2025 14:19:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C6EE942
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 14:19:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D82F837BC
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 14:19:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yWFOZEd3nqvz for <buildroot@buildroot.org>;
 Fri, 10 Jan 2025 14:19:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::92b; helo=mail-ua1-x92b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E73BE834DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E73BE834DE
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com
 [IPv6:2607:f8b0:4864:20::92b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E73BE834DE
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 14:19:22 +0000 (UTC)
Received: by mail-ua1-x92b.google.com with SMTP id
 a1e0cc1a2514c-85b88a685e6so860399241.2
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 06:19:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736518761; x=1737123561;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ieiS3vQhkc1O+lmVwU7xgxn1MqDoavqqsCUXnrANxiU=;
 b=reUT5zjYoQsng+45WBQaz2x4t+pDo1+XsEsY1YXpoWZivkJUd0u1Wf2Ij34wwQqkoD
 mb3GzCxEfP/KOqK55U1I/3UvG2PLdGmx+NO3PF1tcL/rtkN+yaOHQ49a2mHuRsiI7nns
 1x3dCZroBMYB4/WsLcptz6YeVBrQPa2FN3dWQIxxhU30K1O4vej26YZ054dZR0u8QdiI
 EdeilR0yfMacmmyD9hSTCYHONbbheqTDMsfJUn1+qvBANBSlSsGZ08vr915Q55Gjf+T4
 B2zPPxeelBjfJTjCBWyMHtDiKZhB7YSSV4BfAR49ugL5qAVMmWAg0sGf/lwFo7BdcIlc
 hfMQ==
X-Gm-Message-State: AOJu0YwEOyZztfnDPb2RIJIqx1T1V/KGNu81k4qdxSj2hPB/ESvNAjcm
 JOvaAkQ8NFhxyE0gZkKFMnnxigpvsX68UiUI1qT8j3o29Yw0urc6gp/MuO1cRifadRk2kngf0Tx
 OgHL76dcVc0zLJ9Q6/s1qzyDpkkADXtcnYgS5FA==
X-Gm-Gg: ASbGnctXlEOdbW/yMTjt0FzH7svN1zmcknrcpY46dcYsrQP0szdXM0YFlma/DXqcFzw
 aIcNZQcguuwN6ca6bU5dwAF8xPJaItriL0Q18
X-Google-Smtp-Source: AGHT+IH65hwUuwK5LiC09RlS8iiVGsJbQbllu2MGrye/FmzR6iPTaxQjjZgkz9GFPpWrXS9YpwXdwVoreCKQcKjUKOw=
X-Received: by 2002:a05:6122:8f05:b0:518:7ab7:afa9 with SMTP id
 71dfb90a1353d-51c6c3530fcmr9555507e0c.10.1736518761181; Fri, 10 Jan 2025
 06:19:21 -0800 (PST)
MIME-Version: 1.0
References: <20250109214158.2413259-1-james.hilliard1@gmail.com>
 <11ccf477-c020-4d14-9c1e-a1c2d493805e@bubu1.eu>
In-Reply-To: <11ccf477-c020-4d14-9c1e-a1c2d493805e@bubu1.eu>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 10 Jan 2025 16:19:10 +0200
X-Gm-Features: AbW1kvYbPaOYzdsp0Tl-PYaDzSCh8_VlpENMe-xFat5n3fa5pqUxxuDYcxlUHU4
Message-ID: <CADvTj4qAm3J2dCr=Kgb=gbUVBA1YqrWifWTgfSNJzrmL1wEMmw@mail.gmail.com>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, Marcus Hoffmann <bubu@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736518761; x=1737123561; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ieiS3vQhkc1O+lmVwU7xgxn1MqDoavqqsCUXnrANxiU=;
 b=h2pdOupX2Duaa9+JbCGCB7FOJGWTwdQ0bqJq6KtK0zdE7a23eeUv7kBpeAfe961GZo
 VuKj6x5APIpmqdTB6UQnpZ0J+2Xze4KXOBT6wtP1SVuXValGHmt1wYuervimYLbpiy4N
 Xihpg710JwyvtBGB9LAZkomuztUlUKtDNx611SOu9V9L/SOBHyGjKeY3+QtLzqcUHqm7
 6WImnBvRQKA9JmzobhD9te4K/6x08PUtayGF1Hpn70JdtA8u/bddgSCRzJFjRH6X2JEz
 zhhxuZukaE5AQ9td6V8I0GiPXS0PNM3cJDdp4XMt0ZjD2eBZ9Og+/YsUULKueSmf3l55
 2C/w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=h2pdOupX
Subject: Re: [Buildroot] [PATCH 1/1] package/python-jc: bump to version
 1.25.4
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

T24gRnJpLCBKYW4gMTAsIDIwMjUgYXQgMTI6MzbigK9QTSBNYXJjdXMgSG9mZm1hbm4gPGJ1aWxk
cm9vdEBidWJ1MS5ldT4gd3JvdGU6Cj4KPiBIaSBKYW1lcywKPgo+IE9uIDA5LjAxLjI1IDIyOjQx
LCBKYW1lcyBIaWxsaWFyZCB3cm90ZToKPiA+IEFkZCBuZXcgcHl0aG9uLXB5Z21lbnRzIHJ1bnRp
bWUgZGVwZW5kZW5jeS4KPiA+Cj4gPiBBZGQgbmV3IHB5dGhvbi1ydWFtZWwteWFtbCBydW50aW1l
IGRlcGVuZGVuY3kuCj4gPgo+ID4gQWRkIG5ldyBweXRob24teG1sdG9kaWN0IHJ1bnRpbWUgZGVw
ZW5kZW5jeS4KPgo+IEFsbCBvZiB0aGVzZSBhcmUgY29uc2lkZXJlZCBvcHRpb25hbCBkZXBlbmRl
bmNpZXMuWzFdWzJdIEl0J3Mgc3VwcG9ydGVkCj4gdG8gdXNlIHRoaXMgcGFja2FnZSB3aXRob3V0
IHRoZXNlIGRlcGVuZGVuY2llcywgc29tZSBmdW5jdGlvbmFsaXR5IHdpbGwKPiBub3QgYmUgc3Vw
cG9ydGVkIHRoZW4uIFdlIGFsc28gaGF2ZSBhIGJ1aWxkcm9vdCB0ZXN0IHRoYXQgdmVyaWZpZXMg
dGhhdAo+IHRoaXMgd29ya3MuCgpZZWFoLCBsb29rcyBsaWtlIHRoZXkgYXJlbid0IGZsYWdnZWQg
YXMgb3B0aW9uYWwgaGVyZSB3aGljaCBpcyB3aHkgSSBhc3N1bWVkCnRoZXkgd2VyZSByZXF1aXJl
ZDoKaHR0cHM6Ly9naXRodWIuY29tL2tlbGx5am9uYnJhemlsL2pjL2Jsb2IvdjEuMjUuNC9zZXR1
cC5weSNMMTItTDE2CgpSZW1vdmVkIHRoZSBkZXBzIGluIHYyOgpodHRwczovL3BhdGNod29yay5v
emxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjUwMTEwMTQxNzE3LjI0MzQ5Mzct
MS1qYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tLwoKPgo+IFsxXSBodHRwczovL2dpdGh1Yi5jb20v
a2VsbHlqb25icmF6aWwvamMvcmVsZWFzZXMvdGFnL3YxLjI1LjEKPiBbMl0gaHR0cHM6Ly9naXRo
dWIuY29tL2tlbGx5am9uYnJhemlsL2pjL2lzc3Vlcy81MzcKPgo+IE1hcmN1cwo+Cj4gPgo+ID4g
U2lnbmVkLW9mZi1ieTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+
Cj4gPiAtLS0KPiA+ICAgcGFja2FnZS9weXRob24tamMvQ29uZmlnLmluICAgICAgfCAzICsrKwo+
ID4gICBwYWNrYWdlL3B5dGhvbi1qYy9weXRob24tamMuaGFzaCB8IDQgKystLQo+ID4gICBwYWNr
YWdlL3B5dGhvbi1qYy9weXRob24tamMubWsgICB8IDQgKystLQo+ID4gICAzIGZpbGVzIGNoYW5n
ZWQsIDcgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS9weXRob24tamMvQ29uZmlnLmluIGIvcGFja2FnZS9weXRob24tamMvQ29uZmlnLmlu
Cj4gPiBpbmRleCBiODgxNTBlMDY5Li4xOTMzZGIyNTNiIDEwMDY0NAo+ID4gLS0tIGEvcGFja2Fn
ZS9weXRob24tamMvQ29uZmlnLmluCj4gPiArKysgYi9wYWNrYWdlL3B5dGhvbi1qYy9Db25maWcu
aW4KPiA+IEBAIC0xLDUgKzEsOCBAQAo+ID4gICBjb25maWcgQlIyX1BBQ0tBR0VfUFlUSE9OX0pD
Cj4gPiAgICAgICBib29sICJweXRob24tamMiCj4gPiArICAgICBzZWxlY3QgQlIyX1BBQ0tBR0Vf
UFlUSE9OX1BZR01FTlRTICMgcnVudGltZQo+ID4gKyAgICAgc2VsZWN0IEJSMl9QQUNLQUdFX1BZ
VEhPTl9SVUFNRUxfWUFNTCAjIHJ1bnRpbWUKPiA+ICsgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9Q
WVRIT05fWE1MVE9ESUNUICMgcnVudGltZQo+ID4gICAgICAgaGVscAo+ID4gICAgICAgICBDb252
ZXJ0cyB0aGUgb3V0cHV0IG9mIHBvcHVsYXIgY29tbWFuZC1saW5lIHRvb2xzIGFuZCBmaWxlLQo+
ID4gICAgICAgICB0eXBlcyB0byBKU09OLgo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9u
LWpjL3B5dGhvbi1qYy5oYXNoIGIvcGFja2FnZS9weXRob24tamMvcHl0aG9uLWpjLmhhc2gKPiA+
IGluZGV4IDc1ZDY0ZGE3YmYuLmQ4ZWU5MThhYzcgMTAwNjQ0Cj4gPiAtLS0gYS9wYWNrYWdlL3B5
dGhvbi1qYy9weXRob24tamMuaGFzaAo+ID4gKysrIGIvcGFja2FnZS9weXRob24tamMvcHl0aG9u
LWpjLmhhc2gKPiA+IEBAIC0xLDUgKzEsNSBAQAo+ID4gICAjIG1kNSwgc2hhMjU2IGZyb20gaHR0
cHM6Ly9weXBpLm9yZy9weXBpL2pjL2pzb24KPiA+IC1tZDUgIDdlOTQ1NGUwMWVhZmE3YzhjNmU0
MTVmZGRjN2QyNjM4ICBqYy0xLjI1LjMudGFyLmd6Cj4gPiAtc2hhMjU2ICBmYTMxNDBjZWRhNmNi
YTEyMTBkMTM2MmYzNjNjZDc5YTA1MTQ3NDFlOGExZGQ2MTY3ZGIyYjJlMmQ1ZjI0ZjdiICBqYy0x
LjI1LjMudGFyLmd6Cj4gPiArbWQ1ICA3N2U3OThmMmMzZmJlODljMGRiZjdiMzFkYzM1ZmM2OSAg
amMtMS4yNS40LnRhci5nego+ID4gK3NoYTI1NiAgYTMyZWFmMDI5YzU2YjU4MmRhZGFlNDg4OTVm
MjA3ODRkMGY4NGYyZmEyOGE4ZTJiMzJmMzc3YThiZmZhOGIzOSAgamMtMS4yNS40LnRhci5nego+
ID4gICAjIExvY2FsbHkgY29tcHV0ZWQgc2hhMjU2IGNoZWNrc3Vtcwo+ID4gICBzaGEyNTYgIDY0
OTNmMmRiNDAwZjQxNjZjYTA5NTZjZjE5MmE0MWFhMDkyYmQxMzk2ZmY0NjNlN2ZkYWY1MWYyNTdj
MTA0OTcgIExJQ0VOU0UubWQKPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1qYy9weXRo
b24tamMubWsgYi9wYWNrYWdlL3B5dGhvbi1qYy9weXRob24tamMubWsKPiA+IGluZGV4IDIwMjg4
NGYzZGMuLjlhMzc1NGEwZmEgMTAwNjQ0Cj4gPiAtLS0gYS9wYWNrYWdlL3B5dGhvbi1qYy9weXRo
b24tamMubWsKPiA+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLWpjL3B5dGhvbi1qYy5tawo+ID4gQEAg
LTQsOSArNCw5IEBACj4gPiAgICMKPiA+ICAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiA+Cj4g
PiAtUFlUSE9OX0pDX1ZFUlNJT04gPSAxLjI1LjMKPiA+ICtQWVRIT05fSkNfVkVSU0lPTiA9IDEu
MjUuNAo+ID4gICBQWVRIT05fSkNfU09VUkNFID0gamMtJChQWVRIT05fSkNfVkVSU0lPTikudGFy
Lmd6Cj4gPiAtUFlUSE9OX0pDX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcv
cGFja2FnZXMvYTUvODIvYmZiMWVjN2Q5NjY3YmMyZjkyMjI1NGJjNjJlMTJmZDQ2MGE1ZGUzYjcx
MTUxOGY1MDg5ZGYwYTE3MTgwCj4gPiArUFlUSE9OX0pDX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5
dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvNWIvODIvMTQ2ZWY0Yzk0Mjk3ZWY4N2M2YTczMmM5MmRk
NTc3NjFiZWEyYzIxNzllMWI4Y2E4YTZiOWI4ZGQ2ZmY3Cj4gPiAgIFBZVEhPTl9KQ19TRVRVUF9U
WVBFID0gc2V0dXB0b29scwo+ID4gICBQWVRIT05fSkNfTElDRU5TRSA9IE1JVCwgQlNELTMtQ2xh
dXNlIChidW5kbGVkIHBiUGxpc3QpCj4gPiAgIFBZVEhPTl9KQ19MSUNFTlNFX0ZJTEVTID0gTElD
RU5TRS5tZAo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
