Return-Path: <SRS0=01xH=PX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96A5CC433F5
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 15:08:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3878A61213
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 15:08:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3878A61213
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=yandex.ru
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB0774013F;
	Thu,  4 Nov 2021 15:08:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qTvOBLSL0KtI; Thu,  4 Nov 2021 15:08:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 412CC40141;
	Thu,  4 Nov 2021 15:07:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8E53F1BF5A1
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 15:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7EE174013F
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 15:07:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Pe-umszN05I for <buildroot@lists.busybox.net>;
 Thu,  4 Nov 2021 15:07:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from forward501o.mail.yandex.net (forward501o.mail.yandex.net
 [37.140.190.203])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E24FA40139
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 15:07:55 +0000 (UTC)
Received: from sas1-df7c155f48c6.qloud-c.yandex.net
 (sas1-df7c155f48c6.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:e119:0:640:df7c:155f])
 by forward501o.mail.yandex.net (Yandex) with ESMTP id 4601945C48EB;
 Thu,  4 Nov 2021 18:07:51 +0300 (MSK)
Received: from sas8-b61c542d7279.qloud-c.yandex.net
 (sas8-b61c542d7279.qloud-c.yandex.net [2a02:6b8:c1b:2912:0:640:b61c:542d])
 by sas1-df7c155f48c6.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 cEnKGtF4Bu-7pCu7bK8; Thu, 04 Nov 2021 18:07:51 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
 t=1636038471; bh=4TA/yJni65xKtmCDh5A2h/U4t7hUTo0PWkf1VHWHct4=;
 h=In-Reply-To:From:Subject:References:Date:Message-ID:To;
 b=SbFabEjitio1nMpO30ngBFmrIdbQbeM0KbXbZg5L8+uW5ejjUlawGuUj9de0nuytB
 RLlN+T75eJF2V+VB7999jXeiqiUVp7byhtcQUTvAI2I/EMpZHuRC+P3Uvq1zVZVjXR
 NpYH8wK+qQthGijscoBZporXP0waZI/a/ryllu6U=
Authentication-Results: sas1-df7c155f48c6.qloud-c.yandex.net;
 dkim=pass header.i=@yandex.ru
Received: by sas8-b61c542d7279.qloud-c.yandex.net (smtp/Yandex) with ESMTPS id
 M878L2BRfw-7o8mqlJU; Thu, 04 Nov 2021 18:07:50 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 2
Message-ID: <8639a15a-14fc-26e3-10f6-abd14b2c688e@yandex.ru>
Date: Thu, 4 Nov 2021 18:07:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-US
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <3c3603ba-5719-fec9-9bb3-7b0f3967fc9f@yandex.ru>
 <b379b067-4456-324c-f768-2f6eac1b155c@yandex.ru>
 <1180b9a6-7a4b-853b-a61e-0f853cdb5ef8@benettiengineering.com>
