Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5BA4C5B543
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 18:19:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 867D640A8C;
	Wed,  4 Jun 2025 18:19:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E2HPX9O8HXDK; Wed,  4 Jun 2025 18:19:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A798A4092F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A798A4092F;
	Wed,  4 Jun 2025 18:19:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 69C8CDA
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5005983B2F
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:19:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b5w6aQMqz-lq for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 18:19:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6F49B80E10
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F49B80E10
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6F49B80E10
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:19:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 84EDD1C00E0; Wed,  4 Jun 2025 20:19:27 +0200 (CEST)
Message-ID: <82c0a6d5-0dcd-4e92-a181-5ecde43011bc@rnout.be>
Date: Wed, 4 Jun 2025 20:19:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 buildroot@buildroot.org
Cc: David GOUARIN <dgouarin@gmail.com>
References: <20250414104614.973244-1-raphael.melotte@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250414104614.973244-1-raphael.melotte@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1749061167; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=2++Foc0R7wJBC0b3znUNbNGrh0cC8LVaunWpTbotvFQ=;
 b=GWv9uVTP6SFe69uuE4VGySokenKypT83rFuZtX9HQfMtlxkZihqwCwyxHKvhh5YgxH7pYZ
 DJhZD9JEKWNw4hoJllSWtREywJYBj7thzdauIMLWQN939u+9qrV3CpGIDWIRhYi3oT5z+2
 k5p++RYwsXBJ4uFolq0RVzfSIrZcKoRsVVw/6qZgyF24tdSXiP6LrYJltUaJVmBz10xiMJ
 OoKiS2+ABP683cFJjFoIYuiMXqhM6CMmnhr4ZprgclYXurwJqnjNOtM5qPutldHp0oFHvc
 DRR4p5tBqcda2hydiJMjsZVB4m7IRQXhHUBfsSt0oE5ojx3fJT1MwmpCp3ZlIw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=GWv9uVTP
