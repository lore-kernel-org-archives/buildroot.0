Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A283CCD183
	for <buildroot@archiver.kernel.org>; Mon, 13 Oct 2025 18:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DE1D40A7B;
	Mon, 13 Oct 2025 18:52:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ovpz6ep9hqS2; Mon, 13 Oct 2025 18:52:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8EF540AC9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8EF540AC9;
	Mon, 13 Oct 2025 18:52:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B17B4BC
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 18:52:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A272060E17
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 18:52:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id buRFn5SrkG3K for <buildroot@buildroot.org>;
 Mon, 13 Oct 2025 18:52:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C68F560E16
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C68F560E16
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C68F560E16
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 18:52:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 91AE819F5AF;
 Mon, 13 Oct 2025 20:52:04 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 13 Oct 2025 20:52:04 +0200
MIME-Version: 1.0
Date: Mon, 13 Oct 2025 20:52:04 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Herv=C3=A9_Codina?=
 <herve.codina@bootlin.com>
In-Reply-To: <20251013162158.204270-1-titouan.christophe@mind.be>
References: <20251013162158.204270-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <b7e0d31d4b69cf2b253ad90a00434bfb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760381526;
 bh=w6DqyebfWaK8knSFa/Z93Pv0tz6NbqWe3ppO4ndNrp0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=W+mvr0gkQ1WdOUKB0r0BE7Bggeq8HaSC/ahPJY/3NALNT9ze7wNgaDd+xoHZeBsxT
 M1U5ubxIAzCC6Ha3CBPDVapM6oTjYZDKnz2j3Ykl7JcNH7uNLz4+CrDR/ki6YxXIF/
 VzVS5Ih97G19xjh8+taeYl4gXmuaZvFxgM0mtLfg+6DJRDQKzaPE4ONT+hMkj/RNrP
 cLS1zPO5XlZDy50AwhSf7tx+pWfiErf3hJzXlHoKZtmTrJX9AzqqJYQ/KTLzGpdKqC
 7qPoa4jOmx2LvpLieGWs32OFW9LSJW9YBqoVefwhzuYPI5mgQXkzvoBMKvjPMeVLBE
 M6ev3Ho3piEPw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=W+mvr0gk
Subject: Re: [Buildroot] [PATCH] package/modsecurity2: security bump to
 v2.9.12
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

T24gMTMvMTAvMjAyNSAxODoyMSwgVGl0b3VhbiBDaHJpc3RvcGhlIHZpYSBidWlsZHJvb3Qgd3Jv
dGU6Cj4gU2VlIHRoZSByZWxlYXNlIG5vdGVzOgo+IC0gaHR0cHM6Ly9naXRodWIuY29tL293YXNw
LW1vZHNlY3VyaXR5L01vZFNlY3VyaXR5L3JlbGVhc2VzL3RhZy92Mi45LjExCj4gLSBodHRwczov
L2dpdGh1Yi5jb20vb3dhc3AtbW9kc2VjdXJpdHkvTW9kU2VjdXJpdHkvcmVsZWFzZXMvdGFnL3Yy
LjkuMTIKPiAKPiBUaGlzIGZpeGVzIHRoZSBmb2xsb3dpbmcgdnVsbmVyYWJpbGl0aWVzOgo+IC0g
Q1ZFLTIwMjUtNTI4OTE6Cj4gICAgIE1vZFNlY3VyaXR5IGlzIGFuIG9wZW4gc291cmNlLCBjcm9z
cyBwbGF0Zm9ybSB3ZWIgYXBwbGljYXRpb24gCj4gZmlyZXdhbGwKPiAgICAgKFdBRikgZW5naW5l
IGZvciBBcGFjaGUsIElJUyBhbmQgTmdpbnguIEluIHZlcnNpb25zIDIuOS44IHRvIGJlZm9yZQo+
ICAgICAyLjkuMTEsIGFuIGVtcHR5IFhNTCB0YWcgY2FuIGNhdXNlIGEgc2VnbWVudGF0aW9uIGZh
dWx0LiBJZgo+ICAgICBTZWNQYXJzZVhtbEludG9BcmdzIGlzIHNldCB0byBPbiBvciBPbmx5QXJn
cywgYW5kIHRoZSByZXF1ZXN0IHR5cGUgCj4gaXMKPiAgICAgYXBwbGljYXRpb24veG1sLCBhbmQg
YXQgbGVhc3Qgb25lIFhNTCB0YWcgaXMgZW1wdHkgKGVnIAo+IDxmb28+PC9mb28+KSwKPiAgICAg
dGhlbiBhIHNlZ21lbnRhdGlvbiBmYXVsdCBvY2N1cnMuIFRoaXMgaXNzdWUgaGFzIGJlZW4gcGF0
Y2hlZCBpbgo+ICAgICB2ZXJzaW9uIDIuOS4xMS4gQSB3b3JrYXJvdW5kIGludm9sdmVzIHNldHRp
bmcgU2VjUGFyc2VYbWxJbnRvQXJncyAKPiB0bwo+ICAgICBPZmYuCj4gICAgIGh0dHBzOi8vd3d3
LmN2ZS5vcmcvQ1ZFUmVjb3JkP2lkPUNWRS0yMDI1LTUyODkxCj4gCj4gLSBDVkUtMjAyNS01NDU3
MToKPiAgICAgTW9kU2VjdXJpdHkgaXMgYW4gb3BlbiBzb3VyY2UsIGNyb3NzIHBsYXRmb3JtIHdl
YiBhcHBsaWNhdGlvbiAKPiBmaXJld2FsbAo+ICAgICAoV0FGKSBlbmdpbmUgZm9yIEFwYWNoZSwg
SUlTIGFuZCBOZ2lueC4gSW4gdmVyc2lvbnMgMi45LjExIGFuZCAKPiBiZWxvdywKPiAgICAgYW4g
YXR0YWNrZXIgY2FuIG92ZXJyaWRlIHRoZSBIVFRQIHJlc3BvbnNl4oCZcyBDb250ZW50LVR5cGUs
IHdoaWNoIAo+IGNvdWxkCj4gICAgIGxlYWQgdG8gc2V2ZXJhbCBpc3N1ZXMgZGVwZW5kaW5nIG9u
IHRoZSBIVFRQIHNjZW5hcmlvLiBGb3IgZXhhbXBsZSwgCj4gd2UKPiAgICAgaGF2ZSBkZW1vbnN0
cmF0ZWQgdGhlIHBvdGVudGlhbCBmb3IgWFNTIGFuZCBhcmJpdHJhcnkgc2NyaXB0IHNvdXJjZQo+
ICAgICBjb2RlIGRpc2Nsb3N1cmUgaW4gdGhlIGxhdGVzdCB2ZXJzaW9uIG9mIG1vZF9zZWN1cml0
eTIuIFRoaXMgaXNzdWUgCj4gaXMKPiAgICAgZml4ZWQgaW4gdmVyc2lvbiAyLjkuMTIuCj4gICAg
IGh0dHBzOi8vd3d3LmN2ZS5vcmcvQ1ZFUmVjb3JkP2lkPUNWRS0yMDI1LTU0NTcxCj4gCj4gU2ln
bmVkLW9mZi1ieTogVGl0b3VhbiBDaHJpc3RvcGhlIDx0aXRvdWFuLmNocmlzdG9waGVAbWluZC5i
ZT4KCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
