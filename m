Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0215C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 19:49:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27069610C8
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 19:49:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 27069610C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE497605B2;
	Mon, 25 Oct 2021 19:49:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hOwVLwWwQNCO; Mon, 25 Oct 2021 19:48:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06BF66089A;
	Mon, 25 Oct 2021 19:48:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A2C971BF309
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 19:48:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F5566089A
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 19:48:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FbWoS8I3V-oT for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 19:48:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1A0DC605B2
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 19:48:56 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:88a7:5655:8f62:bf4c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id E0BB419F59D;
 Mon, 25 Oct 2021 21:48:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1635191333;
 bh=TI8ly/A8Wsu4cbxOWjCuYZ7Gp4dR3uxR0Rqn4WlIJw0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D4uN368BGGq1XQO46oWVs4YIOgU0j5AfXxwy1blJJQvbYh4bnxT42h9SvsOai8xpp
 G7uxR5kmr4p+tlGbILzd0NUxVSEkgpYaQWYQ3FvawqcIW1lMVbleePRaSSEqRF8Fjx
 6DOyH6rn5TxYSS4Zs2GOwMZ3reNuIkcMCLclU5ErG28BTpwlM6d9hrq1qhCoLkvUaE
 KDG/fRLRKXVgxleI0y0wMGc7x4IM/NTfechAYll3D5FAeYGgan4jKxrljcsb51urCR
 jUPtjhLDMZ6LWmj17jCicHZsc/RpybovpV+vgzQqyzUtN+7Pers7oWgV6nbjlb2eoA
 na5hzyZaQg11Q==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 25 Oct 2021 21:48:44 +0200
