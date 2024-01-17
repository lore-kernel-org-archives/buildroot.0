Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C191FC47258
	for <buildroot@archiver.kernel.org>; Wed, 17 Jan 2024 18:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74A8983E37;
	Wed, 17 Jan 2024 18:03:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74A8983E37
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W4PD8mT_qu7c; Wed, 17 Jan 2024 18:03:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3B5383E46;
	Wed, 17 Jan 2024 18:03:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3B5383E46
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3433B1BF3BA
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 18:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B4B1419CF
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 18:03:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B4B1419CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n2LtFLZE2ZQj for <buildroot@lists.busybox.net>;
 Wed, 17 Jan 2024 18:03:03 +0000 (UTC)
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com
 [IPv6:2607:f8b0:4864:20::92a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 80A6340169
 for <buildroot@buildroot.org>; Wed, 17 Jan 2024 18:03:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80A6340169
Received: by mail-ua1-x92a.google.com with SMTP id
 a1e0cc1a2514c-7ce528fc53fso3494405241.0
 for <buildroot@buildroot.org>; Wed, 17 Jan 2024 10:03:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705514582; x=1706119382;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IBlxS0Hub5tKij0WqXEwUSpqcaE6UeSs9XeeoVpyeAw=;
 b=ZohjC3C5evxTplvvOAsKLXRH0ve+ZyCnyHavZIdOK6keQEcuvB6Y+tRe0Y+kmO6fhZ
 NMxpjLOHzkcZ267ctjbOxJE6wQVD/Vf56dMPZ72jqz5wFCzdXBjl4+y3cz2j65ngY00X
 gQpf/j2lTL3ac1Ft/tAh3fkzmPFD7nuBA/eCwF5rzJqwV8s96LkxBNcmn+m4pkbEPqop
 b1/ExpUAWno+89f3qe66IyzUumS1+pNzz4xDOahmAI44D4nILdrpYqD7RJ8oKJXzXkGP
 HAwh/aIXrk5dv+1My1ADnP5WEDS/ikwwo1HLS6tQb1qJ98uaWja1UAbxgiAFKP8Dsa17
 BjLw==
X-Gm-Message-State: AOJu0YwZ6943ao5CYoM8Pxovmd4TBiPo2kho8AnD/BrqbQS+/rC91bAm
 aclT8qfDddpV/6/he3ExDEsXJoyMqLizjpeXJrCRP5BTjgiXoA4B
X-Google-Smtp-Source: AGHT+IEGH0K3Guf2Or+lSqSqsv3WHhTDXsVvTaDT8pnasGJl5gVEMibFWFOVKaxq7dKa/yF4is1DY19D5EsomInFzuc=
X-Received: by 2002:a05:6122:4f0d:b0:4b6:f254:b220 with SMTP id
 gh13-20020a0561224f0d00b004b6f254b220mr4495741vkb.19.1705514581696; Wed, 17
 Jan 2024 10:03:01 -0800 (PST)
MIME-Version: 1.0
References: <20240101213454.558295-1-aleksandr.o.makarov@gmail.com>
 <87le8tndhy.fsf@48ers.dk>
In-Reply-To: <87le8tndhy.fsf@48ers.dk>
From: =?UTF-8?B?0JDQu9C10LrRgdCw0L3QtNGAINCc0LDQutCw0YDQvtCy?=
 <aleksandr.o.makarov@gmail.com>
Date: Wed, 17 Jan 2024 20:02:50 +0200
Message-ID: <CA+tfhufnjnh-_aGXBT=_7k-00KkYh764HfhZP=g-n7buLfgFKA@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705514582; x=1706119382; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IBlxS0Hub5tKij0WqXEwUSpqcaE6UeSs9XeeoVpyeAw=;
 b=l6VJ4Qc7pRjYIuhoZtxukOb8UbWJImluJXnRKpeG8lw5jsVx5cuXyDRkKw/5s30ZjJ
 IxvqUQuXXtDVntyVDi+q+1qU8cfGFHkq8zVQHKMzJa7gFU+EBQGLZ+u3vnt8N1vB1nic
 RFEqhi5JX9a/Zg8npTAMqxRIYkCdH1AG7oGe5tJcfJmzUKaHDo+/DkO8O+P5PWtlVEC9
 CnrT9wbV4foF6qSP7yry0s8UtkI8nGrP+bIyZ0yQF5BJdKZewNHL9KiRp3XgflzKvxAo
 oTa5KEe9Xo09+L1YbZIK7xRd0xZEXiTNH673UTG3mkTum5zGBqcoq5Sh+VpwePBLjqXL
 Aq7g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=l6VJ4Qc7
Subject: Re: [Buildroot] [PATCH 1/1] package/haproxy: fix runtime 'FATAL
 ERROR: invalid code detected -- cannot go further'
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UmVqZWN0ZWQgYnkgdXBzdHJlYW0uCgpodHRwczovL3d3dy5tYWlsLWFyY2hpdmUuY29tL2hhcHJv
eHlAZm9ybWlsdXgub3JnL21zZzQ0NDk5Lmh0bWwKCtGB0LEsIDEzINGP0L3Qsi4gMjAyNOKAr9Cz
LiDQsiAyMzoxMywgUGV0ZXIgS29yc2dhYXJkIDxwZXRlckBrb3JzZ2FhcmQuY29tPjoKPgo+ID4+
Pj4+ICJBbGVrc2FuZHIiID09IEFsZWtzYW5kciBNYWthcm92IDxhbGVrc2FuZHIuby5tYWthcm92
QGdtYWlsLmNvbT4gd3JpdGVzOgo+Cj4gID4gRm9yY2luZyBIQVBST1hZX0NGTEFHUyBvbiB0aGUg
aGFwcm94eSBidWlsZCBjb21tYW5kIGxpbmUgb3ZlcnJpZGVzIENGTEFHUwo+ICA+IHdoaWNoIHdl
cmUgaW50ZXJuYWxseSBzZXQgYnkgdGhlIHBhY2thZ2UgTWFrZWZpbGUuCj4KPiAgPiBJbiBzdWNo
IGEgd2F5LCBhIGJ1bmNoIG9mIGZsYWdzIHRoYXQgd2VyZSBkZWR1Y2VkIGJ5IHRoZSBwYWNrYWdl
IGJ1aWxkIHNjcmlwdAo+ICA+IGluICpfQ0ZMQUdTIHZhcmlhYmxlcywgc3BlY2lmaWNhbGx5IGlu
IFNQRUNfQ0ZMQUdTLCBhcmUgb21pdHRlZC4gQ29tcGlsaW5nIGFuZAo+ICA+IHJ1bm5pbmcgaGFw
cm94eSB3aXRob3V0IFNQRUNfQ0ZMQUdTIHRha2VuIGludG8gYWNjb3VudCByZXN1bHRzIGluIHJ1
bnRpbWUgZXJyb3I6Cj4KPiAgPiAkIGhhcHJveHkKPiAgPiBGQVRBTCBFUlJPUjogaW52YWxpZCBj
b2RlIGRldGVjdGVkIC0tIGNhbm5vdCBnbyBmdXJ0aGVyLCBwbGVhc2UgcmVjb21waWxlIQo+ICA+
IFRoZSBzb3VyY2UgY29kZSB3YXMgbWlzY29tcGlsZWQgYnkgdGhlIGNvbXBpbGVyLCB3aGljaCB1
c3VhbGx5IGluZGljYXRlcyB0aGF0Cj4gID4gc29tZSBvZiB0aGUgQ0ZMQUdTIG5lZWRlZCB0byB3
b3JrIGFyb3VuZCBvdmVyemVhbG91cyBjb21waWxlciBvcHRpbWl6YXRpb25zCj4gID4gd2VyZSBv
dmVyd3JpdHRlbiBhdCBidWlsZCB0aW1lLiBQbGVhc2UgZG8gbm90IGZvcmNlIENGTEFHUywgYW5k
IHJlYWQgTWFrZWZpbGUKPiAgPiBhbmQgSU5TVEFMTCBmaWxlcyB0byBkZWNpZGUgb24gdGhlIGJl
c3Qgd2F5IHRvIHBhc3MgeW91ciBsb2NhbCBidWlsZCBvcHRpb25zLgo+ICA+IC4uLgo+Cj4gID4g
VGhpcyBlcnJvciBpcyBwcm9kdWNlZCBieSBoYXByb3h5LmMgWzFdIHNvdXJjZSB3aGljaCBlZmZl
Y3RpdmVseSBlbnN1cmVzIHRoYXQgSU5UX01BWCsxCj4gID4gZXhwcmVzc2lvbiB3cmFwcyBhcm91
bmQgdXNpbmcgdHdvcy1jb21wbGVtZW50IHJlcHJlc2VudGF0aW9uLiBJdCBpcyBvbmx5IHRydWUg
d2hlbiAtZndyYXB2Cj4gID4gZ2NjIG9wdGlvbiBpcyBzZXQgaW4gU1BFQ19DRkxBR1MuCj4KPiAg
PiBUbyBhZGRyZXNzIHRoaXMsIGFwcGVuZCBuZWNlc3NhcnkgKl9DRkxBR1MgdmFyaWFibGVzIHRv
IHRoZSBDRkxBR1MgaW4gaGFwcm94eSBNYWtlZmlsZS4KPgo+ICA+IFsxXSBodHRwczovL2dpdC5o
YXByb3h5Lm9yZy8/cD1oYXByb3h5LmdpdDthPWJsb2I7Zj1zcmMvaGFwcm94eS5jO2g9ZTE4NjMy
NTU0MjI0NTllODA2ZjdlNTA4MjhlODE5NzZiYjQxYzE0YztoYj1IRUFEI2wzMzA0Cj4KPiAgPiBT
aWduZWQtb2ZmLWJ5OiBBbGVrc2FuZHIgTWFrYXJvdiA8YWxla3NhbmRyLm8ubWFrYXJvdkBnbWFp
bC5jb20+Cj4gID4gLS0tCj4gID4gIC4uLmZpeC1ydW50aW1lLUZBVEFMLUVSUk9SLWludmFsaWQt
Y29kZS5wYXRjaCB8IDUwICsrKysrKysrKysrKysrKysrKysKPiAgPiAgMSBmaWxlIGNoYW5nZWQs
IDUwIGluc2VydGlvbnMoKykKPiAgPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvaGFwcm94
eS8wMDAyLXBhY2thZ2UtaGFwcm94eS1maXgtcnVudGltZS1GQVRBTC1FUlJPUi1pbnZhbGlkLWNv
ZGUucGF0Y2gKPgo+ICA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2hhcHJveHkvMDAwMi1wYWNrYWdl
LWhhcHJveHktZml4LXJ1bnRpbWUtRkFUQUwtRVJST1ItaW52YWxpZC1jb2RlLnBhdGNoIGIvcGFj
a2FnZS9oYXByb3h5LzAwMDItcGFja2FnZS1oYXByb3h5LWZpeC1ydW50aW1lLUZBVEFMLUVSUk9S
LWludmFsaWQtY29kZS5wYXRjaAo+ICA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gID4gaW5kZXgg
MDAwMDAwMDAwMC4uMzk3MDYwNDhmMwo+ICA+IC0tLSAvZGV2L251bGwKPiAgPiArKysgYi9wYWNr
YWdlL2hhcHJveHkvMDAwMi1wYWNrYWdlLWhhcHJveHktZml4LXJ1bnRpbWUtRkFUQUwtRVJST1It
aW52YWxpZC1jb2RlLnBhdGNoCj4gID4gQEAgLTAsMCArMSw1MCBAQAo+ICA+ICtGcm9tIDlkYmYy
NzE4MGM1YWUwNGIxMTA3NmM0NmRhMDI5YmZkMTQ0Njc4MmEgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCj4gID4gK0Zyb206IEFsZWtzYW5kciBNYWthcm92IDxhbGVrc2FuZHIuby5tYWthcm92QGdt
YWlsLmNvbT4KPiAgPiArRGF0ZTogTW9uLCAxIEphbiAyMDI0IDIyOjA0OjE1ICswMjAwCj4gID4g
K1N1YmplY3Q6IFtQQVRDSCAxLzFdIHBhY2thZ2UvaGFwcm94eTogZml4IHJ1bnRpbWUgJ0ZBVEFM
IEVSUk9SOiBpbnZhbGlkIGNvZGUKPiAgPiArIGRldGVjdGVkIC0tIGNhbm5vdCBnbyBmdXJ0aGVy
Jwo+Cj4gSGFzIHRoaXMgcGF0Y2ggYmVlbiBzdWJtaXR0ZWQgdXBzdHJlYW0/IElmIHNvLCB3aGF0
IGlzIHRoZSBzdGF0dXMgb2YgaXQ/Cj4KPiAtLQo+IEJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
