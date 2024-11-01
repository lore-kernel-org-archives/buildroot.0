Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85DF8E6B243
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 11:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23F13841B2;
	Fri,  1 Nov 2024 11:23:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QNZaUVPf4Opw; Fri,  1 Nov 2024 11:23:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33B7E841B7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33B7E841B7;
	Fri,  1 Nov 2024 11:23:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 545B7725
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 11:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 426F8841B7
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 11:23:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KwoZ9uRfSmNb for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 11:23:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 74ECC841B2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74ECC841B2
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 74ECC841B2
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 11:23:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id F0D472003C1;
 Fri,  1 Nov 2024 12:23:17 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:57818])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 01 Nov 2024 12:23:17 +0100
MIME-Version: 1.0
Date: Fri, 01 Nov 2024 12:23:17 +0100
From: Julien Olivain <ju.o@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
In-Reply-To: <62b6862c-a837-4267-8aa1-f54ab5acb667@smile.fr>
References: <20241031213348.2057705-1-ju.o@free.fr>
 <20241031213348.2057705-7-ju.o@free.fr>
 <62b6862c-a837-4267-8aa1-f54ab5acb667@smile.fr>
User-Agent: Webmail Free/1.6.9
Message-ID: <6168f547475ebb157af2848ef09b9a22@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1730460200;
 bh=7kS9hEaQ/StHGjh8VM+SE+6ClNPo6G5rNOf0FoO0/5g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NmyygKuV/6L25JZREcVHKn+PlVlkFPNhw0AphZna38mNijxZ3rVMgufILe0TornPQ
 s36HMV84Wwhj5SfAE/yyzoKPqocQvx04UHcklDBi25BDD7a1t6HY6g7eNAy7zEKdPj
 7GqngZ5J/eXQscAsvQGpn8qVpE1u16QCQgk1x+RrGopPoNfoNYIz+d2k/Bo3cquw4s
 IOFC9iIsNBD0JUuxhyztf7ZBuzyWB9EwLgXOpe9bDTXy+nbqHTrVf+yDr0Qf8+ORTe
 XuQU1r87+572lHecC8jZzX9pg4F6W+n0HwZbuoKJxoSIPyar/zuwVYbwckKBLEwL7t
 vNntKTF6Y7cRg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NmyygKuV
Subject: Re: [Buildroot] [PATCH v3 6/8] support/testing: test_edk2: update
 and re-enable the test
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUm9tYWluLAoKVGhhbmtzIGZvciB0aGUgcmV2aWV3LgoKT24gMzEvMTAvMjAyNCAyMzowOSwg
Um9tYWluIE5hb3VyIHdyb3RlOgo+IEhlbGxvIEp1bGllbiwKPiAKPiBMZSAzMS8xMC8yMDI0IMOg
IDIyOjMzLCBKdWxpZW4gT2xpdmFpbiBhIMOpY3JpdMKgOgo+PiBUaGUgRURLMiBidW1wIHRvIHN0
YWJsZTIwMjQwNSBpbnRyb2R1Y2VkIGFuIGluY29tcGF0aWJpbGl0eSB3aXRoIHRoZQo+PiBRZW11
IHZlcnNpb24gNS4yLjAgcHJlc2VudCBpbiB0aGUgcmVmZXJlbmNlIERvY2tlciBpbWFnZS4gRm9y
IHRoYXQKPj4gcmVhc29uLCB0aGlzIHRlc3Qgd2FzIGRpc2FibGVkLgo+PiAKPj4gVGhpcyBjb21t
aXQgdXBkYXRlcyBBVEYgdG8gMi4xMSBhbmQga2VybmVsIHRvIDYuNi41OCwgYW5kIGVuYWJsZXMK
Pj4gaG9zdC1xZW11IGluIHRoZSBidWlsZCwgdG8gYmUgdXNlZCBieSB0aGUgcnVudGltZSB0ZXN0
IGluZnJhc3RydWN0dXJlLgo+PiAKPj4gVGhvc2UgY2hhbmdlcyBhcmUgZml4aW5nIHRoaXMgdGVz
dCwgd2hpY2ggaXMgd2h5IHRoaXMgY29tbWl0IAo+PiByZS1lbmFibGVzCj4+IGl0IGJ5IHJlbW92
aW5nIHRoZSBza2lwVGVzdCgpIGludm9jYXRpb24uCj4gCj4gRG8gd2Ugd2FudCB0byBzd2l0Y2gg
dG8gbmVvdmVyc2UtbjEgPwo+IFRoZSB0ZXN0IHN0aWxsIHdvcmtzIHdpdGggY29ydGV4LWE1Ny4K
CkkgdGhpbmsgdGhpcyBraW5kIG9mIHNtYWxsIGltcHJvdmVtZW50IGNhbiBiZSBkb25lIGxhdGVy
LAppbiBmb2xsb3d1cCBwYXRjaGVzLgoKVGhlIGluaXRpYWwgZ29hbCBvZiB0aGlzIHNlcmllcyB3
YXMgdG8gZml4IHRoZQpxZW11X2FhcmNoNjRfc2JzYV9kZWZjb25maWcsIHdpdGhvdXQgYnJlYWtp
bmcgdGhlIHJ1bnRpbWUgdGVzdHMuCgpUZWNobmljYWxseSwgdGhpcyB0ZXN0IGNoZWNrcyB0aGUg
RURLMiByZWNpcGUgYnVpbGRzIGFuZCBib290cy4KSXQgaXMgbm90IGNoZWNraW5nIGZvciB0aGUg
U0JTQSBjb21wbGlhbmNlLgpJbiB0aGlzIGN1cnJlbnQgc3RhdGUsIHRoaXMgdGVzdCBzdWNjZWVk
LgoKVGhpcyBzZXJpZXMgd2FzIHN0YXJ0aW5nIHRvIGJlICJjb21wbGV4IiBpbiB0aGUgc2Vuc2Ug
aXMgaXQKbWl4aW5nIG1hbnkgdG9waWNzLiBNeSBpbnRlbnQgd2FzIHRvIGtlZXAgb3RoZXIgaW1w
cm92ZW1lbnRzCmZvciBsYXRlciwgdG8gbGltaXQgdGhlIG51bWJlciBvZiBjaGFuZ2VzLgoKSWYg
dGhpcyBzZXJpZXMgaXMgbWVyZ2VkLCBoYXZpbmcgdGhlIGNhcGFiaWxpdHkgdG8gdXNlIHRoZQpo
b3N0LXFlbXUgaW4gcnVudGltZSB0ZXN0cyB3aWxsIGFsbG93IG1hbnkgcGVyLXRlc3QgaW1wcm92
ZW1lbnRzLAppbiBpbmRpdmlkdWFsIGNvbW1pdHMuCgo+IE90aGVyd2lzZToKPiBSZXZpZXdlZC1i
eTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+Cj4gCj4gQmVzdCByZWdhcmRz
LAo+IFJvbWFpbgoKQmVzdCByZWdhcmRzLAoKSnVsaWVuLgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
