Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E0ED10BF0
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 10:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5747880FAB;
	Sat, 26 Oct 2024 10:50:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jxAUCUiYBsfj; Sat, 26 Oct 2024 10:50:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B287812E5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B287812E5;
	Sat, 26 Oct 2024 10:50:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E69045C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 10:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D42B64019A
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 10:50:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nNIjEyyq3haR for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 10:50:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 521DC40195
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 521DC40195
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 521DC40195
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 10:50:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 27FD0780395;
 Sat, 26 Oct 2024 12:50:22 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:43970])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 26 Oct 2024 12:50:22 +0200
MIME-Version: 1.0
Date: Sat, 26 Oct 2024 12:50:22 +0200
From: Julien Olivain <ju.o@free.fr>
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: buildroot@buildroot.org
In-Reply-To: <20240925-mscan-coreutils-v1-1-3765769290e8@yoseli.org>
References: <20240925-mscan-coreutils-v1-1-3765769290e8@yoseli.org>
User-Agent: Webmail Free/1.6.9
Message-ID: <27ba663f61c1149a80315f01f0eca471@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1729939823;
 bh=VOJOQV3x6m/GISPrS8QPYlYPxP8qOG1LixbqzvCKfVU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Kh9ycr/GHi8EdZfRR8fJ+ys1q3COD33zwgF/eSb4QK/wT+STLdMlvSGPY3fU2Nzf0
 kG0poNSPErGTaDAw1nWOTcPYupsDM07biwBNhOrLnAxN7ZP4TJtJyoD8594Zce+xxz
 lIwvMORHGN1qpyP0Ci9C1H/YUsUxBb8Y5ritjoGcOTBgdCEwJec9hFqWm/RUm0FdhF
 wGN68P04T2aqcTaM9vA5gUobSHlJIE46WgWwZXZhmZOMx5WzdCCj7UgUEYlCBW6rWf
 jKWHDMsEbVtMDdK5IJ2SyoTs9AO1kWCjOrIR9+sSvv1uEF5ndDUbeVSHjWS5UT8gUB
 WeAtzKS1P43ng==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Kh9ycr/G
Subject: Re: [Buildroot] [PATCH] package: coreutils: fix mcel for uClibc-ng
 compatibility
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

