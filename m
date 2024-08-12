Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4523DC52D7C
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 18:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D31984011A;
	Mon, 12 Aug 2024 18:29:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q6qNOhmUao-5; Mon, 12 Aug 2024 18:29:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7EE604035D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7EE604035D;
	Mon, 12 Aug 2024 18:29:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5CD9A1BF5AA
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 18:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56AF24035D
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 18:29:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3eIAsXk9gIES for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 18:29:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com;
 envelope-from=jcmvbkbc@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0686E4011A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0686E4011A
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0686E4011A
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 18:29:26 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-7c68b71ada4so589592a12.1
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 11:29:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723487366; x=1724092166;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SRRIrWhGRuXootfBKiOxfCyeDNTPjfMgFW6yg6Mnyts=;
 b=pz8rRrW9KbqdI2gI+yNoOmaLtQkK+uXf2cM1xND5BQOi4NXM4CeXdsCGQCjI9WvSv4
 tV/il4dsX3E09iut/3KXYIpf5baMDyt6IipqKqObcucZrJqSKOk3Ip1dsbBVvmuUc4d+
 wni2CRSz0qXuBKXemLhqrcA1tZwWdM1ALuEqdtpVFkB5zyp+k5RYyYRF28wBjRapNmEv
 cUMvwh0vw6NJF7sbX7eBXiVRHgnZEWSxrrrr8GVt7BZ23N/9FVFeyJ4nRIN9HJL4nzTP
 kaAt1mENjDTi5fTwVMG4qc0n/Bkw+2u/5BSqN8O0DJxKTzaAbrF7rWqPqozGzU7c3VXT
 zKgg==
X-Gm-Message-State: AOJu0YxAU3ICq9UtfOze/u2Usga18srbXPZzqqglTqVxXiLTDk29x/Dz
 6ob//8bF8P035VI3LdvshSl3sdVQ1l9122ncZJ15cZV1oly/eisYnQlJaWLN+Ty0pjYq6vubCv1
 kQTxDWE61VQjhjRELfUKMwn2BckwNjHV0
X-Google-Smtp-Source: AGHT+IEwCdiOtHzuFnZkhmOKTF/8tkxx/cq7h5aPG5s+FkffyC2ynOmn9BF32MCVupa0r5Fq5xllEsrh6sLEXzCXwlI=
X-Received: by 2002:a17:90a:a90:b0:2c9:a151:44fb with SMTP id
 98e67ed59e1d1-2d39253f0a1mr1357145a91.22.1723487366214; Mon, 12 Aug 2024
 11:29:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240811000029.1956409-1-jcmvbkbc@gmail.com>
 <20240811000029.1956409-2-jcmvbkbc@gmail.com>
 <e9b57e78-0ecc-449c-97bc-16ccb1ddab6d@carnegierobotics.com>
In-Reply-To: <e9b57e78-0ecc-449c-97bc-16ccb1ddab6d@carnegierobotics.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 12 Aug 2024 11:29:00 -0700
Message-ID: <CAMo8Bf+Mw6nUKJaD5SVe9qgcBrHHfN-39A2bNR05xyUhPRi7Yg@mail.gmail.com>
To: Woody Douglass <wdouglass@carnegierobotics.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723487366; x=1724092166; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SRRIrWhGRuXootfBKiOxfCyeDNTPjfMgFW6yg6Mnyts=;
 b=XtKGUNOqLTpVVaYRSaA+A1MmrQ4f3murRdahzUEywtsyip2JP5XkFHo0HSlo5hbaKz
 hG123MlCbCNVhq8k+GFilZNgpJ4QwHJzlb72kv0wnnxCkhyImQuu9lKdIKX1P79TJquD
 6vPVhCJgybqXPd7ctnsO5GZKSePzNHX8DNqHH0o6ST4IA0T48qX70sbyBTV2VaX3VBvm
 ikcRslrnNm/BmVlaJBJNVQ7NrnMqjSSKJcDFtWbrckBetYsaRZTK6wA3377d92CzsySQ
 MY0wIQZ3/74jVfNNyQEoJIWtzj2V3yQmW8gO9VAlNUSkV1TqdjAJnHg1KheLnkUZ1srS
 RZRQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=XtKGUNOq