Subject: Re: [Buildroot] [PATCH 1/1] package/freeradius-server: ignore
 CVE-2002-0318 and CVE-2011-4966
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxNC8wNC8yMDI1IDEyOjQ2LCBSYXBoYcOrbCBNw6lsb3R0ZSB2aWEgYnVpbGRyb290IHdy
b3RlOgo+IENWRS0yMDAyLTAzMTggaGFzIGJlZW4gbWl0aWdhdGVkIGJ5IGFkZGluZyBhIG5ldyBj
b25maWcgb3B0aW9uIGluCj4gZnJlZXJhZGl1cy1zZXJ2ZXIgY29tbWl0IGYwZjc2MmQxNDM5MzM2
ZmZmOWM4YjkwMjkxMzY0ZGRmZjU4M2Y2OTgsCj4gd2hpY2ggaXMgcGFydCBvZiByZWxlYXNlXzBf
NV8wIG9ud2FyZHMuCj4gU2VlIGFsc28gdGhlIG9yaWdpbmFsIHJlcG9ydCAoWzFdKS4KPiBUaGUg
TlZEIGRhdGFiYXNlJ3MgQ1BFIGNvbmZpZ3VyYXRpb24gZG9lc24ndCBoYXZlIGFuIGFzc29jaWF0
ZWQKPiB2ZXJzaW9uIG51bWJlciwgd2hpY2ggaXMgd2h5IG91ciBDVkUgY2hlY2sgc3RpbGwgcmVw
b3J0cyBpdC4KPiAKPiBGb3IgQ1ZFLTIwMTEtNDk2NiwgdGhlIENWRSBkZXNjcmlwdGlvbiAoc2Vl
IFsyXSkgbWVudGlvbnMgdGhlIGlzc3VlIGlzCj4gZml4ZWQgaW4gdmVyc2lvbiAyLjIuMCBvbndh
cmRzLCBidXQgdGhlIENQRSBhZ2FpbiBkb2Vzbid0IHVzZSBhCj4gdmVyc2lvbiBudW1iZXIuCj4g
Cj4gVG8gcmVkdWNlIHRoZSBub2lzZSBpbiB0aGUgbGlzdCBvZiBDVkVzIHRoYXQgcGtnLXN0YXRz
IHJlcG9ydHMsIGlnbm9yZQo+IHRoZW0uCj4gCj4gRldJVywgeW9jdG8vb2UgYWxzbyBpZ25vcmVz
IHRoZW0gKHNlZSBbM10pLgo+IAo+IFsxXTogaHR0cHM6Ly9tYXJjLmluZm8vP2w9YnVndHJhcSZt
PTEwMTQ0MDExMzQxMDA4MyZ3PTIjMgo+IFsyXTogaHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9k
ZXRhaWwvQ1ZFLTIwMTEtNDk2Ngo+IFszXSBodHRwczovL3BhdGNod29yay55b2N0b3Byb2plY3Qu
b3JnL3Byb2plY3Qvb2UvcGF0Y2gvMjAyMjA3MTUxMzM1MTUuMTQyOTgtMS1kYXZpZGUuZ2FyZGVu
YWxAaHVhd2VpLmNvbS8KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFw
aGFlbC5tZWxvdHRlQG1pbmQuYmU+CgogIEFwcGxpZWQgdG8gMjAyNS4wMi54LCB0aGFua3MuCgog
IFJlZ2FyZHMsCiAgQXJub3V0Cgo+IC0tLQo+ICAgcGFja2FnZS9mcmVlcmFkaXVzLXNlcnZlci9m
cmVlcmFkaXVzLXNlcnZlci5tayB8IDYgKysrKysrCj4gICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNl
cnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZnJlZXJhZGl1cy1zZXJ2ZXIvZnJl
ZXJhZGl1cy1zZXJ2ZXIubWsgYi9wYWNrYWdlL2ZyZWVyYWRpdXMtc2VydmVyL2ZyZWVyYWRpdXMt
c2VydmVyLm1rCj4gaW5kZXggOTRjOTMzMWIzZC4uMjVlZGEwY2Q2MyAxMDA2NDQKPiAtLS0gYS9w
YWNrYWdlL2ZyZWVyYWRpdXMtc2VydmVyL2ZyZWVyYWRpdXMtc2VydmVyLm1rCj4gKysrIGIvcGFj
a2FnZS9mcmVlcmFkaXVzLXNlcnZlci9mcmVlcmFkaXVzLXNlcnZlci5tawo+IEBAIC0xNSw2ICsx
NSwxMiBAQCBGUkVFUkFESVVTX1NFUlZFUl9DUEVfSURfUFJPRFVDVCA9IGZyZWVyYWRpdXMKPiAg
IEZSRUVSQURJVVNfU0VSVkVSX0RFUEVOREVOQ0lFUyA9IGxpYnRhbGxvYwo+ICAgRlJFRVJBRElV
U19TRVJWRVJfQVVUT1JFQ09ORiA9IFlFUwo+ICAgCj4gKyMgVGhlIE5WRCBkYXRhYmFzZSBkb2Vz
bid0IGhhdmUgYSB2ZXJzaW9uIG51bWJlciBjb25maWd1cmVkIGZvciB0aGUKPiArIyBmb2xsb3dp
bmcgQ1ZFcwo+ICtGUkVFUkFESVVTX1NFUlZFUl9JR05PUkVfQ1ZFUyArPSBcCj4gKwlDVkUtMjAw
Mi0wMzE4IFwKPiArCUNWRS0yMDExLTQ5NjYKPiArCj4gICAjIFdlJ3JlIHBhdGNoaW5nIHNyYy9t
b2R1bGVzL3JsbV9rcmI1L2NvbmZpZ3VyZS5hYwo+ICAgZGVmaW5lIEZSRUVSQURJVVNfU0VSVkVS
X1JVTl9LUkI1X0FVVE9SRUNPTkYKPiAgIAljZCAkKEBEKS9zcmMvbW9kdWxlcy9ybG1fa3JiNTsg
JChBVVRPUkVDT05GKSAtSSQoQEQpL200CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
