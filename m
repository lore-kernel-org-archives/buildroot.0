Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED8FC5AD4E
	for <buildroot@archiver.kernel.org>; Mon, 10 Aug 2026 09:29:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B2D060628;
	Mon, 10 Aug 2026 09:29:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j_9IHbLaAPfl; Mon, 10 Aug 2026 09:29:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A20D6065A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786354153;
	bh=aJgbrSPJ9DrFBl5HqUUB1clFLeCpYp9DRpsJ7NWfjto=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HZDIcLVxYEjBBZ0Y7L5r48ZGP/e5EVSH1aDibd703DMIPQ2KPQGlAHd94DaPLIykk
	 0cReLrNbB9u33iTNXtZbbWtLExrEexTyuHXzNDJNE7LhHIyKoEbeGvaFO4fVvyfX0K
	 AMGEKEkKBYkN7hML1ITOaptAPqa/3jH7ErpnWNMwRyqe7jMPFvO/aKty6wRqWFkZGb
	 yrV7qQlBz6JHwVffNB9ItwljXRGZ306YUUnDRJg9zJ9MSqpdBq00B8bDHpjf+q2C3s
	 egQgPU2GimInDWu3l5cMSAdXtECElWfeSroEUAKTcvTtMNIzibVMePnKCl7JfIA7t3
	 Rf7l6e3FUoTaw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A20D6065A;
	Mon, 10 Aug 2026 09:29:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A82E282
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 09:29:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4B16400E9
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 09:29:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gza7D043lWv4 for <buildroot@buildroot.org>;
 Mon, 10 Aug 2026 09:29:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B2C71400DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2C71400DB
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B2C71400DB
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 09:29:10 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id B92661A14C6
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 09:29:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8D2696033B;
 Mon, 10 Aug 2026 09:29:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6CD8411C4A020; 
 Mon, 10 Aug 2026 11:29:02 +0200 (CEST)
Mime-Version: 1.0
Date: Mon, 10 Aug 2026 11:29:01 +0200
Message-Id: <DKL5OZPSP69X.2WIL567PI8DXH@bootlin.com>
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: <buildroot@buildroot.org>, "Nicolas Carrier"
 <nicolas.carrier@nav-timing.safrangroup.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260806-host_tools-v1-0-19c63ecc3b10@bootlin.com>
 <20260806-host_tools-v1-2-19c63ecc3b10@bootlin.com>
 <anWV0uzil1jp4BNN@windsurf>
In-Reply-To: <anWV0uzil1jp4BNN@windsurf>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1786354143; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=KpAU7sDV3JvW63qlWhBacu+BVCRdFLGNK+j087VwCuk=;
 b=WkjD/s1NL6SQXqRkrqq85IFZn6k0xP5cJ48caMgqt7smFxaQVwZKxmzRbF+x53cqfZ+ydB
 rI3bWfhJ9LgK+b+4ntLbfDG4ZefwnxdbLOiKgXLc0b2CfeTwKPe+HQbd5heduoTdTE1J5x
 m3grdStaBBzwBjPerfkjAbUR7OWdeT6bq8JjbqCRlxnrgeRh1+jvETGtrpVn5P650e0G8s
 A9EedTNsRweQuJfihu6r2GfBEhvu2LLOfKsUdfcUw0XTF0JYcaNCmxIy+S1Uvg5nLnyVI4
 nDA92PNShcBYzcKnVvG5rqTAesiGZglDNEA27QZFe3RgoAnKyCKYr1aGwLqDNQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=WkjD/s1N
