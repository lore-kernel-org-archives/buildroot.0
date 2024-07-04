Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23D86C30653
	for <buildroot@archiver.kernel.org>; Thu,  4 Jul 2024 08:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3D97813EB;
	Thu,  4 Jul 2024 08:54:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dXWJKPSv5zdp; Thu,  4 Jul 2024 08:54:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 298D681379
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 298D681379;
	Thu,  4 Jul 2024 08:54:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0AB981BF2B7
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 08:54:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB1184094B
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 08:54:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id erj3IikZDkFe for <buildroot@lists.busybox.net>;
 Thu,  4 Jul 2024 08:54:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 47B744097F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47B744097F
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 47B744097F
 for <buildroot@buildroot.org>; Thu,  4 Jul 2024 08:54:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 8E73119F59C;
 Thu,  4 Jul 2024 10:54:34 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:59050])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 04 Jul 2024 10:54:34 +0200
MIME-Version: 1.0
Date: Thu, 04 Jul 2024 10:54:34 +0200
From: Julien Olivain <ju.o@free.fr>
To: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <aa5d66c7-625f-49c0-a5ae-dd4be92a11cd@smile.fr>
References: <20240702131925.248165-1-ju.o@free.fr>
 <aa5d66c7-625f-49c0-a5ae-dd4be92a11cd@smile.fr>
User-Agent: Webmail Free/1.6.7
Message-ID: <2e195625172f71646c9de48409f659c1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1720083275;
 bh=S21fZmU7hCtgRYp9VLv/58kkVjhDuP0iwWsnJT93KZg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RhjwDF1fWQchJuJFLBS2xoUIMQ1X0oCnSFvtpcRi73pjNFr9JUlug0v9qTApvgT0d
 vf6LCkrnepu5+GKDkqHbJ2ODduIpHHXU24+H8uW+vyAlaqrb7os41P+z+C+0k1Iflm
 TMXzyO0iuvB2IWgLVQxASf3PelJ1h/gF28jlujyAafC+g032rcDelq2cE9ka23njdd
 dqeaokmt0WjEYB0UiBC/ggvhGt06PCNoBPSwJh/lf/+/IVGM63A0nZVYvo1U1szkOK
 N8mpJKZhUFj7gDSqsYZr6tcVH5nMVeWMWjdQgYH2VAyojo2WfiOfQ732V6G8KuvVIx
 MeiEzM64c6xJA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=RhjwDF1f
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: new rt-tests runtime
 test
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUm9tYWluLAoKT24gMDQvMDcvMjAyNCAwMDowMiwgUm9tYWluIE5hb3VyIHdyb3RlOgo+IEhl
bGxvIEp1bGllbiwKPiAKPiBMZSAwMi8wNy8yMDI0IMOgIDE1OjE5LCBKdWxpZW4gT2xpdmFpbiBh
IMOpY3JpdMKgOgo+PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gT2xpdmFpbiA8anUub0BmcmVlLmZy
PgpbLi4uXQo+PiArICAgICAgICAjIFdlIGNhbm5vdCBlYXNpbHkgdGVzdCByZWFsdGltZSBwcm9w
ZXJ0aWVzIGluIGEgQ0kvZW11bGF0b3IKPj4gKyAgICAgICAgIyBlbnZpcm9ubWVudC4gSW5zdGVh
ZCwgdGhpcyB0ZXN0IHJ1bnMgZmV3IHJ0LXRlc3RzIHByb2dyYW1zCj4+ICsgICAgICAgICMgaW4g
c21hbGwgc2NlbmFyaW8gY29uZmlndXJhdGlvbnMgKHRvIG1ha2Ugc3VyZSB0aGUgCj4+IGV4ZWN1
dGlvbgo+PiArICAgICAgICAjIHdpbGwgcmVtYWluIHNob3J0KS4gSXQganVzdCBtYWtlcyBzdXJl
IHRoZSBleGVjdXRpb24gCj4+IHJldHVybnMKPj4gKyAgICAgICAgIyBhIHN1Y2Nlc3MgY29kZS4g
QWxzbywgdG8gYXZvaWQgbWFraW5nIHRoZSBsb2dzIHRvbyBiaWcsIHdlCj4+ICsgICAgICAgICMg
Z2VuZXJhbGx5IHBhc3MgdGhlICItLXF1aWV0IiBvcHRpb24gdG8gaGF2ZSBhIHN1bW1hcnkgYXQg
Cj4+IHRoZQo+PiArICAgICAgICAjIGVuZCBvZiB0aGUgZXhlY3V0aW9uLgo+IAo+IFJ1bm5pbmcg
cnQtdGVzdHMgdG9vbHMgb24gc2xvdyBHaXRsYWItY2kgcnVubmVycywgd2hhdCBjYW4gZ28gd3Jv
bmc/IDopCgpUZWNobmljYWxseSwgd2UgY291bGQgcHJvYmFibHkgZG8gc29tZSBhY2N1cmF0ZSBy
ZWFsdGltZSB0ZXN0cyBpbiBhIENJCmVudmlyb25tZW50IHdpdGggc2xvdyBydW5uZXJzLCB3aXRo
IHRoZSByaWdodCBLZXJuZWwgY29uZmlnIGFuZCB1c2luZwp0aGUgcWVtdSAtaWNvdW50IG9wdGlv
bi4gQnV0IEkgY2hvc2UgdG8ga2VlcCB0aGlzIHRlc3Qgc2ltcGxlIGFuZCBvbmx5CmNoZWNrIGlm
IHRoZSBCdWlsZHJvb3QgcmVjaXBlIHdhcyBnZW5lcmF0aW5nIHdvcmtpbmcgYmluYXJpZXMuLi4K
ClNlZSBRZW11IGRvYzoKaHR0cHM6Ly93d3cucWVtdS5vcmcvZG9jcy9tYXN0ZXIvc3lzdGVtL2lu
dm9jYXRpb24uaHRtbAoKSSdtIG1lbnRpb25pbmcgdGhhdCBpbiBjYXNlIHdlIG5lZWQgYW4gYWN0
dWFsIHJlYWx0aW1lIHJ1bnRpbWUgdGVzdCwKaW4gdGhlIGZ1dHVyZS4uLgoKPiBUZXN0ZWQgbG9j
YWxseSAob24gYSBsYXB0b3ApIGJlZm9yZSBhcHBseWluZy4KPiAKPiBBcHBsaWVkIHRvIG1hc3Rl
ciwgdGhhbmtzLgo+IAo+IEJlc3QgcmVnYXJkcywKPiBSb21haW4KCkJlc3QgcmVnYXJkcywKCkp1
bGllbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
