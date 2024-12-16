Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB75AE7717F
	for <buildroot@archiver.kernel.org>; Mon, 16 Dec 2024 21:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69BD2611F5;
	Mon, 16 Dec 2024 21:08:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xDrxJTwGQZgg; Mon, 16 Dec 2024 21:08:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DF4A611FA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DF4A611FA;
	Mon, 16 Dec 2024 21:08:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 00CAACE
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 21:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2B504172F
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 21:08:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d9GAocczhW27 for <buildroot@buildroot.org>;
 Mon, 16 Dec 2024 21:08:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B00DC41732
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B00DC41732
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B00DC41732
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 21:08:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 4F3C919F59C;
 Mon, 16 Dec 2024 22:08:46 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:46514])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 16 Dec 2024 22:08:46 +0100
MIME-Version: 1.0
Date: Mon, 16 Dec 2024 22:08:46 +0100
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>
Cc: buildroot@buildroot.org, Sergey Matyukevich <geomatsi@gmail.com>
In-Reply-To: <20241216090421.2867204-1-vincent.stehle@arm.com>
References: <20241216090421.2867204-1-vincent.stehle@arm.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <847d9076e7ae8227d486d9ef1fe08bb0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734383328;
 bh=4bck8gb+Pw9s17R8oGhrt1OVW/s8i7K3CS4gUXgbISM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QcpdXD77OE+pVoD2KWe/kr+w3+J4HCTf/7fIB39N++6pb8bkWKozJ7qawlCJV04mG
 q7BZXDTzjY1EutPI41iV+Dg6m2GbR772PqKu76rEB6ok1A6G2Sgk1RZLc39WG0D8cP
 UErbyGcG4z//ts/pp3IAKm5LBqBo9u3qXLz1WWzKp8CBZL9JAgsTRoidDKsJtKQQ3Q
 2T/Zq64G/hbxqNVdTZyYJPedLvcvybUNosiWDy/mXHMCx5nx/jye5PJyADn9mT32aA
 uWElzMhrEV9Ub6yvgADF+6eflCsUsaRyAZGB4rrU5aPjFpoB7LjLtwJasw7qZZTJtq
 FVXxLCTga7zZA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QcpdXD77
Subject: Re: [Buildroot] [PATCH] boot/arm-trusted-firmware: bump to v2.12
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