Date: Mon, 25 Oct 2021 21:48:44 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Brian Murphy <brm@robotize.com>
Message-ID: <20211025194844.GS2400@scaer>
References: <20211015105914.9428-1-brm@robotize.com>
 <20211023215705.GK2400@scaer>
 <7ccf4953-a921-54ab-59b0-a77e91056f1a@robotize.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7ccf4953-a921-54ab-59b0-a77e91056f1a@robotize.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] boot/grub2: fix dependency on host-gawk
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
Cc: Kory Maincent <kory.maincent@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QnJpYW4sIEFsbCwKCk9uIDIwMjEtMTAtMjUgMTE6MDYgKzAyMDAsIEJyaWFuIE11cnBoeSBzcGFr
ZSB0aHVzbHk6Cj4gWWVhaC4gSSBnb3QgdGhpcyByYW5kb21seSB3aGVuIGJ1aWxkaW5nIC0gYW5k
IHByZXR0eSBtdWNoIGFsd2F5cyBmcm9tIGNsZWFuOgo+IAo+IGFjbG9jYWwubTQ6MTc6IHdhcm5p
bmc6IHRoaXMgZmlsZSB3YXMgZ2VuZXJhdGVkIGZvciBhdXRvY29uZiAyLjY5Lgo+IFlvdSBoYXZl
IGFub3RoZXIgdmVyc2lvbiBvZiBhdXRvY29uZi7CoCBJdCBtYXkgd29yaywgYnV0IGlzIG5vdCBn
dWFyYW50ZWVkCj4gdG8uCj4gSWYgeW91IGhhdmUgcHJvYmxlbXMsIHlvdSBtYXkgbmVlZCB0byBy
ZWdlbmVyYXRlIHRoZSBidWlsZCBzeXN0ZW0gZW50aXJlbHkuCj4gVG8gZG8gc28sIHVzZSB0aGUg
cHJvY2VkdXJlIGRvY3VtZW50ZWQgYnkgdGhlIHBhY2thZ2UsIHR5cGljYWxseQo+ICdhdXRvcmVj
b25mJy4KPiBybSAtZiBzdGFtcC1oMQo+IHRvdWNoIC4uL2NvbmZpZy11dGlsLmguaW4KPiBjZCAu
ICYmIC9iaW4vYmFzaCAuL2NvbmZpZy5zdGF0dXMgY29uZmlnLXV0aWwuaAo+IGNvbmZpZy5zdGF0
dXM6IGNyZWF0aW5nIGNvbmZpZy11dGlsLmgKPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gLi4vaW5j
bHVkZS9ncnViL2Rpc2suaDoyMiwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBm
cm9tIC4uL2luY2x1ZGUvZ3J1Yi9maWxlLmg6MjYsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgZnJvbSAuLi9ncnViLWNvcmUvZnMvbWluaXguYzoyMToKPiAuL2NvbmZpZy5oOjM4
OjEwOiBmYXRhbCBlcnJvcjogLi9jb25maWctdXRpbC5oOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0
b3J5Cj4gwqDCoCAzOCB8ICNpbmNsdWRlIDxjb25maWctdXRpbC5oPgo+IMKgwqDCoMKgwqAgfMKg
wqDCoMKgwqDCoMKgwqDCoCBefn5+fn5+fn5+fn5+fn4KClRoaXMgaXMgYSBwYXJhbGxlbCBidWls
ZCBpc3N1ZTsgSSBhbHNvIGhpdCB0aGF0IGlzc3VlIGV2ZW4gd2l0aCBnYXdrCmludGFsbGVkIG9u
IG15IHN5c3RlbS4gV2UndmUgYWxyZWFkeSBiYWNrcG9ydGVkIGFuIHVwc3RyZWFtIGNoYW5nZSB0
bwooYXQgbGVhc3QgcGFydGlhbGx5PykgZml4IHRoYXQgaXNzdWU6CiAgICBodHRwczovL2dpdC5i
dWlsZHJvb3Qub3JnL2J1aWxkcm9vdC9jb21taXQvP2lkPTUxNjgyYzAzYThiOTlkNDJjMWI0ZTI1
M2RhODBjMTI3ZDkxNDZjOWYKCj4gY29tcGlsYXRpb24gdGVybWluYXRlZC4KPiBtYWtlWzFdOiAq
KiogW01ha2VmaWxlOjEzMDk2OiBsaWJncnViLnBwXSBFcnJvciAxCj4gbWFrZVsxXTogTGVhdmlu
ZyBkaXJlY3RvcnkKPiAnL2hvbWUvYnJtL3NyYy9idWlsZHJvb3QvYnIucGMvb3V0cHV0L2J1aWxk
L2dydWIyLTIuMDQvYnVpbGQtaTM4Ni1wYycKPiBtYWtlOiAqKiogW3BhY2thZ2UvcGtnLWdlbmVy
aWMubWs6Mjk0Ogo+IC9ob21lL2JybS9zcmMvYnVpbGRyb290L2JyLnBjL291dHB1dC9idWlsZC9n
cnViMi0yLjA0Ly5zdGFtcF9idWlsdF0gRXJyb3IgMgo+IAo+IGFuZCB3aGVuIEkgcnVuIHRoZSBj
b21tYW5kIEkgZ2V0Ogo+IAo+ICQgL2Jpbi9iYXNoIC4vY29uZmlnLnN0YXR1cyBjb25maWctdXRp
bC5oCj4gY29uZmlnLnN0YXR1czogY3JlYXRpbmcgY29uZmlnLXV0aWwuaAo+IC4vY29uZmlnLnN0
YXR1czogbGluZSAyMzU2OiBnYXdrOiBjb21tYW5kIG5vdCBmb3VuZAoKVGhpcyBpcyBpbmRlZWQg
aW50ZXJlc3RpbmcuCgpXaXRob3V0IGdhd2sgaW5zdGFsbGVkIG9uIG15IHN5c3RlbSwgYW5kIHdp
dGhvdXQgaG9zdC1nYXdrIGF2YWlsYWJsZToKCiAgICAkIHdoaWNoIGdhd2sKICAgIFt6aWxjaF0K
ICAgICQgZ3JlcCBnYXdrIC4vY29uZmlnLnN0YXR1cwogICAgW3ppbGNoXQogICAgJCAvYmluL2Jh
c2ggLi9jb25maWcuc3RhdHVzIGNvbmZpZy11dGlsLmgKICAgIGNvbmZpZy5zdGF0dXM6IGNyZWF0
aW5nIGNvbmZpZy11dGlsLmgKICAgIGNvbmZpZy5zdGF0dXM6IGNvbmZpZy11dGlsLmggaXMgdW5j
aGFuZ2VkCiAgICAkIHJtIGNvbmZpZy11dGlsLmgKICAgICQgL2Jpbi9iYXNoIC4vY29uZmlnLnN0
YXR1cyBjb25maWctdXRpbC5oCiAgICBjb25maWcuc3RhdHVzOiBjcmVhdGluZyBjb25maWctdXRp
bC5oCgo+IGNvbmZpZy5zdGF0dXM6IGVycm9yOiBjb3VsZCBub3QgY3JlYXRlIGNvbmZpZy11dGls
LmgKPiAKPiBTbyBncnViIGVuZHMgdXAgbmVlZGluZyBnYXdrIHRvIGNyZWF0ZSB0aGlzIGNvbmZp
Zy11dGlsLmguIEkgZG8gbm90IGhhdmUKPiBnYXdrIGluc3RhbGxlZCBvbiBteSBidWlsZCBtYWNo
aW5lIGJ1dCBvdGhlciBidWlsZHJvb3QgcGFja2FnZXMgZGVwZW5kIG9uCj4gaG9zdC1nYXdrIHNv
IGl0IGVuZHMgdXAgYmVpbmcgYnVpbHQuIFBlcmhhcHMgZ3J1YiBhdXRvZGV0ZWN0cyBnYXdrIGJl
Zm9yZSBpdAo+IGlzIHJlYWR5IHRvIGJlIHVzZWQgKHNvbWV0aW1lcykgaW4gYSBwYXJhbGxlbCBi
dWlsZCBpZiBpdCBpcyBnb2luZyB0byBiZQo+IGluc3RhbGxlZCBhcyBhIGRlcGVuZGVuY3kgZnJv
bSBhbm90aGVyIHBhY2thZ2U/CgpBaCwgaG9zdC1nYXdrIGVuZHMgdXAgaW4gdGhlIGRlcFtlbmRl
bmN5IGNoYWluIG9nIGdydWIyIGJ5IHdheSBvZgphbm90ZWhyIHBhY2thZ2UuIEluIHRoYXQgY2Fz
ZSwgcnVubmluZyBjb25maWcuc3RhdHVzIG1hbnVhbGx5IGxpa2UgeW91CmRpZCBhYm9jZSB3aWxs
IGJlIG1pc2luZyB0aGUgcHJvcGVyIFBBVEggdGhhdCBoYXMgQnVpbGRyb290J3MgaG9zdC9iaW4v
CmRpcmVjdG9yeSBzbyB0aGF0IGdhd2sgaXMgZm91bmQuCgpTbywgeW91ciBidWlsZCBpc3N1ZSBy
ZWFsbHkgbG9va3MgbGlrZSB0aGUgcGFyYWxsZWwgYnVpbGQgaXNzdWUgd2UgYXJlCnN1cHBvc2Vk
IHRvIGhhdmUgZml4ZWQgYWxyZWFkeTsgc2VlIGFib3ZlLgoKUmVnYXJkcywKWWFubiBFLiBNT1JJ
Ti4KCj4gTWFraW5nIGdydWIgZGVwZW5kIG9uIGhvc3QtZ2F3ayBmaXhlcyB0aGlzIGZvciBtZS4K
PiAKPiBPbiAyMy8xMC8yMDIxIDIzOjU3LCBZYW5uIEUuIE1PUklOIHdyb3RlOgo+ID5Ccmlhbiwg
QWxsLAo+ID4KPiA+K0vDtnJ5IHdobyBkaWQgcmVjZW50IGNoYW5nZXMgaW4gZ3J1YjIKPiA+Cj4g
Pk9uIDIwMjEtMTAtMTUgMTI6NTkgKzAyMDAsIEJyaWFuIE11cnBoeSBzcGFrZSB0aHVzbHk6Cj4g
Pj5TaWduZWQtb2ZmLWJ5OiBCcmlhbiBNdXJwaHkgPGJybUByb2JvdGl6ZS5jb20+Cj4gPkNvdWxk
IHlvdSBnaXZlIGEgYml0IG1vcmUgZGV0YWlscyBhYm91dCB0aGUgcmVhc29uIHdoeSBob3N0LWdh
d2sgaXMKPiA+bmVlZGVkPyBJJ3ZlIGp1c3QgYmVlbiBhYmxlIHRvIGNvbXBsZXRlIGEgZ3J1YjIg
YnVpbGQgd2l0aCBtYXdrIGFzIG15Cj4gPnN5c3RlbSBhd2suIGdydWIyJ3MgY29uZmlndXJlIGV2
ZW4gZGV0ZWN0cyB0aGF0IHNpdHVhdGlvbjsKPiA+Cj4gPiAgICAgY2hlY2tpbmcgZm9yIGdhd2su
Li4gbm8KPiA+ICAgICBjaGVja2luZyBmb3IgbWF3ay4uLiBtYXdrCj4gPgo+ID5SZWdhcmRzLAo+
ID5ZYW5uIEUuIE1PUklOLgo+ID4KPiA+Pi0tLQo+ID4+ICBib290L2dydWIyL2dydWIyLm1rIHwg
MiArLQo+ID4+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
PiA+Pgo+ID4+ZGlmZiAtLWdpdCBhL2Jvb3QvZ3J1YjIvZ3J1YjIubWsgYi9ib290L2dydWIyL2dy
dWIyLm1rCj4gPj5pbmRleCBlMDFlYmIyZWRiLi43N2JmMjZiNzM5IDEwMDY0NAo+ID4+LS0tIGEv
Ym9vdC9ncnViMi9ncnViMi5tawo+ID4+KysrIGIvYm9vdC9ncnViMi9ncnViMi5tawo+ID4+QEAg
LTEwLDcgKzEwLDcgQEAgR1JVQjJfU09VUkNFID0gZ3J1Yi0kKEdSVUIyX1ZFUlNJT04pLnRhci54
ego+ID4+ICBHUlVCMl9MSUNFTlNFID0gR1BMLTMuMCsKPiA+PiAgR1JVQjJfTElDRU5TRV9GSUxF
UyA9IENPUFlJTkcKPiA+PiAgR1JVQjJfREVQRU5ERU5DSUVTID0gaG9zdC1iaXNvbiBob3N0LWZs
ZXggaG9zdC1ncnViMgo+ID4+LUhPU1RfR1JVQjJfREVQRU5ERU5DSUVTID0gaG9zdC1iaXNvbiBo
b3N0LWZsZXgKPiA+PitIT1NUX0dSVUIyX0RFUEVOREVOQ0lFUyA9IGhvc3QtYmlzb24gaG9zdC1m
bGV4IGhvc3QtZ2F3awo+ID4+ICBHUlVCMl9JTlNUQUxMX0lNQUdFUyA9IFlFUwo+ID4+ICAjIDAw
MDEtYnVpbGQtRml4LUdSVUItaTM4Ni1wYy1idWlsZC13aXRoLVVidW50dS1nY2MucGF0Y2ggYW5k
IDIwMjEvMDMvMDIKPiA+Pi0tIAo+ID4+Mi4yMC4xCj4gPj4KPiA+Pl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPj5idWlsZHJvb3QgbWFpbGluZyBsaXN0
Cj4gPj5idWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+ID4+aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4gLS0gCj4gCj4gTWVkIHZlbmxpZyBoaWxz
ZW4gLyBLaW5kIFJlZ2FyZHMgLyBNaXQgZnJldW5kbGljaGVuIEdyw7xzc2VuCj4gCj4gKkJyaWFu
IE11cnBoeSoKPiAKPiBEZXZlbG9wbWVudCBFbmdpbmVlcgo+IAo+IHJvYm90aXplCj4gCj4gTWFn
bGViamVyZ3ZlaiA1QiAtIDI4MDAgS2dzLiBMeW5nYnkgLSBEZW5tYXJrCj4gVGVsICs0NSAzMDgw
IDkwNzAKPiBNYWlsIGJybUByb2JvdGl6ZS5jb20gLSBXZWIgd3d3LnJvYm90aXplLmNvbQoKPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKCi0tIAouLS0tLS0tLS0t
LS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0t
LS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8i
XCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8
IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAg
ICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNU
ICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9y
Zy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0t
LS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