Subject: Re: [Buildroot] [PATCH 1/2] Revert "package/chicken: move literals
 into text section for xtensa architecture"
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCBBdWcgMTIsIDIwMjQgYXQgNTozOeKAr0FNIFdvb2R5IERvdWdsYXNzCjx3ZG91Z2xh
c3NAY2FybmVnaWVyb2JvdGljcy5jb20+IHdyb3RlOgo+IE9uIDgvMTAvMjQgMjA6MDAsIE1heCBG
aWxpcHBvdiB3cm90ZToKPiA+IENBVVRJT046IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91
dHNpZGUgb2YgdGhlIG9yZ2FuaXphdGlvbi4gRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0
YWNobWVudHMgdW5sZXNzIHlvdSByZWNvZ25pemUgdGhlIHNlbmRlci4KPiA+Cj4gPgo+ID4gVGhp
cyByZXZlcnRzIGNvbW1pdCA4NmU1MWZkNWZlMjgxMGJiZjgzM2I0OGM0OTE0ZGNkMmRlMDFiZGJl
Lgo+ID4gU2lnbmVkLW9mZi1ieTogTWF4IEZpbGlwcG92IDxqY212YmtiY0BnbWFpbC5jb20+Cj4g
PiAtLS0KPiA+ICAgLi4uLzAwMDEteHRlbnNhLXRleHQtc2VjdGlvbi1saXRlcmFscy5wYXRjaCAg
IHwgMzAgLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gICBwYWNrYWdlL2NoaWNrZW4vY2hpY2tlbi5t
ayAgICAgICAgICAgICAgICAgICAgfCAxNCArKy0tLS0tLS0KPiA+ICAgMiBmaWxlcyBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDQyIGRlbGV0aW9ucygtKQo+ID4gICBkZWxldGUgbW9kZSAxMDA2
NDQgcGFja2FnZS9jaGlja2VuLzAwMDEteHRlbnNhLXRleHQtc2VjdGlvbi1saXRlcmFscy5wYXRj
aAo+ID4KPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2NoaWNrZW4vMDAwMS14dGVuc2EtdGV4dC1z
ZWN0aW9uLWxpdGVyYWxzLnBhdGNoIGIvcGFja2FnZS9jaGlja2VuLzAwMDEteHRlbnNhLXRleHQt
c2VjdGlvbi1saXRlcmFscy5wYXRjaAo+ID4gZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBp
bmRleCBiOTNhYWY5ZTIxOGQuLjAwMDAwMDAwMDAwMAo+ID4gLS0tIGEvcGFja2FnZS9jaGlja2Vu
LzAwMDEteHRlbnNhLXRleHQtc2VjdGlvbi1saXRlcmFscy5wYXRjaAo+ID4gKysrIC9kZXYvbnVs
bAo+ID4gQEAgLTEsMzAgKzAsMCBAQAo+ID4gLUZyb20gZThkMTc3ZjRkNGUxYzZiYzQxNzg3ZWEx
NjIxZTMyM2ZmNGFkNDkzZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiA+IC1Gcm9tOiBXb29k
cm93IERvdWdsYXNzIDx3ZG91Z2xhc3NAY2FybmVnaWVyb2JvdGljcy5jb20+Cj4gPiAtRGF0ZTog
TW9uLCAyMiBKdWwgMjAyNCAwODo1MDozNyAtMDQwMAo+ID4gLVN1YmplY3Q6IFtQQVRDSF0gTW92
ZSBsaXRlcmFscyBpbnRvIHRleHQgc2VjdGlvbiBmb3IgeHRlbnNhIGFyY2hpdGVjdHVyZQo+ID4g
LQo+ID4gLVVwc3RyZWFtOiBodHRwczovL2J1Z3MuY2FsbC1jYy5vcmcvdGlja2V0LzE4NDAKPiA+
IC1TaWduZWQtb2ZmLWJ5OiBXb29kcm93IERvdWdsYXNzIDx3ZG91Z2xhc3NAY2FybmVnaWVyb2Jv
dGljcy5jb20+Cj4gPiAtLS0tCj4gPiAtIE1ha2VmaWxlLmxpbnV4IHwgNSArKysrKwo+ID4gLSAx
IGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4gPiAtCj4gPiAtZGlmZiAtLWdpdCBhL01h
a2VmaWxlLmxpbnV4IGIvTWFrZWZpbGUubGludXgKPiA+IC1pbmRleCBiNjI4Y2RhNC4uZTk3YzJi
OTQgMTAwNjQ0Cj4gPiAtLS0tIGEvTWFrZWZpbGUubGludXgKPiA+IC0rKysgYi9NYWtlZmlsZS5s
aW51eAo+ID4gLUBAIC01Miw2ICs1MiwxMSBAQCBVU0VTX1NPTkFNRSA9IHllcwo+ID4gLQo+ID4g
LSAjIGFyY2hpdGVjdHVyZXMKPiA+IC0KPiA+IC0raWZlcSAoJChBUkNIKSx4dGVuc2EpCj4gPiAt
K0NfQ09NUElMRVJfT1BUSU9OUyArPSAtbXRleHQtc2VjdGlvbi1saXRlcmFscwo+ID4gLStMSU5L
RVJfT1BUSU9OUyArPSAtbXRleHQtc2VjdGlvbi1saXRlcmFscwo+ID4gLStlbmRpZgo+ID4gLSsK
PiA+IC0gaWZlcSAoJChBUkNIKSx4MzIpCj4gPiAtIENfQ09NUElMRVJfT1BUSU9OUyArPSAtbXgz
Mgo+ID4gLSBMSU5LRVJfT1BUSU9OUyArPSAtbXgzMgo+ID4gLS0tCj4gPiAtMi4zOS4yCj4gPiAt
Cj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9jaGlja2VuL2NoaWNrZW4ubWsgYi9wYWNrYWdlL2No
aWNrZW4vY2hpY2tlbi5tawo+ID4gaW5kZXggMDUyMDI4MDEzNGFiLi4yNjY3Zjc4MjNkOGEgMTAw
NjQ0Cj4gPiAtLS0gYS9wYWNrYWdlL2NoaWNrZW4vY2hpY2tlbi5tawo+ID4gKysrIGIvcGFja2Fn
ZS9jaGlja2VuL2NoaWNrZW4ubWsKPiA+IEBAIC0xMSwxOSArMTEsOSBAQCBDSElDS0VOX0xJQ0VO
U0VfRklMRVMgPSBMSUNFTlNFCj4gPiAgIENISUNLRU5fQ1BFX0lEX1ZFTkRPUiA9IGNhbGwtY2MK
PiA+ICAgQ0hJQ0tFTl9JTlNUQUxMX1NUQUdJTkcgPSBZRVMKPiA+Cj4gPiAtIyBDaGlja2VuIG9u
bHkgdXNlcyB0aGUgImFyY2giIHZhcmlhYmxlIGZvciBzb21lIHNwZWNpYWwtY2FzZSBjb21waWxl
Cj4gPiAtIyBhcmd1bWVudHMgSWYgaXQncyBlbXB0eSwgaXQgdHJpZXMgdG8gZGV0ZWN0IHRoZSBh
cmNoIGhvc3QgRmlsdGVyIG91dAo+ID4gLSMgdmFsdWVzIHRoYXQgaGF2ZSBhbiBlZmZlY3QsIG9y
IHBhc3MgInVudXNlZCIgaGVyZQo+ID4gLWlmZXEgKCQoTk9STUFMSVpFRF9BUkNIKSx4ODZfNjQp
Cj4gPiAtQ0hJQ0tFTl9BUkNIID0geDg2LTY0Cj4KPiBjaGFuZ2luZyB0aGUgc3BlbGxpbmcgdG8g
YHg4Ni02NGAgaGVyZSBpcyBhIGdvb2QgaWRlYSBpIHRoaW5rLCBiZWNhdXNlCj4gY2hpY2tlbiBk
b2VzIGFkZCBzb21lIGZsYWdzLiBPdGhlciB0aGVuIHRoYXQsIGkgYWdyZWUgdGhhdCB0aGUKPiBD
X0NPTVBJTEVSX09QVElNSVpBVElPTl9PUFRJT05TIGFwcHJvYWNoIGlzIGJldHRlciBoZXJlCgpJ
IGJlbGlldmUgdGhhdCBpdCBzaG91bGQgYmUgZG9uZSBpbiBhIHNlcGFyYXRlIGNoYW5nZSBhcyBp
dCBoYXMKbm90aGluZyB0byBkbyB3aXRoIHRoZSB0b3BpYyBvZiAnbW92ZSBsaXRlcmFscyBpbnRv
IHRleHQgc2VjdGlvbiBmb3IKeHRlbnNhIGFyY2hpdGVjdHVyZScuCgotLSAKVGhhbmtzLgotLSBN
YXgKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
