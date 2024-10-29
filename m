Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B3FAD3A69F
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 20:52:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E413980EA0;
	Tue, 29 Oct 2024 20:52:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yu4jdPQM0wj9; Tue, 29 Oct 2024 20:52:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5D0980F22
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5D0980F22;
	Tue, 29 Oct 2024 20:52:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D8014969
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 20:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF6456070D
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 20:52:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZxswbMXJNrnD for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 20:52:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5E8A4606A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E8A4606A9
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E8A4606A9
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 20:52:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id C3A43B00548;
 Tue, 29 Oct 2024 21:51:55 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:52996])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 29 Oct 2024 21:51:55 +0100
MIME-Version: 1.0
Date: Tue, 29 Oct 2024 21:51:55 +0100
From: Julien Olivain <ju.o@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
In-Reply-To: <a0addb27-54e4-4e13-b511-302eb40661af@smile.fr>
References: <20241027194337.2444930-1-romain.naour@smile.fr>
 <20241027194337.2444930-2-romain.naour@smile.fr>
 <cefe2b8e2bcf392b1db0eddc3a38b2bc@free.fr>
 <20241028221254.37434add@windsurf>
 <a0addb27-54e4-4e13-b511-302eb40661af@smile.fr>
User-Agent: Webmail Free/1.6.9
Message-ID: <7808488cc706e7b21b3b374c78e8548c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1730235118;
 bh=k2Kb0dmw7bcTFKUwYhIFClvRE+XPatotYy3wFyhAcw8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NhG83OCtHtythvmZuuSTXXp+c4F+Ogt2IeFk/qfEgmNBlQCUoZkVrMS2GOQRc8qIm
 zH65IUQmv+rCmaA4lGHeWKIMZj3FjGiv/s93tJK2BEtTIYKehYkCt80dJ/Qdw0jPgl
 D8tOGijk0zpCR15kLZb6FhrD6qK8AF7S655pH8a7zRuqpIkGIsnbabHGHi2eZnEFXZ
 k+XXs1+4xub2pdurfa68+7xyi9XRGhrS4SLO0sb0eR21iNNdqgnoEt/iGEVZYk4kNk
 2Y2HMIhBtEgcWVJ9bAkpXZBPIhfGDqmbDSQDrnXwbXSucGf/3Rl9aTbSwAcDgOPVj6
 8g1ORznzWM9xw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=NhG83OCt
Subject: Re: [Buildroot] [PATCH v2 2/3] boot/edk2: bump to version
 edk2-stable202405
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

