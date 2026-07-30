Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A488C5516D
	for <buildroot@archiver.kernel.org>; Thu, 30 Jul 2026 20:18:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C63040CDD;
	Thu, 30 Jul 2026 20:18:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xWbNf-lwpvxN; Thu, 30 Jul 2026 20:18:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57BBF40CC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785442702;
	bh=9QadC4hEJskT8tS3HRa9Z66tE0RpDRIsmqPV+ywM1WA=;
	h=Date:To:Cc:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gdL2UexTcyJ2T9YMVquCpLgaOxji+KJR4FcGRrSZhpCeGaItF6PviKTYqZVkuNttm
	 7sFzGzWailHcI7D4Sj8g472MRtmxFmY839hByYeRTxD4MSkKX3um/TKOajDGihV2MQ
	 yE3mtADWMEm3G/4kdG7V3DadV1fXIMIom+3CJsr3ScPtBe5yS3WY0B+fh23ByOAYn2
	 7Bf3KEKTNAc5aZnN68yhOtpAf3SuhzlZ+9ZeO4s5LDDxVZCXjvT0R/reC7IWkUKyhT
	 Qo8jQ0G+5vgZotIcSLy/IvUY190YmxM4DRvhLzK5IhtNNaIwdN3NHHBVPQZBCP6zcz
	 sw8et74I1PXeg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57BBF40CC7;
	Thu, 30 Jul 2026 20:18:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 75B84218
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 20:18:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B7D26065E
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 20:18:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z82iQzwAgvEa for <buildroot@buildroot.org>;
 Thu, 30 Jul 2026 20:18:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.140.110.172;
 helo=foss.arm.com; envelope-from=laszlo.ersek@arm.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 44E396065C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44E396065C
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp3.osuosl.org (Postfix) with ESMTP id 44E396065C
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 20:18:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 438AF1BCB;
 Thu, 30 Jul 2026 13:18:14 -0700 (PDT)
Received: from [10.57.40.101] (unknown [10.57.40.101])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AD26D3F66F;
 Thu, 30 Jul 2026 13:18:17 -0700 (PDT)
Message-ID: <2982b63d-ab0b-4649-9eff-7940bd053ef3@arm.com>
Date: Thu, 30 Jul 2026 22:18:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnout Vandecappelle <arnout@rnout.be>
Cc: Oleg Lyovin <ovlevin@sberdevices.ru>, buildroot@buildroot.org
References: <20260730180627.1224385-1-laszlo.ersek@arm.com>
 <638ca326-29a3-499b-b8b0-57c9fc24ca1e@rnout.be>
Content-Language: en-US
From: Laszlo Ersek <laszlo.ersek@arm.com>
In-Reply-To: <638ca326-29a3-499b-b8b0-57c9fc24ca1e@rnout.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=arm.com; s=foss; 
 t=1785442698; bh=SBETSq/py7jNp0QOn3W3ikC18RnzdN4JuVDY/CGNPOI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CsLXKGN22Qo3jfumrUOFWDueCjoeBDMQagKdOx5ucx2RYLFqZj11C3YK2XQPLZfSg
 81vrWiFPIyJaQzZ4IqT8aaD0sLLS5UBmsnRmEFgHMATvRoXhbOAcXw43kNCmhA4lVz
 R+Lyjq5mY8z9eNmBmhSU/aUwJ/tL7pr6GFawnbh0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=arm.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256
 header.s=foss header.b=CsLXKGN2
Subject: Re: [Buildroot] [PATCH] linux/linux.mk: forcibly (re)enable Make
 jobserver
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

