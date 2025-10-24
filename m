Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 079C7CCD1BF
	for <buildroot@archiver.kernel.org>; Fri, 24 Oct 2025 21:51:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA7A84048B;
	Fri, 24 Oct 2025 21:51:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yA_HWR-Ppa7m; Fri, 24 Oct 2025 21:51:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDFA940556
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDFA940556;
	Fri, 24 Oct 2025 21:51:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FB6543F
 for <buildroot@buildroot.org>; Fri, 24 Oct 2025 21:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 354024085E
 for <buildroot@buildroot.org>; Fri, 24 Oct 2025 21:51:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wLUuVr1SSTXe for <buildroot@buildroot.org>;
 Fri, 24 Oct 2025 21:51:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::135; helo=mail-il1-x135.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 520F4403BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 520F4403BF
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 520F4403BF
 for <buildroot@buildroot.org>; Fri, 24 Oct 2025 21:51:41 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-430bf3b7608so24952905ab.3
 for <buildroot@buildroot.org>; Fri, 24 Oct 2025 14:51:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761342700; x=1761947500;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zXdtWA0AXmA+Qp1yH9A6cq0PDraK9AkFv9PZauXFVH4=;
 b=gwDOmyxWpNrBCLtVGOX8dcUmRRjYEAXMwuJXVG7Qo4qlnpYcfyu0N6Gi+od7Iku2xp
 DhRJTXabkk08zbQsRLEWpRCmavcOTm3qe11wAFxtJJgP+IB6O1+aJKUbTt2tp1D6Liox
 ifnbtZ6siM1XrQOqK6cdJZh/jgkkjQS8N/Wl/UkDI3pkgb9KUx57pN/GHaQU65/mmTTu
 Gf1Aaglp1gw6tOtfH0C2p2scj29Lm/hlWyhL2/I20j7JWq9Opm+W4Dv2XNNEajdsexSb
 1RYiR6gFs/5giXtgh9TgvcNJimnqBGB936wAVIL7mhV77n06XsjRPQgf6+tda2PB3fiT
 r8YQ==
X-Gm-Message-State: AOJu0YwVjIityGwsyzPMRXN6OZ/Y4oge9pC33xfMligM6XaM7GdD2vDY
 wFXitlAOUVErewcl9mU8jf4/yOkPFrSCiR9z+ir3bUJUc+3ShBvYjrmpZlaT57KCxmmiAzJWqrz
 dIbzIX2qpEgxwnXqFMrLuz9eCh02ksG5Ugw==
X-Gm-Gg: ASbGnctz301CvMAojtAZA9EvtrEMM3nFxttNAbRppKscOarLsyWSmCF+8619SumMn9j
 bkyTOxus/r6fQ+ObuhfQAm6Ncjqj3yofIoYUYIpJS4PQvqK4mAdlVw48nH9IyiKYXVCofkOlOrh
 lkw8VcoxQVkEhr9wlXSlVT2457IcXGORHqXRKmsG2GkzHOftQidVfWrRgGfH/ikI5zSLbTNe7na
 acfN712xQspLLpHJrbqFwAvqmKPLfv4oRBCTUWup5vXPPW0V86o2lcLJvE8o8PtUeU/UfnegxCm
 FqeX
X-Google-Smtp-Source: AGHT+IHvPZBORq0UTXPl1NCtiIR2bMpmueXluiFE+BfPaz2EmUeRHMBp6BEnBb3purA8X+7pZobfsw5s6TK7+7Ts1WI=
X-Received: by 2002:a05:6e02:2183:b0:430:c477:fcde with SMTP id
 e9e14a558f8ab-430c52081demr392014615ab.1.1761342700011; Fri, 24 Oct 2025
 14:51:40 -0700 (PDT)
MIME-Version: 1.0
References: <20251022-bash-5-3-v2-1-adcf1223650f@gmail.com>
 <1de6f99f32205dfc810bd0811a6c013e@free.fr>
