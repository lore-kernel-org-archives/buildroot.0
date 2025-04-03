Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32605C3600C
	for <buildroot@archiver.kernel.org>; Thu,  3 Apr 2025 19:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF4D341318;
	Thu,  3 Apr 2025 19:51:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VAF9mdDEKYNg; Thu,  3 Apr 2025 19:51:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11D1341374
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11D1341374;
	Thu,  3 Apr 2025 19:51:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AF3C51F4
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 19:51:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC99F40ABE
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 19:51:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5gXNT6AbrgzY for <buildroot@buildroot.org>;
 Thu,  3 Apr 2025 19:51:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AD7AB400C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD7AB400C8
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AD7AB400C8
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 19:51:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id AF9FDB0057C;
 Thu,  3 Apr 2025 21:51:08 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:40748])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 03 Apr 2025 21:51:08 +0200
MIME-Version: 1.0
Date: Thu, 03 Apr 2025 21:51:08 +0200
From: Julien Olivain <ju.o@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20250403064750.116910-1-romain.naour@smile.fr>
References: <20250403064750.116910-1-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.10
Message-ID: <a0a3c53fa79fc5a1a5eae33bd60a9774@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743709869;
 bh=AP9BAgG19u5kbNU5nIGKfgr43y+f6X6AKTJrCdPknKo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DH/ggBpahcegdI7vD1uytIpIrmSy/zKDOBtMP4vugxaiUxZU9cfV6uyDeOAYUBJLz
 4qlnSW7/eY6zPn/cDruqTTFGxu2CKU+FRaDRC3Nqz7j5+6K3JNeum6l8/nCr32X0MO
 vXc0Ijjhh+9CK2YYuaQFiL+r4gVJ+zpVceZuF08hsuNPDDS++2Qxa6sULf6SooE9/p
 SiDKBHWV+3x3Q9ZWKmHOJn0VJv2H4ewhyomRy2ly8+GELnLo8sh3gSreuH6ZPMSlrl
 XJQ77FzMAeDiyi5Fu7WZNDLD1siEtxLOji3KKWqEsx70URyD1T8EYJ7YsBQdfDVEZx
 AB9u05iRMBS3A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=DH/ggBpa
Subject: Re: [Buildroot] [PATCH] support/download/svn: use 'svn info' whith
 LC_ALL=C
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

