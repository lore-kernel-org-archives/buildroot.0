Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A61C47DD9
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 18:27:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 347D340130;
	Wed, 28 Feb 2024 18:27:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JOyzJwGyu2su; Wed, 28 Feb 2024 18:27:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E76194016F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E76194016F;
	Wed, 28 Feb 2024 18:27:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7F1101BF3D5
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 18:27:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6BABE81854
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 18:27:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l43iByzADi4K for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 18:27:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 36A9081836
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36A9081836
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 36A9081836
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 18:27:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 8C03513F8B3;
 Wed, 28 Feb 2024 19:27:25 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:51830])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 28 Feb 2024 19:27:25 +0100
MIME-Version: 1.0
Date: Wed, 28 Feb 2024 19:27:25 +0100
From: Julien Olivain <ju.o@free.fr>
To: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <90f5d326-0b04-495e-9b6d-d25ebfa59cb4@smile.fr>
References: <20240227213517.241837-1-ju.o@free.fr>
 <90f5d326-0b04-495e-9b6d-d25ebfa59cb4@smile.fr>
User-Agent: Webmail Free/1.6.5
Message-ID: <f022f3c9135414a00bd69b5c1f41239d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1709144846;
 bh=QxjvXzA9fezVh9878VwLTnNMM/jF5ZSG7AES9+/kIhY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ooIFdESGvGF0kHdK5lR6IQQgTVtA/eiFtL/1DZstXTbOUCdH1l9z8Q9cLEc1I/vZH
 190OaNoHQ1Wjnm7DZgVSngTI65ktY/5rDKYcIoo+WAB9RAH1JkyKOmvp5dCkkWAmCz
 Onvct716bm/a7ICsJgUettZLQmIlA+4eYy5wsnyNd51oZeKimUE1bLjgoWRYnyNy/b
 BDWsvO2hsPz5Cd3IKKKmOPOSn7isXfCl+h1XR1goXEo/BJWcwXSCh5EYUgPfDyuii0
 ST1NOvqem6ZZFZooykTGm4t/RsYgviVONzeTT2hudu9P6ArAlllchautT1y7nOtJ4x
 u37qWTIdZbtxQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ooIFdESG
