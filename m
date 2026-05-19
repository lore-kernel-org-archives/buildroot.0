Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9BD4CD4F5B
	for <buildroot@archiver.kernel.org>; Tue, 19 May 2026 19:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31F1A60BB6;
	Tue, 19 May 2026 19:49:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id taNAR8hEREp4; Tue, 19 May 2026 19:49:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44C2560BB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779220177;
	bh=DO9t6mlBEqeKZtILX8FSei9pueRovmbX+eOsOTEoP+U=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=G+ODMJHjuWs6w6762deJNp5QhBS6IbRiu5dU40DCk01ECfKUP+LlNRFLiKj/6otlU
	 xC/QhWexW8qRtp1ms5B3pB03PxBxJaNjPyaprJF8HAqYD1Ixdii5i/0jKt92g/Nu4Y
	 aZf+LfdqRk+2t7OkxB+O5yOf4xA0Za78pmBGtLdaqkALxrcKjQiuaEGeXGXQuGeHKm
	 tfyWtucc0/HE5dC5EciXAmwYWzNsbj8MiRF7BmuYyPPTGN+7dPNvvDA7ruBz/3pHXr
	 njcYngfzZVUM1LCGIzj/GE0CJdivCkIlxb1EZ4+HLDyAZyNaa1nbpMzofhOiX+Y+pw
	 aWvuYUYBvV+qA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44C2560BB3;
	Tue, 19 May 2026 19:49:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BA29E1B2
 for <buildroot@buildroot.org>; Tue, 19 May 2026 19:49:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AAFAD81BB0
 for <buildroot@buildroot.org>; Tue, 19 May 2026 19:49:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UwVdbmKZZ1GA for <buildroot@buildroot.org>;
 Tue, 19 May 2026 19:49:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8D65F81B9A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D65F81B9A
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8D65F81B9A
 for <buildroot@buildroot.org>; Tue, 19 May 2026 19:49:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 9F4D778035B;
 Tue, 19 May 2026 21:49:28 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 19 May 2026 21:49:28 +0200
MIME-Version: 1.0
Date: Tue, 19 May 2026 21:49:28 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Alexis_Lothor=C3=A9?=
 <alexis.lothore@bootlin.com>
In-Reply-To: <20260519185732.1029402-1-bernd@kuhls.net>
References: <20260519185732.1029402-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <a87d2b8d5ea8b9d4fc9ef7d3635eb4ee@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1779220170;
 bh=cKXxIHQP4/0JIqYNu0jAyafVto4GsP4mbmgFz6Kvo48=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hi5T1KsCNqw0Wn5+SEsAcUaNqXrfQz1CmLzndIYokJradReRRxdG9yEjuXJsRwAYm
 BsSgs3yTA6JhV/O98at9Oli/nABYU7IA/Atsy6Z8DV6flkBj3ynhulL9QX1Z0d8zn2
 MzYuLEtH7OF1OAUH+ATBPR1a+5T5j92jDnZXDx6jQlND2/6mk5v0XVSqgazNaCAEeU
 /DBlCeWZfDrpkvRULWE+UJYOXevCMKcA6mbE/geE7Cw5r4VYCVMUT6LWmCb1+Cy5wg
 fEk50dBFS8DCTAIDk953k2rmJ5l87uAwHg3pGqGkvHEZNQ0J1/7RsXMPY45gjuebGW
 jNNaXs5Tz3oCQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=hi5T1KsC
