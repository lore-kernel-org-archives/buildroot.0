Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33720CF884D
	for <buildroot@archiver.kernel.org>; Fri,  4 Oct 2024 15:50:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9171A40D13;
	Fri,  4 Oct 2024 15:50:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 57MsXYoEaolO; Fri,  4 Oct 2024 15:50:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 625E040D27
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 625E040D27;
	Fri,  4 Oct 2024 15:50:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 10CFC1BF3D2
 for <buildroot@lists.busybox.net>; Fri,  4 Oct 2024 15:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C6BA4137D
 for <buildroot@lists.busybox.net>; Fri,  4 Oct 2024 15:50:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e9IR7HrgvjYz for <buildroot@lists.busybox.net>;
 Fri,  4 Oct 2024 15:50:36 +0000 (UTC)
X-Greylist: delayed 371 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 04 Oct 2024 15:50:34 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1BFD3402D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BFD3402D4
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:67c:2050:0:465::201; helo=mout-p-201.mailbox.org;
 envelope-from=hypnotoad@lindra.de; receiver=<UNKNOWN> 
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org
 [IPv6:2001:67c:2050:0:465::201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1BFD3402D4
 for <buildroot@buildroot.org>; Fri,  4 Oct 2024 15:50:34 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4XKtBp3jStz9t44;
 Fri,  4 Oct 2024 17:44:18 +0200 (CEST)
Message-ID: <1e3d0c06-17b1-422f-9e9d-a501e3f9fcf8@lindra.de>
Date: Fri, 4 Oct 2024 17:44:16 +0200
MIME-Version: 1.0
To: Andreas Naumann <dev@andin.de>, buildroot@buildroot.org
References: <20240401084841.439073-1-hypnotoad@lindra.de>
 <20240405175454.14431-2-hypnotoad@lindra.de>
 <6b23799f-7a89-4665-935f-22176901d87e@andin.de>
Content-Language: en-US, de-DE
From: Ralf Dragon <hypnotoad@lindra.de>
In-Reply-To: <6b23799f-7a89-4665-935f-22176901d87e@andin.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lindra.de; s=MBO0001; t=1728056658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j4W7P8ulacjeMcHs4szB/H0DFB69G0784UnR7b8WTbw=;
 b=MxuUcxUoebjrzLeG1R0r0n3MQxZlWgp37zzB3jE78WFyPTr8/FFToGlPgFvqJU0dsn+Tqy
 O2oBphc6/Z3yCSUkG/U5pocJcwJrVpP3yOT+KYYNhRDQwLWg+ZS/egucpA9z0Wp2L/skgP
 73RfBDhnRy8gJcKFSJ3O+OPBa4BtSpbPwj91GzXN7s1SegA9j0JXihInBnil9T3ypMaN3w
 NIkzprNGdzUWlsT8HcLWALLiXClrEmMDBacTUzZ7+wFJdBeZRebWShBqgkLZE/JwcwXjWn
 hjyg970O0z/n2HAyUmu1aORMmMbSY7vwtD95GCuZqJ9Z5wbLaYOvOn6yC9z43A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=lindra.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=lindra.de header.i=@lindra.de header.a=rsa-sha256
 header.s=MBO0001 header.b=MxuUcxUo
Subject: Re: [Buildroot] [PATCH v3 2/2] add missing SIP module for PyQt5
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QW0gMTIuMDkuMjQgdW0gMjE6MjMgc2NocmllYiBBbmRyZWFzIE5hdW1hbm46Cj4KPgo+IEFtIDA1
LjA0LjI0IHVtIDE5OjU0IHNjaHJpZWIgUmFsZiBEcmFnb246Cj4+IFRoaXMgZml4ZXMgdGhlIGZv
bGxvd2luZyBydW50aW1lIGVycm9yIHdoZW4gaW1wb3J0aW5nIFB5UXQ1IGluIHB5dGhvbjoKPj4K
Pj4gZnJvbSBQeVF0NS5RdENvcmUgaW1wb3J0ICoKPj4gTW9kdWxlTm90Rm91bmRFcnJvcjogTm8g
bW9kdWxlIG5hbWVkICdQeVF0NS5zaXAnCj4+Cj4+IFRoZSBwcm9ibGVtIHdhcyBsaWtlbHkgdHJp
Z2dlcmVkIGJ5IHRoZSBhdG9taWMgdXBncmFkZSBmcm9tIDUuNyB0bwo+PiA1LjE1IGluIGIzNmNl
N2UuIFRoaXMgY29tbWl0IGlzIHBhcnQgb2YgdGhlIDIwMjItMjAyNCBMVFMuCj4+Cj4+IFNpZ25l
ZC1vZmYtYnk6IFJhbGYgRHJhZ29uIDxoeXBub3RvYWRAbGluZHJhLmRlPgo+Cj4gUmFuIGludG8g
dGhlIHNhbWUgcHJvYmxlbSwgZm91bmQgYW5kIGFwcGxpZWQgYm90aCBwYXRjaGVzIG9uIDIwMjQu
MDIsIAo+IGNvbXBpbGVkIGEgcXQ1IGNvbmZpZyBpbmNsdWRpbmcgcHlxdDUgZm9yIGlteDhtcCBh
bmQgc3VjY2Vzc2Z1bGx5IHJhbiAKPiBpdCBvbiB0aGUgdGFyZ2V0Lgo+Cj4gVGVzdGVkLWJ5OiBB
bmRyZWFzIE5hdW1hbm4gPGFuYXVtYW5uQHVsdHJhdHJvbmlrLmRlPgo+Cj4KPj4gLS0tCj4+IMKg
IHBhY2thZ2UvcHl0aG9uLXB5cXQ1L0NvbmZpZy5pbiB8IDEgKwo+PiDCoCAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKykKPj4KPj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLXB5cXQ1
L0NvbmZpZy5pbiAKPj4gYi9wYWNrYWdlL3B5dGhvbi1weXF0NS9Db25maWcuaW4KPj4gaW5kZXgg
OWZhNzY3NmY5OC4uMGIzN2YxNDMxNyAxMDA2NDQKPj4gLS0tIGEvcGFja2FnZS9weXRob24tcHlx
dDUvQ29uZmlnLmluCj4+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLXB5cXQ1L0NvbmZpZy5pbgo+PiBA
QCAtNSw2ICs1LDcgQEAgY29uZmlnIEJSMl9QQUNLQUdFX1BZVEhPTl9QWVFUNQo+PiDCoMKgwqDC
oMKgIGJvb2wgInB5dGhvbi1weXF0NSIKPj4gwqDCoMKgwqDCoCBkZXBlbmRzIG9uIEJSMl9QQUNL
QUdFX1FUNQo+PiDCoMKgwqDCoMKgIHNlbGVjdCBCUjJfUEFDS0FHRV9QWVRIT05fU0lQCj4+ICvC
oMKgwqAgc2VsZWN0IEJSMl9QQUNLQUdFX1BZVEhPTl9QWVFUNV9TSVAgIyBydW50aW1lCj4+IMKg
wqDCoMKgwqAgc2VsZWN0IEJSMl9QQUNLQUdFX1FUNUJBU0VfR1VJCj4+IMKgwqDCoMKgwqAgaGVs
cAo+PiDCoMKgwqDCoMKgwqDCoCBQeXRob24gYmluZGluZ3MgZm9yIFF0IDUKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