Subject: Re: [Buildroot] [PATCH 1/1] boot/syslinux: fix build with gnu-efi
 >= 3.0.16
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUm9tYWluLAoKT24gMjcvMDIvMjAyNCAyMzozMSwgUm9tYWluIE5hb3VyIHdyb3RlOgo+IEhp
IEp1bGllbiwKPiAKPiBMZSAyNy8wMi8yMDI0IMOgIDIyOjM1LCBKdWxpZW4gT2xpdmFpbiBhIMOp
Y3JpdMKgOgo+PiBDb21taXQgZmE5ODkzYWQ4ZiAicGFja2FnZS9nbnUtZWZpOiBidW1wIHRvIHZl
cnNpb24gMy4wLjE3IiB1cGRhdGVkCj4+IGdudS1lZmkuIFRoaXMgdXBkYXRlIGludHJvZHVjZWQg
c3lzbGludXggYnVpbGQgZmFpbHVyZSwgYXMgcmVwb3J0ZWQKPj4gaW4gWzFdLgo+PiAKPj4gVGhp
cyBjb21taXQgYWRkcyBhIHBhY2thZ2UgcGF0Y2ggdG8gZml4IHRoaXMgaXNzdWUuIEZvciB0ZWNo
bmljYWwKPj4gZGV0YWlscyBvZiB0aGUgaXNzdWUsIHNlZSB0aGUgcGFja2FnZSBwYXRjaCBjb21t
aXQgbG9nLgo+PiAKPj4gRml4ZXM6Cj4+IC0gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5v
cmcvYnVpbGRyb290Ly0vam9icy82MjU2ODgwOTM3Cj4+IC0gaHR0cHM6Ly9naXRsYWIuY29tL2J1
aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy82MjU2ODgwOTQ5Cj4+IAo+PiBbMV0gCj4+IGh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9waXBlcm1haWwvYnVpbGRyb290LzIwMjQtRmVicnVh
cnkvNjg1OTcxLmh0bWwKPj4gCj4+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBPbGl2YWluIDxqdS5v
QGZyZWUuZnI+Cj4+IC0tLQo+PiAgLmNoZWNrcGFja2FnZWlnbm9yZSAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgIDEgKwo+PiAgLi4uc3RkZGVmLmgtYWRkLXdjaGFyX3QtdHlwZS1kZWZpbml0
aW9uLnBhdGNoIHwgNTggCj4+ICsrKysrKysrKysrKysrKysrKysKPj4gIDIgZmlsZXMgY2hhbmdl
ZCwgNTkgaW5zZXJ0aW9ucygrKQo+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IAo+PiBib290L3N5c2xp
bnV4LzAwMTktc3RkZGVmLmgtYWRkLXdjaGFyX3QtdHlwZS1kZWZpbml0aW9uLnBhdGNoCj4+IAo+
PiBkaWZmIC0tZ2l0IGEvLmNoZWNrcGFja2FnZWlnbm9yZSBiLy5jaGVja3BhY2thZ2VpZ25vcmUK
Pj4gaW5kZXggYTZjYzU4YzQ0OGMuLmE5OGE1M2ZiZjM2IDEwMDY0NAo+PiAtLS0gYS8uY2hlY2tw
YWNrYWdlaWdub3JlCj4+ICsrKyBiLy5jaGVja3BhY2thZ2VpZ25vcmUKPj4gQEAgLTExOCw2ICsx
MTgsNyBAQCAKPj4gYm9vdC9zeXNsaW51eC8wMDEzLUZpeC1idWlsZC13aXRoLWdudS1lZmktdmVy
c2lvbi0zLjAuOS5wYXRjaCBVcHN0cmVhbQo+PiAgCj4+IGJvb3Qvc3lzbGludXgvMDAxNC1GaXgt
YnVpbGQtd2l0aC1iaW51dGlscy1ub3RlLWdudS1wcm9wZXJ0eS1zZWN0aW9uLnBhdGNoIAo+PiBV
cHN0cmVhbQo+PiAgCj4+IGJvb3Qvc3lzbGludXgvMDAxNi1Xb3JrYXJvdW5kLW11bHRpcGxlLWRl
ZmluaXRpb24tb2Ytc3ltYm9sLWVycm9ycy5wYXRjaCAKPj4gVXBzdHJlYW0KPj4gIAo+PiBib290
L3N5c2xpbnV4LzAwMTctUmVwbGFjZS1idWlsdGluLXN0cmxlbi10aGF0LWFwcGVhcnMtdG8tZ2V0
LW9wdGltaXplZC5wYXRjaCAKPj4gVXBzdHJlYW0KPj4gK2Jvb3Qvc3lzbGludXgvMDAxOS1zdGRk
ZWYuaC1hZGQtd2NoYXJfdC10eXBlLWRlZmluaXRpb24ucGF0Y2gKPiAKPiBXZSB3YW50IHRvIHJl
bW92ZSAuY2hlY2twYWNrYWdlaWdub3JlIGluIGEgbm90IHRvbyBmYXIgZnV0dXJlLCBwbGVhc2Ug
Cj4gYWRkIGFuCj4gdXBzdHJlYW0gc3RhdHVzIHRhZyBpbiB0aGUgcGF0Y2ggCj4gMDAxOS1zdGRk
ZWYuaC1hZGQtd2NoYXJfdC10eXBlLWRlZmluaXRpb24ucGF0Y2gKPiBpdHNlbGYuIEV2ZW4gaWYg
dXBzdHJlYW0gaXMgbm90IHZlcnkgYWN0aXZlIChsYXN0IGNvbW1pdCBpcyA1IHllYXJzIAo+IGFn
bykuCgpJIHNlbnQgYSB2MiBmaXhpbmcgdGhhdDoKaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9y
Zy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDI0MDIyODE4MTQxMS4xMDE3NC0xLWp1Lm9AZnJl
ZS5mci8KCkkgaW5pdGlhbGx5IHNldCBhbiBleGNsdXNpb24gYmVjYXVzZSBteSByZWdpc3RyYXRp
b24gdG8gdGhlIGxpc3Qgd2FzIApzbG93LiBJIGFsc28gbm90ZWQKdGhlIHNvbWV3aGF0IHNsb3cg
YWN0aXZpdHkgb2YgdGhlIHByb2plY3QuIFdoYXQgd291bGQgYmUgeW91ciAKcmVjb21tZW5kYXRp
b24gZm9yIHRoZQoiVXBzdHJlYW06IiB0YWcsIGluIHRoZSBjYXNlIGEgcGF0Y2ggZG9lcyBhcHBs
eSB1cHN0cmVhbSwgYnV0IHRoZSBmaXJzdCAKdGltZSBzdWJtaXNzaW9uCnRha2VzIGEgYml0IGxv
bmdlcj8gIFNvbWV0aGluZyBsaWtlICJVcHN0cmVhbTogQXBwbGljYWJsZSAoYnV0IG5vdCAKcHJv
cG9zZWQgeWV0KSI/CgpCZXN0IHJlZ2FyZHMsCgpKdWxpZW4uCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
