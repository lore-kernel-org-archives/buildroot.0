Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4FEECD1284
	for <buildroot@archiver.kernel.org>; Thu,  4 Apr 2024 15:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4142E832EA;
	Thu,  4 Apr 2024 15:02:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mCuGtuo2TQtE; Thu,  4 Apr 2024 15:02:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DA0A8330B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DA0A8330B;
	Thu,  4 Apr 2024 15:02:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7A8D41BF365
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 15:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67DF5402D7
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 15:02:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K4KpFURCVhOQ for <buildroot@lists.busybox.net>;
 Thu,  4 Apr 2024 15:02:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0F98640204
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F98640204
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0F98640204
 for <buildroot@buildroot.org>; Thu,  4 Apr 2024 15:02:48 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2d109e82bd0so11512511fa.3
 for <buildroot@buildroot.org>; Thu, 04 Apr 2024 08:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712242967; x=1712847767;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L+iEqPQaDRCtG5Z6MAfWRjtFdqPBY6GL05Q2bLXDHcM=;
 b=XlVxLkGL2G+A7moyrEMQDJD6bWqvxilG6Rw8Ey70QyIHoCnm1xFq4+/iz/sUCw9fxF
 aJGyDNmE9JPfqwDDpAbKvnd+ceET1g9W9KQCEl+f4iFmTij+13IbhqXY7kKgMWF+qF1P
 cPckVVq1xemgGbWqsSosE6zANmSXZ3v2ZWHCv9tF9N6tLu66WMuZlapHGx+C+aYG41HQ
 JR/FmisbB0KSExxOz7oLHAPbNdRQ+YycI4UsbMjUNspumm8KJw17DiQcqILsFd9tgtKX
 TdSB8WqZXfaiu2EU9T/3C7yynjSK/rKt+BfV3jxPkADGPcXR0/M7yW1da90b7excrCoE
 XN2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxQY94uKrwFNS57kuoDutxFaOERuJtllhhKIMBZ+YNzgfYRGC0BWpvbrPOX7F4I6AbX602B3zHuLSI/iadC50+Zej7fb8a1Q==
X-Gm-Message-State: AOJu0Yw8Ef/FdCjyxaX1CkYv6AZLVjVIWzqaXPz/C7NTAUR+FNEkckRa
 3gU4peOTyzb65V5vLDJv3YuYlepOpP+SmiLvJ6JZ8Wp+FQVEm3aJkw5CQ2xqg68Lc8dWEoz9UvY
 WNs8mWOon08MWFpDS4jo6FN3W+lj8IC+/
X-Google-Smtp-Source: AGHT+IFfaeKAFPPat7Ldf9i4JLI8NOp6O2y6uWyWNCRdMldBcYXcP6YkTwJJFDzMfG9fUHGZC6/2KrmMbCXNwkLML2A=
X-Received: by 2002:a2e:6818:0:b0:2d8:3438:5256 with SMTP id
 c24-20020a2e6818000000b002d834385256mr2163897lja.16.1712242966509; Thu, 04
 Apr 2024 08:02:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240403195403.1359007-1-romain.naour@smile.fr>
 <CAEyMn7YZB0q1p56F4ECOemAEbJReDUDLUuKBQyp6H016gCL7Fg@mail.gmail.com>
 <edac4a6e-c07a-48ce-9f9a-13928f8c898a@smile.fr>
 <D0BAEFA95U59.21GTZHTZRDS1A@walle.cc>
 <CAEyMn7Yoowh--mcB6Qn8rsGh+5AZphqmc-QNcp8oFJnb6g+HNg@mail.gmail.com>
 <161774c5-0326-4baf-921a-7332c677f9fc@smile.fr>
In-Reply-To: <161774c5-0326-4baf-921a-7332c677f9fc@smile.fr>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 4 Apr 2024 17:02:34 +0200
Message-ID: <CAEyMn7aquy4C7sMmU8OfRjXgN4h59HR=MBZA-BAsepGfuqaNbg@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712242967; x=1712847767; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L+iEqPQaDRCtG5Z6MAfWRjtFdqPBY6GL05Q2bLXDHcM=;
 b=FMYODvWe9ffVm/oOxtyfUtCV8m0KGQ7zxSNip2Fd/ocHveOymB9kLpYz6jIQO5cbEN
 jFEVa7ZpEhOrezIIMmZvMgtb+81WYe15SgmJUhL97rucnKuFVfUe2Sp1es0uRdXhSgQc
 DFoad+eAfyibJJQLVtq05nSwXCM6rS9KPfu8hTJ6kp19WofhwrWJ3bRVDn5VrKJ+mtEp
 TXE1fq5GWO2fL2dZYU/YHYt+JyGiXRDoo6V6qd0E0ibruN9cynyDVsfEDJI+pUk6cPnh
 JnTlCcM5mqn3YpyshZJ6QFkBJ7FBirX068DXqK5mVf8oykLYTpPRVjAr9apyiN6UAVpM
 AqbA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=FMYODvWe