Subject: Re: [Buildroot] [PATCH/next v2 1/1] package/libxmlsec1: bump
 version to 1.3.11
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQmVybmQsCgpUaGFua3MgZm9yIHRoZSB2Mi4KCk9uIDE5LzA1LzIwMjYgMjA6NTcsIEJlcm5k
IEt1aGxzIHdyb3RlOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9sc2gxMjMveG1sc2VjL3JlbGVhc2Vz
L3RhZy8xLjMuMTEKPiBodHRwczovL2dpdGh1Yi5jb20vbHNoMTIzL3htbHNlYy9yZWxlYXNlcy90
YWcvMS4zLjEwCj4gCj4gU3dpdGNoZWQgdG8gdGFyYmFsbCBoYXNoIHByb3ZpZGVkIGJ5IHVwc3Ry
ZWFtLgo+IAo+IERpc2FibGUgdGhlIGJ1aWxkIG9mIHVuaXRfdGVzdHMvdHJhbnNmb3JtX2hlbHBl
cnNfdW5pdF90ZXN0cyB0byBmaXgKPiBhIGJ1aWxkIGVycm9yIHdoaWNoIHdvdWxkIGJlIGludHJv
ZHVjZWQgYnkgdGhpcyBidW1wOgo+IAo+ICAgdW5pdF90ZXN0cy90cmFuc2Zvcm1faGVscGVyc191
bml0X3Rlc3RzLmM6MjkxOjk6IGVycm9yOiBpbXBsaWNpdAo+ICAgZGVjbGFyYXRpb24gb2YgZnVu
Y3Rpb24g4oCYeG1sRGVidWdEdW1wRG9jdW1lbnTigJkKPiAgIFstV2ltcGxpY2l0LWZ1bmN0aW9u
LWRlY2xhcmF0aW9uXQo+IAo+IFRoZSBidWlsZCBlcnJvciBvY2N1cnMgZHVlIHRvIHVwc3RyZWFt
IGNvbW1pdAo+IGh0dHBzOi8vZ2l0aHViLmNvbS9sc2gxMjMveG1sc2VjL2NvbW1pdC82MzNjMDZl
NzU2YTM3NzBiNDQxNDc3MWQ3NjkyYzNmMjkyMzViNDljCj4gCj4gd2hpY2ggYWRkZWQgdW5pdF90
ZXN0cy90cmFuc2Zvcm1faGVscGVyc191bml0X3Rlc3RzLmMgdG8gdmVyc2lvbiAxLjMuMTAKPiBh
bmQgbWFrZXMgdXNlIG9mIHhtbERlYnVnRHVtcERvY3VtZW50KCkgd2hpY2ggaXMgcGFydCBvZiBs
aWJ4bWwyOgo+IGh0dHBzOi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS9saWJ4bWwyLy0vYmxvYi92
Mi4xNS4zL2luY2x1ZGUvbGlieG1sL2RlYnVnWE1MLmg/cmVmX3R5cGU9dGFncyNMNTgKPiAKPiBi
dXQgb25seSB3aGVuIGxpYnhtbDIgd2FzIGJ1aWxkIHdpdGggLS13aXRoLWRlYnVnOgo+IGh0dHBz
Oi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS9saWJ4bWwyLy0vYmxvYi92Mi4xNS4zL2luY2x1ZGUv
bGlieG1sL2RlYnVnWE1MLmg/cmVmX3R5cGU9dGFncyNMMjAKPiAKPiBCdWlsZHJvb3QgYnVpbGRz
IHRoZSB0YXJnZXQgcGFja2FnZSBvZiBsaWJ4bWwyIHdpdGggLS13aXRob3V0LWRlYnVnOgo+IGh0
dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2Jsb2IvYzE3ZDExMGIx
MGQ0NDYyODIyZDcxMmUzMjdlZTA1NzljZjQ1YWYxMC9wYWNrYWdlL2xpYnhtbDIvbGlieG1sMi5t
ayNMMjUKPiBzbyB3ZSBuZWVkIHRvIGRpc2FibGUgdGhlIGJ1aWxkIG9mIHhtbHNlY191bml0X3Rl
c3RzLgo+IAo+IFRoZSBob3N0LWxpYnhtbHNlYzEgcGFja2FnZSBpcyBub3QgYWZmZWN0ZWQgYmVj
YXVzZSBob3N0LWxpYnhtbDIgZG9lcwo+IG5vdCBtYWtlIHVzZSBvZiAtLXdpdGhvdXQtZGVidWcu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KPiAtLS0K
PiB2MjogZml4ZWQgbGlieG1sMi1yZWxhdGVkIGJ1aWxkIGVycm9yIChKdWxpZW4pCj4gCj4gIHBh
Y2thZ2UvbGlieG1sc2VjMS9saWJ4bWxzZWMxLmhhc2ggfCA1ICsrKy0tCj4gIHBhY2thZ2UvbGli
eG1sc2VjMS9saWJ4bWxzZWMxLm1rICAgfCA5ICsrKysrKysrLQo+ICAyIGZpbGVzIGNoYW5nZWQs
IDExIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2th
Z2UvbGlieG1sc2VjMS9saWJ4bWxzZWMxLmhhc2ggCj4gYi9wYWNrYWdlL2xpYnhtbHNlYzEvbGli
eG1sc2VjMS5oYXNoCj4gaW5kZXggOWUwZTY3ZTczMi4uZGI2ZTY0NTdlOSAxMDA2NDQKPiAtLS0g
YS9wYWNrYWdlL2xpYnhtbHNlYzEvbGlieG1sc2VjMS5oYXNoCj4gKysrIGIvcGFja2FnZS9saWJ4
bWxzZWMxL2xpYnhtbHNlYzEuaGFzaAo+IEBAIC0xLDMgKzEsNCBAQAo+ICsjIEZyb20gaHR0cHM6
Ly9naXRodWIuY29tL2xzaDEyMy94bWxzZWMvcmVsZWFzZXMvdGFnLzEuMy4xMQo+ICtzaGEyNTYg
IAo+IDUzNjc1ZTk4ZmE4M2I0ODIwMWQyNGY3YmZiY2FlYWExYjUxNDk2YjhiMTlmZjk2OTc4NTg1
NmJkZWIxOTZhZjMgIAo+IHhtbHNlYzEtMS4zLjExLnRhci5nego+ICAjIExvY2FsbHkgY29tcHV0
ZWQKPiAtc2hhMjU2ICAKPiBhNjMxYzhjZDdhNmI4NmU2YWRiOWY1YjkzNWQ0NWE5Y2Y5NzY4YjNj
YjA5MGQ0NjFlOGViOWQwNDNjZjliNjJmICAKPiB4bWxzZWMxLTEuMy45LnRhci5nego+IC1zaGEy
NTYgIAo+IGQ1ZTkzODg1MzQyNTYzNjBjNmEwMDlkNGYxOWFiMmI4ZDZlYzBhYTdmZjMyYTUxZTIy
ZDg5OWVkN2JlYjVjNDggIAo+IENvcHlyaWdodAo+ICtzaGEyNTYgIAo+IGE2ZDIxNzE1MWYzZDQy
M2UwNjYzOWMwNzViYWQ4ZTQ0MmVhMTkzNjgyOGQzYTY2MDEwNTEyMmVmNzhlY2Q5NmQgIAo+IENv
cHlyaWdodAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYnhtbHNlYzEvbGlieG1sc2VjMS5tayAK
PiBiL3BhY2thZ2UvbGlieG1sc2VjMS9saWJ4bWxzZWMxLm1rCj4gaW5kZXggMjkyMjJiYzE2Zi4u
NjI1ODU0MDFlYSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2xpYnhtbHNlYzEvbGlieG1sc2VjMS5t
awo+ICsrKyBiL3BhY2thZ2UvbGlieG1sc2VjMS9saWJ4bWxzZWMxLm1rCj4gQEAgLTQsNyArNCw3
IEBACj4gICMKPiAgCj4gIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAKPiAtTElCWE1MU0VDMV9W
RVJTSU9OID0gMS4zLjkKPiArTElCWE1MU0VDMV9WRVJTSU9OID0gMS4zLjExCgpXaXRoIHRoaXMg
bmV3IHZlcnNpb24sIHRoZXJlIGlzIHN0aWxsIHR3byBidWlsZCBmYWlsdXJlczoKaHR0cHM6Ly9n
aXRsYWIuY29tL2pvbGl2YWluL2J1aWxkcm9vdC8tL3BpcGVsaW5lcy8yNTM4MzQwODAxCgpDb3Vs
ZCB5b3UgaGF2ZSBhIGxvb2ssIHBsZWFzZT8KCj4gIExJQlhNTFNFQzFfU09VUkNFID0geG1sc2Vj
MS0kKExJQlhNTFNFQzFfVkVSU0lPTikudGFyLmd6Cj4gIExJQlhNTFNFQzFfU0lURSA9IAo+IGh0
dHBzOi8vZ2l0aHViLmNvbS9sc2gxMjMveG1sc2VjL3JlbGVhc2VzL2Rvd25sb2FkLyQoTElCWE1M
U0VDMV9WRVJTSU9OKQo+ICBMSUJYTUxTRUMxX0xJQ0VOU0UgPSBNSVQKPiBAQCAtMTQsNiArMTQs
MTMgQEAgTElCWE1MU0VDMV9ERVBFTkRFTkNJRVMgPSBsaWJ4bWwyIG9wZW5zc2wKPiAgSE9TVF9M
SUJYTUxTRUMxX0RFUEVOREVOQ0lFUyA9IGhvc3QtbGlieG1sMiBob3N0LW9wZW5zc2wKPiAgTElC
WE1MU0VDMV9BVVRPUkVDT05GID0gWUVTCj4gCj4gKyMgeG1sc2VjX3VuaXRfdGVzdHMgbmVlZHMg
eG1sRGVidWdEdW1wRG9jdW1lbnQoKSBmcm9tIGxpYnhtbDIgd2hpY2ggaXMKPiArIyBub3QgcHJl
c2VudCBpbiBidWlsZHJvb3QgYmVjYXVzZSBsaWJ4bWwyIGlzIGJ1aWxkIHdpdGggCj4gLS13aXRo
b3V0LWRlYnVnCj4gK2RlZmluZSBMSUJYTUxTRUMxX0RJU0FCTEVfVU5JVF9URVNUUwo+ICsJJChT
RUQpICdzL25vaW5zdF9QUk9HUkFNUyA9IHhtbHNlY191bml0X3Rlc3RzL25vaW5zdF9QUk9HUkFN
UyA9LycgCj4gJChARCkvYXBwcy9NYWtlZmlsZS5hbQo+ICtlbmRlZgo+ICtMSUJYTUxTRUMxX1BP
U1RfUEFUQ0hfSE9PS1MgKz0gTElCWE1MU0VDMV9ESVNBQkxFX1VOSVRfVEVTVFMKPiArCj4gIExJ
QlhNTFNFQzFfQ09ORl9PUFRTID0gXAo+ICAJLS1lbmFibGUtY3J5cHRvLWRsPW5vIFwKPiAgCS0t
d2l0aC1vcGVuc3NsIFwKPiAtLQo+IDIuNDcuMwoKQmVzdCByZWdhcmRzLAoKSnVsaWVuLgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