SGkgUm9tYWluLCBUaG9tYXMsCgpPbiAyOS8xMC8yMDI0IDEwOjU2LCBSb21haW4gTmFvdXIgd3Jv
dGU6Cj4gSGVsbG8gSnVsaWVuLCBUaG9tYXMsCj4gCj4gTGUgMjgvMTAvMjAyNCDDoCAyMjoxMiwg
VGhvbWFzIFBldGF6em9uaSBhIMOpY3JpdMKgOgo+PiBPbiBNb24sIDI4IE9jdCAyMDI0IDIxOjI3
OjMwICswMTAwCj4+IEp1bGllbiBPbGl2YWluIDxqdS5vQGZyZWUuZnI+IHdyb3RlOgo+PiAKPj4+
IE9uIG15IHNpZGUgKHRoaXMgc2VyaWVzIGFwcGxpZWQgb24gdG9wIG9mIGJyYW5jaCBtYXN0ZXIg
YXQgODFlNzgwNiksCj4+PiB0aGlzIHBhdGNoIGRvZXMgbm90IGFwcGx5LiBUaGlzIGNhbiBiZSBy
ZXByb2R1Y2VkIHdpdGg6Cj4+PiAKPj4+ICAgICAgbWFrZSBxZW11X2FhcmNoNjRfc2JzYV9kZWZj
b25maWcKPj4+ICAgICAgbWFrZSBlZGsyLXBhdGNoCj4+PiAKPj4+IFdoaWNoIGZhaWxzIHdpdGgg
b3V0cHV0Ogo+Pj4gCj4+PiAgICAgIEFwcGx5aW5nCj4+PiAwMDAxLU92bWZQa2ctUWVtdVZpZGVv
RHhlLWFkZC1mZWF0dXJlLVBDRC10by1yZW1hcC1mcmFtZWIucGF0Y2ggdXNpbmcKPj4+IHBhdGNo
Ogo+PiAKPj4gSSdkIHNheSB0aGVyZSdzIGEgZmFpcmx5IGhpZ2ggY2hhbmNlIHRoaXMgaXNuJ3Qg
Um9tYWluJ3MgZmF1bHQuIEkKPj4gaGF2ZW4ndCBjaGVja2VkIGJ1dCBJIHdvdWxkIGd1ZXNzIHRo
YXQgdGhpcyBFREsyIGNvZGUgYmFzZSB1c2VzCj4+IERPUy1zdHlsZSBuZXcgbGluZXMgKFxyXG4p
LCBhbmQgc28gdGhlIHBhdGNoZXMgaGF2ZSB0aG9zZSwgYnV0IHRoZXkgCj4+IGdldAo+PiBzdHJp
cHBlZCB3aGVuIGdvaW5nIHRocm91Z2ggdGhlIG1haWxpbmcgbGlzdCwgbWFraW5nIHRoZSBwYXRj
aAo+PiB1bmFwcGxpY2FibGUuCj4gCj4gSW5kZWVkLCB0aGlzIGlzIG91ciB3ZWxsIGtub3duIGlz
c3VlIHdpdGggdGhlIG1haWxpbmcgbGlzdAo+IAo+IFtUaGUgY29ycmVjdCBwYXRjaCBmaWxlXQo+
ICQgZmlsZSAKPiBib290L2VkazIvMDAwMS1Pdm1mUGtnLVFlbXVWaWRlb0R4ZS1hZGQtZmVhdHVy
ZS1QQ0QtdG8tcmVtYXAtZnJhbWViLnBhdGNoCj4gYm9vdC9lZGsyLzAwMDEtT3ZtZlBrZy1RZW11
VmlkZW9EeGUtYWRkLWZlYXR1cmUtUENELXRvLXJlbWFwLWZyYW1lYi5wYXRjaDoKPiB1bmlmaWVk
IGRpZmYgb3V0cHV0LCBBU0NJSSB0ZXh0LCB3aXRoIENSTEYsIExGIGxpbmUgdGVybWluYXRvcnMK
PiAKPiBbVGhlIGNvcnJ1cHRlZCBwYXRjaCBmaWxlXQo+ICQgZmlsZSAKPiBib290L2VkazIvMDAw
MS1Pdm1mUGtnLVFlbXVWaWRlb0R4ZS1hZGQtZmVhdHVyZS1QQ0QtdG8tcmVtYXAtZnJhbWViLnBh
dGNoCj4gYm9vdC9lZGsyLzAwMDEtT3ZtZlBrZy1RZW11VmlkZW9EeGUtYWRkLWZlYXR1cmUtUENE
LXRvLXJlbWFwLWZyYW1lYi5wYXRjaDoKPiB1bmlmaWVkIGRpZmYgb3V0cHV0LCBBU0NJSSB0ZXh0
Cj4gCgpJIGNvbmZpcm0gdGhlIENSLUxSIG5ld2xpbmVzIG9mIHRoZSBvcmlnaW5hbCBwYXRjaCBn
b3QgbG9zdCBvbgp0aGUgbWFpbGluZyBsaXN0LiBJZiBJIGRvd25sb2FkIHRoZSBwYXRjaCBmcm9t
OgpodHRwczovL2dpdGh1Yi5jb20vdGlhbm9jb3JlL2VkazIvY29tbWl0L2MxZDE5MTBiZTZlMDRh
OGIxYTczMDkwY2YyODgxZmI2OTg5NDdhNmUucGF0Y2gKCkl0IGFwcGxpZXMgYW5kIGJ1aWxkIGNv
cnJlY3RseS4KCkhvd2V2ZXIsIHdoaWxlIHRlc3RpbmcgdGhpcyBzZXJpZXMgYSBiaXQgbW9yZSwg
dGhpcyBlZGsyIGJ1bXAgYnJlYWtzCnNldmVyYWwgcnVudGltZSB0ZXN0cy4gU28gZmFyLCBJIHNw
b3R0ZWQgdGVzdF9lZGsyLCB0ZXN0X2Z3dHMgYW5kCnRlc3RfZ3J1Yi4KClRob3NlIHRlc3RzIGFy
ZSBmYWlsaW5nIGRpc3JlZ2FyZGluZyB0aGUgcWVtdSB2ZXJzaW9uIHVzZWQuCgpXaGVuIHVwZGF0
aW5nIEFURiB0byAyLjExIGluIHRob3NlIHRlc3RzLCB0aGV5IGdldCBmaXhlZCB3aXRoIGEKcmVj
ZW50IHFlbXUgdmVyc2lvbiAoSSB0ZXN0ZWQgOS4xLjEpLCBidXQgdGhleSBhcmUgc3RpbGwgY3Jh
c2hpbmcKaW4gdGhlIHFlbXUgNS4yLjAgaW4gdGhlIEJ1aWxkcm9vdCBEb2NrZXIgaW1hZ2UuIFRo
aXMgZml0IHRvIHlvdXIKY29tbWl0IGxvZ3MuIFdoZW4gY3Jhc2hpbmcsIHRoZSBvdXRwdXQgaXM6
CgogICAgIE5PVElDRTogIEJMMzE6IHYyLjExLjAocmVsZWFzZSk6djIuMTEKICAgICBOT1RJQ0U6
ICBCTDMxOiBCdWlsdCA6IDE3OjUyOjA4LCBPY3QgMjkgMjAyNAogICAgIFVFRkkgZmlybXdhcmUg
KHZlcnNpb24gMS4wIGJ1aWx0IGF0IDE3OjUyOjM0IG9uIE9jdCAyOSAyMDI0KQogICAgIFN5bmNo
cm9ub3VzIEV4Y2VwdGlvbiBhdCAweDAwMDAwMTAwMUYzQUUwQUMKCk15IGd1ZXNzIGlzIHRoYXQg
d2UndmUgcmVhY2hlZCB0aGUgbGltaXQgb2YgdGhpcyBvbGQgUWVtdSB2ZXJzaW9uLi4uCgpJIHRo
aW5rIHRob3NlIHRlc3RzIHJlbHlpbmcgb24gcmVjZW50IHFlbXUgc2hvdWxkIGJ1aWxkIHRoZWly
IG93bgpob3N0LXFlbXUgYW5kIHRoZSBydW50aW1lIHRlc3QgaW5mcmEgc2hvdWxkIHVzZSBpdC4g
T3RoZXIgdGVzdHMKc2hvdWxkIHJlbWFpbiBhcyB0aGV5IGFyZS4gSWYgSSByZWNhbGwgY29ycmVj
dGx5LCBpdCBpcyBub3QgdGhlCmZpcnN0IHRpbWUgd2UgZ2V0IHRvd2FyZCB0aGlzIGNvbmNsdXNp
b24uLi4KCklmIHdlIGRlY2lkZSB0byBkbyBzbywgdGhpcyBzZXJpZXMgd2lsbCBuZWVkIHRvIGJl
IGV4cGFuZGVkIGEgYml0CnRvIGZpeCB0aG9zZSB0ZXN0cyBhdCB0aGUgc2FtZSB0aW1lLiBJJ2xs
IGNvbnRpbnVlIHRvIHRlc3Rpbmcgb24KbXkgc2lkZSB0byBzZWUgaG93IHdlIGNhbiBpbXByb3Zl
IHRoYXQuCgo+PiAKPj4+IFdoZW4gd2UgYnVtcGluZyBib290L2VkazIsIHdlIHVzdWFsbHkgYWxz
byBidW1wIGVkazItbm9uLW9zaS4KPj4+IFNlZToKPj4+IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWls
ZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2Jsb2IvbWFzdGVyL3BhY2thZ2UvZWRrMi1ub24tb3NpL2Vk
azItbm9uLW9zaS5taz9yZWZfdHlwZT1oZWFkcyNMNwo+Pj4gCj4+PiBFdmVuIGlmIGl0IGlzIG5v
dCBuZWVkZWQgdG8gZml4IHRoZSBxZW11X2FhcmNoNjRfc2JzYV9kZWZjb25maWcgb2YKPj4+IHRo
aXMgc2VyaWVzLCBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8ga2VlcCBhbGwgdGhvc2UgY29tcG9uZW50
cyBhbGlnbmVkLgo+Pj4gCj4+PiBDb3VsZCB5b3UgY2hlY2sgaWYgZWRrMi1ub24tb3NpIG5lZWRz
IHRvIGJlIHVwZGF0ZWQgdG9vPwo+Pj4gSWYgeWVzLCBjb3VsZCB5b3UgdXBkYXRlIGl0Pwo+Pj4g
SWYgbm8sIGNvdWxkIHlvdSBhZGQgYSBtZW50aW9uIHRoYXQgaXQgZG9lcyBub3QgbmVlZCB0bz8K
Pj4+IAo+Pj4gTWF5YmUgd2UgY291bGQgYWRkIGEgY29tbWVudCBpbiBib290L2VkazIvZWRrMi5t
aywgYmVmb3JlIAo+Pj4gRURLMl9WRVJTSU9OLgo+Pj4gU29tZXRoaW5nIGxpa2U6Cj4+PiAKPj4+
ICMgV2hlbiB1cGRhdGluZyB2ZXJzaW9uLCBtYWtlIHN1cmUgdG8gYWxzbyB1cGRhdGUgdGhlIGVk
azItcGxhdGZvcm1zCj4+PiAjIGFuZCBlZGsyLW5vbi1vc2kgcGFja2FnZXMgdG8gdGhlaXIgcmVz
cGVjdGl2ZSBjb21taXQgSUQgbmVhcmVzdCB0bwo+Pj4gIyB0aGUgZWRrMiByZWxlYXNlLgo+PiAK
Pj4gSSdsbCBsZXQgUm9tYWluIGFkZHJlc3MgdGhpcyBwb2ludCBiZWZvcmUgYXBwbHlpbmcgdGhl
bi4KPiAKPiBUaGVyZSBpcyBubyBpbmZvcm1hdGlvbiBmcm9tIGVkazIgcmVsZWFzZXMgYWJvdXQg
ZWRrMi1ub24tb3NpIGFuZCAKPiBlZGsyLXBsYXRmb3Jtcwo+IGdpdCBoYXNoZXMgdG8gdXNlLiBB
dCBsZWFzdCBRZW11IHRlc3RzdWl0ZSBmaWxlcyBjb250YWlucyB0aGUgaGFzaCB1c2VkIAo+IGZv
cgo+IHRoZWlyIHRlc3RzIFsxXS4uLgo+IAo+IEFjdHVhbGx5IEknbSBub3Qgc3VyZSBpZiBlZGsy
LW5vbi1vc2kgcGFja2FnZSBpcyByZWFsbHkgbmVlZGVkIHNpbmNlIGl0IAo+IGNvbnRhaW5zCj4g
bW9zdGx5IHByZWJ1aWx0IGZpcm13YXJlcy4KPiAKPiBtZXRhLWFybSBkb2Vzbid0IHVzZSBpdDoK
PiAKPiBodHRwczovL2dpdC55b2N0b3Byb2plY3Qub3JnL21ldGEtYXJtL3RyZWUvbWV0YS1hcm0v
cmVjaXBlcy1ic3AvdWVmaS9lZGsyLWZpcm13YXJlLmluYz9oPXNjYXJ0aGdhcCNuMTgKPiAKPiBB
Y3R1YWxseSB0aGlzIHBhY2thZ2UgaXMgb25seSBuZWVkZWQgZm9yIE1hcnZlbGwgQXJtYWRhIFsy
XQo+IChTaWxpY29uL01hcnZlbGwvQXJtYWRhN2s4ay9EZXZpY2VUcmVlKSB0aGF0IHdhcyBub3Qg
dXBkYXRlZCBzaW5jZSAyMDIxIAo+IGluCj4gZWRrMi1ub24tb3NpIHJlcG9zaXRvcnkuCj4gCj4g
U28sIG5vIHVwZGF0ZSBpcyByZXF1aXJlZC4KCk9rLCB0aGFua3MgZm9yIHRoaXMgY29uZmlybWF0
aW9uLgoKPiBbMV0KPiBodHRwczovL2dpdGxhYi5jb20vcWVtdS1wcm9qZWN0L3FlbXUvLS9jb21t
aXQvMjRhN2NkNmE3YzIxZjgyZjFjZTliZDVlY2Y2ZmI1NGViN2JmNDYwMgo+IFsyXQo+IGh0dHBz
Oi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2NvbW1pdC85NWY3MmZiNjFh
YWU2YTY0ZWE4MjJiNTM1Y2Y5ZDJjMmUwMWU2ZmM5Cj4gCj4gQmVzdCByZWdhcmRzLAo+IFJvbWFp
bgo+IAo+IAo+PiAKPj4gVGhhbmtzIQo+PiAKPj4gVGhvbWFzCgpCZXN0IHJlZ2FyZHMsCgpKdWxp
ZW4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