T24gNy8zMC8yNiAyMDoxNCwgQXJub3V0IFZhbmRlY2FwcGVsbGUgd3JvdGU6Cj4KPgo+IE9uIDMw
LzA3LzIwMjYgMjA6MDYsIExhc3psbyBFcnNlayB3cm90ZToKPj4gQ29tbWl0IDBiOWVmYzk5MWY4
YSAowqtsaW51eDogdXNlIEJSMl9NQUtFwrssIDIwMjMtMDQtMTApIHJlcGxhY2VkCj4+ICQoTUFL
RSkgd2l0aCAkKEJSMl9NQUtFKSBpbiBhIG51bWJlciBvZiByZWNpcGVzLiBBcyBhIGNvbnNlcXVl
bmNlLAo+PiB0aGUgY2hpbGQgbWFrZSBpcyB1bmFibGUgdG8gZGlzY292ZXIgdGhlIGpvYiBzZXJ2
ZXIsIGFuZCB3ZSBnZXQgYQo+PiB3YXJuaW5nIHN1Y2ggYXMKPj4KPj4+IHdhcm5pbmc6IGpvYnNl
cnZlciB1bmF2YWlsYWJsZTogdXNpbmcgLWoxLiBBZGQgYCsnIHRvIHBhcmVudCBtYWtlIHJ1bGUu
Cj4+Cj4+IGh0dHBzOi8vd3d3LmdudS5vcmcvc29mdHdhcmUvbWFrZS9tYW51YWwvaHRtbF9ub2Rl
L0Vycm9yLU1lc3NhZ2VzLmh0bWwKPj4gaHR0cHM6Ly93d3cuZ251Lm9yZy9zb2Z0d2FyZS9tYWtl
L21hbnVhbC9odG1sX25vZGUvTUFLRS1WYXJpYWJsZS5odG1sCj4+Cj4+IEluZm9ybSB0aGUgcGFy
ZW50IE1ha2UsIGJ5IHByZWZpeGluZyB0aGUgcmVjaXBlIHdpdGggIisiLCB0aGF0Cj4+ICQoQlIy
X01BS0UpIGNhbiBkZWFsIHdpdGggdGhlIGpvYiBzZXJ2ZXIuCj4+Cj4+IENjOiBBcm5vdXQgVmFu
ZGVjYXBwZWxsZSA8YXJub3V0QG1pbmQuYmU+Cj4+IENjOiBPbGVnIEx5b3ZpbiA8b3ZsZXZpbkBz
YmVyZGV2aWNlcy5ydT4KPj4gQ2M6IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4+IFNpZ25lZC1v
ZmYtYnk6IExhc3psbyBFcnNlayA8bGFzemxvLmVyc2VrQGFybS5jb20+Cj4+IC0tLQo+Pgo+PiBO
b3RlczoKPj4gICAgICBDb21taXQgMGI5ZWZjOTkxZjhhIHJlcGxhY2VzIG11bHRpcGxlIGluc3Rh
bmNlcyBvZiAkKE1BS0UpIHdpdGgKPj4gICAgICAkKEJSMl9NQUtFKTsgSSdtIG9ubHkgcHJlZml4
aW5nIHRoZSBvbmUgcmVjaXBlIHdpdGggIisiIHRoYXQKPj4gICAgICBzZWVtcyB0byBjYXVzZSB0
aGUgbW9zdCBub3RpY2VhYmxlIHNsb3dkb3duIGZvciBtZSAoYnkgbWlzc2luZwo+PiAgICAgIG91
dCBvbiBhIHBhcmFsbGVsIGtlcm5lbCBidWlsZCkuCj4KPiAgIEFyZSB5b3UgcmVhbGx5IHN1cmUg
dGhpcyBzcGVlZHMgdGhpbmdzIHVwPwoKWWVzLgoKPiBUaGUgY29yZSBvZiB0aGUgd29yayBzaG91
bGQgYmUgaW4gdGhlIGBtYWtlIGFsbGAgaW52b2NhdGlvbiBvbiBsaW5lCj4gNTQ2LiBBbGwgdGhl
IG90aGVyIGludm9jYXRpb25zIHNob3VsZCBiZSBwcmV0dHkgbXVjaCBzZXJpYWwuIEluCj4gcGFy
dGljdWxhciB0aGUgcmVidWlsZC13aXRoLWluaXRyYW1mcyBzaG91bGQgZG8gbm90aGluZyBtb3Jl
IHRoYW4KPiByZS1saW5raW5nIGFuZCByZS1jb21wcmVzc2luZyB0aGUga2VybmVsIGJlY2F1c2Ug
dGhlIGV4YWN0IHNhbWUKPiBjb21tYW5kIHdhcyBhbHJlYWR5IGRvbmUgaW4gdGhlIGJ1aWxkIHN0
ZXAuCgpJbiBteSBjYXNlLAoKLSBib3RoICJMSU5VWF9CVUlMRF9DTURTIiAtLSB0aGUgImFsbCIg
dGFyZ2V0IC0tLAoKLSBhbmQgImxpbnV4LXJlYnVpbGQtd2l0aC1pbml0cmFtZnMiIC0tIHRoZSAk
KExJTlVYX1RBUkdFVF9OQU1FKSwgYWthCiAgICJJbWFnZSIgdGFyZ2V0IC0tCgpzZWVtIHRvIHBl
cmZvcm0gYSBzaW1pbGFybHkgbGFyZ2UgWzFdIGtlcm5lbCBidWlsZC4gVGhlIGZpcnN0IG9uZSBi
dWlsZHMKb2JqZWN0IGZpbGVzIGNvbmN1cnJlbnRseSBhbHJlYWR5LCB0aGUgc2Vjb25kIG9uZSAo
d2l0aG91dCB0aGlzIHBhdGNoKQpkb2Vzbid0LgoKWzFdIFRoZSAiSW1hZ2UiIGJ1aWxkIChmcm9t
ICJsaW51eC1yZWJ1aWxkLXdpdGgtaW5pdHJhbWZzIikgc2VlbXMgbm90IHRvCmV4ZWN1dGUgdGhl
IGZvbGxvd2luZyB0eXBlcyBvZiByZWNpcGVzIGZyb20gdGhlICJhbGwiIHRhcmdldCAoZnJvbQoi
TElOVVhfQlVJTERfQ01EUyIpOgoKLSBDQyBbTV0KLSBMRCBbTV0KLSBDSEtTSEExIG9uIHZhcmlv
dXMgaGVhZGVycwotIENPUFkgb24gdmFyaW91cyBoZWFkZXJzCi0gRFRDIG9uIHZhcmlvdXMgZGV2
aWNlIHRyZWUgZmlsZXMKLSBHWklQIG9uIEltYWdlLmd6Ci0gVVBEIGFuZCBXUkFQIG9uIHZhcmlv
dXMgZ2VuZXJhdGVkIGhlYWRlciBmaWxlcwoKSSB0aGluayB0aGVzZSBkaWZmZXJlbmNlcyBhcmUg
ZXhwZWN0ZWQuIEhvd2V2ZXIsIHdoaWxlCiJsaW51eC1yZWJ1aWxkLXdpdGgtaW5pdHJhbWZzIiBw
ZXJmb3JtcyBmZXdlciBidWlsZCBzdGVwcywgYWNjb3JkaW5nIHRvCnRoZSBhYm92ZSwgaXQgZG9l
cyBidWlsZCBhbGwgdGhlIGJ1aWx0LWluIG9iamVjdCBmaWxlcyBhbmV3LCBhbmQgdGhhdApoYXBw
ZW5zIHdheSBtb3JlIHNsb3dseSB0aGFuIGluICJMSU5VWF9CVUlMRF9DTURTIiwgYmVjYXVzZQoi
bGludXgtcmVidWlsZC13aXRoLWluaXRyYW1mcyIgZG9lc24ndCBkbyBpdCBjb25jdXJyZW50bHku
CgooRldJVywgSSdtIGJhc2VkIG9mZiBvZiByZWxlYXNlIDIwMjUuMDUuKQoKTGFzemxvCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
