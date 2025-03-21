Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50201C36001
	for <buildroot@archiver.kernel.org>; Fri, 21 Mar 2025 23:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD8D0424BD;
	Fri, 21 Mar 2025 23:37:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wiGd86LpCQiJ; Fri, 21 Mar 2025 23:37:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B030B424C1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B030B424C1;
	Fri, 21 Mar 2025 23:37:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A3F42E2
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 23:37:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8DF6084865
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 23:37:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jmoqAV_BEOvY for <buildroot@buildroot.org>;
 Fri, 21 Mar 2025 23:37:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2F29684868
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F29684868
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F29684868
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 23:37:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id A6F5D5FF95;
 Sat, 22 Mar 2025 00:37:44 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 22 Mar 2025 00:37:44 +0100
MIME-Version: 1.0
Date: Sat, 22 Mar 2025 00:37:44 +0100
From: Julien Olivain <ju.o@free.fr>
To: gilles.bardoux@sagemcom.com
Cc: buildroot@buildroot.org
In-Reply-To: <76dd8fca-f33f-4c74-a36c-d2f91e1d9102@sagemcom.com>
References: <76dd8fca-f33f-4c74-a36c-d2f91e1d9102@sagemcom.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <33e771424610d57d3cfbc8d80383eb75@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742600265;
 bh=xEHrdG2KQbE4nkzlVOuL3MXMWOGTBviVtXq2tSGJuls=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XEZmOdbOT/FlSo1QuwdiAoecDvq9nwhvrBOXlY/YEZa55uHR4EMVIA8DJfMMJu62y
 UjVmrlksnURvth1XxOnFQlbqXUhhq2HDcMPC+VUjl7nN3nXondzTb9RWttJh8vu12Z
 dXndKIXI/zkiQT6BsvGETVYvYpqBHyXPcmpRGOj6azDLMeacKq7ejWO0AGD915G2jQ
 BjngocXzT2W3NT0zlLduCG+F447Z8dAMf31GHPiNfVNHR1vvKn+2oz7NFscldvM5xN
 P872EJw8zzH1bK+b4bvDIpSOEYx+SeA5adk0nWKnFQmerQZAhmKjXjkXYTUE3AfRiQ
 jkB22bVTTp4Pg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=XEZmOdbO
Subject: Re: [Buildroot] [PATCH] package/python-fastapi: fix cpe id vendor
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

SGkgR2lsbGVzLAoKVGhhbmsgeW91IGZvciB5b3VyIHN1Ym1pc3Npb24uCgpUaGUgcGF0Y2ggaXMg
bm90IGFwcGVhcmluZyBpbiBwYXRjaHdvcms6Cmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcv
cHJvamVjdC9idWlsZHJvb3QvbGlzdC8KCkl0IHNlZW1zIGluY29ycmVjdGx5IGZvcm1hdHRlZC4g
Q291bGQgeW91IHJlc2VuZCBpdCB1c2luZwoiZ2l0IHNlbmQtZW1haWwiLiBTZWU6Cmh0dHBzOi8v
YnVpbGRyb290Lm9yZy9kb3dubG9hZHMvbWFudWFsL21hbnVhbC5odG1sI3N1Ym1pdHRpbmctcGF0
Y2hlcwoKT24gMjEvMDMvMjAyNSAxMjozMywgR2lsbGVzIEJhcmRvdXggdmlhIGJ1aWxkcm9vdCB3
cm90ZToKPiBmYXN0YXBpX3Byb2plY3QgaXMgZGVwcmVjYXRlZCwgdGlhbmdvbG8gaXMgdGhlIGN1
cnJlbnQgY3BlIGlkIHZlbmRvciAKPiBmb3IgcHl0aG9uLWZhc3RhcGkKPiBTaWduZWQtb2ZmLWJ5
OiBnaWxsZXMuYmFyZG91eEBzYWdlbWNvbS5jb20KPiAtLS0KPiDCoHBhY2thZ2UvcHl0aG9uLWZh
c3RhcGkvcHl0aG9uLWZhc3RhcGkubWvCoHzCoDLCoCstCj4gwqAxwqBmaWxlwqBjaGFuZ2VkLMKg
McKgaW5zZXJ0aW9uKCspLMKgMcKgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9weXRob24tZmFzdGFwaS9weXRob24tZmFzdGFwaS5tayAKPiBiL3BhY2thZ2UvcHl0aG9uLWZh
c3RhcGkvcHl0aG9uLWZhc3RhcGkubWsKPiBpbmRleMKgMDhmZTU2MjNjYi4uMjY2MmYzZGRhZsKg
MTAwNjQ0Cj4gLS0twqBhL3BhY2thZ2UvcHl0aG9uLWZhc3RhcGkvcHl0aG9uLWZhc3RhcGkubWsK
PiArKyvCoGIvcGFja2FnZS9weXRob24tZmFzdGFwaS9weXRob24tZmFzdGFwaS5tawo+IEBAIC0x
MCw3ICsxMCw3IEBAIFBZVEhPTl9GQVNUQVBJX1NJVEUgPSAKPiBodHRwczovL2ZpbGVzLnB5dGhv
bmhvc3RlZC5vcmcvcGFja2FnZXMvYTIvYjIvNWE1ZGM0YWZmZGI2Cj4gwqBQWVRIT05fRkFTVEFQ
SV9TRVRVUF9UWVBFwqA9wqBwZXA1MTcKPiDCoFBZVEhPTl9GQVNUQVBJX0xJQ0VOU0XCoD3CoE1J
VAo+IMKgUFlUSE9OX0ZBU1RBUElfTElDRU5TRV9GSUxFU8KgPcKgTElDRU5TRQo+IC1QWVRIT05f
RkFTVEFQSV9DUEVfSURfVkVORE9SwqA9wqBmYXN0YXBpX3Byb2plY3QKPiArUFlUSE9OX0ZBU1RB
UElfQ1BFX0lEX1ZFTkRPUsKgPcKgdGlhbmdvbG8KPiDCoFBZVEhPTl9GQVNUQVBJX0NQRV9JRF9Q
Uk9EVUNUwqA9wqBmYXN0YXBpCj4gwqBQWVRIT05fRkFTVEFQSV9ERVBFTkRFTkNJRVPCoD3CoGhv
c3QtcHl0aG9uLXBkbS1iYWNrZW5kCgpCZXN0IHJlZ2FyZHMsCgpKdWxpZW4uCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
