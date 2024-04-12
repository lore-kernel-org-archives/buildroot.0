Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44AF8C4345F
	for <buildroot@archiver.kernel.org>; Fri, 12 Apr 2024 20:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 085AC404B4;
	Fri, 12 Apr 2024 20:01:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xqUrgI_4nr87; Fri, 12 Apr 2024 20:01:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2BEF409C4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E2BEF409C4;
	Fri, 12 Apr 2024 20:01:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 017A11BF4E2
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 20:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF50F409C4
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 20:01:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GWJ8N-wu7fYR for <buildroot@lists.busybox.net>;
 Fri, 12 Apr 2024 20:01:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B43B0404B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B43B0404B4
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B43B0404B4
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 20:01:08 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 3FD2213F88F;
 Fri, 12 Apr 2024 22:00:54 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 12 Apr 2024 22:00:54 +0200
Date: Fri, 12 Apr 2024 22:00:54 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Perale <thomas.perale@essensium.com>
Message-ID: <ZhmS9kRYj2AuqBln@landeda>
References: <20240412132659.1168317-1-thomas.perale@mind.be>
 <20240412132659.1168317-4-thomas.perale@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240412132659.1168317-4-thomas.perale@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712952066;
 bh=LulWq/i2G3BM3whvyyvT/sOYyKRmbOV4ktgn3nmo13A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EvTmq6yjfoInhSztukTwL2PXDYzuioE2uBCtc8DzavgNjkI203sPNJBRU3A0sw/HO
 Dfj7HEZTLNCO5O2IXcgItBdN/c5lxSUPGiz0RvOjOlhgr57yD5SKyV3FX5UJEdTjgp
 JDyhAKfr5n3Qb5M51NDNaR9ntehyizNzSIGpz8/zG5lyG9gFNynbVm9HHSwxtTg4bm
 kH9en+OP5EwXY5aQ/tf/M+eLWJ/nt4gKCghHLISfyqLsbsiJVywWDWaSTu99rlxpmU
 zUDJgHTiYbvWwnYJuD4zJP6r45R+umisJqx7aofVQUMhE1PTXHYSf9hS+iI65hbHdr
 qzXUkQD3uLf7g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=EvTmq6yj
Subject: Re: [Buildroot] [PATCH 3/6] package/go: make host package a virtual
 package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Geoff Levand <geoff@infradead.org>, Anisse Astier <anisse@astier.eu>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Christian Stewart <christian@aperture.us>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhvbWFzLCBBbGwsCgpUaGFua3MgZm9yIHRoaXMgc2VyaWVzLCBpdCByZWFsbHkgbG9va3MgZ29v
