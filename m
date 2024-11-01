Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A40ACE6B244
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 11:24:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E40B60BF4;
	Fri,  1 Nov 2024 11:24:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FPUUDZiLwvwd; Fri,  1 Nov 2024 11:24:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EB4860E2C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EB4860E2C;
	Fri,  1 Nov 2024 11:24:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 026E8725
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 11:24:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D7CD1842F0
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 11:24:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AVZQJL7Tz3cK for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 11:24:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 11ECE841B2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11ECE841B2
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 11ECE841B2
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 11:24:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 078C713F88F;
 Fri,  1 Nov 2024 12:24:45 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:41960])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 01 Nov 2024 12:24:45 +0100
MIME-Version: 1.0
Date: Fri, 01 Nov 2024 12:24:45 +0100
From: Julien Olivain <ju.o@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
In-Reply-To: <95e1bc8e-6908-4eec-a4f4-446bfbe5e575@smile.fr>
References: <20241031213348.2057705-1-ju.o@free.fr>
 <20241031213348.2057705-8-ju.o@free.fr>
 <95e1bc8e-6908-4eec-a4f4-446bfbe5e575@smile.fr>
User-Agent: Webmail Free/1.6.9
Message-ID: <d9d9d9c7f2dbd6a3214758a9be301a53@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1730460288;
 bh=lpuIXVZo7bq+8xrCrHD6ySofZtrGuqPGLbju+taBfRA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=raRdsiEAMw4emriqwb+15j6TZq72HalEhlNxnDJedqMqZJ/udzu3n/NB+QCAYxOlv
 EaSgo+M+O6jNLThz7JSfPo5XOrJznzP/DeWY0oiBEis0t3wE+Vv574+Kbn/wI9x1XY
 uvcrRT3qwhKW4UGOqJrHzCwGNhjfdONridKORBS27f3QMusosSj+5H4moX+EfOaIW6
 mSwcX+Net1fn4yyVafDnpqr28XgdF1dwLOOKPyBfQ8tTsnF/GAddjlREnbEBTtkKEu
 JOasXhttfK4gLq5+/mhu/HXE4xvQ69XMh8hV0nwqV8Tv8uY8bUfYkY7D00Bw8X42l1
 0LHfVuIddfLnQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=raRdsiEA
Subject: Re: [Buildroot] [PATCH v3 7/8] support/testing: test_fwts: update
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

SGkgUm9tYWluLAoKVGhhbmtzIGZvciB0aGUgcmV2aWV3LgoKT24gMzEvMTAvMjAyNCAyMzoxMSwg
Um9tYWluIE5hb3VyIHdyb3RlOgo+IEhlbGxvIEp1bGllbiwKPiAKPiBMZSAzMS8xMC8yMDI0IMOg
IDIyOjMzLCBKdWxpZW4gT2xpdmFpbiBhIMOpY3JpdMKgOgo+PiBUaGUgRURLMiBidW1wIHRvIHN0
YWJsZTIwMjQwNSBpbnRyb2R1Y2VkIGFuIGluY29tcGF0aWJpbGl0eSB3aXRoIHRoZQo+PiBRZW11
IHZlcnNpb24gNS4yLjAgcHJlc2VudCBpbiB0aGUgcmVmZXJlbmNlIERvY2tlciBpbWFnZS4gRm9y
IHRoYXQKPj4gcmVhc29uLCB0aGlzIHRlc3Qgd2FzIGRpc2FibGVkLgo+PiAKPj4gVGhpcyBjb21t
aXQgdXBkYXRlcyBBVEYgdG8gMi4xMSwgYW5kIGVuYWJsZXMgaG9zdC1xZW11IGluIHRoZSBidWls
ZCwKPj4gdG8gYmUgdXNlZCBieSB0aGUgcnVudGltZSB0ZXN0IGluZnJhc3RydWN0dXJlLgo+PiAK
Pj4gVGhvc2UgY2hhbmdlcyBhcmUgZml4aW5nIHRoaXMgdGVzdCwgd2hpY2ggaXMgd2h5IHRoaXMg
Y29tbWl0IAo+PiByZS1lbmFibGVzCj4+IGl0IGJ5IHJlbW92aW5nIHRoZSBza2lwVGVzdCgpIGlu
dm9jYXRpb24uCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gT2xpdmFpbiA8anUub0BmcmVl
LmZyPgo+IAo+IFNhbWUgcXVlc3Rpb24gYWJvdXQgbmVvdmVyc2UtbjEuCgpTYW1lIGFuc3dlciBh
cyBmb3IgdGVzdF9lZGsyICh0aGlzIGNhbiBiZSBkb25lIGxhdGVyKS4KCj4gUmV2aWV3ZWQtYnk6
IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgo+IAo+IEJlc3QgcmVnYXJkcywK
PiBSb21haW4KCkJlc3QgcmVnYXJkcywKCkp1bGllbi4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