Subject: Re: [Buildroot] [PATCH 2/2] package/sass: new package
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpIEF1ZyA3LCAyMDI2IGF0IDEwOjI5IEFNIENFU1QsIFRob21hcyBQZXRhenpvbmkgd3Jv
dGU6Cj4gSGVsbG8gQWxleGlzLAo+Cj4gT24gVGh1LCBBdWcgMDYsIDIwMjYgYXQgMTE6MjQ6MjNQ
TSArMDIwMCwgQWxleGlzIExvdGhvcsOpIHdyb3RlOgo+PiBzYXNzIGlzIGEgY3NzIGV4dGVuc2lv
biBhZGRpbmcgcHJvZ3JhbW1pbmcgZmVhdHVyZXMgdG8gY3NzLgo+PiAKPj4gaHR0cHM6Ly9naXRo
dWIuY29tL3Nhc3MvZGFydC1zYXNzCj4+IAo+PiBUaGUgc291cmNlIGNvbmZpZ3VyZWQgZm9yIHRo
ZSBwYWNrYWdlIGlzIG5vdCBhIGdpdGh1YiByZXBvc2l0b3J5LCBhcyB0aGUKPj4gb2ZmaWNpYWwg
c291cmNlcyBmb3Igc2FzcyBhcmUgaW4gZmFjdCBpbiBEYXJ0OiB0aG9zZSBzb3VyY2VzIGFyZQo+
PiBhdXRvbWF0aWNhbGx5IGJ1aWx0IGludG8gYSBqYXZhc2NyaXB0IG1vZHVsZSBieSB0aGUgY29y
cmVzcG9uZGluZyBnaXRodWIKPj4gd29ya2Zsb3cgKFsxXSkuIFJhdGhlciB0aGFuIHRyeWluZyB0
byByZXBsaWNhdGUgdGhlIHdob2xlIGRhcnQgYnVpbGQsCj4+IHRoaXMgbmV3IHBhY2thZ2UganVz
dCBkb3dubG9hZHMgdGhlIHNvdXJjZXMgZm9yIHNhc3MgZnJvbSBucG1qcwo+PiBkaXJlY3RseS4K
Pj4gCj4+IFsxXQo+PiBodHRwczovL2dpdGh1Yi5jb20vc2Fzcy9kYXJ0LXNhc3MvYmxvYi9tYWlu
Ly5naXRodWIvd29ya2Zsb3dzL3JlbGVhc2UueW1sCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBBbGV4
aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgo+Cj4gSSBhbSBub3Qgc3Vw
ZXIgY2xlYXIgb24gd2hhdCBzYXNzIGV4YWN0bHkgZG9lcy9pcy4gQnV0IHNvbWUgdGltZSBhZ28s
Cj4gd2UgZHJvcHBlZCBhbGwgSlMgbGlicmFyaWVzIGZyb20gQnVpbGRyb290Ogo+Cj4gICBodHRw
czovL2xvcmUua2VybmVsLm9yZy9idWlsZHJvb3QvMjAyNTA4MjkxMDMzNDAuMTU4ODczLTEtdGhv
bWFzLnBlcmFsZUBtaW5kLmJlLwoKVGhhbmtzIGZvciB0aGUgbGluaywgZ29vZCB0byBrbm93LgoK
PiBCdXQgc2FzcyBkb2Vzbid0IHNlZW0gdG8gYmUgb25lIG9mIHRob3NlIHN0YXRpYyBKUyBsaWJy
YXJpZXMgSSBndWVzcwo+IGJlY2F1c2UgaXQgaW5zdGFsbHMgc29tZSBleGVjdXRhYmxlIGhvc3Qg
dG9vbD8KClllcywgdGhlIGdvYWwgaGVyZSByZWFsbHkgaXMgdG8gaW5zdGFsbCBhICJzYXNzIGJp
bmFyeSIgaW4KJChIT1NUX0RJUikvYmluIHRvIGJlIGFibGUgdG8gdXNlIGl0IGF0IGJ1aWxkIHRp
bWUsIGJ1dCAiYmluYXJ5IiBpcyBhCmtpbmQgb2Ygc3Ryb25nIHdvcms6IHRoaXMgcmVhbGx5IGlz
IGEgbm9kZSBzY3JpcHQuCgo+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9zYXNzL3Nhc3MubWsgYi9w
YWNrYWdlL3Nhc3Mvc2Fzcy5tawo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAwMDAw
MDAwMDAwMDAuLmM3OTEwOWJlNDRhMgo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL3BhY2thZ2Uv
c2Fzcy9zYXNzLm1rCj4+IEBAIC0wLDAgKzEsMzAgQEAKPj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjCj4+ICsjCj4+ICsjIHNhc3MKPj4gKyMKPj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4+
ICsKPj4gK1NBU1NfVkVSU0lPTiA9IDEuMTAyLjAKPj4gK1NBU1NfU09VUkNFID0gc2Fzcy0kKFNB
U1NfVkVSU0lPTikudGd6Cj4+ICtTQVNTX1NJVEUgPSBodHRwczovL3JlZ2lzdHJ5Lm5wbWpzLm9y
Zy9zYXNzLy0KPj4gK1NBU1NfTElDRU5TRSA9IE1JVAo+PiArU0FTU19MSUNFTlNFX0ZJTEVTID0g
TElDRU5TRQo+PiArSE9TVF9TQVNTX0RFUEVOREVOQ0lFUyA9IGhvc3Qtbm9kZWpzCj4+ICsKPj4g
K2RlZmluZSBIT1NUX1NBU1NfQlVJTERfQ01EUwo+PiArCSQoSE9TVF9ESVIpL2Jpbi9ucG0gaW5z
dGFsbCBcCj4+ICsJCS0tcHJlZml4ICQoQEQpIFwKPj4gKwkJLS1wcm9kdWN0aW9uIFwKPj4gKwkJ
LS1uby1hdWRpdCBcCj4+ICsJCS0tbm8tZnVuZAo+Cj4gV2hhdCBpcyB0aGlzICJucG0gaW5zdGFs
bCIgZG9pbmc/IElzbid0IGl0IGRvd25sb2FkaW5nIHJhbmRvbSBzdHVmZgo+IGZyb20gdGhlIElu
dGVybmV0PwoKWWVzLCB0aGlzIGBucG0gaW5zdGFsbGAgZG93bmxvYWRzIDMgZGVwZW5kZW5jaWVz
IGZvciB0aGlzIHNhc3MgdG9vbC4KSSB1bmRlcnN0YW5kIHRoYXQgaXQgaXMgbm90IGlkZWFsICho
YXZpbmcgc29tZSBkb3dubG9hZCBpbiB0aGUgYnVpbGQKc3RlcCksIGJ1dCBwcm9wb3NlZCBpdCBh
bnl3YXksIGFzIGl0IHdhcyBhIHBvdGVudGlhbCAia25vd24gaXNzdWUiIGluCkFybm91dCdzIHBy
b3Bvc2FsIChbMV0pLiBCdXQgaWYgdGhpcyBpcyBmaW5hbGx5IGEgbm8tZ28sIHRoaW5raW5nIGEg
Yml0Cm1vcmUgYWJvdXQgaXQsIEkgc2VlIHR3byBtYWluIG9wdGlvbnM6Ci0gZmluZCBhIHdheSB0
byB2ZW5kb3IgdGhlIGRlcGVuZGVuY2llcyAobWF5IGJlIGFzIHNpbXBsZSBhcyBzZXR0aW5nIGEK
ICBwb3N0IGRvd25sb2FkIGhvb2sgd2hpY2ggcGVyZm9ybXMgdGhlIG5wbSBpbnN0YWxsID8pCi0g
dGhpcyBzYXNzIHBhY2thZ2UgaXMgYSBub2RlIHdyYXBwZXIgYXJvdW5kIHRoZSBvZmZpY2lhbCBw
cm9qZWN0CiAgZGFydC1zYXNzIChbMl0pLiBJIGRpZCBub3QgdGFrZSBhIGxvb2sgYXQgYWxsIGF0
IGhvdyB0byBidWlsZCBhbmQgcnVuCiAgaXQgKEkgYW0gcHJldHR5IGlnbm9yYW50IGluIERhcnQp
LCBidXQgSSBjYW4gdGFrZSBhIGxvb2suIEkgYW0gbm90CiAgc3VyZSBob3cgY2FwYWJsZSBCdWls
ZHJvb3QgaXMgYWJvdXQgYnVpbGRpbmcgRGFydCBwcm9qZWN0cyAoSSBzZWUgc29tZQogIGZsdXR0
ZXItc2RrLWJpbiBwYWNrYWdlLCBJIGFtIG5vdCBzdXJlIGhvdyByZS11c2FibGUgaXQgY291bGQg
YmUgdG8KICBidWlsZCBzb21lIHJhbmRvbWUgZGFydCBwcm9qZWN0cykKClsxXSBodHRwczovL2xv
cmUua2VybmVsLm9yZy9idWlsZHJvb3QvMjAyMjAxMTkxNDA3MDMuMTI5NzgtMS10b20ubWFyY3V6
emlAb3JvbGlhLmNvbS8KWzJdIGh0dHBzOi8vc2Fzcy1sYW5nLmNvbS9kYXJ0LXNhc3MvCgpBbGV4
aXMKCi0tIApBbGV4aXMgTG90aG9yw6ksIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5l
bCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
