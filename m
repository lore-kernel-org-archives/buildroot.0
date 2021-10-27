Return-Path: <SRS0=x9kH=PP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CC35C433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 07:29:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4CBA610A4
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 07:29:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E4CBA610A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E7DE60AD5;
	Wed, 27 Oct 2021 07:29:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nuBH1xeSYZxu; Wed, 27 Oct 2021 07:29:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED40F606D9;
	Wed, 27 Oct 2021 07:29:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1A2C21BF580
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 07:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16D1A4035F
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 07:29:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 64KXz5jPuH05 for <buildroot@lists.busybox.net>;
 Wed, 27 Oct 2021 07:29:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1B3C1401E8
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 07:28:59 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id c28so4112334lfv.13
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 00:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YC8svCyKHoXo+qI1se/eUPdY7n2cy7iyve0ZDdr2z0M=;
 b=ncWnnnn9l8Cqcau2IOF3oFlDhi/1WD6rqODAHe1trrKi7BqRZ3bVGcjidYsfsOgoeK
 xP5ASC48omN76+KHs8l00NSh2RiqS5YWdURvt2MLY3176IdsP9i77hzGL81Lp90qTH24
 sbZXTMsYrpec7AdV+flolmdGUkwLi0sBedHM6li/xJAlLcJePM3P+lcMaPfrBlOMHnUX
 rgEsnKLJ4voctBYJM/af01iTTZcID1W7WfN7g7prlG46vFCOZ8LtIS1O8D95Piug5PMv
 JLg+H9HqkNzyP8jZEgM1gW2x3jc1pHtQZ2pQD3V8ZUNkPWjhfoP5SsuknzZZIEEgDc9A
 /pPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YC8svCyKHoXo+qI1se/eUPdY7n2cy7iyve0ZDdr2z0M=;
 b=N7Yu7i6+Etqqqbv0DcHxORDmQNUt8SJ5tx3fcXGWvkrwG59rgKOu6h2fVy+mqHOSjA
 awyZzrfatRk+iTHfIUL6f5R0FR+Z0XXPxzmIzBk/sMskkNDoetv8P+ZsXIJkSwsVkwDk
 Ht+xWJPcotCNf/pmFpmvVDdLo1SzrI6KO4ZWb9Ixcyv9G3fY3heQTxO1nxW/Zlas2Dqn
 o7xHKBjfSZQdSf4dSnUjhvV/uyZt2XUOC0q6f8IEGZQ7f5HDzRH+Nbm2HgSlMlxNCiKb
 ZmirukfF6XV5IpJxBAjqwA3BbjMekU81YjM9ays8J1G7f1v9xBvzO++mtKNSJpHpQ/wn
 lriQ==
X-Gm-Message-State: AOAM5332BsdiPGJFIHwCHp7qMk/svdlCMVelOQbI/ZoeSEsmlKUI5kS+
 8YvBQzWlQPfODiPWEa96OzkW05hGiBeXj5BBDMj3meJI
X-Google-Smtp-Source: ABdhPJywJR8lmyxZ+dwbywc6mVXqAzxACNZ1JADyMtFLa/tYseJ46xf9OP3hQH5ZAtwqyzlcSTeuz1DTv0JgWnnUEZQ=
X-Received: by 2002:a05:6512:1284:: with SMTP id
 u4mr28224183lfs.614.1635319737757; 
 Wed, 27 Oct 2021 00:28:57 -0700 (PDT)
MIME-Version: 1.0
References: <mailman.3672.1635273538.103149.buildroot@buildroot.org>
 <170e09cd599fceea54a6bac8ae1fea5d@umbiko.net>