Subject: Re: [Buildroot] [PATCH v11 00/17] Add support for AM62x-SK HS-FS
 devices
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
Cc: Michael Walle <michael@walle.cc>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUm9tYWluLAoKQW0gRG8uLCA0LiBBcHIuIDIwMjQgdW0gMTQ6MTQgVWhyIHNjaHJpZWIgUm9t
YWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+Ogo+Cj4gSGVsbG8gSGVpa28sIE1pY2hh
ZWwsIEFsbCwKPgo+IExlIDA0LzA0LzIwMjQgw6AgMTM6NDYsIEhlaWtvIFRoaWVyeSBhIMOpY3Jp
dCA6Cj4gPiBIaSwKPiA+Cj4gPiBBbSBEby4sIDQuIEFwci4gMjAyNCB1bSAxMzowNCBVaHIgc2No
cmllYiBNaWNoYWVsIFdhbGxlIDxtaWNoYWVsQHdhbGxlLmNjPjoKPiA+Pgo+ID4+IEhpIFJvbWFp
biwKPiA+Pgo+ID4+IHRoYW5rcyBmb3Igd29ya2luZyBvbiB0aGUgc2VyaWVzIQo+ID4+Cj4gPj4+
PiBJIGtub3cgdGhlcmUgYXJlIHNvbWUgZGlzY3Vzc2lvbnMgb25nb2luZyBhYm91dCB0aGUgaGFu
ZGxpbmcgb2YgdGhlCj4gPj4+PiBCUjJfUEFDS0FHRV9USV9LM19TRUNUWVBFX1ggYW5kIEJSMl9Q
QUNLQUdFX1RJX0szX1NPQ19YLiBJIHNlZSB0aGF0Cj4gPj4+PiB0aGVzZSB2YXJpYWJsZXMgYXJl
IG9ubHkgdXNlZCBmb3Igc2VsZWN0aW5nIHRoZSByaWdodCB2YWx1ZSBmb3IKPiA+Pj4+IEJSMl9U
QVJHRVRfVElfSzNfUjVfTE9BREVSX1RJQk9PVDNfQklOLiAgU2luY2Ugd2UgY2FuIHNldCB0aGlz
IHZhbHVlCj4gPj4+PiBkaXJlY3RseSBmb3IgZWFjaCBkZWZjb25maWcgSSB0aGluayB3ZSBjYW4g
Z2V0IHJpZCBvZiBhbGwgdGhpcyBzdHVmZi4KPiA+Pj4+IE5ldmVydGhlbGVzcyB0aGVyZSBpcyBh
IHByb2JsZW0gd2l0aCB0aGUKPiA+Pj4+IEJSMl9UQVJHRVRfVElfSzNfUjVfTE9BREVSX1RJQk9P
VDNfQklOIHNpbmNlIGl0IGlzIG5vdCBwb3NzaWJsZSB0bwo+ID4+Pj4gc2VsZWN0IGEgdmFsdWUg
aW4gbWVudWNvbmZpZyBiZWNhdXNlIG9mIHRoZSBtaXNzaW5nIGhlbHAgdGV4dC4KPiA+Pj4KPiA+
Pj4gSXQgc2VlbXMgZWFzaWVyIHRvIHNlbGVjdCB0aGUgU29DIHZhcmlhbnQgYW5kIHRoZSBTZWN0
eXBlIHVzaW5nIHR3byBib29sZWFuIHRoYW4KPiA+Pj4gbGV0dGluZyB0aGUgdXNlciB0byBwcm92
aWRlIHRoZSByaWdodCBmaWxlIG5hbWUgaW4KPiA+Pj4gQlIyX1RBUkdFVF9USV9LM19SNV9MT0FE
RVJfVElCT09UM19CSU4gZnJvbSB0aGUgZGVmY29uZmlnLgo+ID4+Cj4gPj4gRG9lc24ndCBzZWVt
IGVhc2llciB0byBtZSB0byB1cGRhdGUgdGhlIHBhY2thZ2UgZWFjaCB0aW1lIGEgbmV3IFNvQwo+
ID4+IGlzIGludHJvZHVjZWQuIEJlc2lkZXMuLgo+ID4+Cj4gPj4+IElzIGEgdXNlIGNhc2Ugd2hl
cmUgdGhlIHdlIG11c3QgdXNlIGEgY3VzdG9tIHRpYm9vdDMqLmJpbiBuYW1lID8KPiA+Pgo+ID4+
IC4ueW91IGFyZSBsaXRlcmFsbHkgZW5jb2RpbmcgdGhlIGJvYXJkIG5hbWUgIi1ldm0iIG9mIHRo
ZSBUSSBFVk0KPiA+PiBpbnRvIHRoYXQgbmFtZS4gU28gaXQgaXMgdW51c2FibGUgZm9yIGFueSBv
dGhlciBib2FyZC4gRS5nLiAgdGhlcmUKPiA+PiBpcyBhbHJlYWR5IHRoaXMgYm9hcmQgdXBzdHJl
YW06Cj4gPj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vdS1ib290L3YyMDI0LjA0L3NvdXJj
ZS9hcmNoL2FybS9kdHMvazMtYW02MjUtcGh5Y29yZS1zb20tYmlubWFuLmR0c2kjTDE0Cj4gPj4K
PiA+PiBBcyBJIHNhaWQsIHRoYXQgZmlsZW5hbWUgaXMganVzdCBhIGZyZWUgZm9ybSB0eXBlIG9m
IGZpbGVuYW1lIGFuZAo+ID4+IHRoZSBkdHNpIGF1dGhvciBpcyBmcmVlIHRvIGNob29zZSBpdHMg
bmFtaW5nLgo+ID4+Cj4gPj4gSU1ITyB3aXRoIHRoZSByZW1vdmFsIG9mIHRoZSBpbWFnZSBnZW4g
cGFja2FnZSwgdGhlcmUgaXMgbm8gbmVlZAo+ID4+IGZvciB0aGUgU09DIGFuZCBTRUNUWVBFIGNo
b2ljZSBhbnltb3JlLCBhcyBpdCBpcyBqdXN0IHVzZWQgdG8KPiA+PiBhc3NlbWJsZSB0aGUgYm9h
cmQgc3BlY2lmaWMgZmlsZW5hbWUgd2hpY2ggd2lsbCBlbmQgdXAgYmVpbmcgdGhlCj4gPj4gdGli
b290My5iaW4uIEJ1dCB1LWJvb3QgaXMgYWxyZWFkeSBjaG9vc2luZyB0aGUgZGVmYXVsdCB0aWJv
b3QzLmJpbgo+ID4+IGZvciB5b3U6Cj4gPj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vdS1i
b290L3YyMDI0LjA0L3NvdXJjZS9hcmNoL2FybS9kdHMvazMtYW02MjUtcGh5Y29yZS1zb20tYmlu
bWFuLmR0c2kjTDYwCj4gPj4KPiA+PiBTb3JyeSBmb3IgYmVpbmcgc28gcGVyc2lzdGVudCwgSSBy
ZWFsbHkgZG9uJ3QgdGhpbmsgdGhpcyBpcyB0aGUKPiA+PiBjb3JyZWN0IGFwcHJvYWNoLiBKdXN0
IGRlZmF1bHRpbmcgdGhlIGJpbmFyeSBuYW1lIHRvIHRpYm9vdDMuYmluCj4gPj4gd2lsbCBwcm9i
YWJseSBoYW5kbGUgbW9zdCBjYXNlcyBhbmQgZm9yIHRoZSBvZGRiYWxscywganVzdCBzZXQgdGhl
Cj4gPj4gZmlsZW5hbWUgaW4gdGhlIGRlZmNvbmZpZy4KPiA+Cj4gPiBNaWNoYWVsIGlzIHJpZ2h0
IGF0IHRoaXMgcG9pbnQuIFRoaXMgb3B0aW9uIG9ubHkgY2FuIHNlbGVjdCB0aGUgVEkgZXZtCj4g
PiBzcGVjaWZpYyB0aWJvb3QzIGZpbGVzIGRlZmluZWQgaW4gdGhlIFUtQm9vdCBiaW5tYW4gZHRz
aSBmaWxlcy4gSSBqdXN0Cj4gPiBjaGVja2VkIGFuZCBpbiBVLUJvb3QgYXJlIDMgb3RoZXIgYm9h
cmRzIHRoYXQgdXNlIGRpZmZlcmVudCBuYW1lcwo+ID4gdGhhbiB0aGUgb25lIHVzZWQgYnkgVEku
IEFuZCBhdCBsZWFzdCBvbmUgb3RoZXIgd2lsbCBjb21lIGluIHRoZSBuZWFyIGZ1dHVyZS4KPgo+
IEluZGVlZCwgeW91J3JlIHJpZ2h0Lgo+Cj4gTGFzdCB0aW1lIEkndmUgY2hlY2tlZCAtZXZtIHdh
cyB1c2VkIG9uIG1vc3QgKEkgdGhvdWdodCBvbiBhbGwpIGJvYXJkcy4KPgo+IFNlZSB0aGUgZmls
ZSBrMy1qNzIxZS1iaW5tYW4uZHRzaSBzaGFyZWQgYmV0d2VlbiB0aGUgcmVhbCBUSSBFVk0gYW5k
IHRoZQo+IHNrLXRkYTRWTSBib2FyZHMuCj4KPiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS91
LWJvb3QvbGF0ZXN0L3NvdXJjZS9hcmNoL2FybS9kdHMvazMtajcyMWUtYmlubWFuLmR0c2kKPgo+
IEV2ZW4gdGhlIGJlYXBsZXBsYXkgdXNlcyB0aGUgLWV2bSBzdWZmaXg6Cj4KPiBodHRwczovL2Vs
aXhpci5ib290bGluLmNvbS91LWJvb3QvbGF0ZXN0L3NvdXJjZS9hcmNoL2FybS9kdHMvazMtYW02
MjUtcjUtYmVhZ2xlcGxheS5kdHMjTDgxCj4KPiBJIG1pc3NlZCB0aGUgdmVyZGluIGV4YW1wbGVz
Ogo+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL3UtYm9vdC9sYXRlc3Qvc291cmNlL2FyY2gv
YXJtL2R0cy9rMy1hbTYyNS12ZXJkaW4td2lmaS1kZXYtYmlubWFuLmR0c2kjTDEyCj4KPiBJbiBv
dGhlciBoYW5kLCB3ZSBzaG91bGQgbm90IHJlbHkgb24gdGhlIHRpYm9vdDMuYmluIHN5bWxpbmsg
c2luY2UgaXQgbGlua3MgdGhlCj4gLWdwLCAtaHMtZnMsIC1ocyB0aWJvb3QzIGJpbmFyeSBhY2Nv
cmRpbmcgdG8gd2hlcmUgInN5bWxpbmsgPSAidGlib290My5iaW4iOyIKPiBsaW5lIGlzIGxvY2F0
ZWQgaW4gazMtKmJpbm1hbi5kdHNpLgo+Cj4gU28sIGluc3RlYWQgb2YgQlIyX1RBUkdFVF9USV9L
M19SNV9MT0FERVJfVElCT09UM19CSU4geW91IHN1Z2dlc3QgdG8gbGV0IHRoZQo+IHVzZXIgdG8g
ZGVmaW5lIGEgY3VzdG9tIHRpYm9vdDMgYmluYXJ5IG5hbWUgb3IgaWYgZW1wdHkgdXNlIHRoZSBk
ZWZhdWx0IG9uZS4KPgo+IFdlIHNob3VsZCBhbHNvIGRvIHNvbWV0aGluZyBzaW1pbGFyIGZvciBC
UjJfVEFSR0VUX1RJX0szX1I1X0xPQURFUl9TV1NGV19JVEIKCklmIHlvdSB3YW50IEkgY2FuIHBy
b3ZpZGUgdGhlIHBhdGNoZXMgdG8geW91IHRvIHJlbW92ZSBhbGwgdGhhdCBzdHVmZi4KV2hhdCBk
byB5b3UgdGhpbms/IE9yIGluIGNhc2UgdGhlIHNlcmllcyB3aWxsIGJlIG1lcmdlZCBiZWZvcmUg
SSBjYW4KZG8gdGhhdCBhZnRlcndhcmRzLgoKSSB0aGluayB3aXRoIHJlbW92aW5nIHRoYXQgd2Ug
YWxzbyBjb3VsZCByZW1vdmUgdGhlICJwYWNrYWdlL3RpLWszIgpwYWNrYWdlLiBUaGUgb25seSB0
aGluZyB0aGF0IHRoZW4gc3RpbGwgbmVlZHMgc29tZSBpbmZvIGZyb20gaGVyZSBpczoKCjI3NCBp
ZmVxICgkKEJSMl9UQVJHRVRfVUJPT1RfVVNFX0JJTk1BTikkKEJSMl9QQUNLQUdFX1RJX0szKSx5
eSkKMjc1IFVCT09UX0RFUEVOREVOQ0lFUyArPSB0aS1rMy1ib290LWZpcm13YXJlCjI3NiBlbmRp
ZgoKQW5kIHRoaXMgY291bGQgYmUgY2hhbmdlZCBieSBhZGRpbmcgQlIyX1RBUkdFVF9VQk9PVF9O
RUVEU19USV9LM19CT09UX0ZJUk1XQVJFLgoKV2hhdCBkbyB5b3UgdGhpbms/CgoKLS0KSGVpa28K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