SGkgSmVhbi1NaWNoZWwsCgpUaGFua3MgZm9yIHlvdXIgcGF0Y2ghCgpPbiAyNS8wOS8yMDI0IDA5
OjQ4LCBKZWFuLU1pY2hlbCBIYXV0Ym9pcyB3cm90ZToKPiBQcm9ibGVtIHJlcG9ydGVkIGJ5IFdh
bGRlbWFyIEJyb2Rrb3JiIGluOgo+IGh0dHBzOi8vbGlzdHMuZ251Lm9yZy9yL2J1Zy1nbnVsaWIv
MjAyNC0wOC9tc2cwMDEzMC5odG1sCj4gCj4gVGhpcyBwYXRjaCBtb2RpZmllcyBtY2VsX3NjYW4g
dG8gYXZvaWQgdHJlYXRpbmcgdUNsaWJjLW5nIGFzIGlmIGl0IHdlcmUKPiBnbGliYywgcmVzb2x2
aW5nIGNvbXBhdGliaWxpdHkgaXNzdWVzLgo+IAo+IFNwZWNpZmljYWxseSwgdUNsaWJjLW5nIHdh
cyBpbmNvcnJlY3RseSB0cmVhdGVkIGxpa2UgZ2xpYmMgaW4gdGhlIGNvZGUsCj4gd2hpY2ggbGVk
IHRvIGluY29ycmVjdCBhc3N1bXB0aW9ucyBhYm91dCB0aGUgbWJzdGF0ZV90IGluaXRpYWxpemF0
aW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEplYW4tTWljaGVsIEhhdXRib2lzIDxqZWFubWljaGVs
LmhhdXRib2lzQHlvc2VsaS5vcmc+CgpJIGRpZCBmZXcgbWlub3IgcmV3b3JrcyBhbmQgYXBwbGll
ZCB0byBtYXN0ZXIuIFNlZSB0aGUgZGV0YWlscyBpbgp0aGUgbmV3IGNvbW1pdCBsb2c6Cmh0dHBz
Oi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2NvbW1pdC80Y2YwZmQ4ZTll
M2YwNWVjMmUyODQxZWY0OTZhYmI4OTU3M2Q0MWY4CgpCZXN0IHJlZ2FyZHMsCgpKdWxpZW4uCgo+
IC0tLQo+ICAuLi4vMDAwMS1jb3JldXRpbHMtbWNlbC1wb3J0LXRvLXVDbGliYy1uZy5wYXRjaCAg
ICB8IDM0IAo+ICsrKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDM0IGlu
c2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IAo+IGEvcGFja2FnZS9jb3JldXRpbHMvMDAwMS1j
b3JldXRpbHMtbWNlbC1wb3J0LXRvLXVDbGliYy1uZy5wYXRjaCAKPiBiL3BhY2thZ2UvY29yZXV0
aWxzLzAwMDEtY29yZXV0aWxzLW1jZWwtcG9ydC10by11Q2xpYmMtbmcucGF0Y2gKPiBuZXcgZmls
ZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjMwMGEwYjcxYWIKPiAtLS0gL2Rldi9u
dWxsCj4gKysrIGIvcGFja2FnZS9jb3JldXRpbHMvMDAwMS1jb3JldXRpbHMtbWNlbC1wb3J0LXRv
LXVDbGliYy1uZy5wYXRjaAo+IEBAIC0wLDAgKzEsMzQgQEAKPiArRnJvbSBjNGU5MjNhOThmMzRm
ZTVmNWVjM2I0OTU0M2U5MDcxNmVjMmE0NWZjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+ICtG
cm9tOiBKZWFuLU1pY2hlbCBIYXV0Ym9pcyA8amVhbm1pY2hlbC5oYXV0Ym9pc0B5b3NlbGkub3Jn
Pgo+ICtEYXRlOiBUdWUsIDI0IFNlcCAyMDI0IDE4OjA4OjMxICswMjAwCj4gK1N1YmplY3Q6IFtQ
QVRDSF0gY29yZXV0aWxzOiBtY2VsOiBwb3J0IHRvIHVDbGliYy1uZwo+ICtNSU1FLVZlcnNpb246
IDEuMAo+ICtDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKPiArQ29udGVu
dC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAo+ICsKPiArUHJvYmxlbSByZXBvcnRlZCBieSBXYWxk
ZW1hciBCcm9ka29yYiBpbjoKPiAraHR0cHM6Ly9saXN0cy5nbnUub3JnL3IvYnVnLWdudWxpYi8y
MDI0LTA4L21zZzAwMTMwLmh0bWwKPiArKiBsaWIvbWNlbC5oIChtY2VsX3NjYW4pOiBEb27DouKC
rOKEonQgdHJlYXQgdUNsaWJjLW5nIGxpa2UgZ2xpYmMuCj4gKwo+ICtTaWduZWQtb2ZmLWJ5OiBK
ZWFuLU1pY2hlbCBIYXV0Ym9pcyA8amVhbm1pY2hlbC5oYXV0Ym9pc0B5b3NlbGkub3JnPgo+ICst
LS0KPiArIGxpYi9tY2VsLmggfCAzICsrLQo+ICsgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQo+ICsKPiArZGlmZiAtLWdpdCBhL2xpYi9tY2VsLmggYi9saWIv
bWNlbC5oCj4gK2luZGV4IGY2ZjAwNmMuLmRjYTRkMDggMTAwNjQ0Cj4gKy0tLSBhL2xpYi9tY2Vs
LmgKPiArKysrIGIvbGliL21jZWwuaAo+ICtAQCAtMjIxLDcgKzIyMSw4IEBAIG1jZWxfc2NhbiAo
Y2hhciBjb25zdCAqcCwgY2hhciBjb25zdCAqbGltKQo+ICsKPiArICAgLyogQW4gaW5pdGlhbCBt
YnN0YXRlX3Q7IGluaXRpYWxpemF0aW9uIG9wdGltaXplZCBmb3Igc29tZSAKPiBwbGF0Zm9ybXMu
Cj4gKyAgICAgIEZvciBkZXRhaWxzIGFib3V0IHRoZXNlIGFuZCBvdGhlciBwbGF0Zm9ybXMsIHNl
ZSB3Y2hhci5pbi5oLiAgKi8KPiArLSNpZiBkZWZpbmVkIF9fR0xJQkNfXyAmJiAyIDwgX19HTElC
Q19fICsgKDIgPD0gX19HTElCQ19NSU5PUl9fKQo+ICsrI2lmIChkZWZpbmVkIF9fR0xJQkNfXyAm
JiAyIDwgX19HTElCQ19fICsgKDIgPD0gX19HTElCQ19NSU5PUl9fKSBcCj4gKysJJiYgIWRlZmlu
ZWQgX19VQ0xJQkNfXykKPiArICAgLyogQWx0aG91Z2ggb25seSBhIHRyaXZpYWwgb3B0aW1pemF0
aW9uLCBpdCdzIHdvcnRoIGl0IGZvciBHTlUuICAqLwo+ICsgICBtYnN0YXRlX3QgbWJzOyBtYnMu
X19jb3VudCA9IDA7Cj4gKyAjZWxpZiAoZGVmaW5lZCBfX0ZyZWVCU0RfXyB8fCBkZWZpbmVkIF9f
RHJhZ29uRmx5X18gfHwgZGVmaW5lZCAKPiBfX09wZW5CU0RfXyBcCj4gKy0tCj4gKzIuMzkuMgo+
ICsKPiAKPiAtLS0KPiBiYXNlLWNvbW1pdDogMDk4MjQ5OGM2NzM1YTJkOTBiNTU0MDM3MGQxN2U0
OGMzMWM5NjJiYwo+IGNoYW5nZS1pZDogMjAyNDA5MjUtbXNjYW4tY29yZXV0aWxzLWFkZDczNDdh
MTFmMAo+IAo+IEJlc3QgcmVnYXJkcywKPiAtLQo+IEplYW4tTWljaGVsIEhhdXRib2lzIDxqZWFu
bWljaGVsLmhhdXRib2lzQHlvc2VsaS5vcmc+Cj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
