Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB431C433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Jul 2022 22:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DBF160ED3;
	Sat, 16 Jul 2022 22:01:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DBF160ED3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U7zMbRbaCEE1; Sat, 16 Jul 2022 22:01:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EF3560BCB;
	Sat, 16 Jul 2022 22:01:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EF3560BCB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4D0481BF487
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 22:01:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3562A60BCB
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 22:01:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3562A60BCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q8GdRmBK5kIF for <buildroot@lists.busybox.net>;
 Sat, 16 Jul 2022 22:01:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0AB660AFD
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A0AB660AFD
 for <buildroot@buildroot.org>; Sat, 16 Jul 2022 22:01:21 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4985:d730:3c09:77ac])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 47B0A780346;
 Sun, 17 Jul 2022 00:01:16 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Jul 2022 00:01:16 +0200
Date: Sun, 17 Jul 2022 00:01:15 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Vincent =?utf-8?Q?Stehl=C3=A9?= <vincent.stehle@laposte.net>
Message-ID: <20220716220115.GL2543@scaer>
References: <20220715095925.12881-1-vincent.stehle@laposte.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220715095925.12881-1-vincent.stehle@laposte.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658008878;
 bh=SuZoMdEPf4DPtReG27xDBrtnqZVvabTSxJBl7KKY2Tw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K3xWNZOQJyExE9wmeDDlMS6Ahr4yDPmQjS9mPopRS3ur1iAw0ggKC9qs6soL4KMBc
 qodW9uN9SmYSyd45vWD8xybFc/xnIXbKOhAHsj1/OoBDQSiul8EThyvxj4rsHlbKf3
 LqVmCy1Ie1dDwfqW27vwgbqoGI5Umjj66ajqLKDBRr3mSOCjyYHCZKvBkotpzq/KW9
 regV87OiJC9aDgqa9xE5N27Wn8FeD3hdfU8b99eMByBojId5jrouJJda/atreOoULD
 3L1VC1gUzliY3Eo0+KcQxCLjJjYG97EYLY5sF7auMZSDWwG/DxRL9ymYNGaBMFb4HN
 5KfS6PvlYP8/w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=K3xWNZOQ
