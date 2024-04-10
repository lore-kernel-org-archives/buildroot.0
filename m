Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 506DCCD11C2
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 19:42:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C791E41722;
	Wed, 10 Apr 2024 19:42:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UbdvOuCVzqx0; Wed, 10 Apr 2024 19:42:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B641641778
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B641641778;
	Wed, 10 Apr 2024 19:42:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 365831BF59A
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 19:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 23991820F7
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 19:41:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rrdrnnp7vqDV for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 19:41:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1FA15820F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FA15820F0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1FA15820F0
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 19:41:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 55FDCB004FF;
 Wed, 10 Apr 2024 21:41:51 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:52234])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 10 Apr 2024 21:41:51 +0200
MIME-Version: 1.0
Date: Wed, 10 Apr 2024 21:41:51 +0200
From: Julien Olivain <ju.o@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <081ad720-f9f0-4ec5-935f-d6e197afed25@mind.be>
References: <20240409212758.380547-1-ju.o@free.fr>
 <20240409212758.380547-2-ju.o@free.fr>
 <e16166b5-9ca0-4d2e-9c69-80d74d5d7e07@mind.be>
 <af4421720e276e1e58b1319732a75891@free.fr>
 <081ad720-f9f0-4ec5-935f-d6e197afed25@mind.be>
User-Agent: Webmail Free/1.6.5
Message-ID: <5c25d0e80ab871bf307eef222247d285@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712778112;
 bh=aQgoO/J7wDAnE2Lr43vPFg4HnFYQlyuRkdrv3oMdyvA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=o/CfYSmqikhPmPdLrJLgzPY/hW/6h2swVHQ0sp6ZvHeklO4wCm9faCFkg5zwxeIym
 w0QGGgfah26sCF0LaXRIXLGFrjyTc0mD1asHj8UfduUjZqAmWdS+8m+mt0+7T/qvOF
 nBmPXsaRlGuX5dcvx6PjaX4chXN15U6AoXGxT+6UBtyB/aoE6yAIF8q6D8mAThwocS
 TbGSxudKSZ302mMPSVYH+fhWHnsaelha5lG3NUFCd1s69m3xWaflBpuqVSbMaUOyWu
 UWL+JSr3/hrMs0Qxqk9iVVaI43JLwsTpNfuO1ypRps8M7WC5bZNBo7MZPt+2FBmqMT
 ZbSy5P7PwLp/g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=o/CfYSmq
Subject: Re: [Buildroot] [PATCH v2 2/2] package/rdma-core: bump to version
 v51.0
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

SGkgQXJub3V0LAoKT24gMTAvMDQvMjAyNCAyMDozMCwgQXJub3V0IFZhbmRlY2FwcGVsbGUgd3Jv
dGU6Cj4gT24gMTAvMDQvMjAyNCAyMDoyMiwgSnVsaWVuIE9saXZhaW4gd3JvdGU6Cj4+IEhpIEFy
bm91dCwKPj4gCj4+IE9uIDEwLzA0LzIwMjQgMjA6MDQsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdy
b3RlOgo+Pj4gT24gMDkvMDQvMjAyNCAyMzoyNywgSnVsaWVuIE9saXZhaW4gd3JvdGU6Cj4+Pj4g
Rm9yIGNoYW5nZSBsb2csIHNlZToKPj4+PiBodHRwczovL2dpdGh1Yi5jb20vbGludXgtcmRtYS9y
ZG1hLWNvcmUvcmVsZWFzZXMvdGFnL3Y1MS4wCj4+Pj4gCj4+Pj4gU2lnbmVkLW9mZi1ieTogSnVs
aWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4KPj4+PiAtLS0KPj4+PiBDaGFuZ2VzIHYxIC0+IHYy
Ogo+Pj4+IC0gaW50cm9kdWNlZCB0aGlzIG5ldyBwYXRjaCBmb3IgdjUxLjAgYnVtcC4KPj4+IAo+
Pj4gwqBXaHkgZGlkIHlvdSBkbyB0aGlzIGluIHR3byBzZXBhcmF0ZSBwYXRjaGVzLCBpbnN0ZWFk
IG9mIGEgc2luZ2xlIAo+Pj4gcGF0Y2ggdGhhdCBidW1wcyB0byB2NTEuMD8KPj4gCj4+IFdlbGws
IHRoZSB2NTAuMCBwYXRjaCB3YXMgd2FpdGluZyBpbiBwYXRjaHdvcmsgZm9yIHF1aXRlIHNvbWUg
dGltZS4gSXQgCj4+IGlzIHN0aWxsIHZhbGlkIGFzLWlzLgo+IAo+ICBZb3UgYW55d2F5IG1hcmtl
ZCB0aGF0IG9uZSBhcyBTdXBlcnNlZGVkLCBzbyBpdCdzIG5vdCByZWFsbHkgcmVsZXZhbnQgCj4g
dGhhdCBpdCB3YXMgYWxyZWFkeSBvbiBwYXRjaHdvcmsuCj4gCj4+IEkganVzdCB3cm90ZSB0aGUg
djUxLjAgb24gdG9wIG9mIGl0IGFuZCBzZW50IGJvdGggYXMgYSByZW1haW5kZXIgdGhhdCAKPj4g
djUwLjAgd2FzIHN0aWxsIHRoZXJlLgo+PiAKPj4gRG8geW91IHByZWZlciBJIHNlbmQgYSBzcXVh
c2hlZCB2ZXJzaW9uIG9mIHRob3NlIGluIGEgdjM/Cj4gCj4gIFllcyEgV2VsbCwgaXQncyBub3Qg
c3VwZXIgaW1wb3J0YW50IG5vdyBiZWNhdXNlIHdlIGNhbiBhbHNvIGVhc2lseSBkbyAKPiB0aGF0
IHdoaWxlIGFwcGx5aW5nLCBidXQgaXQncyBsZXNzIHdvcmsgZm9yIHVzIGlmIHlvdSBkbyBpdCA6
LSkKPiAKPiAgSXQncyBqdXN0IHRoYXQgYmVjYXVzZSBpdCB3YXMgaW4gdHdvIHNlcGFyYXRlIHBh
dGNoZXMsIEkgdGhvdWdodCB0aGVyZSAKPiB3YXMgYSByZWFzb24gZm9yIGl0IChlLmcuIHRoYXQg
dGhlIHY1MC4wIGJ1bXAgd2FzIGEgc2VjdXJpdHkgYnVtcCBhbmQgCj4gc2hvdWxkIGJlIGFwcGxp
ZWQgdG8gMjAyNC4wMi54IGFzIHdlbGwpLgoKSSBzZW50IGEgdjM6Cmh0dHBzOi8vcGF0Y2h3b3Jr
Lm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyNDA0MTAxOTM3MTIuMzExMDgt
MS1qdS5vQGZyZWUuZnIvCgo+IAo+ICBSZWdhcmRzLAo+ICBBcm5vdXQKCkJlc3QgcmVnYXJkcywK
Ckp1bGllbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
