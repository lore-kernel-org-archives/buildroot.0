Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B6EC4332F
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 21:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E7F660AAE;
	Sat,  5 Nov 2022 21:51:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E7F660AAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d_dxJpwZsnJ9; Sat,  5 Nov 2022 21:51:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E53C5607F6;
	Sat,  5 Nov 2022 21:51:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E53C5607F6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4F2961BF283
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 21:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22123405AE
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 21:51:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22123405AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KTOZlRg17RcW for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 21:51:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 545B140510
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 545B140510
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 21:51:47 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9B14160002;
 Sat,  5 Nov 2022 21:51:44 +0000 (UTC)
Date: Sat, 5 Nov 2022 22:51:43 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221105225143.0c1ab11e@windsurf>
In-Reply-To: <20221105211639.349885-1-fontaine.fabrice@gmail.com>
References: <20221105211639.349885-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667685105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tixTdkst06+VAglncHxEdXT5Yxx7EBDPY3V09daFaKA=;
 b=Vl+94CHQNoyvby8bNT50ox5CxLq8F7DmboXowwl1FXjIzP9u04+M3tiwPO08/jNI4xGo+c
 ILOkEdO2/9/eAlfiRLY56l3uyJePSPymFaCYCMdh5f9o2erQFRy1nFWLD1w/qOK4aQIJZy
 /GNYpV3JFoblgQaQ7TRjNrNDdrlYCZZ7yubtRl0g6KpZQS2y1V/3xksO65Ou6LLte2Ce+K
 NfYZFt91SNcuw3IBnuTHwH1HmyDyv1BiJFKs0u/JlNDYdCT2atYE75le03nZMonRr8Ijc3
 9GsCm51DScK+0WoIrHcpbICdYzd0uHM8JBhKb4xAmZTXK9xhAtkBkhYh/OdBrw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Vl+94CHQ
