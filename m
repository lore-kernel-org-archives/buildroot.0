Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D896C83F34
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:50:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A0D46061E;
	Thu, 17 Jul 2025 20:50:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xkDnwMC94TcB; Thu, 17 Jul 2025 20:50:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B96D60693
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B96D60693;
	Thu, 17 Jul 2025 20:50:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A1F8B226
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8881D60693
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:50:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JS1dXL8Ddjn8 for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:50:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 852626072A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 852626072A
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 852626072A
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:50:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 1950778034D;
 Thu, 17 Jul 2025 22:50:41 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 17 Jul 2025 22:50:40 +0200
MIME-Version: 1.0
Date: Thu, 17 Jul 2025 22:50:40 +0200
To: Arnout Vandecappelle <arnout@rnout.be>
Cc: Titouan Christophe <titouan.christophe@mind.be>,
 buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <02953971-578f-4bdd-9419-c577187226f2@rnout.be>
References: <20250716102159.306474-1-titouan.christophe@mind.be>
 <1f135eeb-13b6-4386-b6f2-bc389bbb8944@rnout.be>
 <02953971-578f-4bdd-9419-c577187226f2@rnout.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <4a10c5f49839683b30c09ac3c3ddd2bb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752785444;
 bh=DYjBu38+KIRmhKT7uopN92TikjswM3KM2VC1L13VrmM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KhKEcuC7MJfoRxe9QCqWDzUgLlblDXLTfnVMZkVf9GBrrMKnQPOzfK5HqmnyMaESQ
 H3EnF0ddBD6xWR9SR2q4kL3GPjm93WaeCL41b+my1cOGtvuKbR5akAxZk+/f33Fnfq
 u+E3x9LkCmQ9p+dXpqQVBI/NOYJxSoBN+CIAmDKJ+2TfJ54k5q2oq7j0EQs99DHtJ+
 F84U5bQuqpUPsZDjUNZJQsdk+7M5n+XN37hOhgCQ6WpOk9t/tusGvr8jfkm4/n/BMP
 WoU/4K2PKFXwV6EtZlQhAgQ90drf+vzsvkDbmRcWB0gXd13DykAxqfWLGmi9rdUe4x
 7T0/BuvSeq2IA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KhKEcuC7
Subject: Re: [Buildroot] [PATCH] package/python-aiohttp: security bump to
 v3.12.14
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

