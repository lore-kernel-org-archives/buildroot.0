Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5273CC76196
	for <buildroot@archiver.kernel.org>; Tue, 11 Apr 2023 14:42:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9445841BAA;
	Tue, 11 Apr 2023 14:42:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9445841BAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wXpg0wZ4eZVt; Tue, 11 Apr 2023 14:42:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D14341B9C;
	Tue, 11 Apr 2023 14:42:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D14341B9C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1E7411C3C1C
 for <buildroot@lists.busybox.net>; Tue, 11 Apr 2023 14:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2C4E41B9C
 for <buildroot@lists.busybox.net>; Tue, 11 Apr 2023 14:41:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2C4E41B9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nfmNmc8BKSUw for <buildroot@lists.busybox.net>;
 Tue, 11 Apr 2023 14:41:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA5CB41B91
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com
 [IPv6:2607:f8b0:4864:20::e2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DA5CB41B91
 for <buildroot@buildroot.org>; Tue, 11 Apr 2023 14:41:56 +0000 (UTC)
Received: by mail-vs1-xe2b.google.com with SMTP id k11so4569865vsv.8
 for <buildroot@buildroot.org>; Tue, 11 Apr 2023 07:41:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681224115;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OJlAgkKQZaiY/EmKqSQjCVO1uV8cjeNI78ZukF6EkDQ=;
 b=xGQrY5ro/2PZmJvZfhQV6Scv9L0bb3f2k37FNmDELZ0meGTNALFB05eIvvCMvGLSR3
 03NDozgRSrUam1yR8V3c/hevUFLF6yz6Fk8DEsOlLfgd4AFa2kA/tEDlIPGUUCylF5Dv
 SUsa2a69jiGvEiEARRib6aeDItRvbD/qYKh4OQABbwrzjq8LcWr18YCqyGgTLD2IT/Gb
 iw+aP0Ps1FZeD72IFmoEKifZ6wNR4MMGFy+korK5sQlJ+3WCMg2stTFxXq/oOHolkqmK
 D0z3abTrHrNotPRQEl6nJUQPiBvI9p48BAV0XXpsRFH1NrEvBFg3y0kNGtUsyKvp4yua
 nbow==
X-Gm-Message-State: AAQBX9fby1xOa2vLx78M/n4A9b4XjwC9XncOjOKxBBmMaSQZgbX8uYMc
 y4CW1+2xyTddBC/rd1B8D9prf1z5X96k/3Zuvcw=
X-Google-Smtp-Source: AKy350bjFzbw9vcTM4Jz1/bYOV71cY8lC5FO7l1xcAfavWz+CTDb6ExoIauVaz9/eH3875xXm+vhVrfTdTgtBryZ5X8=
X-Received: by 2002:a67:e08b:0:b0:426:da10:240b with SMTP id
 f11-20020a67e08b000000b00426da10240bmr2052924vsl.7.1681224115378; Tue, 11 Apr
 2023 07:41:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230409000929.391071-1-unixmania@gmail.com>
 <2e28cd63-1af2-cfc0-fe46-32ec6d6954df@mind.be>
In-Reply-To: <2e28cd63-1af2-cfc0-fe46-32ec6d6954df@mind.be>
From: Carlos Santos <unixmania@gmail.com>
Date: Tue, 11 Apr 2023 11:41:44 -0300
Message-ID: <CAJ4jsadr2aqVUWfO79++RF8spamx79r4pY+umDaL5rmEraYGZA@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681224115;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OJlAgkKQZaiY/EmKqSQjCVO1uV8cjeNI78ZukF6EkDQ=;
 b=MeGZEkfS2Tgjfm4cGznVm0JIfKWTcPD7VQLt4orOuy4fVdsoAH7RJSKwmhxBc9/HWu
 JxHtIwQ0TLyQmY4K8DMAQZ+22qsY6lWhb+CKtFmUnsFGqLKFUPPOlclMTHe0t3xB792Y
 6qk6nsuNHSo/FcpmBl9a0m9tT0jOW9tryqBKecVOi0Rh7X4rwcIe1x0n3pKu4taANTbP
 agVZzQSf4V9GtMF12ZBvA8mQxhS4uLCP2CK2oLfGtrvJnyGyc4zU1llcl9rmZLNF5sMH
 adOZIRNP+KNYGBZa6EE0cCIRE2UnLC7MEtuuQnsIYPmrC1CI3G8mZL69RM08/iJswWSX
 +kLg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=MeGZEkfS
Subject: Re: [Buildroot] [PATCH] package/qemu: install keyboard maps only if
 necessary
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCBBcHIgMTAsIDIwMjMgYXQgMTE6NTfigK9BTSBBcm5vdXQgVmFuZGVjYXBwZWxsZSA8
YXJub3V0QG1pbmQuYmU+IHdyb3RlOgo+Cj4gICBIaSBDYXJsb3MsCj4KPiBPbiAwOS8wNC8yMDIz
IDAyOjA5LCB1bml4bWFuaWFAZ21haWwuY29tIHdyb3RlOgo+ID4gRnJvbTogQ2FybG9zIFNhbnRv
cyA8dW5peG1hbmlhQGdtYWlsLmNvbT4KPiA+Cj4gPiBUaGV5IGFyZSByZXF1aXJlZCBvbmx5IGZv
ciBzeXN0ZW0gZW11bGF0aW9uLCBzbyBwdWxsIGEgcGF0Y2ggYWxyZWFkeQo+ID4gcmV2aWV3ZCB1
cHN0cmVhbVsxLDJdIHRoYXQgbWFrZXMgdGhlIGluc3RhbGxhdGlvbiBjb25kaXRpb25hbC4KPiA+
Cj4gPiAxLiBodHRwczovL2xpc3RzLmdudS5vcmcvYXJjaGl2ZS9odG1sL3FlbXUtZGV2ZWwvMjAy
My0wMy9tc2cwNjQyOC5odG1sCj4gPiAyLiBodHRwczovL2xpc3RzLmdudS5vcmcvYXJjaGl2ZS9o
dG1sL3FlbXUtZGV2ZWwvMjAyMy0wMy9tc2cwNjQzOC5odG1sCj4gPgo+ID4gU2lnbmVkLW9mZi1i
eTogQ2FybG9zIFNhbnRvcyA8dW5peG1hbmlhQGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gICAuLi50
YWxsLWtleWJvYXJkLW1hcHMtb25seS1pZi1uZWNlc3NhcnkucGF0Y2ggfCAzNiArKysrKysrKysr
KysrKysrKysrCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspCj4gPiAgIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3FlbXUvMDAwNC1tZXNvbi1pbnN0YWxsLWtleWJvYXJk
LW1hcHMtb25seS1pZi1uZWNlc3NhcnkucGF0Y2gKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9xZW11LzAwMDQtbWVzb24taW5zdGFsbC1rZXlib2FyZC1tYXBzLW9ubHktaWYtbmVjZXNzYXJ5
LnBhdGNoIGIvcGFja2FnZS9xZW11LzAwMDQtbWVzb24taW5zdGFsbC1rZXlib2FyZC1tYXBzLW9u
bHktaWYtbmVjZXNzYXJ5LnBhdGNoCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXgg
MDAwMDAwMDAwMC4uOTFlYTFlODZjOQo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvcGFja2Fn
ZS9xZW11LzAwMDQtbWVzb24taW5zdGFsbC1rZXlib2FyZC1tYXBzLW9ubHktaWYtbmVjZXNzYXJ5
LnBhdGNoCj4gPiBAQCAtMCwwICsxLDM2IEBACj4gPiArRnJvbSA5ZDliNzRmODA2ZjVkYmNhNTNk
ZjY2MzBjMWEwNTkxZWFlZGQ0NTAwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+ID4gK0Zyb206
IENhcmxvcyBTYW50b3MgPGNhc2FudG9zQHJlZGhhdC5jb20+Cj4gPiArRGF0ZTogU3VuLCAxIEph
biAyMDIzIDIxOjAwOjU3IC0wMzAwCj4gPiArU3ViamVjdDogW1BBVENIXSBtZXNvbjogaW5zdGFs
bCBrZXlib2FyZCBtYXBzIG9ubHkgaWYgbmVjZXNzYXJ5Cj4gPiArCj4gPiArVGhleSBhcmUgcmVx
dWlyZWQgb25seSBmb3Igc3lzdGVtIGVtdWxhdGlvbiAoaS5lLiBoYXZlX3N5c3RlbSBpcyB0cnVl
KS4KPiA+ICsKPiA+ICtTaWduZWQtb2ZmLWJ5OiBDYXJsb3MgU2FudG9zIDxjYXNhbnRvc0ByZWRo
YXQuY29tPgo+Cj4gICBXZSBuZWVkIHRoZSBTb0IgZm9yIHVuaXhtYW5pYUBnbWFpbC5jb20gb24g
dGhpcy4gVGhlIFNvQiBpcyBhIHNob3J0IHdheSBmb3IKPiB5b3UgKHRoZSBwcml2YXRlIHBlcnNv
biwgbm90IHRoZSBSZWRoYXQgZW1wbG95ZWUpIHRvIGFzc2VydCB0aGF0IHlvdSBhcmUKPiBlbnRp
dGxlZCB0byBjb250cmlidXRlIHRoZSBwYXRjaCB1bmRlciBxZW11J3MgbGljZW5zZS4KClRob3Vz
YW5kcyBvZiBSZWQgSGF0IGVtcGxveWVlcyBjb250cmlidXRlIHRvIGZyZWUgc29mdHdhcmUgcHJv
amVjdHMKdXNpbmcgdGhlaXIgd29yayBlbWFpbCBhZGRyZXNzZXMuIFRoZXJlIGlzIG5vIGNvbnRy
YWRpY3Rpb24gYmV0d2VlbgpwZXJzb25hbCBhbmQgZW1wbG95ZWUgYWN0aXZpdHkgcmVnYXJkaW5n
IHRoaXMuIENoZWNrIHRoaXMgZG9jdW1lbnQgZm9yCmFkZGl0aW9uYWwgaW5mb3JtYXRpb246Cgog
ICBSZWQgSGF04oCZcyBvcGVuIHNvdXJjZSBwYXJ0aWNpcGF0aW9uIGd1aWRlbGluZXMKICAgaHR0
cHM6Ly93d3cucmVkaGF0LmNvbS9lbi9yZXNvdXJjZXMvb3Blbi1zb3VyY2UtcGFydGljaXBhdGlv
bi1ndWlkZWxpbmVzLW92ZXJ2aWV3Cgo+ICAgQWxzbywgcGxlYXNlIGxpbmsgdG8gdGhlIHVwc3Ry
ZWFtIHBhdGNod29yayBlbnRyeSBoZXJlLCBsaWtlIHRoaXM6Cj4KPiBVcHN0cmVhbToKPiBodHRw
czovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvcWVtdS1kZXZlbC9wYXRjaC8yMDIzMDMy
NzE3MjE0Ny4xOTY2MDctMS1jYXNhbnRvc0ByZWRoYXQuY29tLwoKVGhpcyBtYWtlcyBzZW5zZS4g
SSB3aWxsIHVwZGF0ZSB0aGUgY29tbWl0IG1lc3NhZ2UgdG8gZml4IHRoZSBsaW5rLgoKLS0gCkNh
cmxvcyBTYW50b3MgPHVuaXhtYW5pYUBnbWFpbC5jb20+Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