T24gMDMvMDQvMjAyNSAwODo0NywgUm9tYWluIE5hb3VyIHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4g
VXNlIHRoZSAnQycgbG9jYWxlIHdoZW4gcmV0cmlldmluZyB0aGUgZGF0ZSBvZiB0aGUgbGFzdCBj
aGFuZ2UgdXNpbmcKPiAnc3ZuIGluZm8nIHNpbmNlIHRoZSBzdm4gZG93bmxvYWQgaGVscGVyIHNj
cmlwdCBleHBlY3QKPiAiTGFzdCBDaGFuZ2VkIERhdGUiIHN0cmluZy4KPiAKPiBJZiBhbm90aGVy
IGxvY2FsZSBpcyB1c2VkLCB0aGUgJ2RhdGUnIGlzIGVtcHR5IHNvIHRoZSBnZW5lcmF0ZWQKPiBh
cmNoaXZlIChieSBta190YXJfZ3opIHdpbGwgbm90IG1hdGNoIHRoZSBleHBlY3RlZCBoYXNoIHNp
bmNlCj4gdGhlIGZpbGUgdGltZXN0YW1wIGlzIG5vdCBzZXQgcHJvcGVybHkuCj4gCj4gSWYgTEFO
Rz1mcl9GUi5VVEYtOCBpcyBkZWZpbmVkIGluIHRoZSBob3N0IHN5c3RlbSwgc3ZuIHByaW50IHNv
bWUKPiAiRnJlbmNoIGVuY3J5cHRlZCIgdGV4dDoKPiAKPiAgIGV2YWwgc3ZuIC0tbm9uLWludGVy
YWN0aXZlIC0tY29uZmlnLW9wdGlvbiAKPiBzZXJ2ZXJzOmdsb2JhbDpodHRwLXRpbWVvdXQ9MTAg
aW5mbyAKPiAnJ1wnJ2h0dHBzOi8vc3ZuLmNvZGUuc2YubmV0L3AveG1scnBjLWMvY29kZS9hZHZh
bmNlZEByMzE3NidcJycnCj4gICAuLi4KPiAgIERhdGUgZGUgbGEgZGVybmnDqHJlIG1vZGlmaWNh
dGlvbjogMjAyMy0wOS0wMiAxOToxMzozNSArMDIwMCAoc2FtLiAwMiAKPiBzZXB0LiAyMDIzKQo+
IAo+IGRpZmZvc2NvcGUgY29uZmlybSB0aGF0IHRoZSBmaWxlIHRpbWVzdGFtcCBpcyBub3Qgc2V0
IGNvcnJlY3RseQo+IGluIHRoZSBnZW5lcmF0ZWQgYXJjaGl2ZToKPiAKPiAkIGRpZmZvc2NvcGUg
Tk9LL2xpYnhtbHJwYy1yMzE3Ni1zdm41LnRhci5neiAKPiBPSy9saWJ4bWxycGMtcjMxNzYtc3Zu
NS50YXIuZ3oKPiAtLS0gTk9LL2xpYnhtbHJwYy1yMzE3Ni1zdm41LnRhci5nego+ICsrKyBPSy9s
aWJ4bWxycGMtcjMxNzYtc3ZuNS50YXIuZ3oKPiDilJzilIDilIAgbGlieG1scnBjLXIzMTc2LXN2
bjUudGFyCj4g4pSCIOKUnOKUgOKUgCBmaWxlIGxpc3QKPiDilIIg4pSCIEBAIC0xLDYyNiArMSw2
MjYgQEAKPiDilIIg4pSCIC0tcnctci0tci0tICAgMCAgICAgICAgMCAgICAgICAgMCAgICAgNjkz
NyAyMDI1LTA0LTAyIAo+IDAwOjAwOjAwLjAwMDAwMCBsaWJ4bWxycGMtcjMxNzYvR05VbWFrZWZp
bGUKPiDilIIg4pSCICstcnctci0tci0tICAgMCAgICAgICAgMCAgICAgICAgMCAgICAgNjkzNyAy
MDIzLTA5LTAyIAo+IDE3OjEzOjM1LjAwMDAwMCBsaWJ4bWxycGMtcjMxNzYvR05VbWFrZWZpbGUK
PiAKPiBGaXggdGhpcyBpc3N1ZSB1c2luZyAnQycgbG9jYWxlOgo+IAo+ICAgTENfQUxMPUMgZXZh
bCBzdm4gLS1ub24taW50ZXJhY3RpdmUgLS1jb25maWctb3B0aW9uIAo+IHNlcnZlcnM6Z2xvYmFs
Omh0dHAtdGltZW91dD0xMCBpbmZvIAo+ICcnXCcnaHR0cHM6Ly9zdm4uY29kZS5zZi5uZXQvcC94
bWxycGMtYy9jb2RlL2FkdmFuY2VkQHIzMTc2J1wnJycKPiAgIC4uLgo+ICAgTGFzdCBDaGFuZ2Vk
IERhdGU6IDIwMjMtMDktMDIgMTk6MTM6MzUgKzAyMDAgKFNhdCwgMDIgU2VwIDIwMjMpCj4gCj4g
Rml4ZXM6IDg5ZjVlOTg5MzIzYWNlODE1YTMyZmNlZDI3ZWFlZmVlMmY0NjY2ZGUKPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4KCkFwcGxpZWQg
dG8gbWFzdGVyLCB0aGFua3MuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
