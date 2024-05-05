Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD0BC4345F
	for <buildroot@archiver.kernel.org>; Sun,  5 May 2024 20:40:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FB2840336;
	Sun,  5 May 2024 20:40:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aAODFgwd1Vtf; Sun,  5 May 2024 20:40:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DBFD40362
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DBFD40362;
	Sun,  5 May 2024 20:40:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E39131BF280
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 20:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CEC5040362
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 20:40:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pKceNlSdyZeV for <buildroot@lists.busybox.net>;
 Sun,  5 May 2024 20:40:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A375640336
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A375640336
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A375640336
 for <buildroot@buildroot.org>; Sun,  5 May 2024 20:40:35 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id A852313F88E;
 Sun,  5 May 2024 22:40:27 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 05 May 2024 22:40:27 +0200
Date: Sun, 5 May 2024 22:40:27 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: julien.boibessot@armadeus.com
Message-ID: <Zjfuu1QNP4nf1908@landeda>
References: <20240503154856.763551-1-julien.boibessot@armadeus.com>
 <ZjdFdee2PdlJ22gq@landeda>
 <dc60d28929a40047698d678e756c2dd4@armadeus.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dc60d28929a40047698d678e756c2dd4@armadeus.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1714941632;
 bh=oP4FFCu7ckor0Hii7TqtHTH5CUpb51pUu8LdPsHVsJw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ple7dlhWtKgUwhFE8dANnQTRt1IleeA8ek689vS1znfIMP65LyoWn2E0MUdF5w+DY
 MVyGA/WosEbc3aEFpY80GOss/iiGgC8fZigYX0AqT+HcN9RJA++wNmqLXoGI2EVd6t
 NPA7Nhz1SimT7Qup/rN7OB8J+24wJsLxQGVlJgSkZ4y9BF6I2Gq4sb6BSpXykJkHqQ
 CMl8RFbpAzWtG7HdYJOe08AbSq7ZAJf0DKactdpjfnSGLqmaqSSt1xyoLZsiAXxbul
 PKzXnrEPbywyAbNPR6bmeiaJy83WXFhB0e+WOasFPL9XQgChUbPmwVCWqMNJ8QWQS9
 ED+BXuIQWJHLA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Ple7dlhW
Subject: Re: [Buildroot] [PATCH 1/3] configs/armadeus_apf27: add hashes for
 Linux/U-Boot
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
Cc: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SnVsaWVuLCBBbGwsCgpPbiAyMDI0LTA1LTA1IDIyOjA3ICswMjAwLCBqdWxpZW4uYm9pYmVzc290
QGFybWFkZXVzLmNvbSBzcGFrZSB0aHVzbHk6Cj4gTGUgMjAyNC0wNS0wNSAxMDozOCwgWWFubiBF
LiBNT1JJTiBhIMOpY3JpdMKgOgo+ID4gSnVsaWVuLCBBbGwsCj4gPiBPbiAyMDI0LTA1LTAzIDE3
OjQ4ICswMjAwLCBKdWxpZW4gQk9JQkVTU09UIHNwYWtlIHRodXNseToKPiA+ID4gQW5kIGVuYWJs
ZSBCUjJfRE9XTkxPQURfRk9SQ0VfQ0hFQ0tfSEFTSEVTLiBBcyBhc2tlZCBCeSBSb21haW4uCj4g
PiAgICAgJCAuL3V0aWxzL2RvY2tlci1ydW4gbWFrZSBjaGVjay1wYWNrYWdlCj4gPiAgICAgY29u
Zmlncy9hcm1hZGV1c19hcGYyN19kZWZjb25maWc6MDogbGliX2RlZmNvbmZpZy5Gb3JjZUNoZWNr
SGFzaAo+ID4gd2FzIGV4cGVjdGVkIHRvIGZhaWwsIGRpZCB5b3UgZml4IHRoZSBmaWxlIGFuZCBm
b3JnZXQgdG8gdXBkYXRlCj4gPiAuY2hlY2twYWNrYWdlaWdub3JlPwpbLS1TTklQLS1dCj4gVGhh
bmtzIGZvciB0aGUgZml4ICEgSSBhbHNvIHNhdyB0aGUgbWVzc2FnZXMgd2hlbiBydW5uaW5nICJt
YWtlCj4gY2hlY2stcGFja2FnZSIgYnV0IGRpZG4ndCBrbm93IGlmIGl0IHdhcyBteSBqb2Igb3Ig
bm90IHRvIGZpeAo+IC5jaGVja3BhY2thZ2VpZ25vcmUgZmlsZS4KCkVudHJpZXMgaW4gLmNoZWNr
cGFja2FnZWlnbm9yZSBtZWFucyB0aGF0IHRob3NlIGZpbGVzIGFyZSBleGVtcGxldGVkCmZyb20g
dGhlIGFzc29jaWF0ZWQgdGVzdHMuIFByZXN1bWFibHksIHRob3NlIGZpbGVzIHByZS1leGlzdGVk
CmNoZWNrLXBhY2thZ2UsIGFuZCB0aHVzIHdlIGRpZCBub3Qgd2FudCB0byBmYWlsIGZvciB0aG9z
ZSwgc28gd2UKZXhjbHVkZWQgdGhlbS4KClNvLCB3aGVuIGEgZmlsZSBpcyBmaXhlZCwgdGhlIGNv
cnJlc3BvbmRpbmcgZXhjbHVzaW9uIG11c3QgYmUgcmVtb3ZlZC4KCkluIHRoaXMgY2FzZSwgeW91
IGZpeGVkIHRoZSBsaWJfZGVmY29uZmlnLkZvcmNlQ2hlY2tIYXNoIHRlc3QsIHNvIG5vdyBpdApu
byBsb25nZXIgZmFpbHMsIGJ1dCBpdCB3YXMgZXhwZWN0ZWQgdG8gZmFpbC4gc28gdGhlIGNvcnJl
Y3Qgc29sdXRpb24gaXMKaW5kZWVkIGZvciB5b3UgdG8gc3RhdGUgInllcywgSSBmaXhlZCBpdCwg
c28gaXQgaXMgbm8gbG9uZ2VyIGV4Y2x1ZGVkISIuCgo+IElzIHRoZXJlIGFueSBkb2N1bWVudGF0
aW9uIG9uIHdoYXQgSSB3YXMgc3VwcG9zZWQgdG8gZG8gPwoKRXJyLi4uIEpva2VyLgoKVGhhbmtz
IQoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0t
LS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8
ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04g
fCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNp
Z25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEg
MDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBU
aGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8g
XCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0t
LS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
