Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7882C36002
	for <buildroot@archiver.kernel.org>; Sun,  6 Apr 2025 20:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CA2260F1B;
	Sun,  6 Apr 2025 20:02:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LDuiBAGX75im; Sun,  6 Apr 2025 20:02:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8930660DEF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8930660DEF;
	Sun,  6 Apr 2025 20:02:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 47462DA
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 20:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 391D740BFA
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 20:02:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 12kV7lVWVy_X for <buildroot@buildroot.org>;
 Sun,  6 Apr 2025 20:02:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 526C740B87
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 526C740B87
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 526C740B87
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 20:02:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id B1554780389;
 Sun,  6 Apr 2025 22:02:06 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 06 Apr 2025 22:02:06 +0200
MIME-Version: 1.0
Date: Sun, 06 Apr 2025 22:02:06 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250403213634.2412177-1-thomas.petazzoni@bootlin.com>
References: <20250403213634.2412177-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <069561f818635b5be4c0506077a72244@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743969727;
 bh=wQTB0ODivi1EtzzGsB9a4uyJqVLcaTsc+QUSyKYW+ZI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=l1oO6NVm2+125mDcMpbFWJQgh8k0VSVudf29v9uM0/+iu5mXWybmQJkwiWhP0U8M/
 MXFHlx4+tlWVUh6hkM/0vZjmCBW9dD0w2dhAeb9fzT3SUzfwLpjNeIakPVa6V0rzcF
 TSo0FZUJZxm2/TYKaQ7uwe16SwWf+WpfvYZooxYSw3sVpApIeWrdxujs1NtEIf+8f4
 /CQ9CbyMJ/SXSS4H+D+oauJqW61xSZAtlZlHHGE2o6Ei36m8Wwu76l9EXjxJYrnYu4
 KDuhFzDLS88ReVMwaZhRYII8cIY0bP+sXiRtGVovcO8E7/cmH8UsexfKl7ce4smCmH
 Hbwc8d9y4zwPQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=l1oO6NVm
Subject: Re: [Buildroot] [PATCH] package/uclibc: add patch to fix
 reallocarray() definition
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

T24gMDMvMDQvMjAyNSAyMzozNiwgVGhvbWFzIFBldGF6em9uaSB2aWEgYnVpbGRyb290IHdyb3Rl
Ogo+IHVDbGliYy1uZyB1bmNvbmRpdGlvbmFsbHkgZXhwb3NlcyBhIHJlYWxsb2NhcnJheSgpIHBy
b3RvdHlwZSwgYnV0IG9ubHkKPiBwcm92aWRlcyB0aGUgaW1wbGVtZW50YXRpb24gd2hlbiB0aGUg
bWFsbG9jLXN0YW5kYXJkIGltcGxlbWVudGF0aW9uIGlzCj4gc2VsZWN0ZWQgaW4gdGhlIGNvbmZp
Z3VyYXRpb24uCj4gCj4gQXMgbm9NTVUgY29uZmlndXJhdGlvbnMgY2FuJ3QgdXNlIG1hbGxvYy1z
dGFuZGFyZCwgdGhleSB1c2UgbWFsbG9jIG9yCj4gbWFsbG9jLXNpbXBsZSB0aGF0IGRvbid0IHBy
b3ZpZGUgcmVhbGxvY2FycmF5KCkuCj4gCj4gQXMgYSByZXN1bHQgb2YgcmVhbGxvY2FycmF5KCkg
YmVpbmcgbWlzc2luZywgc29tZSBwYWNrYWdlcyBzdWNoIGFzCj4gdXRpbC1saW51eCBwcm92aWRl
IHRoZWlyIG93biByZXBsYWNlbWVudCBpbXBsZW1lbnRhdGlvbi4uLiBidXQgaXRzCj4gcHJvdG90
eXBlIGNsYXNoZXMgd2l0aCB0aGUgb25lIHByb3ZpZGVkIGJ5IHVDbGliYywgY2F1c2luZyBidWls
ZAo+IGZhaWx1cmVzIHN1Y2ggYXM6Cj4gCj4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGxpYi9jb2xv
ci1uYW1lcy5jOjc6Cj4gLi9pbmNsdWRlL2MuaDo1ODY6MjE6IGVycm9yOiBzdGF0aWMgZGVjbGFy
YXRpb24gb2Yg4oCYcmVhbGxvY2FycmF54oCZIAo+IGZvbGxvd3Mgbm9uLXN0YXRpYyBkZWNsYXJh
dGlvbgo+ICAgNTg2IHwgc3RhdGljIGlubGluZSB2b2lkICpyZWFsbG9jYXJyYXkodm9pZCAqcHRy
LCBzaXplX3Qgbm1lbWIsIAo+IHNpemVfdCBzaXplKQo+ICAgICAgIHwgICAgICAgICAgICAgICAg
ICAgICBefn5+fn5+fn5+fn4KPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gLi9pbmNsdWRlL2MuaDox
NjoKPiAvaG9tZS90aG9tYXMvcHJvamV0cy9idWlsZHJvb3Qvb3V0cHV0L2hvc3QvYXJtLWJ1aWxk
cm9vdC11Y2xpbnV4LXVjbGliY2dudWVhYmkvc3lzcm9vdC91c3IvaW5jbHVkZS9zdGRsaWIuaDo4
OTg6MTQ6IAo+IG5vdGU6IHByZXZpb3VzIGRlY2xhcmF0aW9uIG9mIOKAmHJlYWxsb2NhcnJheeKA
mSB3aXRoIHR5cGUg4oCYdm9pZCAqKHZvaWQgKiwgCj4gc2l6ZV90LCAgc2l6ZV90KeKAmSB7YWth
IOKAmHZvaWQgKih2b2lkICosIHVuc2lnbmVkIGludCwgIHVuc2lnbmVkIGludCnigJl9Cj4gICA4
OTggfCBleHRlcm4gdm9pZCAqcmVhbGxvY2FycmF5ICh2b2lkICpfX3B0ciwgc2l6ZV90IF9fbSwg
c2l6ZV90IAo+IF9fbik7Cj4gICAgICAgfCAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+Cj4gbWFr
ZVszXTogKioqIFtNYWtlZmlsZToxMjM1NDogbGliL2xpYnRjb2xvcnNfbGEtY29sb3ItbmFtZXMu
bG9dIEVycm9yIDEKPiAKPiBUaGlzIGlzIGFkZHJlc3NlZCBieSBhIHBhdGNoIG9uIHVDbGliYywg
c3VibWl0dGVkIHVwc3RyZWFtLCB3aGljaAo+IG1ha2VzIHN1cmUgdGhlIHByb3RvdHlwZSBpcyBv
bmx5IGV4cG9zZWQgd2hlbiB0aGUgaW1wbGVtZW50YXRpb24gaXMKPiBwcm92aWRlZC4KPiAKPiBG
aXhlczoKPiAKPiAgIAo+IGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy8x
NTdhYTgyYWE0Y2Q1N2VhY2M0ZGVmZTZjYWNlMTZlNDY0MjYxZTlhLyAKPiAoUklTQy1WIG5vTU1V
KQo+ICAgCj4gaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzL2NlMWEyNGMx
NDY1YjgyNjg2YWUzNzVhYzY4OGE1NTNmYjY1ZGY1ZWEvIAo+IChBUk0gbm9NTVUpCj4gCj4gU2ln
bmVkLW9mZi1ieTogVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNv
bT4KCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