ZCEgOi0pCgpJIGFueXdheSBoYXZlIGEgZmV3IGNvbW1lbnRzIGFuZCBxdWVzdGlvbnMsIHBsZWFz
ZSBzZWUgYmVsb3cuCgpPbiAyMDI0LTA0LTEyIDE1OjI2ICswMjAwLCBUaG9tYXMgUGVyYWxlIHZp
YSBidWlsZHJvb3Qgc3Bha2UgdGh1c2x5Ogo+IFR1cm5zIGhvc3QtZ28gaW50byBhIHZpcnR1YWwg
cGFja2FnZSwgd2hpY2ggaGFzIHR3byBwcm92aWRlcnM6CgpXaXRoIHRoaXMgcGF0Y2gsIHRoZXJl
IGlzIGEgc2luZ2xlIHByb3ZpZGVyLCBzbyB0aGUgY29tbWl0IGxvZyBpcyBub3QKY29ycmVjdC4g
SW5zdGVhZCwgaXQgc2hvdWxkIHN0YXRlIHNvbWV0aGluZyBsaWtlOgoKICAgIFR1cm4gaG9zdC1n
byBpbnRvIGEgdmlydHVhbCBwYWNrYWdlLCB3aGljaCBjdXJyZW50bHkgaGFzIGEgc2luZ2xlCiAg
ICBwcm92aWRlciwgdGhlIGV4aXN0aW5nIGhvc3QtZ28gcGFja2FnZS4gSW4gbGF0ZXIgY29tbWl0
cywgd2UnbGwKICAgIGFkZCBhIHByZWJ1aWx0LCBiaW5hcnkgaG9zdCBnbyBjb21waWxlciBhcyBh
bm90aGVyIHByb3ZpZGVyLgoKPiAgLSBob3N0LWdvLXNyYywgd2hpY2ggYnVpbGRzIGhvc3QtZ28g
ZnJvbSBzb3VyY2UgYmFzZWQgb24gdGhlIHNhbWUgbG9naWMKPiAgICB0aGF0IHdhcyBwcmV2aW91
c2x5IHVzZWQgaW4gcGFja2FnZS9nby9nby9nby5taywgbm93IG1vdmVkIHRvCj4gICAgcGFja2Fn
ZS9nby9nby1zcmMvZ28tc3JjLm1rIHRvIHJlbW92ZSBhbnkgYW1iaWd1aXR5IG9uIHRoZSByb2xl
IG9mCj4gICAgdGhlIHBhY2thZ2UuCj4gCj4gIC0gaG9zdC1nby1iaW4sIHdoaWNoIHdpbGwgYmUg
aW50cm9kdWNlZCBpbiB0aGUgbmV4dCBjb21taXQgYW5kIGluc3RhbGxzCj4gICAgYSBwcmUtYnVp
bHQgR28gY29tcGlsZXIuCj4gCj4gVGhlIHVzYWdlIG9mIGEgdmlydHVhbCBwYWNrYWdlIGVuYWJs
ZXMgc3VwcG9ydCBmb3IgcHJlLWJ1aWx0IEdvCgpzL3VzYWdlL3VzZS8KCj4gY29tcGlsZXIsIHdo
aWNoIHJlZHVjZXMgdGhlIGJ1aWxkIHRpbWUgZm9yIG9mIGhvc3QtZ28uCj4gQSBzaW1pbGFyIHNv
bHV0aW9uIGlzIHByb3Bvc2VkIGZvciBob3N0LXJ1c3QuCj4gCj4gQnkgZGVmYXVsdCwgaG9zdC1n
byBpcyBidWlsdCBmcm9tIHNvdXJjZXMgdG8ga2VlcCB0aGUgc2FtZSBiZWhhdmlvciBhcwo+IHRo
ZSBmb3JtZXIgdmVyc2lvbi4KClNpbmNlIHRoaXMgY29tbWl0IG9ubHkgaW50cm9kdWNlcyBhIHNp
bmdsZSBwcm92aWRlciwgdGhpcyBjb21tZW50IGRvZXMKbm90IG1ha2Ugc2Vuc2UsIGFuZCBiZWxv
bmdzIHRvIHRoZSBjb21taXQgdGhhdCBhZGRzIHRoZSBwcmVidWlsdCBnby4KCk5vdCByZWxhdGVk
IHRvIHRoaXMgcGF0Y2gsIGJ1dCBzdGlsbCByZWxldmFudCB0byB0aGUgZGlzY3Vzc2lvbjogaXQK
d291bGQgYmUgZXZlbiBiZXR0ZXIgaWYgd2UgY291bGQgYWxzbyBoYXZlIHRoZSBwb3NzaWJpbGl0
eSB0aGF0IHRoZQpzdGFnZS0zIGhhcyB0aGUgb3B0aW9uIG9mIGJlaW5nIGEgcHJlYnVpbHQgZ28u
CgpJbmRlZWQsIGl0IHdvdWxkIHN0aWxsIGJlIGludGVyZXN0aW5nIHRvIGJlIGFibGUgdG8gYnVp
bGQgdGhlIGZpbmFsIGdvCmZyb20gc291cmNlLCBidXQgdXNlIGEgcHJlYnVpbGQgYm9vdHN0cmFw
LgoKU28gdGhhdCB3b3VsZCBhbGxvdyBmb3IgdGhyZWUgc2l0dWF0aW9uczoKCiAgLSBmdWxsIHNv
dXJjZTogc3RhZ2UtMSwgc3RhZ2UtMiwgc3RhZ2UtMywgYW5kIGZpbmFsIGdvLCBhbGwgYnVpbHQg
ZnJvbQogICAgc291cmNlczsKCiAgLSBwcmVidWlsdCBzdGFnZS0zIChzbyBub3Qgc3RhZ2UtMSBh
bmQgbm8gc3RhZ2UtMiksIGJ1dCBmaW5hbCBidWlsdAogICAgZnJvbSBzb3VyY2VzOwoKICAtIG5v
IGJvb3RzdHJhcCBhdCBhbGwsIGFuZCBwcmVidWlsdCBmaW5hbCBnby4KCk9mIGNvdXJzZSwgdGhp
cyBpcyBfbm90XyByZXF1aXJlZCBmb3IgdGhpcyBzZXJpZXMgdG8gcHJvZ3Jlc3MuCgo+IFNpZ25l
ZC1vZmYtYnk6IFRob21hcyBQZXJhbGUgPHRob21hcy5wZXJhbGVAbWluZC5iZT4KPiAtLS0KCj4g
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvZ28vQ29uZmlnLmluLmhvc3QgYi9wYWNrYWdlL2dvL0NvbmZp
Zy5pbi5ob3N0Cj4gaW5kZXggN2VkZjQ1ODUwZC4uYTIxM2VlOTRiZiAxMDA2NDQKPiAtLS0gYS9w
YWNrYWdlL2dvL0NvbmZpZy5pbi5ob3N0Cj4gKysrIGIvcGFja2FnZS9nby9Db25maWcuaW4uaG9z
dAo+IEBAIC0zMiw2ICszMiwzOCBAQCBjb25maWcgQlIyX1BBQ0tBR0VfSE9TVF9HT19IT1NUX0FS
Q0hfU1VQUE9SVFMKPiAgCWRlZmF1bHQgeQo+ICAJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9IT1NU
X0dPX0JPT1RTVFJBUF9TVEFHRTNfQVJDSF9TVVBQT1JUUwo+ICAKPiArY29uZmlnIEJSMl9QQUNL
QUdFX0hPU1RfR08KClNvIG5vdywgYWxsIGdvIHBhY2thZ2VzIGFyZSBicm9rZW4sIGJlY2F1c2Ug
bm9uZSBzZWxlY3RzCkJSMl9QQUNLQUdFX0hPU1RfR08sIHdoaWNoIGlzIHJlcXVpcmVkIGZvciB0
aGUgdmlydHVhbC1wYWNsYWdlIGluZnJhLgoKVG8gImZpeCIgdGhhdCBpc3N1ZSwgdGhlcmUgYXJl
IHR3byBvcHRpb25zOgoKICAtIGZpeCBhbGwgcGFja2FnZSBpbiB0aGlzIHZlcnkgcGF0Y2gsIGJ1
dCBpdCBpcyBhIGJpdCBodWdlLCBvcgoKICAtIGludHJvZHVjZSBCUjJfUEFDS0FHRV9IT1NUX0dP
IGZpcnN0IGFuZCBoYXZlIHBhY2thZ2VzIHNlbGVjdCBpdDsKICAgIGJhc2ljYWxseSB0aGF0J3Mg
eW91ciBuZXh0IHBhdGNoLCBidXQgaXQgc2hvdWxkIGNvbWUgZmlyc3Q6CgogICAgICAgIGNvbmZp
ZyBCUjJfUEFDS0FHRV9IT1NUX0dPCiAgICAgICAgICAgIGJvb2wKICAgICAgICAgICAgZGVwZW5k
cyBvbiBCUjJfUEFDS0FHRV9IT1NUX0dPX0JPT1RTVFJBUF9TVEFHRTNfQVJDSF9TVVBQT1JUUwoK
ICAgICAgICBjb25maWcgQlIyX1BBQ0tBR0VfQkFMRU5BX0VOR0lORQogICAgICAgICAgICBkZXBl
bmRzIG9uIEJSMl9QQUNLQUdFX0hPU1RfR09fQk9PVFNUUkFQX1NUQUdFM19BUkNIX1NVUFBPUlRT
CiAgICAgICAgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9IT1NUX0dPCgogICAgYW5kIHRoZW4gdGhp
cyBwYXRjaCBjb21lcyBpbiB0byBpbnRyb2R1Y2UgdGhlIGhvc3QgdmFyaWFudC4KClRoaXMgd2F5
LCB3ZSBoYXZlIGEgc2VyaWVzIHRoYXQgaXMgYmlzZWN0YWJsZS4KCkFsc28sIEkgc2VlIHRoYXQg
eW91IG1vZGVsZWQgdGhlIHNvbHV0aW9uIGFmdGVyIHRoZSBydXN0IG9uZSwgYW5kIHRoaXMKaXMg
Z29vZC4KCkhvd2V2ZXIsIEkgZG9uJ3QgdGhpbmsgdGhlcmUgaXMgYSBuZWVkIGZvciBhIHByb21w
dCBmb3IKQlIyX1BBQ0tBR0VfSE9TVF9HTy4gSXQgY2FuIHZlcnkgd2VsbCBiZSBhIHByb21wdC1s
ZXNzIHN5bWJvbCwgYXMKcGFja2FnZXMgbmVlZCB0byBzZWxlY3QgaXQgYW55d2F5LgoKQWxzbywg
dGhlcmUgaXMgKEkgdGhpbmspIG5vIHJlYXNvbiB0byBlbmFibGUgQlIyX1BBQ0tBR0VfSE9TVF9H
TyB3aGVuIG5vCnBhY2thZ2UgbmVlZHMgaXQuIFBvc3QtYnVpbGQvZmFrZXJvb3QvaW1hZ2Ugc2Ny
aXB0cyBzaG91bGQgbm90IG5lZWQgdGhlCmdvIGNvbXBpbGVyIGVpdGhlciwgc28gSSBkb247dCB0
aGluayB0aGVyZSBpcyBhbiBhY3R1YWwgbmVlZCBmb3IgYQpwcm9tcHQuLi4KClstLVNOSVAtLV0K
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9nby9nby9nby5tayBiL3BhY2thZ2UvZ28vZ28tc3JjL2dv
LXNyYy5tawo+IHNpbWlsYXJpdHkgaW5kZXggNjglCj4gcmVuYW1lIGZyb20gcGFja2FnZS9nby9n
by9nby5tawo+IHJlbmFtZSB0byBwYWNrYWdlL2dvL2dvLXNyYy9nby1zcmMubWsKPiBpbmRleCBj
M2M0MDkyMmY0Li45ZDczYzdjNjkyIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvZ28vZ28vZ28ubWsK
PiArKysgYi9wYWNrYWdlL2dvL2dvLXNyYy9nby1zcmMubWsKPiBAQCAtMSwyMSArMSwyMiBAQAo+
ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAjCj4gLSMgZ28KPiArIyBnby1zcmMKCkkgaGF2
ZW4ndCByZXZpZXdlZCB0aGUgcy9HTy9HT19TUkMvIHRyYW5zaXRpb247IHRoYXQncyBtb3N0bHkK
bWVjaGFuaWNhbCwgc28gSSBkb247dCBleHBlY3QgdG9vIG11Y2ggc3VycHJpc2UuCgpFeGNlcHQg
b25lIHBvaW50OmlmIGFueSBvZiB0aG9zZSBzeW1ib2wgaXMgdXNlZCBlbHNld2hlcmUsIHRoZXkg
bmVlZCB0bwpiZSBmaXhlZCBhcyB3ZWxsLi4uIEJ1dCB1bmxpa2UgcnVzdCwgdGhlcmUgZG9lcyBu
b3Qgc2VlbSBsaWtlIHRoZXJlIGFyZQpwYWNrYWdlcyB0aGF0IGJ1aWxkIGdvIHN0dWZmIGFzIHBh
cnQgb2YgYW5vdGhlciBlY29zeXN0ZW0gKMOgLWxhCnB5dGhvbitydXN0KS4KCkhtbS4uLiBIT1NU
X0dPX0NPTU1PTl9FTlYgaXMgdXNlZCBpbiB0aGUgcGtnLWdvbGFuZyBpbmZyYSwgYnV0IEkgY291
bGQKbm90IHNwb3QgYW55dGhpbmcgZWxzZSBvbiBhIGN1cnNvcnkgbG9vay4gIkl0IHNob3VsZCBi
ZSBmaW5lISIKClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgotLSAKLi0tLS0tLS0tLS0tLS0tLS0t
Li0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0t
LS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkg
UklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2Fy
ZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCAr
MzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwg
IFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8q
XF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0t
LS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
