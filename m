Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 156C8FF8873
	for <buildroot@archiver.kernel.org>; Thu, 30 Apr 2026 13:57:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE4E842971;
	Thu, 30 Apr 2026 13:57:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RJdyiyugk0-8; Thu, 30 Apr 2026 13:57:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEB4942983
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777557451;
	bh=cSqTM5QQnmuYrvC9eGdTGPtjbu179UgOhd70SzImUn8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=j85xMTYQ+v8Be/Mu3UTEhEQLMmYbvDFMyRyl2XACL17nvy5Di3gP52EP0eEhiFAvT
	 64FqM7WAHZWUGBiqjeNN0O7Ath/OzdWr0TalCB6aWK1JDJfjkNUYZsT4KCbrWyYjbq
	 trx3bf/OeKvWYwQNcmjM3RqJd2343luCxPc78/SmJj5Pm1Yx7OKQbcVxXWFKGaSFOQ
	 21NBWbDLyFn1s+cjRqQvtjuJZ2tA8ZgIJpoO1+kAozxxjcyL0iSvUBxD4ZQ9R5gZ6o
	 A5o4wSminvJ4tj0CTSlKQFBK4rgqp3pQCe4JmQxU9+N5NUjBXUGGJzE8oQ3IfoutsV
	 bO4ChPM/rCjoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEB4942983;
	Thu, 30 Apr 2026 13:57:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E9E518E
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 13:57:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8BE1384B57
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 13:57:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3zFufkGLaHFK for <buildroot@buildroot.org>;
 Thu, 30 Apr 2026 13:57:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1FCE684B53
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FCE684B53
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1FCE684B53
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 13:57:27 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MHXFr-1w4zVU0kd7-005yad; Thu, 30
 Apr 2026 15:57:25 +0200
Message-ID: <80008ff3-a0f5-421d-8a34-be66fc65beb7@gmx.de>
Date: Thu, 30 Apr 2026 15:57:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Julien Olivain <ju.o@free.fr>
References: <20260425085657.474422-1-fiona.klute@gmx.de>
 <20260425085657.474422-6-fiona.klute@gmx.de>
 <87be7e74-d1d7-4116-890b-7ae7d6557017@bubu1.eu>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <87be7e74-d1d7-4116-890b-7ae7d6557017@bubu1.eu>
X-Provags-ID: V03:K1:23J9b3P/b3I0mVpPL1+rvRarctfxoL+tBKwEb1wjsFXjm0KbhbX
 +eEH3W8qNBApb94fIlsWCOFB5624GqkSCnClCr3U/0LqHxvCAT60+jgIfvTB3FlpriMtdgg
 4g+noSAmhLHWajFjbCEHTnu9sRKiNQauy+pOM2BWNAqJ2IOV33LNukU9JTq7/yZ21cO2qjK
 kDxLR13DEDPdlnuJzV2dA==
UI-OutboundReport: notjunk:1;M01:P0:17fURi06XOY=;wDjhCny7hwQBZjwMWcFS5Bm/Uqv
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1777557445; x=1778162245; i=fiona.klute@gmx.de;
 bh=IJY+eOsm73LqUe+G64Sbw9ZG7cqc0mgQ4FRCKH6Z/oQ=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=iWepUyZiHYNOOTiiCD7jegxqw1N9SEleanHKsPxwxRrVJzfOJsVUPMx+ZaFh6TFJ
 igWIpeO2Ne7P8E+ResG0zEOKEY+h2SkikxuYqeoaujOYFw71amrvJ6OMAnUfR1qGM
 Vqd48PEdaxMPYE4fJIXxyXMmWyw5W4kL+cuFW53rfQxLco8dkifiebi5VXqXwNY74
 Bft8OoTlS0fxzK02ZF2mlcwVa2DY2bNq31CQnNoiAie5K6thUv1Z1vMFQih/ozscR
 965jTUPmc008C+tFUBx0FUgP2aUhkez1wbZm9YIRg1k2EdsrJVFKO67ZwQaBu6Krq
 LbCeDMLEBr/qjQbIfg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=iWepUyZi
