Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12E82D3C53F
	for <buildroot@archiver.kernel.org>; Mon, 21 Oct 2024 06:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AF344029A;
	Mon, 21 Oct 2024 06:38:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 17d5L1HuohPz; Mon, 21 Oct 2024 06:38:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D45654029E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D45654029E;
	Mon, 21 Oct 2024 06:38:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 036EC71F
 for <buildroot@buildroot.org>; Mon, 21 Oct 2024 06:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D243180C2E
 for <buildroot@buildroot.org>; Mon, 21 Oct 2024 06:38:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yJnpdTsgH_bM for <buildroot@buildroot.org>;
 Mon, 21 Oct 2024 06:38:11 +0000 (UTC)
Received-SPF: Pass (sender SPF authorized) identity=helo;
 client-ip=81.169.146.219; helo=mo4-p00-ob.smtp.rzone.de;
 envelope-from=ludwig.kormann@ict42.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D02CC80C2D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D02CC80C2D
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.219])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D02CC80C2D
 for <buildroot@buildroot.org>; Mon, 21 Oct 2024 06:38:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1729492686; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=DJp9NDcaDm2ci/CiYuJ1H6TuYxRtckV76mfVuQs1YNJAYX/kbC3rWecufg2M5pbyW5
 FxUlBTYEgFHRvUkmSGpbLFi+W3aDpgg1Xyi8eN7cGVoIogmSV81SvnTuVAF+gNTkKCR2
 xdxm4+Ggp0W6RN7T7v6mE02jGXQxy3Aq+yKiccMkrc9la7x769DM9n9h85rcUZ9LNrhO
 sCH7ZY+DlqltHzooNnD5FML8gyT0iTWVmnIhpxm2AR1nuE9+PhMooj7+9KjhGqVtau/g
 7TpSaeUpgtuoyqyDw3TBpNaWqTsl9rsp0UY+IXIlvNzdk6wWvzdcBjrgON+tjOINSIEb
 5vuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1729492686;
 s=strato-dkim-0002; d=strato.com;
 h=In-Reply-To:References:Cc:To:Subject:From:Date:Message-ID:Cc:Date:
 From:Subject:Sender;
 bh=uXf91oNsbqsWemA9DdrKdwwbtECUiP0xrms0nK6qLCg=;
 b=hjID0d6xb3lOf/m8Xu0zhgkPA0jFRO+AtH0/MCSWLDlLBd9d4ZPxn++BXyEG+wqtZM
 Eow+3jGjS3MMTYbziri37T/igBAGuEYq6o/yIce06G14Cvz6gMgasOgvc9nSiEMP0SEI
 gYrhWnq2uRA+aXV15DAGoPYWzJDoYlJT+eitv9uVwlKub/SK6nY76CxKdWtkTCnsjfke
 L0LbZIWdnmRzA87Tm5CW6mAuL79DNhmmLRrfwurX6JosgL9OzMlt0s5wypa165kh7WVw
 dYPG1/IIK1OER54n8HaHKR0nj8RWQ4c0iaiEPwI4QINAro5pTokjREWPwcxBQpo7QBf/
 kPyg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
X-RZG-AUTH: ":IHkAYkmvNfSwjg/qSc4u8zZOVaURsoXe3UH2mQA0KgllCYtN8WqJZ5aMuoQuCdrfzui0vA=="
Received: from [192.168.4.213] by smtp.strato.de (RZmta 51.2.11 DYNA|AUTH)
 with ESMTPSA id ja045c09L6c6JXs
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 21 Oct 2024 08:38:06 +0200 (CEST)
Message-ID: <02e0b707-f491-45f7-93f9-7c237ec237ae@ict42.de>
Date: Mon, 21 Oct 2024 08:38:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ludwig Kormann <ludwig.kormann@ict42.de>
To: Fabio Estevam <festevam@gmail.com>
Cc: buildroot@buildroot.org, thomas.petazzoni@bootlin.com
References: <20241016124537.2645119-1-ludwig.kormann@ict42.de>
 <20241016124537.2645119-3-ludwig.kormann@ict42.de>
 <CAOMZO5Bw4WEUL9692jEd1bS6e_NRugNzaAxd96neyGiBsamxCQ@mail.gmail.com>
