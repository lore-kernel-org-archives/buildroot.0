Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F944CCD1AF
	for <buildroot@archiver.kernel.org>; Tue, 21 Oct 2025 20:01:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E2D682354;
	Tue, 21 Oct 2025 20:01:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3deTcYavrgEl; Tue, 21 Oct 2025 20:00:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65FC18233A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65FC18233A;
	Tue, 21 Oct 2025 20:00:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 32F0B43F
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 20:00:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 247FF405F1
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 20:00:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RXEAyMQ9rYks for <buildroot@buildroot.org>;
 Tue, 21 Oct 2025 20:00:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5AD7B405CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AD7B405CB
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5AD7B405CB
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 20:00:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 1B276B0053E;
 Tue, 21 Oct 2025 22:00:51 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 21 Oct 2025 22:00:51 +0200
MIME-Version: 1.0
Date: Tue, 21 Oct 2025 22:00:51 +0200
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>
Cc: buildroot@buildroot.org, Marcus Hoffmann <buildroot@bubu1.eu>, "Yann E.
 MORIN" <yann.morin.1998@free.fr>
In-Reply-To: <20251021165126.168606-1-vincent.stehle@arm.com>
References: <20251021165126.168606-1-vincent.stehle@arm.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <bb3fa10c9fdc24c32b357f32cfbf86a3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761076855;
 bh=qM5nr5568erOwQ0AYSjirtHFu+EVYfg8/NYIYn1tc2s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=t4IQvBi8eKkD9zm7mB7AJnmAAtqCPbmX8SSffQbEYWAXDn4qv5FM4ku0RbMDGBgNz
 CS5HTiDmfOeCKeI4UUhrY2XUKuMGjDiprrnAJscUa3Zq7xtVLisRJsNNdrHyeljwiG
 0psMNMiBnO634LsIpjvb2maPMwBm+tIvhY7hrvDMJTaHeITyuc5diqY70n44wpMcZI
 mJp2Hfdw+jQNOt+OXvpdnYReza9XcrqtHQDMll5VM34cpi4OOP6B564CRoL3qw99he
 QymFiFTlHQh/VSxYi/UxnY89e9a6LHfvlD817j45fegrr49Bp97b/eoJbMCTN68hWe
 2T0O+6XUkvC4Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=t4IQvBi8
Subject: Re: [Buildroot] [PATCH v2] utils/brmake: filter output for parallel
 build
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

T24gMjEvMTAvMjAyNSAxODo1MSwgVmluY2VudCBTdGVobMOpIHdyb3RlOgo+IFdoZW4gYnVpbGRp
bmcgaW4gcGFyYWxsZWwgd2l0aCBwZXItcGFja2FnZSBkaXJlY3Rvcmllcwo+IChCUjJfUEVSX1BB
Q0tBR0VfRElSRUNUT1JJRVM9eSksIGJybWFrZSBvdXRwdXQgaXMgb2Z0ZW4gZ2FyYmxlZDoKPiAK
PiAgIDIwMjUtMTAtMDhUMTg6Mzk6MTAgPj4+IGhvc3QtZHRjIDEuNy4yIEJ1aWxkaW5nCj4gICAy
MDI1LTEwLTA4VDE4OjM5OjExIGNoZWNraW5nIGZvciBzdGRpbnQuaC4uLiA+Pj4gaG9zdC1kdGMg
MS43LjIgCj4gSW5zdGFsbGluZyB0byBob3N0IGRpcmVjdG9yeQo+ICAgMjAyNS0xMC0wOFQxODoz
OToxMiBjaGVja2luZyBmb3IgbGltaXRzLmguLi4gPj4+IGhvc3QtZ21wIDYuMy4wIAo+IEluc3Rh
bGxpbmcgdG8gaG9zdCBkaXJlY3RvcnkKPiAKPiBSZW1vdmUgdGhlIHNwdXJpb3VzIHN0cmluZyBi
ZXR3ZWVuIHRoZSB0aW1lc3RhbXAgYW5kIHRoZSAiPj4+IiBtYXJrZXIgCj4gdG8KPiBmaXggdGhp
cy4KPiBXZSBuZWVkIHNvbWUgZXh0cmEgY2FyZSB0byBwcmVzZXJ2ZSB0aGUgcHJlY2VkaW5nICJ0
ZXJtIGJvbGQiIHNwZWNpYWwKPiBjaGFyYWN0ZXJzIHNlcXVlbmNlLgo+IAo+IFdlIGFsc28gcHJl
dmVudCBncmVwIGFuZCBzZWQgdG8gYnVmZmVyIHRoZWlyIG91dHB1dCB0b28gbXVjaC4gVGhpcyAK
PiBsZWFkcyB0bwo+IG1vcmUgZnJlcXVlbnQgb3V0cHV0IGV2ZW4gd2hlbiB3ZSBtaWdodCBub3Qg
YmUgY29ubmVjdGVkIHRvIGEgdGVybWluYWw7IAo+IGZvcgo+IGV4YW1wbGU6IHdoZW4gYnJtYWtl
J3Mgb3V0cHV0IGlzIHBpcGVkIHRvIGFub3RoZXIgcHJvZ3JhbSBvciB3aGVuIAo+IHJ1bm5pbmcK
PiBpbiBDSS4KPiAKPiBSZXZpZXdlZC1ieTogTWFyY3VzIEhvZmZtYW5uIDxidWlsZHJvb3RAYnVi
dTEuZXU+Cj4gU2lnbmVkLW9mZi1ieTogVmluY2VudCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBh
cm0uY29tPgo+IENjOiBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4KCkFw
cGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