Subject: Re: [Buildroot] [PATCH 5/5] package/kmod: enable dlopen() for
 compression libraries (if any)
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTWFyY3VzIQoKQW0gMzAuMDQuMjYgdW0gMTQ6NDEgc2NocmllYiBNYXJjdXMgSG9mZm1hbm46
Cj4gSGkgRmlvbmEsCj4gCj4gT24gNC8yNS8yNiAxMDo1NiwgRmlvbmEgS2x1dGUgdmlhIGJ1aWxk
cm9vdCB3cm90ZToKPj4gV2l0aCBkbG9wZW4oKSBlbmFibGVkLCBrbW9kIHdpbGwgbG9hZCBjb21w
cmVzc2lvbiBsaWJyYXJpZXMgb25seSBpZgo+PiBhY3R1YWxseSBuZWVkZWQgKGxvYWRpbmcgY29t
cHJlc3NlZCBtb2R1bGVzIGludG8gdGhlIGtlcm5lbCBkb2VzIG5vdAo+PiBpZiB0aGUga2VybmVs
IGNhbiBoYW5kbGUgZGVjb21wcmVzc2lvbiwgZGVwZW5kaW5nIG9uIGl0cwo+PiBjb25maWd1cmF0
aW9uKSwgYW5kIG9ubHkgdGhlIG5lZWRlZCBvbmUuCj4gCj4gSSBkb24ndCB0aGluayB0aGlzIGlz
IGNvdmVyZWQgYXMgcGFydCBvZiB0aGUgZXhpc3Rpbmcga21vZCB0ZXN0LCByaWdodD8KPiBDb3Vs
ZCB3ZSBhZGQgYSB0ZXN0IGNvdmVyaW5nIGxvYWRpbmcgY29tcHJlc3NlZCBtb2R1bGVzIHdpdGhv
dXQgdG9vIG11Y2ggCj4gZWZmb3J0PyBUaGVyZSdzIHByb2JhYmx5IGEgbG90IG9mIHBvc3NpYmxl
IHZhcmlhdGlvbnMgaGVyZSAoa2VybmVsIGNhbiAKPiBsb2FkIGNvbXByZXNzZWQgbW9kdWxlcyBv
biBpdCdzIG93biwgb3Igbm90LCBhbmQgdGhlIHZhcmlvdXMgY29tcHJlc3Npb24gCj4gYWxnb3Jp
dGhtcykgYnV0IG1heWJlIHNvbWUgYmFzZSBmdW5jdGlvbmFsaXR5IHRoYXQgdGhpcyBzdGlsbCB3
b3JrcyB3aXRoIAo+IHRoaXMgY2hhbmdlIGNhbiBiZSBjb3ZlcmVkIGJ5IGEgdGVzdD8KClRoZSB0
ZXN0IGFscmVhZHkgYnVpbGRzIGl0cyBvd24ga2VybmVsLCBzbyBJIHN1cHBvc2Ugd2UgY291bGQg
ZXh0ZW5kIHRoZSAKa2VybmVsIGNvbmZpZyB0byBlbmFibGUgQ09ORklHX01PRFVMRV9DT01QUkVT
Uz15LCAKQ09ORklHX01PRFVMRV9DT01QUkVTU19BTEw9eSBidXQgbGVhdmUgQ09ORklHX01PRFVM
RV9ERUNPTVBSRVNTPW4gKHNvIAprZXJuZWwgbW9kdWxlcyBhcmUgY29tcHJlc3NlZCBkdXJpbmcg
YnVpbGQsIGJ1dCB0aGUga2VybmVsIGRvZXMgbm90IApzdXBwb3J0IGRlY29tcHJlc3Npb24pLiBU
aGF0IHdheSBrbW9kIHdvdWxkIGhhdmUgdG8gaGFuZGxlIGRlY29tcHJlc3Npb24gCmZvciB0aGUg
dGVzdCB0byBwYXNzIChtaWdodCBuZWVkIGVuYWJsaW5nIHRoZSByaWdodCBsaWJyYXJ5IHBhY2th
Z2UsIHRvbykuCgpXaGF0IGRvIHlvdSB0aGluayBvZiB0aGF0PwoKQmVzdCByZWdhcmRzLApGaW9u
YQoKPiAKPj4KPj4gU2lnbmVkLW9mZi1ieTogRmlvbmEgS2x1dGUgPGZpb25hLmtsdXRlQGdteC5k
ZT4KPj4gLS0tCj4+IMKgIHBhY2thZ2Uva21vZC9rbW9kLm1rIHwgNCArKysrCj4+IMKgIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uva21v
ZC9rbW9kLm1rIGIvcGFja2FnZS9rbW9kL2ttb2QubWsKPj4gaW5kZXggZTFmNzEzZGMwMS4uMGFm
Y2FkMGQ0OCAxMDA2NDQKPj4gLS0tIGEvcGFja2FnZS9rbW9kL2ttb2QubWsKPj4gKysrIGIvcGFj
a2FnZS9rbW9kL2ttb2QubWsKPj4gQEAgLTI4LDYgKzI4LDEwIEBAIGVuZGlmCj4+IMKgIEtNT0Rf
Q09ORl9PUFRTICs9IC1EZmlzaGNvbXBsZXRpb25kaXI9bm8gLUR6c2hjb21wbGV0aW9uZGlyPW5v
Cj4+ICsjIGxvYWQgY29tcHJlc3Npb24gbGlicmFyaWVzIChpZiBhbnkgYXJlIGVuYWJsZWQgYmVs
b3cpIGFzIG5lZWRlZAo+PiArIyB1c2luZyBkbG9wZW4oKQo+PiArS01PRF9DT05GX09QVFMgKz0g
LURkbG9wZW49YWxsCj4+ICsKPj4gwqAgaWZlcSAoJChCUjJfUEFDS0FHRV9aTElCKSx5KQo+PiDC
oCBLTU9EX0RFUEVOREVOQ0lFUyArPSB6bGliCj4+IMKgIEtNT0RfQ09ORl9PUFRTICs9IC1Eemxp
Yj1lbmFibGVkCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
