Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA57E7B5E2
	for <buildroot@archiver.kernel.org>; Wed,  4 Oct 2023 09:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFF0381F99;
	Wed,  4 Oct 2023 09:59:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFF0381F99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RFvG1JEl7PQ7; Wed,  4 Oct 2023 09:59:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DACA81F81;
	Wed,  4 Oct 2023 09:59:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DACA81F81
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8AA611BF276
 for <buildroot@lists.busybox.net>; Wed,  4 Oct 2023 09:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 714354019D
 for <buildroot@lists.busybox.net>; Wed,  4 Oct 2023 09:59:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 714354019D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wded3-utYmhb for <buildroot@lists.busybox.net>;
 Wed,  4 Oct 2023 09:59:31 +0000 (UTC)
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9DD5240134
 for <buildroot@buildroot.org>; Wed,  4 Oct 2023 09:59:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DD5240134
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id B414B5C2CC1;
 Wed,  4 Oct 2023 11:59:26 +0200 (CEST)
MIME-Version: 1.0
Date: Wed, 04 Oct 2023 11:59:26 +0200
From: Stefan Agner <stefan@agner.ch>
To: Christian Stewart <christian@aperture.us>
In-Reply-To: <CA+h8R2p24q9AZRvkwacX3oOzuS2T7ZAENm7yNKj70Rfe0xuF0Q@mail.gmail.com>
References: <20230727232235.449788-1-christian@aperture.us>
 <b73fb293249bcf48f42ebaed0f78f1c1@agner.ch>
 <CA+h8R2r3sxFvPN5QFt9szw638M_9o=WRC3a8pUQ1O2KrGMvrkw@mail.gmail.com>
 <08DC739C-F115-4DB2-9F9A-0CD6E9BFEA42@agner.ch>
 <CA+h8R2rbhvCt60Fhwi1qGv0PocZsS0rA3fVQoukDP2KhPrkjdQ@mail.gmail.com>
 <23f2b3bd59cb6d860ea52b566eacfdb8@agner.ch>
 <CA+h8R2o9eAVZBrzU1E8wbh_eoQfhWv+0JsH11_N4hrkPKqKCXg@mail.gmail.com>
 <eb94fb2be140a706ce4797df9cb56d63@agner.ch> <87r0mgay0o.fsf@48ers.dk>
 <CA+h8R2p24q9AZRvkwacX3oOzuS2T7ZAENm7yNKj70Rfe0xuF0Q@mail.gmail.com>
Message-ID: <c614a21b7b4b92432b86c44985840266@agner.ch>
X-Sender: stefan@agner.ch
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1696413566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hgxCQTMlzCCzuAjTQ4RRhyZD2smvcWMIOXdoBvInO48=;
 b=bNIPC2oapXXzZSy2nbp5JDRUAOpY5BvIUg8yhJXfImMXP+jTPL2mhHW8wD8HcNLUzizheA
 136vUoepg2jAfn2i5s5DhoU/gjS0lHjYQB7OtgY1FoiFY8v+nvJg3QsyS0Z7oLUZACGUQS
 u9JismnxsilKQ0DpO44yPeHFhjzVBms=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=agner.ch header.i=@agner.ch
 header.a=rsa-sha256 header.s=dkim header.b=bNIPC2oa
Subject: Re: [Buildroot] [PATCH v1 1/1] package/containerd: bump version to
 v1.6.22
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMjAyMy0xMC0wMiAyMDoyOCwgQ2hyaXN0aWFuIFN0ZXdhcnQgd3JvdGU6Cj4gSGkgUGV0ZXIs
Cj4gCj4gaHR0cHM6Ly9naXRodWIuY29tL2NvbnRhaW5lcmQvY29udGFpbmVyZC9pc3N1ZXMvOTEz
OSNpc3N1ZWNvbW1lbnQtMTczNjQ3NzUzNAo+IAo+IE9uIFNhdCwgU2VwIDMwLCAyMDIzIGF0IDE6
MDPigK9BTSBQZXRlciBLb3JzZ2FhcmQgPHBldGVyQGtvcnNnYWFyZC5jb20+IHdyb3RlOgo+PiBJ
ZiBjcmkgaXMgb25seSBuZWVkZWQgZm9yIHdoZW4gY29udGFpbmVyZCBpcyB1c2VkIHdpdGgga3Vi
ZXJuZXRlcywgdGhlbgo+PiBwZXJoYXBzIHdlIHNob3VsZCBkaXNhYmxlIGl0IGJ5IGRlZmF1bHQg
c28gb3RoZXIgcGVvcGxlIGRvbid0IG5lZWQgdG8KPj4gZGVidWcgdGhlIHNhbWUgaXNzdWUuCj4g
Cj4gSSB0aGluayB3ZSBjYW4gc2FmZWx5IGRpc2FibGUgY3JpIG9uIHRoZSBkZWZhdWx0IGNvbmZp
Zy4KCkF0IHRoYXQgcG9pbnQgd2UgY2FuIGFsc28gcGFzcyB0aGUgbm9fY3JpIGJ1aWxkIHRhZy4K
CkknbGwgY3JlYXRlIGEgUFIgdG8gZG8ganVzdCB0aGF0LgoKLS0KU3RlZmFuCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