In-Reply-To: <1de6f99f32205dfc810bd0811a6c013e@free.fr>
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Fri, 24 Oct 2025 14:51:04 -0700
X-Gm-Features: AWmQ_bnlcvHUP5plXesS0kJ2XNJ-djrWPKSPKYTSAtDnBdrad7iYwX4qCHeRjk0
Message-ID: <CAMWSM7hpyxHZrUxuwjXtoMDyTfoqqzgEsOF3ALmQ8sYCJo27vw@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761342700; x=1761947500; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zXdtWA0AXmA+Qp1yH9A6cq0PDraK9AkFv9PZauXFVH4=;
 b=GMGWkwiRCeK4tHPpO0jmpyYQ3o3aDjyCb21rdO9gjuErJwO9/O2GwrevWDwlGML5I6
 Mbdq2D4e75vEePMpkxmGoAPyVlRAeapqYAmy4SJYCBRSVyzUmiztWYTf2bxhN0eWWn1W
 1vCdubMLVUE9bAKYAgjstKcl06FEfOwlUrQWidStxa6AUl6ns+SsviO5CH9o7vgVzkjj
 K6kAgW+w1P7vrFN8s3Xo+s8wVRMpYpz9tYdUxRDeP3LDUZCeoqkX+uvSyqRcSWbydoLZ
 Qp0sqexSub9U/syZ5MtL5Z4InUsTTuA3zvPfZjwlDcYGU5/pH09pwmjM1I3jjK6elYkK
 ieJw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GMGWkwiR
Subject: Re: [Buildroot] [PATCH v2] package/bash: bump to v5.3
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