Subject: Re: [Buildroot] [PATCH 1/1] package/bdwgc: needs MMU
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Pedro Aguilar <paguilar@paguilar.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU2F0LCAgNSBOb3YgMjAyMiAyMjoxNjozOSArMDEwMApGYWJyaWNlIEZvbnRhaW5lIDxmb250
YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4gd3JvdGU6Cgo+IEZpeCB0aGUgZm9sbG93aW5nIGJ1aWxk
IGZhaWx1cmUgcmFpc2Ugc2luY2UgYnVtcCB0byB2ZXJzaW9uIDguMi4yIGluCj4gY29tbWl0IGQ3
NjE5NjgyNTUyZGQzNGY0OTllOWYxN2IwMjM0YWY1M2RhNzQzZWMgYW5kCj4gaHR0cHM6Ly9naXRo
dWIuY29tL2l2bWFpL2Jkd2djL2NvbW1pdC85ZDhjMTk2MjY4MDY4YmI3NWY4NmRlZTBiYTc1Y2Nk
MDI0NTMxZTcyOgo+IAo+IG9zX2RlcC5jOiBJbiBmdW5jdGlvbiAnYmxvY2tfdW5tYXBfaW5uZXIn
Ogo+IG9zX2RlcC5jOjI2Njg6MTc6IHdhcm5pbmc6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1
bmN0aW9uICdtYWR2aXNlJzsgZGlkIHlvdSBtZWFuICdyYWlzZSc/IFstV2ltcGxpY2l0LWZ1bmN0
aW9uLWRlY2xhcmF0aW9uXQo+ICAyNjY4IHwgICAgICAgICAgICAgaWYgKG1hZHZpc2Uoc3RhcnRf
YWRkciwgbGVuLCBNQURWX0RPTlRORUVEKSA9PSAtMSkKPiAgICAgICB8ICAgICAgICAgICAgICAg
ICBefn5+fn5+Cj4gICAgICAgfCAgICAgICAgICAgICAgICAgcmFpc2UKPiAKPiBGaXhlczoKPiAg
LSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy8yYjk5MjRjYjhjMzZhNzVl
MWNhN2FlZmU4M2U5NWRjMTFjMTBkZWQ2Cj4gCj4gU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250
YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+CgpJIGhlc2l0YXRlZCBhIGJpdCwgYmVj
YXVzZSBub3JtYWxseSBtYWR2aXNlKCkgaXMgb25seSB0byBwcm92aWRlIGFuCmFkdmljZSB0byB0
aGUgT1MsIGFuZCB0aGVyZWZvcmUgc2hvdWxkIG5vdCBiZSBzdHJpY3RseSBtYW5kYXRvcnkuCkhv
d2V2ZXIsIE1BRFZfRE9OVE5FRUQgY2hhbmdlcyB0aGUgc2VtYW50aWMgb2YgZnV0dXJlIG1lbW9y
eSBhY2Nlc3NlczoKCiAgICAgICBNQURWX0RPTlRORUVECiAgICAgICAgICAgICAgRG8gbm90IGV4
cGVjdCBhY2Nlc3MgaW4gdGhlIG5lYXIgZnV0dXJlLiAgKEZvciB0aGUgdGltZSBiZWluZywgdGhl
IGFwcGxpY2F0aW9uIGlzCiAgICAgICAgICAgICAgZmluaXNoZWQgd2l0aCB0aGUgZ2l2ZW4gcmFu
Z2UsIHNvIHRoZSBrZXJuZWwgY2FuIGZyZWUgcmVzb3VyY2VzICBhc3NvY2lhdGVkICB3aXRoCiAg
ICAgICAgICAgICAgaXQuKQoKICAgICAgICAgICAgICBBZnRlciBhIHN1Y2Nlc3NmdWwgTUFEVl9E
T05UTkVFRCBvcGVyYXRpb24sIHRoZSBzZW1hbnRpY3Mgb2YgbWVtb3J5IGFjY2VzcyBpbiB0aGUK
ICAgICAgICAgICAgICBzcGVjaWZpZWQgcmVnaW9uIGFyZSBjaGFuZ2VkOiBzdWJzZXF1ZW50IGFj
Y2Vzc2VzIG9mIHBhZ2VzIGluIHRoZSByYW5nZSB3aWxsIHN1Y+KAkAogICAgICAgICAgICAgIGNl
ZWQsICBidXQgd2lsbCByZXN1bHQgaW4gZWl0aGVyIHJlcG9wdWxhdGluZyB0aGUgbWVtb3J5IGNv
bnRlbnRzIGZyb20gdGhlIHVwLXRvLQogICAgICAgICAgICAgIGRhdGUgY29udGVudHMgb2YgdGhl
IHVuZGVybHlpbmcgbWFwcGVkIGZpbGUgKGZvciAgc2hhcmVkICBmaWxlICBtYXBwaW5ncywgIHNo
YXJlZAogICAgICAgICAgICAgIGFub255bW91cyAgbWFwcGluZ3MsICBhbmQgIHNobWVtLWJhc2Vk
ICB0ZWNobmlxdWVzIHN1Y2ggYXMgU3lzdGVtIFYgc2hhcmVkIG1lbW9yeQogICAgICAgICAgICAg
IHNlZ21lbnRzKSBvciB6ZXJvLWZpbGwtb24tZGVtYW5kIHBhZ2VzIGZvciBhbm9ueW1vdXMgcHJp
dmF0ZSBtYXBwaW5ncy4KCiAgICAgICAgICAgICAgTm90ZSB0aGF0LCB3aGVuIGFwcGxpZWQgdG8g
c2hhcmVkIG1hcHBpbmdzLCBNQURWX0RPTlRORUVEIG1pZ2h0IG5vdCBsZWFkIHRvIGltbWXigJAK
ICAgICAgICAgICAgICBkaWF0ZSBmcmVlaW5nIG9mIHRoZSBwYWdlcyBpbiB0aGUgcmFuZ2UuICBU
aGUga2VybmVsIGlzIGZyZWUgdG8gZGVsYXkgZnJlZWluZyB0aGUKICAgICAgICAgICAgICBwYWdl
cyB1bnRpbCBhbiBhcHByb3ByaWF0ZSBtb21lbnQuICBUaGUgcmVzaWRlbnQgc2V0IHNpemUgKFJT
UykgIG9mICB0aGUgIGNhbGxpbmcKICAgICAgICAgICAgICBwcm9jZXNzIHdpbGwgYmUgaW1tZWRp
YXRlbHkgcmVkdWNlZCBob3dldmVyLgoKICAgICAgICAgICAgICBNQURWX0RPTlRORUVEICBjYW5u
b3QgIGJlICBhcHBsaWVkICB0byBsb2NrZWQgcGFnZXMsIEh1Z2UgVExCIHBhZ2VzLCBvciBWTV9Q
Rk5NQVAKICAgICAgICAgICAgICBwYWdlcy4gIChQYWdlcyBtYXJrZWQgd2l0aCB0aGUga2VybmVs
LWludGVybmFsIFZNX1BGTk1BUCBmbGFnIGFyZSBzcGVjaWFsICBtZW1vcnkKICAgICAgICAgICAg
ICBhcmVhcyB0aGF0IGFyZSBub3QgbWFuYWdlZCBieSB0aGUgdmlydHVhbCBtZW1vcnkgc3Vic3lz
dGVtLiAgU3VjaCBwYWdlcyBhcmUgdHlwaeKAkAogICAgICAgICAgICAgIGNhbGx5IGNyZWF0ZWQg
YnkgZGV2aWNlIGRyaXZlcnMgdGhhdCBtYXAgdGhlIHBhZ2VzIGludG8gdXNlciBzcGFjZS4pCgpB
bmQgYWxzbyB0aGUgZnVuY3Rpb24gaW4gYmRnd2MgdGhhdCB1c2VzIG1hZHZpc2UoKSBpcyBhIGNv
bnZvbHV0ZWQgbWVzcwpvZiAjaWZkZWYtZXJ5LCBzbyBJIGRpZG4ndCB3YW50IHRvIHRha2UgYW55
IHJpc2sgdGhlcmUsIGFuZCBJIGRvbid0CnJlYWxseSBjYXJlIGFib3V0IGJkd2djIG9uIG5vTU1V
IHRhcmdldHMuIFNvIEkgYXBwbGllZCB5b3VyIHBhdGNoLgoKSG93ZXZlciwgeW91IGZvcmdvdCB0
byBwcm9wYWdhdGUgdGhpcyBkZXBlbmRlbmN5IHRvIHBhY2thZ2UvcG9rZSwgd2hpY2gKYWxzbyBz
ZWxlY3RzIGJkd2djLgoKQXBwbGllZCB0byBtYXN0ZXIgd2l0aCB0aGlzIGZpeC4gVGhhbmtzIQoK
VGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCkVt
YmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCmh0dHBzOi8v
Ym9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