Subject: Re: [Buildroot] [PATCH] support/testing: add test for msr-tools
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VmluY2VudCwgQWxsLAoKT24gMjAyMi0wNy0xNSAxMTo1OSArMDIwMCwgVmluY2VudCBTdGVobMOp
IHZpYSBidWlsZHJvb3Qgc3Bha2UgdGh1c2x5Ogo+IEFkZCBhIHNpbXBsZSB0ZXN0IHRvIHZlcmlm
eSB0aGF0IG1zci10b29scyBhcmUgd29ya2luZy4KPiAKPiBUaGUgdGVzdCBuZWVkcyB0byBidWls
ZCBhIGN1c3RvbSB4ODZfNjQga2VybmVsIHdpdGggc3VwcG9ydCBmb3IgQ1BVSUQgYW5kCj4gTVNS
Lgo+IAo+IEFzIHRoZSBUU0NfQVVYIE1TUiBpcyBlbXVsYXRlZCBvbiBxZW11IHdlIGNhbiB1c2Ug
aXQgdG8gdGVzdCB0aGF0IGEgdmFsdWUKPiB3cml0dGVuIHdpdGggd3Jtc3IgY2FuIGluZGVlZCBi
ZSByZWFkIGJhY2sgd2l0aCByZG1zci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IFN0ZWhs
w6kgPHZpbmNlbnQuc3RlaGxlQGxhcG9zdGUubmV0PgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5r
cy4KClstLVNOSVAtLV0KPiBJIGhhdmUgdmVyaWZpZWQgdGhhdCB0aGlzIHRlc3Qgd29ya3MgZmlu
ZSBsb2NhbGx5IGFuZCBvbiBnaXRsYWIuCgpXb3JrZWQgaGVyZSB0b28uCgo+IEl0IGlzIGV4cGVj
dGVkIHRvIGhhdmUgYSB0cml2aWFsIGNvbmZsaWN0IHdpdGggdGhpcyBwcmV2aW91cyBwYXRjaFsx
XSBvbiB0aGUKPiBERVZFTE9QRVJTIGZpbGUuCgpPaCwgdGhlIHNuZWFreSB3YXkgdG8gaW5jaXRl
IGEgbWFpbnRhaW5lciB0byBhcHBseSBhbm90aGVyIHBhdGNoISA7LSkKKEknbGwgZ28gdGhlcmUg
bm93KQoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCj4gQmVzdCByZWdhcmRzLAo+IFZpbmNlbnQu
Cj4gCj4gWzFdOiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvcGlwZXJtYWlsL2J1aWxkcm9v
dC8yMDIyLUp1bHkvNjQ2MDA4Lmh0bWwKPiAKPiAKPiAgREVWRUxPUEVSUyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+ICAuLi4vdGVzdGluZy90ZXN0cy9wYWNrYWdl
L3Rlc3RfbXNyX3Rvb2xzLnB5ICAgfCA1MCArKysrKysrKysrKysrKysrKysrCj4gIC4uLi90ZXN0
cy9wYWNrYWdlL3Rlc3RfbXNyX3Rvb2xzL2xpbnV4LmNvbmZpZyB8ICAyICsKPiAgMyBmaWxlcyBj
aGFuZ2VkLCA1MyBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBzdXBwb3J0L3Rl
c3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X21zcl90b29scy5weQo+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9tc3JfdG9vbHMvbGludXguY29u
ZmlnCj4gCj4gZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJTCj4gaW5kZXggMGFm
ZDY5N2I2Yy4uODc1M2YwYzE3ZSAxMDA2NDQKPiAtLS0gYS9ERVZFTE9QRVJTCj4gKysrIGIvREVW
RUxPUEVSUwo+IEBAIC0yOTE3LDYgKzI5MTcsNyBAQCBGOgljb25maWdzL3Vldm01NDMyX2RlZmNv
bmZpZwo+ICBGOglwYWNrYWdlL2k3ei8KPiAgRjoJcGFja2FnZS9tc3ItdG9vbHMvCj4gIEY6CXBh
Y2thZ2UvcGl4ei8KPiArRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9tc3Jf
dG9vbHMqCj4gIAo+ICBOOglWaW5pY2l1cyBUaW50aSA8dmluaWNpdXN0aW50aUBnbWFpbC5jb20+
Cj4gIEY6CXBhY2thZ2UvcHl0aG9uLXRocmlmdC8KPiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC90ZXN0
aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9tc3JfdG9vbHMucHkgYi9zdXBwb3J0L3Rlc3RpbmcvdGVz
dHMvcGFja2FnZS90ZXN0X21zcl90b29scy5weQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5k
ZXggMDAwMDAwMDAwMC4uNGQ2Mjc0MmE1Zgo+IC0tLSAvZGV2L251bGwKPiArKysgYi9zdXBwb3J0
L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X21zcl90b29scy5weQo+IEBAIC0wLDAgKzEsNTAg
QEAKPiAraW1wb3J0IG9zCj4gKwo+ICtpbXBvcnQgaW5mcmEuYmFzZXRlc3QKPiArCj4gKwo+ICtj
bGFzcyBUZXN0TXNyVG9vbHMoaW5mcmEuYmFzZXRlc3QuQlJUZXN0KToKPiArICAgIGNvbmZpZyA9
IFwKPiArICAgICAgICAiIiIKPiArICAgICAgICBCUjJfeDg2XzY0PXkKPiArICAgICAgICBCUjJf
eDg2X2NvcmVpNz15Cj4gKyAgICAgICAgQlIyX1RPT0xDSEFJTl9FWFRFUk5BTD15Cj4gKyAgICAg
ICAgQlIyX0xJTlVYX0tFUk5FTD15Cj4gKyAgICAgICAgQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01f
VkVSU0lPTj15Cj4gKyAgICAgICAgQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxV
RT0iNS4xNS41NSIKPiArICAgICAgICBCUjJfTElOVVhfS0VSTkVMX1VTRV9DVVNUT01fQ09ORklH
PXkKPiArICAgICAgICBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9DT05GSUdfRklMRT0iYm9hcmQv
cWVtdS94ODZfNjQvbGludXguY29uZmlnIgo+ICsgICAgICAgIEJSMl9MSU5VWF9LRVJORUxfQ09O
RklHX0ZSQUdNRU5UX0ZJTEVTPSJ7fSIKPiArICAgICAgICBCUjJfTElOVVhfS0VSTkVMX05FRURT
X0hPU1RfTElCRUxGPXkKPiArICAgICAgICBCUjJfUEFDS0FHRV9NU1JfVE9PTFM9eQo+ICsgICAg
ICAgIEJSMl9UQVJHRVRfUk9PVEZTX0NQSU89eQo+ICsgICAgICAgICMgQlIyX1RBUkdFVF9ST09U
RlNfVEFSIGlzIG5vdCBzZXQKPiArICAgICAgICAiIiIuZm9ybWF0KAo+ICsgICAgICAgICAgICAg
IGluZnJhLmZpbGVwYXRoKCJ0ZXN0cy9wYWNrYWdlL3Rlc3RfbXNyX3Rvb2xzL2xpbnV4LmNvbmZp
ZyIpKQo+ICsKPiArICAgIGRlZiB0ZXN0X3J1bihzZWxmKToKPiArICAgICAgICBrZXJuZWwgPSBv
cy5wYXRoLmpvaW4oc2VsZi5idWlsZGRpciwgImltYWdlcyIsICJiekltYWdlIikKPiArICAgICAg
ICBjcGlvX2ZpbGUgPSBvcy5wYXRoLmpvaW4oc2VsZi5idWlsZGRpciwgImltYWdlcyIsICJyb290
ZnMuY3BpbyIpCj4gKyAgICAgICAgc2VsZi5lbXVsYXRvci5ib290KAo+ICsgICAgICAgICAgICBh
cmNoPSJ4ODZfNjQiLAo+ICsgICAgICAgICAgICBrZXJuZWw9a2VybmVsLCBrZXJuZWxfY21kbGlu
ZT1bImNvbnNvbGU9dHR5UzAiXSwKPiArICAgICAgICAgICAgb3B0aW9ucz1bIi1jcHUiLCAiTmVo
YWxlbSIsICItbSIsICIzMjAiLCAiLWluaXRyZCIsIGNwaW9fZmlsZV0KPiArICAgICAgICApCj4g
KyAgICAgICAgc2VsZi5lbXVsYXRvci5sb2dpbigpCj4gKwo+ICsgICAgICAgICMgQ1BVIElELgo+
ICsgICAgICAgIGNtZCA9ICJjcHVpZCIKPiArICAgICAgICBzZWxmLmFzc2VydFJ1bk9rKGNtZCkK
PiArCj4gKyAgICAgICAgIyBXcml0ZSBNU1IuCj4gKyAgICAgICAgIyBXZSB3cml0ZSB0byBUU0Nf
QVVYLgo+ICsgICAgICAgIGNtZCA9ICJ3cm1zciAweGMwMDAwMTAzIDB4MTIzNDU2NzgxMjM0NTY3
OCIKPiArICAgICAgICBzZWxmLmFzc2VydFJ1bk9rKGNtZCkKPiArCj4gKyAgICAgICAgIyBSZWFk
IE1TUi4KPiArICAgICAgICAjIFdlIHJlYWQgYmFjayB0aGUgVFNDX0FVWCBhbmQgd2UgdmVyaWZ5
IHRoYXQgd2UgcmVhZCBiYWNrIHRoZSBjb3JyZWN0Cj4gKyAgICAgICAgIyB2YWx1ZS4KPiArICAg
ICAgICBjbWQgPSAicmRtc3IgMHhjMDAwMDEwMyIKPiArICAgICAgICBvdXRwdXQsIGV4aXRfY29k
ZSA9IHNlbGYuZW11bGF0b3IucnVuKGNtZCkKPiArICAgICAgICBzZWxmLmFzc2VydEVxdWFsKGV4
aXRfY29kZSwgMCkKPiArICAgICAgICBzZWxmLmFzc2VydEVxdWFsKG91dHB1dFswXSwgIjEyMzQ1
Njc4MTIzNDU2NzgiKQo+IGRpZmYgLS1naXQgYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2Fn
ZS90ZXN0X21zcl90b29scy9saW51eC5jb25maWcgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFj
a2FnZS90ZXN0X21zcl90b29scy9saW51eC5jb25maWcKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+
IGluZGV4IDAwMDAwMDAwMDAuLjhmZTA5ZGI4N2IKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvc3Vw
cG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9tc3JfdG9vbHMvbGludXguY29uZmlnCj4g
QEAgLTAsMCArMSwyIEBACj4gK0NPTkZJR19YODZfQ1BVSUQ9eQo+ICtDT05GSUdfWDg2X01TUj15
Cj4gLS0gCj4gMi4zNS4xCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QKCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0t
LS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJl
YWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTog
fAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAg
ICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0t
Li0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6
Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYg
ICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1e
LS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