SGkgSnVsaWVuLAoKT24gVGh1LCBPY3QgMjMsIDIwMjUgYXQgMTozMeKAr1BNIEp1bGllbiBPbGl2
YWluIDxqdS5vQGZyZWUuZnI+IHdyb3RlOgo+Cj4gSGkgSm9zZXBoLAo+Cj4gVGhhbmtzIGZvciB0
aGlzIHYyIQo+Cj4gT24gMjIvMTAvMjAyNSAyMjowMSwgSm9zZXBoIEtvZ3V0IHdyb3RlOgo+ID4g
U2VlIHRoZSByZWxldmFudCBhbm5vdW5jZW1lbnQ6Cj4gPiBodHRwczovL2xpc3RzLmdudS5vcmcv
YXJjaGl2ZS9odG1sL2J1Zy1iYXNoLzIwMjUtMDcvbXNnMDAwMDUuaHRtbAo+ID4KPiA+IENoYW5n
ZXM6Cj4gPiAtIFJlbW92ZWQgdXBzdHJlYW1lZCBtdWx0aWJ5dGUgY29tcGlsYXRpb24gZml4Cj4g
PiAtIFJlYmFzZWQgbWlzc2luZyBpbmNsdWRlIHBhdGNoIHRoYXQgcmVtYWlucyB1bm1lcmdlZAo+
ID4gICAtIEZpeGVkIFVwc3RyZWFtOiBjaGVja3BhY2thZ2Ugd2FybmluZwo+ID4gLSBSZW1vdmVk
IGJ1aWxkIGZhaWx1cmUgd29ya2Fyb3VuZHMgZW5mb3JjaW5nIG9sZGVyIEMgc3RhbmRhcmQKPiA+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKb3NlcGggS29ndXQgPGpvc2VwaC5rb2d1dEBnbWFpbC5jb20+
Cj4gWy4uLl0KPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2Jhc2gvYmFzaC5tayBiL3BhY2thZ2Uv
YmFzaC9iYXNoLm1rCj4gPiBpbmRleCA3ZmI0M2M1MmMwLi5lZDk5YmJhZGIyIDEwMDY0NAo+ID4g
LS0tIGEvcGFja2FnZS9iYXNoL2Jhc2gubWsKPiA+ICsrKyBiL3BhY2thZ2UvYmFzaC9iYXNoLm1r
Cj4gPiBAQCAtNCw3ICs0LDcgQEAKPiA+ICAjCj4gPgo+ID4gIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMKPiA+Cj4gPiAtQkFTSF9WRVJTSU9OID0gNS4yLjM3Cj4gPiArQkFTSF9WRVJTSU9OID0gNS4z
Cj4KPiBUaGlzIG5ldyA1LjMgdmVyc2lvbiBpcyBpbnRyb2R1Y2luZyAzIGJ1aWxkIGZhaWx1cmVz
LiBTZWU6Cj4gaHR0cHM6Ly9naXRsYWIuY29tL2pvbGl2YWluL2J1aWxkcm9vdC8tL3BpcGVsaW5l
cy8yMTE0ODc2MTQ2Cj4KPiBGb3IgcmVmZXJlbmNlLCB0aGUgdmVyc2lvbiA1LjIuMzcgYnVpbGQg
Y29ycmVjdGx5Ogo+IGh0dHBzOi8vZ2l0bGFiLmNvbS9qb2xpdmFpbi9idWlsZHJvb3QvLS9waXBl
bGluZXMvMjExNDg5Mjk2Nwo+Cj4gPiAgQkFTSF9TSVRFID0gJChCUjJfR05VX01JUlJPUikvYmFz
aAo+ID4gIEJBU0hfREVQRU5ERU5DSUVTID0gbmN1cnNlcyByZWFkbGluZSBob3N0LWJpc29uCj4g
PiAgQkFTSF9MSUNFTlNFID0gR1BMLTMuMCsKPiA+IEBAIC0yNiwxNSArMjYsNiBAQCBCQVNIX0NP
TkZfRU5WID0gXAo+ID4gICAgICAgYmFzaF9jdl9mdW5jX3NpZ3NldGptcD1wcmVzZW50IFwKPiA+
ICAgICAgIGJhc2hfY3ZfcHJpbnRmX2FfZm9ybWF0PXllcwo+ID4KPiA+IC0jIENhbiBiZSBkcm9w
cGVkIHdoZW4gYmFzaCBpcyBidW1wZWQgdG8gNS4zIG9yIG5ld2VyLgo+ID4gLWlmZXEgKCQoQlIy
X1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfMTUpLHkpCj4gPiAtQkFTSF9DT05GX0VOViArPSBDRkxB
R1M9IiQoVEFSR0VUX0NGTEFHUykgLXN0ZD1nbnUxNyIKPiA+IC1lbmRpZgo+ID4gLQo+ID4gLWlm
ZXEgKCQoQlIyX0hPU1RfR0NDX0FUX0xFQVNUXzE1KSx5KQo+ID4gLUJBU0hfQ09ORl9FTlYgKz0g
Q0ZMQUdTX0ZPUl9CVUlMRD0iJChIT1NUX0NGTEFHUykgLXN0ZD1nbnUxNyIKPiA+IC1lbmRpZgo+
Cj4gV2hlbiBob3N0LWdjYyBpcyA+PSAxNSBidXQgdGFyZ2V0LWdjYyA8IDE1LCB0aGUgYnVpbGQg
aXMgZmFpbGluZwo+IGJlY2F1c2UgdGhlIGJ1aWxkY29uZi5oIChpbml0aWFsbHkgbWFkZSBmb3Ig
dGFyZ2V0KSBpcyByZXVzZWQgZm9yCj4gaG9zdC4gU28gd2UgbWF5IG5lZWQgdG8ga2VlcCB0aGlz
IHByZXZpb3VzIGJsb2NrIHNldHRpbmcKPiBDRkxBR1NfRk9SX0JVSUxEIHZhcmlhYmxlLCBhZnRl
ciBhbGwuCj4KCkl0IGxvb2tzIGxpa2Ugd2Ugc3RpbGwgbmVlZCB0aGUgSE9TVF9HQ0MgdGVzdCwg
YnV0IG5vdCB0aGUKVE9PTENIQUlOX0dDQyB0ZXN0PyBXaXRoIGJvdGggcmVtb3ZlZCwgSSBnZXQg
MjgvMzMgZmFpbHVyZXMgd2l0aAp0ZXN0LXBrZyAtYS4KCldpdGgganVzdCB0aGUgdG9vbGNoYWlu
IGNoZWNrLCBJIGdldCAzMy8zMyBmYWlsdXJlcywgYW5kIGp1c3QgdGhlIGhvc3QKY2hlY2sgSSBn
ZXQgMy8zMyBmYWlsdXJlcy4gSXQgbG9va3MgbGlrZSB0aG9zZSB0aHJlZSBmYWlsdXJlcyBhcmUK
c3RpbGwgcHJlc2VudCBldmVuIHdpdGggYm90aCBjaGVja3MgaW4gcGxhY2UsIHNvIEknZCBzYXkg
d2Ugc3RpbGwgbmVlZAp0aGUgaG9zdCBjaGVjaywgYnV0IG5vdCB0aGUgdG9vbGNoYWluIGNoZWNr
LgoKTXkgYXBvbG9naWVzIGZvciBub3QgcnVubmluZyB0ZXN0LXBrZyBiZWZvcmUgc2VuZGluZyB2
Mi4KCj4gPiAtCj4gPiAgIyBUaGUgc3RhdGljIGJ1aWxkIG5lZWRzIHNvbWUgdHJpY2tlcnkKPiA+
ICBpZmVxICgkKEJSMl9TVEFUSUNfTElCUykseSkKPiA+ICBCQVNIX0NPTkZfT1BUUyArPSAtLWVu
YWJsZS1zdGF0aWMtbGluawo+ID4KPiA+IC0tLQo+Cj4gQ291bGQgeW91IGhhdmUgYSBsb29rLCBw
bGVhc2U/Cj4KPiBCZXN0IHJlZ2FyZHMsCj4KPiBKdWxpZW4uCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