Content-Language: de-DE
In-Reply-To: <CAOMZO5Bw4WEUL9692jEd1bS6e_NRugNzaAxd96neyGiBsamxCQ@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1729492686; 
 s=strato-dkim-0002; d=ict42.de;
 h=In-Reply-To:References:Cc:To:Subject:From:Date:Message-ID:Cc:Date:
 From:Subject:Sender;
 bh=uXf91oNsbqsWemA9DdrKdwwbtECUiP0xrms0nK6qLCg=;
 b=GYoGHjKqG/vrQdRMwfcDZqOsChWDJDX7J8gZwbg6u4naWF0Tuh6i0pbTgRSoANProq
 6DSp3sGnkYXruYdUPNMoHPenxpoUlQahWCMrv3F8FbvVlJaIa0hafeuNeBlLf8LwWGc7
 M2crbxn7Wcs/jd44GRzijp6clqnPCxt7jlXLAcHV4bDjyZJEPUoE/G5Ab2lslT0MsTVv
 9zDodZ1rbjFX4gni4Tje4pLU1yhxCDjGZ4T3FM1cEhZo8jRylc+yKsGWzZOPPxsL5knC
 k/sLSLf+ASDJ0Q3UR0rmWkh3ZPtm8b8CFjLub3bBRAc8e/Vl+4Am77MR0qkFjjN/gcIw
 xlgw==
X-Mailman-Original-DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 t=1729492686; 
 s=strato-dkim-0003; d=ict42.de;
 h=In-Reply-To:References:Cc:To:Subject:From:Date:Message-ID:Cc:Date:
 From:Subject:Sender;
 bh=uXf91oNsbqsWemA9DdrKdwwbtECUiP0xrms0nK6qLCg=;
 b=f+VzjHxQzCve7j4NyhdWww6K4+OpT5WiecPyOh2QkTlOpslEvkb/tzNNdakh+KSPDy
 K2PTw1nnNPl9i8dxQyAw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=ict42.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=ict42.de header.i=@ict42.de
 header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=GYoGHjKq; 
 dkim=pass header.d=ict42.de header.i=@ict42.de header.a=ed25519-sha256
 header.s=strato-dkim-0003 header.b=f+VzjHxQ
