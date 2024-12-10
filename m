Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 436A6E77180
	for <buildroot@archiver.kernel.org>; Tue, 10 Dec 2024 20:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E95CE810C6;
	Tue, 10 Dec 2024 20:59:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kTYaS0StkAxa; Tue, 10 Dec 2024 20:59:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0694D810C8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0694D810C8;
	Tue, 10 Dec 2024 20:59:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F3C2CED2
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 20:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4A7C810C8
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 20:59:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pZ8QW2Ui2Slf for <buildroot@buildroot.org>;
 Tue, 10 Dec 2024 20:59:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DBA92810C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBA92810C6
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DBA92810C6
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 20:59:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id BF2845FF95;
 Tue, 10 Dec 2024 21:59:12 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:34344])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 10 Dec 2024 21:59:12 +0100
MIME-Version: 1.0
Date: Tue, 10 Dec 2024 21:59:12 +0100
From: Julien Olivain <ju.o@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <71f241d3-bbc5-4b2d-ad8e-131aa29de1c7@benettiengineering.com>
References: <20241207201936.103809-1-giulio.benetti@benettiengineering.com>
 <24da891859b2444d6044c3bb22c18a40@free.fr>
 <71f241d3-bbc5-4b2d-ad8e-131aa29de1c7@benettiengineering.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <6e3cb89de46c585515bb8e2ed01545ed@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1733864354;
 bh=xx/qfhdHiHhvyT+bNT+k6kMuzML/la/yZar1oTJpSjA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CZUzYclTQh2FxXAeIB227RTDp/bSXqS5wIex10lcbK6BDzK/E5UZqtoOg2jAihk2x
 rLkf3BgzhG31Gsk12ISu3wGKKIdIQC8Z2QnaH21HQzD2CcKLh9mOib87pfoaKxet8J
 IoofOmCgvDO7a9wkRu6gdTv9NOeNGGISqsHchgMPPelbBVBbEqOcYA92/GHrVxaCy3
 ZUbV0J+ZwbnmbdsgBPkThlpgotKReyPimo+wJxImAy5KsOioKMswLvVMuxX9xUN06g
 JrvLU7Be2l8GDoNS2NqJ/kMJHN1syu30LqVOhADfKE9ecNfVUL28tC6jL/eL5Sq7uF
 eodwUmrJjWC+A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=CZUzYclT
Subject: Re: [Buildroot] [PATCH] package/rtl8192eu: bump to 2024-12-03
 version
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