SGkgQXJub3V0LCBUaXRvdWFuLAoKT24gMTcvMDcvMjAyNSAyMjozOCwgQXJub3V0IFZhbmRlY2Fw
cGVsbGUgdmlhIGJ1aWxkcm9vdCB3cm90ZToKPiBPbiAxNy8wNy8yMDI1IDIyOjI5LCBBcm5vdXQg
VmFuZGVjYXBwZWxsZSB3cm90ZToKPj4gCj4+IAo+PiBPbiAxNi8wNy8yMDI1IDEyOjIxLCBUaXRv
dWFuIENocmlzdG9waGUgdmlhIGJ1aWxkcm9vdCB3cm90ZToKPj4+IFRoaXMgZml4ZXMgdGhlIGZv
bGxvd2luZyB2dWxuZXJhYmlsaXR5Ogo+Pj4gLSBDVkUtMjAyNS01MzY0MzoKPj4+IMKgwqDCoMKg
IEluIGFpb2h0dHAgcHJpb3IgdG8gdmVyc2lvbiAzLjEyLjE0LCB0aGUgUHl0aG9uIHBhcnNlciBp
cyAKPj4+IHZ1bG5lcmFibGUKPj4+IMKgwqDCoMKgIHRvIGEgcmVxdWVzdCBzbXVnZ2xpbmcgdnVs
bmVyYWJpbGl0eSBkdWUgdG8gbm90IHBhcnNpbmcgdHJhaWxlcgo+Pj4gwqDCoMKgwqAgc2VjdGlv
bnMgb2YgYW4gSFRUUCByZXF1ZXN0LiBJZiBhIHB1cmUgUHl0aG9uIHZlcnNpb24gb2YgYWlvaHR0
cCAKPj4+IGlzCj4+PiDCoMKgwqDCoCBpbnN0YWxsZWQgKGkuZS4gd2l0aG91dCB0aGUgdXN1YWwg
QyBleHRlbnNpb25zKSBvcgo+Pj4gwqDCoMKgwqAgQUlPSFRUUF9OT19FWFRFTlNJT05TIGlzIGVu
YWJsZWQsIHRoZW4gYW4gYXR0YWNrZXIgbWF5IGJlIGFibGUgCj4+PiB0bwo+Pj4gwqDCoMKgwqAg
ZXhlY3V0ZSBhIHJlcXVlc3Qgc211Z2dsaW5nIGF0dGFjayB0byBieXBhc3MgY2VydGFpbiBmaXJl
d2FsbHMgCj4+PiBvcgo+Pj4gwqDCoMKgwqAgcHJveHkgcHJvdGVjdGlvbnMuIFZlcnNpb24gMy4x
Mi4xNCBjb250YWlucyBhIHBhdGNoIGZvciB0aGlzIAo+Pj4gaXNzdWUuCj4+PiDCoMKgwqDCoCBo
dHRwczovL3d3dy5jdmUub3JnL0NWRVJlY29yZD9pZD1DVkUtMjAyNS01MzY0Mwo+Pj4gCj4+PiBT
aWduZWQtb2ZmLWJ5OiBUaXRvdWFuIENocmlzdG9waGUgPHRpdG91YW4uY2hyaXN0b3BoZUBtaW5k
LmJlPgo+PiAKPj4gIMKgQXBwbGllZCB0byAyMDI1LjAyLnggYW5kIDIwMjUuMDUueCwgdGhhbmtz
Lgo+IAo+ICBHYWgsIEkgbWVhbnQgdG8gbWFzdGVyIQoKVHJ5aW5nIHRvIGJ1aWxkIHRoaXMgcGFj
a2FnZSB3aXRoIHRoaXMgcGF0Y2ggZmFpbHMgd2l0aCBlcnJvcjoKCiAgICAgRVJST1IgTWlzc2lu
ZyBkZXBlbmRlbmNpZXM6CgkgICAgcGtnY29uZmlnCgpJcyB0aGVyZSBhIG1pc3NpbmcgZGVwZW5k
ZW5jeSBvbiBob3N0LXB5dGhvbi1wa2djb25maWc/ClBvc3NpYmx5IGludHJvZHVjZWQgYnkgdXBz
dHJlYW0gY29tbWl0OgpodHRwczovL2dpdGh1Yi5jb20vYWlvLWxpYnMvYWlvaHR0cC9jb21taXQv
NDA1NjM3NTFhZGYwMmI4MTFkNWFjZjk1Njk2YzA5NmE0ZGJkOWVkNAoKQ291bGQgeW91IGhhdmUg
YSBsb29rIGZvciBhIGZvbGxvd3VwIGZpeCAobm93IGl0IGlzIG1lcmdlZCk/Cgo+ICBSZWdhcmRz
LAo+ICBBcm5vdXQKPiAKPj4gCj4+ICDCoFJlZ2FyZHMsCj4+ICDCoEFybm91dAo+PiAKPj4+IC0t
LQo+Pj4gwqAgcGFja2FnZS9weXRob24tYWlvaHR0cC9weXRob24tYWlvaHR0cC5oYXNoIHwgNCAr
Ky0tCj4+PiDCoCBwYWNrYWdlL3B5dGhvbi1haW9odHRwL3B5dGhvbi1haW9odHRwLm1rwqDCoCB8
IDQgKystLQo+Pj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pCj4+PiAKPj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1haW9odHRwL3B5dGhv
bi1haW9odHRwLmhhc2ggCj4+PiBiL3BhY2thZ2UvcHl0aG9uLSBhaW9odHRwL3B5dGhvbi1haW9o
dHRwLmhhc2gKPj4+IGluZGV4IGFjMTJjYWZlZWEuLjBhYThkYmQzYmMgMTAwNjQ0Cj4+PiAtLS0g
YS9wYWNrYWdlL3B5dGhvbi1haW9odHRwL3B5dGhvbi1haW9odHRwLmhhc2gKPj4+ICsrKyBiL3Bh
Y2thZ2UvcHl0aG9uLWFpb2h0dHAvcHl0aG9uLWFpb2h0dHAuaGFzaAo+Pj4gQEAgLTEsNSArMSw1
IEBACj4+PiDCoCAjIG1kNSwgc2hhMjU2IGZyb20gaHR0cHM6Ly9weXBpLm9yZy9weXBpL2Fpb2h0
dHAvanNvbgo+Pj4gLW1kNcKgIDc4MzVmMjhlNDFhZGY2ZjA5NDY3NTMzZThkZTBjMTk5wqAgYWlv
aHR0cC0zLjExLjE0LnRhci5nego+Pj4gLXNoYTI1NsKgIAo+Pj4gZDZlZGM1MzhjNzQ4MGZhMGEz
YjJiZGQ3MDVmODAxMDA2MmQ3NDcwMDE5OGRhNTVkMTY0OThlMWI0OTU0OWI5YyAgCj4+PiBhaW9o
dHRwLTMuMTEuMTQudGFyLmd6Cj4+PiArbWQ1wqAgNGVkNjZkY2VjNjMxMDhhZTNhN2MwMWQwNDE1
YjRkZDnCoCBhaW9odHRwLTMuMTIuMTQudGFyLmd6Cj4+PiArc2hhMjU2wqAgCj4+PiA2ZTA2ZTEy
MGUzNGQ5MzEwMGRlNDQ4ZmQ5NDE1MjJlMTFkYWZhNzhlZjFhODkzYzE3OTkwMWI3ZDY2YWEyOWYy
ICAKPj4+IGFpb2h0dHAtMy4xMi4xNC50YXIuZ3oKPj4+IMKgICMgTG9jYWxseSBjb21wdXRlZCBz
aGEyNTYgY2hlY2tzdW1zCj4+PiDCoCBzaGEyNTbCoCAKPj4+IDlmODBkMGRiN2Q3NTVhOTQxZGI0
NTcyMTcyYzI3MGVjYmQ4ZjA4MmJhMjE1ZGRkMDk1OTg1OTQyZWQ5NGE5ZWIgIAo+Pj4gTElDRU5T
RS50eHQKPj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1haW9odHRwL3B5dGhvbi1haW9o
dHRwLm1rIAo+Pj4gYi9wYWNrYWdlL3B5dGhvbi0gYWlvaHR0cC9weXRob24tYWlvaHR0cC5tawo+
Pj4gaW5kZXggZDNlN2QxMmViNi4uZTUyYjZlODFjNSAxMDA2NDQKPj4+IC0tLSBhL3BhY2thZ2Uv
cHl0aG9uLWFpb2h0dHAvcHl0aG9uLWFpb2h0dHAubWsKPj4+ICsrKyBiL3BhY2thZ2UvcHl0aG9u
LWFpb2h0dHAvcHl0aG9uLWFpb2h0dHAubWsKPj4+IEBAIC00LDkgKzQsOSBAQAo+Pj4gwqAgIwo+
Pj4gICAKPj4+ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4+PiAtUFlUSE9OX0FJT0hUVFBfVkVS
U0lPTiA9IDMuMTEuMTQKPj4+ICtQWVRIT05fQUlPSFRUUF9WRVJTSU9OID0gMy4xMi4xNAo+Pj4g
wqAgUFlUSE9OX0FJT0hUVFBfU09VUkNFID0gYWlvaHR0cC0kKFBZVEhPTl9BSU9IVFRQX1ZFUlNJ
T04pLnRhci5nego+Pj4gLVBZVEhPTl9BSU9IVFRQX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhv
bmhvc3RlZC5vcmcvIAo+Pj4gcGFja2FnZXMvNmMvOTYvOTFlOTNhZTVmZDA0ZDQyOGMxMDFjZGJh
YmNlNmM4MjBkMjg0ZDYxZDI2MTRkMDA1MThmNGZhNTJlYTI0Cj4+PiArUFlUSE9OX0FJT0hUVFBf
U0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy9lNi8wYi8gCj4+
PiBlMzlhZDk1NDEwN2ViZjIxM2EyMzI1MDM4YTNlN2E1MDZiZTNkOThlMTQzNWUxZjgyMDg2ZWVj
NGNkZTIKPj4+IMKgIFBZVEhPTl9BSU9IVFRQX1NFVFVQX1RZUEUgPSBzZXR1cHRvb2xzCj4+PiDC
oCBQWVRIT05fQUlPSFRUUF9MSUNFTlNFID0gQXBhY2hlLTIuMAo+Pj4gwqAgUFlUSE9OX0FJT0hU
VFBfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UudHh0Cj4+IAo+IAo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+
IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgpCZXN0IHJlZ2FyZHMsCgpKdWxpZW4uCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