Subject: Re: [Buildroot] [PATCH v2 3/3] configs/icnova-a20-adb4006: add
 uboot patch for reliable bootclk
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRmFiaW8sCgpyZXNlbmRpbmcgdGhpcyBtYWlsIGJlY2F1c2UgSSByZWNlaXZlZCBhbiBlcnJv
ciBvbiB0aGUgbGFzdCB0cmFuc21pc3Npb24gCmFuZCBpdCBhbHNvIGRvZXMgbm90IHNob3cgaW4g
dGhlIGJ1aWxkcm9vdCBtYWlsaW5nIGFyY2hpdmUuCgp0aGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3
LgoKQW0gMTYuMTAuMjQgdW0gMTY6MjEgc2NocmllYiBGYWJpbyBFc3RldmFtOgo+IEhpIEx1ZHdp
ZywKPgo+IE9uIFdlZCwgT2N0IDE2LCAyMDI0IGF0IDk6NDXigK9BTSBMdWR3aWcgS29ybWFubiAK
PiA8bHVkd2lnLmtvcm1hbm5AaWN0NDIuZGU+IHdyb3RlOgo+Cj4+ICtGcm9tIDNjZGY4YWEzZmY0
NWUzNWEyMzcyODVjMTA3Nzg1YmMzZDJjNjk3NmEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4+
ICtGcm9tOiBMdWR3aWcgS29ybWFubiA8bHVkd2lnLmtvcm1hbm5AaWN0NDIuZGU+Cj4+ICtEYXRl
OiBXZWQsIDMxIEphbiAyMDI0IDExOjI4OjE5ICswMTAwCj4+ICtTdWJqZWN0OiBbUEFUQ0hdIHN1
bnhpOiBzdW40aTogUmVkdWNlIGNwdSBjbG9jayBhdCBTUEwgCj4+IGluaXRpYWxpemF0aW9uIHRv
IDE0NAo+PiArIE1Iego+PiArCj4+ICtVcCB1bnRpbCBub3cgY3B1IGNsb2NrIGdldHMgaW5pdGlh
bGl6ZWQgYXQgMzg0IE1Ieiwgd2hpY2ggaXMKPj4gK3RoZSBoaWdoZXN0IHN1cHBvcnRlZCBjcHUg
Y2xvY2suCj4+ICsKPj4gK1JlY2VudCBBMjAgYmF0Y2hlcyBzaG93IGFuIGluY3JlYXNlZCBwZXJj
ZW50YWdlIG9mIG1vZHVsZXMKPj4gK3JlYWN0aW5nIHZlcnkgc2Vuc2l0aXZlIHRvIG9wZXJhdGlu
ZyBjb25kaXRpb25zIG91dHNpZGUgdGhlCj4+ICtzcGVjaWZpY2F0aW9ucy4KPj4gKwo+PiArVGhl
IGNwdSBkaWVzIHZlcnkgc2hvcnRseSBhZnRlciBQTExzLCBjb3JlIGZyZXF1ZW5jeSBvciBjcHUK
Pj4gK3ZvbHRhZ2UgYXJlIG1pc3Njb25maWd1cmVkLiBFLmcuOgo+PiArLSB1Ym9vdCBTUEwgc2Vs
ZWN0cyAzODQgTUh6IGFzIGNwdSBjbG9jayB3aGljaCByZXF1aXJlcyBhIGNwdQo+PiArIHZvbHRh
Z2Ugb2YgYXQgbGVhc3QgMS4xIFYuCj4+ICstIExpbnV4IENQVSBGcmVxdWVuY3kgc2NhbGluZyB3
aXRoIG1vc3Qgc3VuN2kgZHRzIHdpbGwgcmVkdWNlCj4+ICsgY3B1IHZvbHRhZ2UgZG93biB0byAx
LjAgVi4KPj4gKy0gV2hlbiBpbnRpYXRpbmcgYSByZWJvb3Qgb3IgcmVzZXQgZnJvbSBsaW51eCB0
aGUgY3B1IHZvbHRhZ2UKPj4gKyBtYXkga2VlcCB0aGUgMS4wIFYgY29uZmlndXJhdGlvbiBhbmQg
dGhlIGNwdSBkaWVzIGR1cmluZyBTUEwKPj4gKyBpbml0aWFsaXphdGlvbi4KPj4gKwo+PiArVGhl
cmVmb3JlIHJlZHVjZSBjcHUgY2xvY2sgYXQgdWJvb3QgU1BMIGluaXRpYWxpemF0aW9uIGRvd24K
Pj4gK3RvIDE0NCBNSHogZnJvbSAzODQgTUh6Lgo+PiArCj4+ICtTaWduZWQtb2ZmLWJ5OiBMdWR3
aWcgS29ybWFubiA8bHVkd2lnLmtvcm1hbm5AaWN0NDIuZGU+Cj4+ICtVcHN0cmVhbTogTm90IEFw
cGxpY2FibGUKPiBXaHkgaXMgdGhpcyBub3QgYXBwbGljYWJsZSB0byBVLUJvb3QgdXBzdHJlYW0/
Ck1heWJlIEknbSBtaXN1bmRlcnN0YW5kaW5nIHdoYXQgdGhlICJVcHN0cmVhbSItdGFnIGlzIG1l
YW50IHRvIGJlIHVzZWQgZm9yLgoKVGhpcyBwYXRjaCB3aWxsIG1vc3QgbGlrZWx5IG5ldmVyIGJl
IHVwc3RyZWFtZWQgdG8gdS1ib290LiBJIGhhZCAKYXR0ZW1wdGVkIHRvIGRvIHRoaXM6Cmh0dHBz
Oi8vbGlzdHMuZGVueC5kZS9waXBlcm1haWwvdS1ib290LzIwMjQtSmFudWFyeS81NDQ4OTcuaHRt
bAoKQnV0IHRoZSBjb25jbHVzaW9uIHdhcyB0aGF0IGludHJvZHVjaW5nIGEgS0NvbmZpZyBvcHRp
b24gd291bGQgYmUgYSAKYmV0dGVyIG9wdGlvbiwgd2hpY2ggaSBzdGFydGVkIHdvcmtpbmcgb24g
aW46Cmh0dHBzOi8vbGlzdHMuZGVueC5kZS9waXBlcm1haWwvdS1ib290LzIwMjQtRmVicnVhcnkv
NTQ1MDgwLmh0bWwKCkJ1dCBhcyBvZiBub3cgdGhlIEtDb25maWcgb3B0aW9uIGlzIG5vdCBhdmFp
bGFibGUgeWV0LCBzbyBJJ2QgbGlrZSB0byAKdXNlIHRoZSBwYXRjaCBhcyBhbiBpbnRlcm1lZGlh
dGUgc29sdXRpb24gZm9yIG91ciBjcHUgbW9kdWxlLgoKa2luZCByZWdhcmRzCkx1ZHdpZwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