SGkgR2l1bGlvLAoKT24gMTAvMTIvMjAyNCAxMToyMywgR2l1bGlvIEJlbmV0dGkgd3JvdGU6Cj4g
SGkgSnVsaWVuLAo+IAo+IE9uIDEyLzkvMjQgMjM6NTIsIEp1bGllbiBPbGl2YWluIHdyb3RlOgo+
PiBIaSBHaXVsaW8sCj4+IAo+PiBPbiAwNy8xMi8yMDI0IDIxOjE5LCBHaXVsaW8gQmVuZXR0aSB3
cm90ZToKPj4+IFRoaXMgdmVyc2lvbiBhbGxvd3MgdG8gYnVpbGQgd2l0aCBMaW51eCA2LjEzLgo+
Pj4gCj4+PiBTaWduZWQtb2ZmLWJ5OiBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVu
ZXR0aWVuZ2luZWVyaW5nLmNvbT4KPj4gCj4+IEFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCj4+
IAo+PiBJIGZpeGVkIGEgY2hlY2stcGFja2FnZSBlcnJvci4KPj4gCj4+PiAtLS0KPj4+IMKgcGFj
a2FnZS9ydGw4MTkyZXUvcnRsODE5MmV1Lmhhc2ggfCAyICstCj4+PiDCoHBhY2thZ2UvcnRsODE5
MmV1L3J0bDgxOTJldS5ta8KgwqAgfCAyICstCj4+PiDCoDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pj4gCj4+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9y
dGw4MTkyZXUvcnRsODE5MmV1Lmhhc2ggYi9wYWNrYWdlL3J0bDgxOTJldS8gCj4+PiBydGw4MTky
ZXUuaGFzaAo+Pj4gaW5kZXggYThiN2NiOTM1OC4uM2U3MGQzNmQ1NyAxMDA2NDQKPj4+IC0tLSBh
L3BhY2thZ2UvcnRsODE5MmV1L3J0bDgxOTJldS5oYXNoCj4+PiArKysgYi9wYWNrYWdlL3J0bDgx
OTJldS9ydGw4MTkyZXUuaGFzaAo+Pj4gQEAgLTEsMiArMSwyIEBACj4+PiDCoCMgTG9jYWxseSBj
b21wdXRlZAo+Pj4gLXNoYTI1NiAKPj4+IDhkYTBmNTRiZDlhZTA5NGI1ZjYxZmUzYzRkZDIwN2Iy
ZGY2MmI0Mjg2OTcwZTI4MjhmN2M1Y2UxMTQ2NDQ3ZmIgCj4+PiBydGw4MTkyZXUtNTZmNjcyYThi
OTU3MmM3NDMxNDhmMmU2MDA2OGZkMzQxZDUyZDVhMy50YXIuZ3oKPj4+ICtzaGEyNTYgCj4+PiBk
YmQ1NjVlZGM4ZDUyYTE0MjlkODU1MTc5NWZiNGRhM2NhNDRjZjI3ODY3NDY2MDEwZTBlNmQwMGM4
NmFlZjVjIAo+Pj4gcnRsODE5MmV1LTY3NTVjZTljMTViYmNiNWRjZmZiY2E3ZjZmMDhlNjYxY2Nk
YWFjZGIudGFyLmd6Cj4+PiBcIE5vIG5ld2xpbmUgYXQgZW5kIG9mIGZpbGUKPj4gCj4+IFRoZSBj
b21tYW5kOgo+PiAKPj4gIMKgwqDCoCB1dGlscy9kb2NrZXItcnVuIG1ha2UgY2hlY2stcGFja2Fn
ZQo+PiAKPj4gcmVwb3J0cyBoZXJlOgo+PiAKPj4gIMKgwqDCoCBwYWNrYWdlL3J0bDgxOTJldS9y
dGw4MTkyZXUuaGFzaDoyOiBtaXNzaW5nIG5ld2xpbmUgYXQgZW5kIG9mIAo+PiBmaWxlCj4+IAo+
PiBJIGZpeGVkIGl0IGJlZm9yZSBhcHBseWluZy4KPiAKPiBUaGFuayB5b3UuIEkgaGF2ZSB0byBi
dWlsZCBpbnNpZGUgZG9ja2VyIHRvIGF2b2lkIHRoaXMuCgpJdCdzIHByZWZlcmFibGUsIHllcy4g
VXNpbmcgdGhlIGRvY2tlciBpbWFnZSB3aWxsIHB1dCB5b3UgaW4gdGhlIHNhbWUgCnN0YXRlIGFz
IHRoZQpCdWlsZHJvb3QgQ0kuIEluIHRoYXQgY2FzZSwgdGhlICJtYWtlIGNoZWNrLXBhY2thZ2Ui
IGlzIHVzaW5nIFNoZWxsQ2hlY2sgCmFuZCBmbGFrZTgKd2hpY2ggY2FuIGZpbmQgbW9yZSBvciBs
ZXNzIGVycm9ycyBkZXBlbmRpbmcgb24gdGhlaXIgdmVyc2lvbnMuIFNlZToKaHR0cHM6Ly9idWls
ZHJvb3Qub3JnL2Rvd25sb2Fkcy9tYW51YWwvbWFudWFsLmh0bWwjY2hlY2stcGFja2FnZQoKPiBC
ZXN0IHJlZ2FyZHMKPiAtLQo+IEdpdWxpbyBCZW5ldHRpCj4gQ0VPJkNUT0BCZW5ldHRpIEVuZ2lu
ZWVyaW5nIHNhcwoKQmVzdCByZWdhcmRzLAoKSnVsaWVuLgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