From: stsp <stsp2@yandex.ru>
In-Reply-To: <1180b9a6-7a4b-853b-a61e-0f853cdb5ef8@benettiengineering.com>
Subject: Re: [Buildroot] generic code with i7 bootlin toolchain?
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgowNC4xMS4yMDIxIDE3OjU1LCBHaXVsaW8gQmVuZXR0aSDQv9C40YjQtdGCOgo+PiBTbyBz
dWNoIHNjaGVtZSBzaG91bGQgcmVzaXN0IHRvCj4+IHRoZSAiYmFkIiBwYWNrYWdlcyB5b3UgbWVu
dGlvbgo+PiBiZWNhdXNlIGl0IGRvZXNuJ3QgcmVseSBvbiB0aGVtCj4+IGhhbmRsaW5nIENGTEFH
UyBjb3JyZWN0bHkuCj4+IFRoZXJlIG1pZ2h0IGJlIHNvbWUgb3RoZXIgZXhwbGFuYXRpb24KPj4g
dG8gdGhlIHByb2JsZW0gSSBzZWUuCj4KPiBObywgaXQgZG9lc24ndCByZXNpc3QgdG8gdGhlICJi
YWQiIHBhY2thZ2VzLiBUcnkgdG8gaW1hZ2luZSBhbiAKPiBhdXRvLXRvb2xzIHBhY2thZ2Ugd2hl
cmUgeW91IGNhbiBwYXNzIENGTEFHUywgYnV0IGluIE1ha2VmaWxlLmluIHlvdSAKPiBmaW5kIG91
dCB0aGF0IGl0IGRvZXMgY29tZSBjaGVjayBhbmQgaXQgYXBwZW5kIHNvbWV0aGluZyBsaWtlICIt
TzIiIAo+IGFuZCBpbnN0ZWFkIHlvdSB3YW50ICItTzAiLCBidXQgdGhpcyB3YXkgeW91IHdpbGwg
ZW5kIHVwIGhhdmluZyAKPiBDRkxBR1M9Ii4uLiAtTzAgLU8yIi4gVGhpcyBvdmVycmlkZXMgdGhl
IG9wdGltaXphdGlvbiBmbGFnLCBzbyB0aGlzIAo+IGRvZXNuJ3Qgc29sdmUgdGhlIHByb2JsZW0u
CgpZb3UgbWVhbiBzb21lb25lIG92ZXJyaWRlcwpteSAtbWFyY2ggLW1jcHU/IEJ1dCBkb2Vzbid0
CnRoYXQgc291bmQgdW5saWtlbHk/IFllcywgLU8gY2FuCmJlIG92ZXJyaWRkZW4sIHN1cmUsIGJ1
dCAtbWFyY2guLi4KCgo+PiBUaGlua2luZyBtb3JlIGFib3V0IHRoaXMgLSBtYXliZQo+PiBsaWJn
Y2Mgb3Igc29tZSBvdGhlciBsaWIgZnJvbSB0aGUKPj4gYm9vdGxpbiB0b29sY2hhaW4gaXMgb3Zl
ci1vcHRpbWl6ZWQ/Cj4+IEluIHRoYXQgY2FzZSBJIHNob3VsZCBhc2sgYXQgYm9vdGxpbgo+PiBw
ZXJoYXBzIGluc3RlYWQuLi4KPgo+IEkgZG9uJ3Qgc2VlIGhvdyBpdCBjb3VsZCBoZWxwLCBhbHNv
IHdoYXQgeW91IG1lYW4gd2l0aCBvdmVyLW9wdGltaXplZD8gCj4gRG8geW91IG1lYW4gdGhhdCAt
T3Mgb24gYnVpbGRpbmcgQm9vdGxpbiB0b29sY2hhaW4gY291bGQgbGVhZCB0byB0aGUgCj4gdG9v
bGNoYWluIHRvIGZhaWwgaW4gc29tZSB3YXk/CgpJIG1lYW4gYnkgdGhlIHVzZSBvZiBTU0UzLzQg
dGhhdApteSBDUFUgZG9lcyBub3QgaGF2ZS4KCgo+PiBQbGVhc2UgQ0MgbWUgdGhlIHJlcGxpZXMg
aWYgcG9zc2libGUuCj4KPiBUaGlzIGlzIHdoYXQgSSBkbywgSSAiQW5zd2VyIHRvIGFsbCIgaW5j
bHVkaW5nIHRoZSBNTC4KClNvcnJ5LCB5YW5kZXggcHV0IGl0IHRvIHNwYW0uIDooCgoKPiBBbnl3
YXkgaGVyZSBJIHRoaW5rIHdlJ3JlIGxvc2luZyB0aGUgZm9jdXMgb2YgdGhlIHByZXZpb3VzIGUt
bWFpbCB0aGF0IAo+IHlvdSBjYW4ndCBidWlsZCBmb3IgQU1ELiBDYW4geW91IHByb3ZpZGUgdGhl
IGV4YWN0IENQVSBtb2RlbCB5b3UncmUgCj4gYnVpbGRsaW5nIGZvcj8gCm1vZGVsIG5hbWXCoMKg
wqAgOiBBTUQgUGhlbm9tKHRtKSBJSSBYNCA5NTUgUHJvY2Vzc29yCmZsYWdzwqDCoMKgIMKgwqDC
oCA6IGZwdSB2bWUgZGUgcHNlIHRzYyBtc3IgcGFlIG1jZSBjeDggYXBpYyBzZXAgbXRyciBwZ2Ug
bWNhIApjbW92IHBhdCBwc2UzNiBjbGZsdXNoIG1teCBmeHNyIHNzZSBzc2UyIGh0IHN5c2NhbGwg
bnggbW14ZXh0IGZ4c3Jfb3B0IApwZHBlMWdiIHJkdHNjcCBsbSAzZG5vd2V4dCAzZG5vdyBjb25z
dGFudF90c2MgcmVwX2dvb2Qgbm9wbCBub25zdG9wX3RzYyAKY3B1aWQgZXh0ZF9hcGljaWQgcG5p
IG1vbml0b3IgY3gxNiBwb3BjbnQgbGFoZl9sbSBjbXBfbGVnYWN5IHN2bSBleHRhcGljIApjcjhf
bGVnYWN5IGFibSBzc2U0YSBtaXNhbGlnbnNzZSAzZG5vd3ByZWZldGNoIG9zdncgaWJzIHNraW5p
dCB3ZHQgCm5vZGVpZF9tc3IgaHdfcHN0YXRlIHZtbWNhbGwgbnB0IGxicnYgc3ZtX2xvY2sgbnJp
cF9zYXZlCgoKU28gaXQgc2VlbXMgdG8gaGF2ZSBTU0UsIFNTRTIsIFNTRTRhPwpEb2Vzbid0IHNl
ZW0gdG8gaGF2ZSBTU0UzLCB3aGljaCBtaWdodApiZSB0aGUgcHJvYmxlbS4gSSBzdXNwZWN0IHRo
ZSBsaWJzIGZyb20KYm9vdGxpbiB0b29sLWNoYWluIGFscmVhZHkgdXNlIFNTRTMsIHNvCnRoYXQg
Y2FuJ3QgYmUgY3VyZWQgb3RoZXIgdGhhbiBieSB0aGUKdG9vbC1jaGFpbiByZWJ1aWxkLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
