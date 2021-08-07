Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 589E0C4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 17:07:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE00D60F50
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 17:07:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DE00D60F50
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0EBC83934;
	Sat,  7 Aug 2021 17:07:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1BVfebB-Y41x; Sat,  7 Aug 2021 17:07:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF6EA83906;
	Sat,  7 Aug 2021 17:07:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 33D351BF964
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 17:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 307BD605DD
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 17:07:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OPBVG-aLTWPL for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 17:07:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 03968605CD
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 17:07:11 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6435:5a60:3dd3:9849])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 6A902780346;
 Sat,  7 Aug 2021 19:07:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1628356028;
 bh=sVuWBcuNNLoNsZQX3iMperfMAKazehgi8xsFdGjHhCY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X4WuKO5Vij8PONNJe6r9BwMVEYyXgXqFJTBsJS3jXAMH9I6Itn2QQmR4w99eAZ5PW
 3l1z/zGogCl8Bx2oW/6cchCVwwKfd3efAfsMlPVA/x9HstIXRxX7nlpCxwu4Dl9hnh
 ys/Myo8vHjektQhKkLQMbYHH3R0uw3Xhwoz1uohgxflPTJ3GWv/dhRv1LMQlZPpSOX
 TCdDaKxI6lpQQAKSIuUpqe2B4xlR0a4DTCKgXlYM8YUhIXroCKgEir2V4le3OJqqP+
 4aRad0n1VCy5sTbvbdFplqPQIAtJGr0MrgBogPmahV7MaYKDO7ick047RSR4uYhvFQ
 VAsdmZuUL0JGQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 07 Aug 2021 19:07:00 +0200
Date: Sat, 7 Aug 2021 19:07:00 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210807170700.GD27036@scaer>
References: <20210806143641.3449707-1-fontaine.fabrice@gmail.com>
 <20210807095002.GY27036@scaer>
 <CAPi7W82H4T-zqU4Q5u8L0LVESd_NC7i9egDYhA0F3aw=rd4hCA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPi7W82H4T-zqU4Q5u8L0LVESd_NC7i9egDYhA0F3aw=rd4hCA@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/ffmpeg: add -latomic to
 libavformat.pc
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

RmFicmljZSwgQWxsLAoKT24gMjAyMS0wOC0wNyAxNzowMSArMDIwMCwgRmFicmljZSBGb250YWlu
ZSBzcGFrZSB0aHVzbHk6Cj4gTGUgc2FtLiA3IGFvw7t0IDIwMjEgw6AgMTE6NTAsIFlhbm4gRS4g
TU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiBhIMOpY3JpdCA6Cj4gPiBPbiAyMDIxLTA4
LTA2IDE2OjM2ICswMjAwLCBGYWJyaWNlIEZvbnRhaW5lIHNwYWtlIHRodXNseToKPiA+ID4gLWxh
dG9taWMgd2FzIGFkZGVkIHRvIGV4dHJhbGlicyB0byBmaXggc3RhdGljIGJ1aWxkIG9mIGZmbXBl
ZyBpbiBjb21taXQKPiA+ID4gZmM4Nzk4MTk3YjU3NDg4YTg1MmUyYzE0YjQ2NzdiNWViMDExNGEw
Yi4gSG93ZXZlciwgZXh0cmFsaWJzIGlzIG5vdAo+ID4gPiBhZGRlZCB0byBsaWJhdmZvcm1hdC5w
YyByZXN1bHRpbmcgaW4gdGhlIGZvbGxvd2luZyBzdGF0aWMgYnVpbGQgZmFpbHVyZQpbLS1TTklQ
LS1dCj4gPiA+IFNvIGFkZCBhIHBhdGNoIHRvIGFkZCBleHRyYWxpYnMgKGFuZCBzbyAtbGF0b21p
YykgdG8gbGliYXZmb3JtYXQucGMKWy0tU05JUC0tXQo+ID4gPiArZGlmZiAtLWdpdCBhL2NvbmZp
Z3VyZSBiL2NvbmZpZ3VyZQo+ID4gPiAraW5kZXggMGJiM2E3Y2YyYi4uY2IzNjZjM2JhNiAxMDA3
NTUKPiA+ID4gKy0tLSBhL2NvbmZpZ3VyZQo+ID4gPiArKysrIGIvY29uZmlndXJlCj4gPiA+ICtA
QCAtNzYwNCw3ICs3NjA0LDcgQEAgTElCUFJFRj0ke0xJQlBSRUZ9Cj4gPiA+ICsgTElCU1VGPSR7
TElCU1VGfQo+ID4gPiArIGV4dHJhbGlic19hdnV0aWw9IiRhdnV0aWxfZXh0cmFsaWJzIgo+ID4g
PiArIGV4dHJhbGlic19hdmNvZGVjPSIkYXZjb2RlY19leHRyYWxpYnMiCj4gPiA+ICstZXh0cmFs
aWJzX2F2Zm9ybWF0PSIkYXZmb3JtYXRfZXh0cmFsaWJzIgo+ID4gPiArK2V4dHJhbGlic19hdmZv
cm1hdD0iJGF2Zm9ybWF0X2V4dHJhbGlicyAkZXh0cmFsaWJzIgo+ID4gPiArIGV4dHJhbGlic19h
dmRldmljZT0iJGF2ZGV2aWNlX2V4dHJhbGlicyIKPiA+ID4gKyBleHRyYWxpYnNfYXZmaWx0ZXI9
IiRhdmZpbHRlcl9leHRyYWxpYnMiCj4gPiA+ICsgZXh0cmFsaWJzX2F2cmVzYW1wbGU9IiRhdnJl
c2FtcGxlX2V4dHJhbGlicyIKPiA+Cj4gPiBTaG91bGRuJ3Qgd2UgYWxzbyBhZGQgJGV4dHJhbGli
cyB0byBhbGwsIGluc3RlYWQgb2YganVzdCBhdmZvcm1hdD8KPiBJIGRvbid0IGtub3cgaWYgYWxs
IGZmbXBlZyBsaWJyYXJpZXMgZGVwZW5kIG9uIGxpYmF0b21pYyBzbyBJIG9ubHkKPiB1cGRhdGVk
IGF2Zm9ybWF0IGFzIGl0IGlzIGVub3VnaCB0byBmaXggdGhlIGJ1aWxkIGZhaWx1cmUgYnV0IEkg
Y2FuCj4gdXBkYXRlIGFsbCBvZiB0aGVtIGlmIHlvdSB0aGluayBpdCdzIGJldHRlci4KClRoaW5n
IGlzLCAkZXh0cmFsaWJzIGlzIHVzZWQgaW4gdGhlIGxpbmsgb2YgYWxsIGZmbXBlZyBsaWJyYXJp
ZXMsIHNvIGl0CndvdWxkIG1ha2Ugc2Vuc2UgaXQgaXMgYWxzbyBhZGRlZCB0byBhbGwgdGhlIHBl
ci1saWJyYXJ5IGV4dHJhbGlicy4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgotLSAKLi0tLS0t
LS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0t
LS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQg
fCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAw
NTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAg
ICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdB
SU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vl
ay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwK
Jy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0t
LV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVzeWJveC5u
ZXQKaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
