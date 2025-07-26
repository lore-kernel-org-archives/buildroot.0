Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5DB5C83F17
	for <buildroot@archiver.kernel.org>; Sat, 26 Jul 2025 14:45:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A38960DD2;
	Sat, 26 Jul 2025 14:45:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id osXGh-wLbEGe; Sat, 26 Jul 2025 14:45:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8084360D4F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8084360D4F;
	Sat, 26 Jul 2025 14:45:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 823D0198
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 14:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 738A282893
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 14:45:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RQWUhFrpoz3h for <buildroot@buildroot.org>;
 Sat, 26 Jul 2025 14:45:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9BB7E827FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BB7E827FA
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9BB7E827FA
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 14:45:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 7D84F13F8C6;
 Sat, 26 Jul 2025 16:44:56 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 26 Jul 2025 16:44:56 +0200
MIME-Version: 1.0
Date: Sat, 26 Jul 2025 16:44:56 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20250726112630.778035-1-thomas.perale@mind.be>
References: <20250726112630.778035-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <08f96c1d396dddcd89710433ca13ca86@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753541097;
 bh=bnRu2rgTshF3FtmnjCaBjALVEmgWlE/4GPAbDi8naw8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tR2jMlQZvv3bEOBA5uLbK2eD0xkxpU7l0kLATYu24AlgcFqjLSTUu8bFcaeRzs1qb
 8j3qW6Gorg6GCIlHRR2Xqmp/eom3UjQPuN6j9ZIyuD8a6lC6ZY/Q/RLBNDcHS79uoL
 rLb0IYbgeBylPoLx7cJIFU66P9yNFLUfjgSbW7+Pm0e638JG1rjnZ+Law/Dxw1rex4
 BqU+oo0b9zFAPJ3nrhT34HSr0J2v5PdLVLel5SmOnOZMYUSutOvyQE/NRMS6N96Q7J
 McdDZFdvKwEV/XgVwhlDGdj86SODUlh3wmgeSzzNmbfaBLz2qbPkon9/csqfkxtelN
 kdkQ+adwbwd8A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tR2jMlQZ
Subject: Re: [Buildroot] [PATCH] package/kvmtool: fix build failure w/ musl
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

T24gMjYvMDcvMjAyNSAxMzoyNiwgVGhvbWFzIFBlcmFsZSB2aWEgYnVpbGRyb290IHdyb3RlOgo+
IFN0YXJ0aW5nIEdDQzE0ICdpbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbicgYXJlIHRyZWF0
ZWQgYXMgZXJyb3JzIGJ5Cj4gZGVmYXVsdC4gV2hlbiBidWlsZGluZyBrdm10b29sIHdpdGggbXVz
bCBsaWJjLCB0aGUgZm9sbG93aW5nIGVycm9yCj4gb2NjdXJzIGR1ZSB0byBtaXNzaW5nIGRlY2xh
cmF0aW9uIG9mICdiYXNlbmFtZSc6Cj4gCj4gYGBgCj4gdmZpby9jb3JlLmM6NTM3OjIyOiBlcnJv
cjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYYmFzZW5hbWXigJkgCj4gWy1X
aW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCj4gICA1MzcgfCAgICAgICAgIGdyb3VwX25h
bWUgPSBiYXNlbmFtZShncm91cF9wYXRoKTsKPiAgICAgICB8ICAgICAgICAgICAgICAgICAgICAg
IF5+fn5+fn5+Cj4gdmZpby9jb3JlLmM6NTM3OjIyOiB3YXJuaW5nOiBuZXN0ZWQgZXh0ZXJuIGRl
Y2xhcmF0aW9uIG9mIOKAmGJhc2VuYW1l4oCZIAo+IFstV25lc3RlZC1leHRlcm5zXQo+IHZmaW8v
Y29yZS5jOjUzNzoyMDogZXJyb3I6IGFzc2lnbm1lbnQgdG8g4oCYY2hhciAq4oCZIGZyb20g4oCY
aW504oCZIG1ha2VzIAo+IHBvaW50ZXIgZnJvbSBpbnRlZ2VyIHdpdGhvdXQgYSBjYXN0IFstV2lu
dC1jb252ZXJzaW9uXQo+ICAgNTM3IHwgICAgICAgICBncm91cF9uYW1lID0gYmFzZW5hbWUoZ3Jv
dXBfcGF0aCk7Cj4gICAgICAgfCAgICAgICAgICAgICAgICAgICAgXgo+IGBgYAo+IAo+IFRoaXMg
ZXJyb3IgY2FuIGJlIHJlcHJvZHVjZWQgd2l0aDoKPiAKPiBgYGAKPiBjYXQgPi5jb25maWcgPDxF
T0YKPiBCUjJfYWFyY2g2ND15Cj4gQlIyX1RPT0xDSEFJTl9FWFRFUk5BTD15Cj4gQlIyX1RPT0xD
SEFJTl9FWFRFUk5BTF9CT09UTElOPXkKPiBCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0JPT1RMSU5f
QUFSQ0g2NF9NVVNMX0JMRUVESU5HX0VER0U9eQo+IEJSMl9QQUNLQUdFX0tWTVRPT0w9eQo+IEVP
Rgo+IG1ha2Ugb2xkZGVmY29uZmlnCj4gbWFrZSBrdm10b29sCj4gYGBgCj4gCj4gVGhpcyBwYXRj
aCBhZGRzIHRoZSB1cHN0cmVhbSBjb21taXQgdGhhdCBmaXhlcyB0aGlzIGlzc3VlIGJ5IGluY2x1
ZGluZwo+IHRoZSBhcHByb3ByaWF0ZSBoZWFkZXIsIGVuc3VyaW5nIGNvbXBhdGliaWxpdHkgd2l0
aCBtdXNsIGFuZCBHQ0MxNC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGVyYWxlIDx0aG9t
YXMucGVyYWxlQG1pbmQuYmU+CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
