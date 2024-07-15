Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4469C3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 10:04:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFEEC4039A;
	Mon, 15 Jul 2024 10:04:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id siMusjBpyg74; Mon, 15 Jul 2024 10:04:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE61B403B0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE61B403B0;
	Mon, 15 Jul 2024 10:04:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 142411BF41C
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 10:04:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 00EF7605D2
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 10:04:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ww0W4fw0Q_As for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 10:04:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.142;
 helo=fllv0016.ext.ti.com; envelope-from=p-bhagat@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6ADDD605C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6ADDD605C8
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6ADDD605C8
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 10:04:00 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46FA3xPf105182;
 Mon, 15 Jul 2024 05:03:59 -0500
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46FA3xMm002670
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 15 Jul 2024 05:03:59 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 15
 Jul 2024 05:03:58 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 15 Jul 2024 05:03:58 -0500
Received: from [172.24.227.38] (ula0502350.dhcp.ti.com [172.24.227.38])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46FA3ttB120113;
 Mon, 15 Jul 2024 05:03:56 -0500
Message-ID: <ed192ad7-705e-4085-8019-f2a6fc707cd2@ti.com>
Date: Mon, 15 Jul 2024 15:33:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bryan Brattlof <bb@ti.com>, Romain Naour <romain.naour@smile.fr>
References: <20240711060531.4067193-1-p-bhagat@ti.com>
 <e0c35138-a12c-42e3-9c7e-1eb9113b001e@smile.fr>
 <20240712203934.zbqkteq4ggtkat4f@bryanbrattlof.com>
Content-Language: en-US
In-Reply-To: <20240712203934.zbqkteq4ggtkat4f@bryanbrattlof.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1721037839;
 bh=f1x0ZRQLnmyVxd6Cd3XagejqL3YGZ+w1xdktSLT+dLc=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=W6WyFIrTTsSMsgxZ62aHgmJzN5DYG/5ndhI11o4LzGPOmNOv4MpxdN+L9ZBN6JmfZ
 s2k9Hdz656T601fAX1Nc8H2gnv5bcfR2R6i5y8Kp2g+wU06QHgmXZrdcsiLfs0zJbS
 q90XMWNLQ/OaSZLsBHsIoaySOD64ZvLQxsCNPp8k=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=W6WyFIrT
Subject: Re: [Buildroot] [PATCH v4] boot/ti-k3-boot-firmware: Add config
 option to specify version
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
From: Paresh Bhagat via buildroot <buildroot@buildroot.org>
Reply-To: Paresh Bhagat <p-bhagat@ti.com>
Cc: Chirag Shilwant <c-shilwant@ti.com>, Gyan Gupta <g-gupta@ti.com>,
 Xuanhao Shi <X15000177@gmail.com>, Syed Mohammed Khasim <khasim@ti.com>,
 buildroot@buildroot.org, Andreas Dannenberg <dannenberg@ti.com>,
 Sai Sree Kartheek Adivi <s-adivi@ti.com>, Anand Gadiyar <gadiyar@ti.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQnJ5YW4sIFJvbWFpbgpPbiAxMy8wNy8yNCAwMjowOSwgQnJ5YW4gQnJhdHRsb2Ygd3JvdGU6