SGkgVmluY2VudCwKCk9uIDE2LzEyLzIwMjQgMTA6MDQsIFZpbmNlbnQgU3RlaGzDqSB3cm90ZToK
PiBVcGRhdGUgdHJ1c3RlZC1maXJtd2FyZS1hIHZlcnNpb24gdG8gdjIuMTIgYW5kIGFkZCBhIGhh
c2ggZmlsZSAKPiBhY2NvcmRpbmdseS4KPiAKPiBDb21wYXJlZCB0byB2Mi4xMSwgdGhlIGxpY2Vu
c2UgaGFzIGNoYW5nZWQgd2l0aCB0aGUgYWRkaXRpb25hbCBtZW50aW9uIAo+IG9mCj4gZmlsZXMg
ZnJvbSB0aGUgcHlkZXZpY2V0cmVlIHByb2plY3QgdW5kZXIgQXBhY2hlIDIuMCBsaWNlbnNlLgo+
IEFzIHdlIG9ubHkgZG9jdW1lbnQgdGhlIG1haW4gbGljZW5zZSBvZiBURi1BLCBCU0QtMy1DbGF1
c2UsIHRoaXMgY2hhbmdlIAo+IGhhcwo+IG5vIGltcGFjdCBmb3IgdXMuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogVmluY2VudCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBhcm0uY29tPgo+IENjOiBEaWNr
IE9sc3NvbiA8aGlAc2VuemlsbGEuaW8+Cj4gQ2M6IFNlcmdleSBNYXR5dWtldmljaCA8Z2VvbWF0
c2lAZ21haWwuY29tPgoKVGhhbmtzIGZvciB0aGUgcGF0Y2ggKGFuZCB0aGUgZXh0ZW5kZWQgdGVz
dGluZykuIEkgYXBwbGllZCB0byBtYXN0ZXIuCgpJIHJlbW92ZWQgdGhlIGhhc2ggZmlsZSBmb3Ig
djIuMTEsIHNpbmNlIGl0IGlzIG5vIGxvbmdlciBuZWVkZWQKaGVyZS4gSSBhbHNvIHNlZSB0aGF0
IGFybV9mdnBfZWJicl9kZWZjb25maWcgdXNlcyBURi1BIHYyLjExIFsxXQpidXQgaXRzIHBhdGNo
IGRpcmVjdG9yeSBbMl0gZG9lcyBub3QgaW5jbHVkZSBhbiBlbnRyeSBmb3IgaXQuCkkgYmVsaWV2
ZSBpdCB3YXMgbWlzc2luZyBhbmQgd2FzIHVzaW5nIHRoZSBoYXNoIGZpbGUgSSByZW1vdmVkLgpU
aGlzIGRlZmNvbmZpZyBtaWdodCBiZSBicm9rZW4gbm93LiBDb3VsZCB5b3UgZG91YmxlIGNoZWNr
IHRoYXQKcGxlYXNlPyBZb3UgbWlnaHQgbmVlZCB0byBhZGQgYmFjayBhIGhhc2ggZmlsZSBpbiB5
b3VyIGJvYXJkCnBhdGNoIGRpcmVjdG9yeSAoZXZlbiBpZiBpdCdzIGZvciBhbiB1cGRhdGVkIHYy
LjEyIHZlcnNpb24pLgoKQmVzdCByZWdhcmRzLAoKSnVsaWVuLgoKWzFdIApodHRwczovL2dpdGxh
Yi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9ibG9iL21hc3Rlci9jb25maWdzL2FybV9m
dnBfZWJicl9kZWZjb25maWcjTDIwClsyXSAKaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5v
cmcvYnVpbGRyb290Ly0vdHJlZS9tYXN0ZXIvYm9hcmQvYXJtL2Z2cC1lYmJyL3BhdGNoZXMKCgo+
IC0tLQo+IAo+IEhpLAo+IAo+IEFmdGVyIGRvaW5nIHNvbWUgdGVzdGluZywgSSB0aGluayBpdCBp
cyBzYWZlIHRvIGJ1bXAgb3VyIGRlZmF1bHQgCj4gdmVyc2lvbiBvZgo+IFRGLUEgdG8gdjIuMTIu
Cj4gCj4gVGVzdGVkIG9rIHdpdGggdGhlIGZvbGxvd2luZyBweXRob24gdGVzdHMgKG1vZGlmaWVk
IGxvY2FsbHkgdG8gdXNlIFRGLUEKPiB2Mi4xMik6Cj4gLSB0ZXN0cy5ib290LnRlc3RfYXRmLlRl
c3RBVEZBbGx3aW5uZXIgKG5vdGU6IHRoaXMgdGVzdCBpcyBidWlsZCBvbmx5KQo+IC0gdGVzdHMu
Ym9vdC50ZXN0X2VkazIuVGVzdEVkazIKPiAtIHRlc3RzLmJvb3QudGVzdF9vcHRlZV9vcy5UZXN0
T3B0ZWUKPiAtIHRlc3RzLnBhY2thZ2UudGVzdF9md3RzLlRlc3RGd3RzCj4gCj4gQm9vdC10ZXN0
ZWQgb2sgd2l0aCB0aGUgZm9sbG93aW5nIGRlZmNvbmZpZ3MgKG1vZGlmaWVkIGxvY2FsbHkgdG8g
dXNlIAo+IFRGLUEKPiB2Mi4xMik6Cj4gLSBhcm1fZnZwX2ViYnIKPiAtIHFlbXVfYWFyY2g2NF9l
YmJyCj4gLSBxZW11X2FhcmNoNjRfc2JzYQo+IC0gcWVtdV9hcm1fZWJicgo+IC0gcWVtdV9hcm1f
dmV4cHJlc3NfdHoKPiAtIHJvY2twcm82NAo+IAo+IEJ1aWxkLXRlc3RlZCBvayB3aXRoIHRoZSBm
b2xsb3dpbmcgZGVmY29uZmlncyAobW9kaWZpZWQgbG9jYWxseSB0byB1c2UgCj4gVEYtQQo+IHYy
LjEyKToKPiAtIGlteDhtbl9ic2hfc21tX3MyCj4gLSBpbXg4bW5fYnNoX3NtbV9zMl9wcm8KPiAt
IGtvbnRyb25fYmxfaW14OG1tCj4gLSBvbGltZXhfYTY0X29saW51eGlubwo+IC0gb3JhbmdlcGlf
cGMyCj4gLSBvcmFuZ2VwaV96ZXJvMncKPiAtIG9yYW5nZXBpX3plcm9fcGx1cwo+IC0gcGluZTY0
Cj4gLSByb2NfcGNfcmszMzk5Cj4gLSBzdG0zMm1wMTU3YV9kazEKPiAtIHN0bTMybXAxNTdjX2Rr
Mgo+IC0gc3RtMzJtcDE1N2Nfb2R5c3NleQo+IAo+IEJlc3QgcmVnYXJkcywKPiBWaW5jZW50Lgo+
IAo+ICBib290L2FybS10cnVzdGVkLWZpcm13YXJlL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAg
ICAgICAgfCA0ICsrLS0KPiAgYm9vdC9hcm0tdHJ1c3RlZC1maXJtd2FyZS92Mi4xMi9hcm0tdHJ1
c3RlZC1maXJtd2FyZS5oYXNoIHwgMyArKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCAKPiBib290L2FybS10
cnVzdGVkLWZpcm13YXJlL3YyLjEyL2FybS10cnVzdGVkLWZpcm13YXJlLmhhc2gKPiAKPiBkaWZm
IC0tZ2l0IGEvYm9vdC9hcm0tdHJ1c3RlZC1maXJtd2FyZS9Db25maWcuaW4gCj4gYi9ib290L2Fy
bS10cnVzdGVkLWZpcm13YXJlL0NvbmZpZy5pbgo+IGluZGV4IDRhNWM3ZGM4OWMuLmM4ZGVlZGU5
Y2QgMTAwNjQ0Cj4gLS0tIGEvYm9vdC9hcm0tdHJ1c3RlZC1maXJtd2FyZS9Db25maWcuaW4KPiAr
KysgYi9ib290L2FybS10cnVzdGVkLWZpcm13YXJlL0NvbmZpZy5pbgo+IEBAIC0xNCw3ICsxNCw3
IEBAIGNob2ljZQo+ICAJICBTZWxlY3QgdGhlIHNwZWNpZmljIEFURiB2ZXJzaW9uIHlvdSB3YW50
IHRvIHVzZQo+IAo+ICBjb25maWcgQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9MQVRF
U1RfVkVSU0lPTgo+IC0JYm9vbCAidjIuMTEiCj4gKwlib29sICJ2Mi4xMiIKPiAKPiAgY29uZmln
IEJSMl9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkVfTEFURVNUX0xUU18yXzEwX1ZFUlNJT04K
PiAgCWJvb2wgImxhdGVzdCBsdHMtdjIuMTAueCIKPiBAQCAtNTIsNyArNTIsNyBAQCBjb25maWcg
Cj4gQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9DVVNUT01fVkVSU0lPTl9WQUxVRQo+
IAo+ICBjb25maWcgQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9WRVJTSU9OCj4gIAlz
dHJpbmcKPiAtCWRlZmF1bHQgInYyLjExIgkJaWYgQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJN
V0FSRV9MQVRFU1RfVkVSU0lPTgo+ICsJZGVmYXVsdCAidjIuMTIiCQlpZiBCUjJfVEFSR0VUX0FS
TV9UUlVTVEVEX0ZJUk1XQVJFX0xBVEVTVF9WRVJTSU9OCj4gIAlkZWZhdWx0ICJsdHMtdjIuMTAu
NSIJaWYgCj4gQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9MQVRFU1RfTFRTXzJfMTBf
VkVSU0lPTgo+ICAJZGVmYXVsdCAibHRzLXYyLjguMjAiCWlmIAo+IEJSMl9UQVJHRVRfQVJNX1RS
VVNURURfRklSTVdBUkVfTEFURVNUX0xUU18yXzhfVkVSU0lPTgo+ICAJZGVmYXVsdCAiY3VzdG9t
IglpZiBCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0NVU1RPTV9UQVJCQUxMCj4gZGlm
ZiAtLWdpdCBhL2Jvb3QvYXJtLXRydXN0ZWQtZmlybXdhcmUvdjIuMTIvYXJtLXRydXN0ZWQtZmly
bXdhcmUuaGFzaCAKPiBiL2Jvb3QvYXJtLXRydXN0ZWQtZmlybXdhcmUvdjIuMTIvYXJtLXRydXN0
ZWQtZmlybXdhcmUuaGFzaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAw
MC4uNTVlYTUxNTQ4MQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9ib290L2FybS10cnVzdGVkLWZp
cm13YXJlL3YyLjEyL2FybS10cnVzdGVkLWZpcm13YXJlLmhhc2gKPiBAQCAtMCwwICsxLDMgQEAK
PiArIyBMb2NhbGx5IGNhbGN1bGF0ZWQKPiArc2hhMjU2ICAKPiAwNmIzNWEzNTk2Yjg0MTdiZjY2
ZjdiZmRkN2FjZDE4MWJjYjUzZmMzNmRjMTMyMTYyMjdiNWNhZTE1NGUwMjE5ICAKPiBhcm0tdHJ1
c3RlZC1maXJtd2FyZS12Mi4xMi1naXQ0LnRhci5nego+ICtzaGEyNTYgIAo+IGIyYzc5NjM1Nzk3
YmFmY2RlODRjNmVkYWRhZGRlMjkwYjlkNWUwNWRlYjNlYTE2YTg0NzIxMGZkMmNhODM2NjkgIAo+
IGRvY3MvbGljZW5zZS5yc3QKPiAtLQo+IDIuNDUuMgo+IAo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
