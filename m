Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DED8C433EF
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 21:21:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A02A611C1
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 21:21:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6A02A611C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F28FE40217;
	Fri,  5 Nov 2021 21:21:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 85ihW88cHG6p; Fri,  5 Nov 2021 21:21:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D5554011F;
	Fri,  5 Nov 2021 21:21:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0AA311BF5B5
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 21:21:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE5BB407A3
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 21:21:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T7eCCLAcEA9Q for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 21:21:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 22B27407A0
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 21:21:15 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9d6e:5497:a761:f603])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 4E5075FF20;
 Fri,  5 Nov 2021 22:21:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636147273;
 bh=H7gosP1+bDYP1yrOtIKWisUQs9D4Guu8OWPrktAuNyc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jc4CbwAfO3GxLkNROIcWxOZelt/TywdrgWhedpiK5r9rkzbtK9kSSjAhbLFAd1dzl
 Xb85UhtujgSThk9Asbf4wFfjaIeSlkug+45fLMJM6rDNxJ1LZ3opsnOnlxiMV/1kFk
 O/kFdQxpXBTqmYUIsbRmEncoEJ35piz/eZy/KzsMlzdXR3x6jMsiw3ptt+8Mc+L26o
 /RksxH4OpHAM7RA9TF8vvFBmsq1ihNVmSbxoMuISB20hsetR1+o/OPuqYkFEU0SOmz
 VJ6aOBPbYEWP5HBT7QdpLnsJaDu5eUZaaqU+9O1XRJQqjUZC/iEUypBKLE6axCL9dr
 cC9NgTy5PJuKg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 05 Nov 2021 22:21:08 +0100
Date: Fri, 5 Nov 2021 22:21:08 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: stsp <stsp2@yandex.ru>
Message-ID: <20211105212108.GF2400@scaer>
References: <3c3603ba-5719-fec9-9bb3-7b0f3967fc9f@yandex.ru>
 <20211104203655.GA2400@scaer>
 <0eeb0b07-b119-8d8c-b3a1-06064c2bf2ee@yandex.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0eeb0b07-b119-8d8c-b3a1-06064c2bf2ee@yandex.ru>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] generic code with i7 bootlin toolchain?
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

U3N0cCwgQWxsLAoKT24gMjAyMS0xMS0wNCAyMzo1OSArMDMwMCwgc3RzcCBzcGFrZSB0aHVzbHk6
Cj4gMDQuMTEuMjAyMSAyMzozNiwgWWFubiBFLiBNT1JJTiDQv9C40YjQtdGCOgo+ID4+U28gaXQg
bG9va3MgbGlrZSB0aGUKPiA+PkJSMl9UQVJHRVRfT1BUSU1JWkFUSU9OCj4gPj5pcyBzb21laG93
IGFwcGxpZWQgbm90IHRvIGFsbAo+ID4+YnVpbHQgcGFja2FnZXM/IFdoeSBjYW4gdGhhdCBiZT8K
PiA+PklzIHRoZXJlIGFueSBvdGhlciB3YXkgSSBjYW4KPiA+PnV0aWxpemUgYm9vdGxpbiB0b29s
LWNoYWluIGZvciBzb21lCj4gPj4iZ2VuZXJpYyIgKG5vbi1TU0UzLzQpIENQVT8KPiA+WW91IHdp
bGwgbm90IGJlIGFibGUgdG8gdXNlIHRoYXQgdG9vbGNoYWluIGZvciB0aGUgUGhlbm9tLiBZb3Ug
d2lsbCBoYXZlCj4gPnRvIGJ1aWxkIHlvdXIgb3duIHRvb2xjaGFpbi4KPiA+Cj4gPk5vdGUgdGhh
dCB5b3UgY2FuIGJ1aWxkIHRoZSB0b29sY2hhaW4gb25jZSwgYW5kIGxhdGVyIHJlLXVzZSB0aGF0
IGFzIGEKPiA+cHJlLWJ1aWx0IHRvb2xjaGFpbi4gU2VlIHRoZSBtYW51YWwgb24gZGlyZWN0aW9u
cyBvbiBob3cgdG8gZG8gdGhhdDoKPiA+ICAgICBodHRwczovL2J1aWxkcm9vdC5vcmcvZG93bmxv
YWRzL21hbnVhbC9tYW51YWwuaHRtbCNfY3Jvc3NfY29tcGlsYXRpb25fdG9vbGNoYWluCj4gVGhh
bmtzLCAibWFrZSBzZGsiIGlzIGFuCj4gaW50ZXJlc3Rpbmcgc3ViamVjdCB0byBwbGF5IHdpdGgu
Cj4gSG93ZXZlciwgYW55IGhvcGVzIGJvb3RsaW4KPiBjYW4gcHJvdmlkZSB0aGUgImdlbmVyaWMi
Cj4gdG9vbC1jaGFpbiBpbiBhZGRpdGlvbiB0byBpNz8KClRoYXQncyB1cCB0byB0aGVtIHRvIGRl
Y2lkZSB3aGF0IHRoZXkgcHJvdmlkZSBhbmQgaG9zdC4gTWF5YmUgeW91IGNhbgpjb250cmFjdCB3
aXRoIHRoZW0/IDstKQoKPiBBbHNvIHRoZSBkb2MgeW91IG1lbnRpb25lZCwKPiBwb2ludHMgdG8g
c29tZSBjb2Rlc291cmNlcnkKPiB0b29sLWNoYWluLiBXaGVyZSBpcyBpdD8KClRoZSBtYW51YWwg
aXMgbm90IHVwLXRvLWRhdGUgaW4gdGhpcyByZXNwZWN0OiB0aGVyZSBpcyBubyBsb25nZXIgYQpD
b2RlU291cmNlcnkgdG9vbGNoYWluIGZvciB4ODYveDg2LTY0IGFueW1vcmUgKHNlZSBjb21taXQg
ZDg3ZTExNGE4ZmZhKS4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlz
dAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0t
LS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4K
fCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9O
IHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVz
aWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYx
IDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAg
VGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAv
IFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0t
LS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