Cj4gT24gSnVseSAxMiwgMjAyNCB0aHVzIHNheWV0aCBSb21haW4gTmFvdXIgdmlhIGJ1aWxkcm9v
dDoKPj4gSGVsbG8gUGFyZXNoLCBBbGwsCj4+Cj4+IExlIDExLzA3LzIwMjQgw6AgMDg6MDUsIFBh
cmVzaCBCaGFnYXQgdmlhIGJ1aWxkcm9vdCBhIMOpY3JpdMKgOgo+Pj4gUHJldmlvdXNseSB0aGUg
dmVyc2lvbiBvZiB0aS1rMy1ib290LWZpcm13YXJlIChUSV9LM19CT09UX0ZJUk1XQVJFX1ZFUlNJ
T04pIHdhcwo+Pj4gZml4ZWQgaW4gbWsgZmlsZS4gSW50cm9kdWNlIGEgbmV3IGNvbmZpZyBvcHRp
b24gQlIyX1RBUkdFVF9USV9LM19CT09UX0ZJUk1XQVJFX0NVU1RPTV9WRVJTSU9OCj4+PiBzbyB0
aGF0IHVzZXIgY2FuIGNoYW5nZSB0aGUgdmVyc2lvbiBmb3IgdGktazMtYm9vdC1maXJtd2FyZSB1
c2luZyBtZW51Y29uZmlnLgo+Pj4KPj4+IFRoaXMgcHJvdmlkZXMgZ3JlYXRlciBmbGV4aWJpbGl0
eSBmb3IgdXNlcnMgdG8gc2VsZWN0IGRpZmZlcmVudCB2ZXJzaW9ucyBvZgo+Pj4gdGktazMtYm9v
dC1maXJtd2FyZSB3aXRob3V0IG1vZGlmeWluZyB0aGUgYnVpbGQgc2NyaXB0IGRpcmVjdGx5Lgo+
PiBJcyB0aGUgbWFpbiByZWFzb24gdG8gYWRkIGFuIG9wdGlvbiB0byBzcGVjaWZ5IHRoZSB0aS1r
My1ib290LWZpcm13YXJlIHZlcnNpb24KPj4gaXMgYmVjYXVzZSBpdCBtdXN0IG1hdGNoIGV4YWN0
bHkgd2l0aCB0aGUgc2VsZWN0ZWQgdS1ib290IG9yIHRpLWszLXI1LWxvYWRlcgo+PiB2ZXJzaW9u
IGR1ZSB0byB0aGUgVEktU0NJIHByb3RvY29sIGFuZCB0aGUgRE1TQyBwcmVidWlsdCBmaXJtd2Fy
ZSBiaW5hcnkKPj4gKHByb3ZpZGVkIGJ5IFRJKSAoRE1TQyBpcyB0aGUgU2VjdXJpdHkgTWFuYWdl
ciBDb3JlIGluIHRoZSBTb0MpPwo+Pgo+IFRoZSBUSS1TQ0kgcHJvdG9jb2wgd2lsbCBhbHdheXMg
YmUgYmFja3dhcmQgY29tcGF0aWJsZS4gVGhlcmUgc2hvdWxkIGJlCj4gbm8gd29ycmllcyBhYm91
dCB1c2luZyBhbiBvbGRlciBUSUZTL0RNL0RNU0MgZmlybXdhcmUgd2l0aCBuZXdlciBrZXJuZWxz
Cj4gYW5kIGJvb3Rsb2FkZXJzIGFuZCBhbnkgZXJyb3JzIGFueW9uZSBzZWVzIHNob3VsZCBiZSBy
ZXBvcnRlZCB0byBUSSBzbwo+IGl0IGNhbiBiZSBhZGRyZXNzZWQuCj4KPiBJdCBnZXRzIGEgbGl0
dGxlIHdlaXJkIHdpdGggdGhlIFRJRlMgPC0+IERNIGNvbW11bmljYXRpb24gc28gaXQncwo+IHJl
Y29tbWVuZGVkIHRvIGtlZXAgdGhvc2UgaW4gc3luYy4gSSBoYXZlbid0IHNlZW4gYW55IGlzc3Vl
cyBidXQgdGhhdAo+IGRvZXNuJ3QgbWVhbiB0aGV5IGRvbid0IGV4aXN0Lgo+Cj4+PiBTaWduZWQt
b2ZmLWJ5OiBQYXJlc2ggQmhhZ2F0IDxwLWJoYWdhdEB0aS5jb20+Cj4+Pgo+Pj4gLS0tCj4+PiBD
aGFuZ2VzIHYzIC0+IHY0Ogo+Pj4gICAgLSBUaSBrMyAtPiBUSSBLMyAoU3VnZ2VzdGVkIGJ5IEFu
ZHJlYXMgRGFubmVuYmVyZykKPj4+ICAgIC0gZ2l0LnRpLm9yZyAtPiBnaXQudGkuY29tIChTdWdn
ZXN0ZWQgYnkgQW5kcmVhcyBEYW5uZW5iZXJnKQo+Pj4KPj4+IENoYW5nZXMgdjIgLT4gdjM6Cj4+
PiAgICAtIGZsZXhpYmlsdHkgLT4gZmxleGliaWxpdHkgKFN1Z2dlc3RlZCBieSBDaGlyYWcgU2hp
bHdhbnQpCj4+Pgo+Pj4gQ2hhbmdlcyB2MSAtPiB2MjoKPj4+ICAgIC0gRml4IHdoaXRlc3BhY2Vz
L2luZGVudGF0aW9uIGluIENvbmZpZy5pbiBmaWxlIChTdWdnZXN0ZWQgYnkgQnJ5YW4gQnJhdHRs
b2YpCj4+Pgo+Pj4gLS0tCj4+PiAgIGJvb3QvdGktazMtYm9vdC1maXJtd2FyZS9Db25maWcuaW4g
ICAgICAgICAgICB8IDMwICsrKysrKysrKysrKysrKysrKysKPj4+ICAgLi4uL3RpLWszLWJvb3Qt
ZmlybXdhcmUubWsgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPj4+ICAgMiBmaWxlcyBjaGFu
Z2VkLCAzMSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBh
L2Jvb3QvdGktazMtYm9vdC1maXJtd2FyZS9Db25maWcuaW4gYi9ib290L3RpLWszLWJvb3QtZmly
bXdhcmUvQ29uZmlnLmluCj4+PiBpbmRleCBkODBiYjRiZGIzLi41ODFlYzBjM2I5IDEwMDY0NAo+
Pj4gLS0tIGEvYm9vdC90aS1rMy1ib290LWZpcm13YXJlL0NvbmZpZy5pbgo+Pj4gKysrIGIvYm9v
dC90aS1rMy1ib290LWZpcm13YXJlL0NvbmZpZy5pbgo+Pj4gQEAgLTUsMyArNSwzMyBAQCBjb25m
aWcgQlIyX1RBUkdFVF9USV9LM19CT09UX0ZJUk1XQVJFCj4+PiAgIAkgIFRoaXMgcGFja2FnZSBk
b3dubG9hZHMgYW5kIGluc3RhbGxzIHRoZSBUSS1zcGVjaWZpYyB0aS1zeXNmdwo+Pj4gICAJICBh
bmQgdGktZG0gZmlybXdhcmUgbmVlZGVkIHRvIGJvb3QgVEkgSzMgcGxhdGZvcm1zICh3aGljaAo+
Pj4gICAJICBpbmNsdWRlIEFNNjJ4LCBBTTY0eCwgQU02NXggYW5kIG1vcmUpLgo+Pj4gKwo+Pj4g
K2lmIEJSMl9UQVJHRVRfVElfSzNfQk9PVF9GSVJNV0FSRQo+Pj4gK2Nob2ljZQo+Pj4gKwlwcm9t
cHQgInRpLWszLWJvb3QtZmlybXdhcmUgdmVyc2lvbiIKPj4+ICsJZGVmYXVsdCBCUjJfVEFSR0VU
X1RJX0szX0JPT1RfRklSTVdBUkVfTEFURVNUX1ZFUlNJT04KPj4+ICsJaGVscAo+Pj4gKwkgIFNl
bGVjdCB0aGUgdmVyc2lvbiBvZiBUSSBLMyBib290IGZpcm13YXJlIHlvdSB3YW50IHRvIHVzZS4K
Pj4+ICsKPj4+ICtjb25maWcgQlIyX1RBUkdFVF9USV9LM19CT09UX0ZJUk1XQVJFX0xBVEVTVF9W
RVJTSU9OCj4+PiArCWJvb2wgIjA5LjAyLjAwLjAwOSIKPj4+ICsKPj4+ICtjb25maWcgQlIyX1RB
UkdFVF9USV9LM19CT09UX0ZJUk1XQVJFX0NVU1RPTV9WRVJTSU9OCj4+PiArCWJvb2wgIkN1c3Rv
bSB2ZXJzaW9uIgo+Pj4gKwloZWxwCj4+PiArCSAgVGhpcyBvcHRpb24gYWxsb3dzIHRvIHVzZSBh
IHNwZWNpZmljIG9mZmljaWFsIHZlcnNpb24gZnJvbQo+Pj4gKwkgIGdpdC50aS5jb20uCj4+IFdo
ZW4geW91IHVzZSB0aGlzIG9wdGlvbiwgeW91IG5lZWQgdG8gZGlzYWJsZSB0aGUgaGFzaCBjaGVj
a2luZyB3aXRoOgo+Pgo+PiBCUl9OT19DSEVDS19IQVNIX0ZPUiArPSAkKFRJX0szX0JPT1RfRklS
TVdBUkVfU09VUkNFKQo+Pgo+PiBPdGhlcndpc2UgeW91IGdldDoKPj4KPj4gRVJST1I6IE5vIGhh
c2ggZm91bmQgZm9yIHRpLWxpbnV4LWZpcm13YXJlLTEwLjAwLjA1LnRhci54ego+Pgo+PiBTZWUg
aG93IGl0J3MgZG9uZSBmb3IgdGktazMtcjUtbG9hZGVyOgo+Pgo+PiBpZmVxICgkKEJSMl9UQVJH
RVRfVElfSzNfUjVfTE9BREVSKSQoQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJfTEFURVNUX1ZF
UlNJT04pLHkpCj4+IEJSX05PX0NIRUNLX0hBU0hfRk9SICs9ICQoVElfSzNfUjVfTE9BREVSX1NP
VVJDRSkKPj4gZW5kaWYKPj4KPiBBaCB5ZWFoIGFuZCB3ZSBzaG91bGQgcHJvYmFibHkgYWRkIHRo
ZSBjb3JyZXNwb25kaW5nIGhhc2ggZmlsZXMgaW4gdGhlCj4gYm9hcmQgZGlyZWN0b3J5IG9mIHRo
ZSBib2FyZHMgd2hvIHVzZSB0aGlzIGZvciB3aGVuIHRoaXMgdmVyc2lvbgo+IGNoYW5nZXMuIE9v
cHMKPgo+IH5CcnlhbgoKSSBzZWUgaGFzaCBjaGVja2luZyBpcyBkaXNhYmxlZCBvbmx5IHdoZW4g
dXNpbmcgdGhlIGxhdGVzdCB2ZXJzaW9uIGFuZCAKbm90IHdoZW4gYSBjdXN0b20gdmVyc2lvbiBp
cyBzcGVjaWZpZWQuIFNvIHNob3VsZCBpIGRpc2FibGUgaGFzaCAKY2hlY2tpbmcgZm9yIGxhdGVz
dCB2ZXJzaW9uIGhlcmUgdG9vPwoKUmVnYXJkcywKClBhcmVzaAoKPgo+PiBCZXN0IHJlZ2FyZHMs
Cj4+IFJvbWFpbgo+Pgo+Pgo+Pj4gKwo+Pj4gK2VuZGNob2ljZQo+Pj4gKwo+Pj4gK2NvbmZpZyBC
UjJfVEFSR0VUX1RJX0szX0JPT1RfRklSTVdBUkVfQ1VTVE9NX1ZFUlNJT05fVkFMVUUKPj4+ICsJ
c3RyaW5nICJDdXN0b20gdGktazMtYm9vdC1maXJtd2FyZSB2ZXJzaW9uIgo+Pj4gKwlkZXBlbmRz
IG9uIEJSMl9UQVJHRVRfVElfSzNfQk9PVF9GSVJNV0FSRV9DVVNUT01fVkVSU0lPTgo+Pj4gKwo+
Pj4gK2NvbmZpZyBCUjJfVEFSR0VUX1RJX0szX0JPT1RfRklSTVdBUkVfVkVSU0lPTgo+Pj4gKwlz
dHJpbmcKPj4+ICsJZGVmYXVsdCAiMDkuMDIuMDAuMDA5IiAgICAgaWYgQlIyX1RBUkdFVF9USV9L
M19CT09UX0ZJUk1XQVJFX0xBVEVTVF9WRVJTSU9OCj4+PiArCWRlZmF1bHQgQlIyX1RBUkdFVF9U
SV9LM19CT09UX0ZJUk1XQVJFX0NVU1RPTV9WRVJTSU9OX1ZBTFVFIFwKPj4+ICsJCQkJaWYgQlIy
X1RBUkdFVF9USV9LM19CT09UX0ZJUk1XQVJFX0NVU1RPTV9WRVJTSU9OCj4+PiArCj4+PiArZW5k
aWYKPj4+IGRpZmYgLS1naXQgYS9ib290L3RpLWszLWJvb3QtZmlybXdhcmUvdGktazMtYm9vdC1m
aXJtd2FyZS5tayBiL2Jvb3QvdGktazMtYm9vdC1maXJtd2FyZS90aS1rMy1ib290LWZpcm13YXJl
Lm1rCj4+PiBpbmRleCA5MzMyNzMyYWQ0Li4zNTAzODFlYmJlIDEwMDY0NAo+Pj4gLS0tIGEvYm9v
dC90aS1rMy1ib290LWZpcm13YXJlL3RpLWszLWJvb3QtZmlybXdhcmUubWsKPj4+ICsrKyBiL2Jv
b3QvdGktazMtYm9vdC1maXJtd2FyZS90aS1rMy1ib290LWZpcm13YXJlLm1rCj4+PiBAQCAtNCw3
ICs0LDcgQEAKPj4+ICAgIwo+Pj4gICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+Pj4gICAKPj4+
IC1USV9LM19CT09UX0ZJUk1XQVJFX1ZFUlNJT04gPSAwOS4wMi4wMC4wMDkKPj4+ICtUSV9LM19C
T09UX0ZJUk1XQVJFX1ZFUlNJT04gPSAkKGNhbGwgcXN0cmlwLCQoQlIyX1RBUkdFVF9USV9LM19C
T09UX0ZJUk1XQVJFX1ZFUlNJT04pKQo+Pj4gICBUSV9LM19CT09UX0ZJUk1XQVJFX1NJVEUgPSBo
dHRwczovL2dpdC50aS5jb20vY2dpdC9wcm9jZXNzb3ItZmlybXdhcmUvdGktbGludXgtZmlybXdh
cmUvc25hcHNob3QKPj4+ICAgVElfSzNfQk9PVF9GSVJNV0FSRV9TT1VSQ0UgPSB0aS1saW51eC1m
aXJtd2FyZS0kKFRJX0szX0JPT1RfRklSTVdBUkVfVkVSU0lPTikudGFyLnh6Cj4+PiAgIFRJX0sz
X0JPT1RfRklSTVdBUkVfSU5TVEFMTF9JTUFHRVMgPSBZRVMKPj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+
PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