In-Reply-To: <170e09cd599fceea54a6bac8ae1fea5d@umbiko.net>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 27 Oct 2021 09:27:16 +0200
Message-ID: <CAPi7W83RQx7p7mbfuA4nqEM2+xR3kJ4uL2egPmmmymcfie80nA@mail.gmail.com>
To: Andreas Ziegler <br015@umbiko.net>
Subject: Re: [Buildroot] [PATCH 1/1] package/lighttpd: fix build on musl
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQW5kcmVhcywKCkxlIG1lci4gMjcgb2N0LiAyMDIxIMOgIDA2OjU4LCBBbmRyZWFzIFppZWds
ZXIgPGJyMDE1QHVtYmlrby5uZXQ+IGEgw6ljcml0IDoKPgo+IEhpIEZhYnJpY2UsCj4KPiBPbiAy
MDIxLTEwLTI2IDE4OjM4LCBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWls
LmNvbT4KPiB3cm90ZToKPgo+ID4gRml4IHRoZSBmb2xsb3dpbmcgYnVpbGQgZmFpbHVyZSBvbiBt
dXNsIHJhaXNlZCBzaW5jZSBidW1wIHRvIHZlcnNpb24KPiA+IDEuNC42MCBpbiBjb21taXQgZDYy
YjdmNTRmMDAyOTFhNTAyNzQ0MDlmYjU1MTA1MjdmZDcyNWZmZToKPiA+Cj4gPiBJbiBmaWxlIGlu
Y2x1ZGVkIGZyb20gYnVmZmVyLmg6NDA0LAo+ID4gICAgICAgICAgICAgICAgICBmcm9tIGFycmF5
Lmg6NSwKPiA+ICAgICAgICAgICAgICAgICAgZnJvbSBhcnJheS5jOjM6Cj4gPiBjay5oOjI0OjE0
OiBlcnJvcjogZXhwZWN0ZWQgJzsnIGJlZm9yZSAndHlwZWRlZicKPiA+ICAgIDI0IHwgX19CRUdJ
Tl9ERUNMUwo+ID4gICAgICAgfCAgICAgICAgICAgICAgXgo+ID4gICAgICAgfCAgICAgICAgICAg
ICAgOwo+ID4gLi4uLi4uCj4gPiAgICAyOSB8IHR5cGVkZWYgc2l6ZV90IHJzaXplX3Q7Cj4gPiAg
ICAgICB8IH5+fn5+fn4KPiA+Cj4gPiBGaXhlczoKPiA+ICAtCj4gPiBodHRwOi8vYXV0b2J1aWxk
LmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy8wZDU2YTQ0NDQ5ZTg5NzczNDk5MDUxYjM1ZjIxZWM4M2Jm
YWI0Y2E2Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUu
ZmFicmljZUBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+ICAuLi4tX19CRUdJTl9ERUNMUy1fX0VORF9E
RUNMUy1pZi1uZWVkZWQucGF0Y2ggfCAzOSArKysrKysrKysrKysrKysrKysrCj4gPiAgMSBmaWxl
IGNoYW5nZWQsIDM5IGluc2VydGlvbnMoKykKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQKPiA+IHBh
Y2thZ2UvbGlnaHR0cGQvMDAwMi1jb3JlLWRlZmluZS1fX0JFR0lOX0RFQ0xTLV9fRU5EX0RFQ0xT
LWlmLW5lZWRlZC5wYXRjaAo+ID4KPiA+IGRpZmYgLS1naXQKPiA+IGEvcGFja2FnZS9saWdodHRw
ZC8wMDAyLWNvcmUtZGVmaW5lLV9fQkVHSU5fREVDTFMtX19FTkRfREVDTFMtaWYtbmVlZGVkLnBh
dGNoCj4gPiBiL3BhY2thZ2UvbGlnaHR0cGQvMDAwMi1jb3JlLWRlZmluZS1fX0JFR0lOX0RFQ0xT
LV9fRU5EX0RFQ0xTLWlmLW5lZWRlZC5wYXRjaAo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+
IGluZGV4IDAwMDAwMDAwMDAuLmNkNjRmMTg3OTQKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKwo+
ID4gYi9wYWNrYWdlL2xpZ2h0dHBkLzAwMDItY29yZS1kZWZpbmUtX19CRUdJTl9ERUNMUy1fX0VO
RF9ERUNMUy1pZi1uZWVkZWQucGF0Y2gKPiA+IEBAIC0wLDAgKzEsMzkgQEAKPiA+ICtGcm9tIGNm
NGRmYmUxNWVmOGVhZDNhN2VkYTk3NGFmN2Q4MDRkNDQ3ZjAwZGIgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCj4gPiArRnJvbTogR2xlbm4gU3RyYXVzcyA8Z3N0cmF1c3NAZ2x1ZWxvZ2ljLmNvbT4K
PiA+ICtEYXRlOiBNb24sIDQgT2N0IDIwMjEgMDk6NTE6MjIgLTA0MDAKPiA+ICtTdWJqZWN0OiBb
UEFUQ0hdIFtjb3JlXSBkZWZpbmUgX19CRUdJTl9ERUNMUywgX19FTkRfREVDTFMgaWYgbmVlZGVk
Cj4gPiArCj4gPiArW1JldHJpZXZlZCBmcm9tOgo+ID4gK2h0dHBzOi8vZ2l0aHViLmNvbS9saWdo
dHRwZC9saWdodHRwZDEuNC9jb21taXQvY2Y0ZGZiZTE1ZWY4ZWFkM2E3ZWRhOTc0YWY3ZDgwNGQ0
NDdmMDBkYl0KPiA+ICtTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5m
YWJyaWNlQGdtYWlsLmNvbT4KPiA+ICstLS0KPiA+ICsgc3JjL2ZpcnN0LmggfCAxNiArKysrKysr
KysrKysrKysrCj4gPiArIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspCj4gPiArCj4g
PiArZGlmZiAtLWdpdCBhL3NyYy9maXJzdC5oIGIvc3JjL2ZpcnN0LmgKPiA+ICtpbmRleCBkZjc0
N2JhNDYuLjlkMDQyOGFlNiAxMDA2NDQKPiA+ICstLS0gYS9zcmMvZmlyc3QuaAo+ID4gKysrKyBi
L3NyYy9maXJzdC5oCj4gPiArQEAgLTM5LDYgKzM5LDIyIEBACj4gPiArICNpbmNsdWRlIDxzeXMv
dHlwZXMuaD4KPiA+ICsgI2luY2x1ZGUgPHN0ZGRlZi5oPgo+ID4gKwo+ID4gKysjaWZuZGVmIF9f
QkVHSU5fREVDTFMKPiA+ICsrI2lmZGVmIF9fY3BsdXNwbHVzCj4gPiArKyNkZWZpbmUgX19CRUdJ
Tl9ERUNMUyBleHRlcm4gIkMiIHsKPiA+ICsrI2Vsc2UKPiA+ICsrI2RlZmluZSBfX0JFR0lOX0RF
Q0xTCj4gPiArKyNlbmRpZgo+ID4gKysjZW5kaWYKPgo+IEluc3RlYWQgb2YgY3JlYXRpbmcgeW91
ciBvd24gZGVjbGFyYXRpb25zIG9mIF8qX0RFQ0xTLCB5b3UgbWlnaHQganVzdAo+IGFkZCB0aGUg
bWlzc2luZyA8c3lzL2NkZWZzLmg+IHRvIGNrLmg7IHRoaXMgc2VlbXMgdG8gYmUgdGhlIG9ubHkg
cGxhY2UKPiB0aGUgcHJvYmxlbSBvY2N1cnMuCj4KPiBUaGUgaGVhZGVyIGlzIHBhcnQgb2YgZ2xp
YmMsIGJ1dCBub3Qgb2YgbXVzbDsgd2l0aGluIEJ1aWxkcm9vdCBpdCBpcwo+IGF1dG9tYXRpY2Fs
bHkgYWRkZWQgYnkgbXVzbC1jb21wYXQtaGVhZGVycywgd2hpY2ggaXMgc2VsZWN0ZWQgaWYgeW91
IHVzZQo+IG11c2wuClRoaXMgaXMgYW4gdXBzdHJlYW0gcGF0Y2ggYW5kIEkgZG9uJ3Qga25vdyBp
ZiB0aGV5IHdpbGwgYWNjZXB0IHRvCnJlcGxhY2UgaXQgd2l0aCB5b3VyIHByb3Bvc2FsIGV2ZW4g
aWYgaXQgc2VlbXMgYmV0dGVyLgpGZWVsIGZyZWUgdG8gc2VuZCBhIFBSIHRvIGh0dHBzOi8vZ2l0
aHViLmNvbS9saWdodHRwZC9saWdodHRwZDEuNCBhbmQKYSB2MiBvZiB0aGlzIHBhdGNoLgo+Cj4g
S2luZCByZWdhcmRzLAo+IEFuZHJlYXMKPgo+ID4gKysKPiA+ICsrI2lmbmRlZiBfX0VORF9ERUNM
Uwo+ID4gKysjaWZkZWYgX19jcGx1c3BsdXMKPiA+ICsrI2RlZmluZSBfX0VORF9ERUNMUyB9Cj4g
PiArKyNlbHNlCj4gPiArKyNkZWZpbmUgX19FTkRfREVDTFMKPiA+ICsrI2VuZGlmCj4gPiArKyNl
bmRpZgo+ID4gKysKPiA+ICsgI2lmIGRlZmluZWQgSEFWRV9TVERJTlRfSAo+ID4gKyAjIGluY2x1
ZGUgPHN0ZGludC5oPgo+ID4gKyAjZWxpZiBkZWZpbmVkIEhBVkVfSU5UVFlQRVNfSAo+ID4gLS0K
PiA+IDIuMzMuMApCZXN0IFJlZ2FyZHMsCgpGYWJyaWNlCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
