Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EFC4C10F07
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 12:56:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F613400DC;
	Mon,  4 Dec 2023 12:56:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F613400DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bMqUNpxlu4w5; Mon,  4 Dec 2023 12:56:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 87C80401F1;
	Mon,  4 Dec 2023 12:56:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87C80401F1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 04A661BF349
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 12:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1AFE8140C
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 12:55:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1AFE8140C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fR5yTPmwdNjY for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 12:55:57 +0000 (UTC)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC0EC8139F
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 12:55:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC0EC8139F
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 6C579C0529
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 12:46:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8B84B40003;
 Mon,  4 Dec 2023 12:46:01 +0000 (UTC)
Date: Mon, 4 Dec 2023 13:46:00 +0100
To: Brandon Maier <brandon.maier@collins.com>
Message-ID: <20231204134600.57f50b6e@bootlin.com>
In-Reply-To: <20231201170552.18210-1-brandon.maier@collins.com>
References: <20231127224139.35969-1-brandon.maier@collins.com>
 <20231201170552.18210-1-brandon.maier@collins.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: herve.codina@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1701693963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6SbzwiWJft68vjE8/6kkQUtmK1wa1bz1WIEJ/ZIAEpw=;
 b=j41wvefu+n4hneh+qnXUAwSYPjqfpGKUXGhjuQ2Rb5yWlzK9sK1/FCCd/YlDFX1AyG6VsU
 99+/Xt/0sQ5wM2DisYO+jko8yag5r9wuCGReF2lpgeSylTVICzFhT5uHCN/TkEigWqjfyq
 RZxiTNgGkdTDZ6vmSDZoVz6Ua40zvUiob1edjhx6dODhQeZyjtt230G6V9bf+Colwd/MT3
 IPSoxLwh5NkTv7ewLCiJUAEbjTx6zFRFaSsU9tUGOYQt9QUycEgGg21tOAS3zZbE/akTJp
 UfAqB71L0R/Rc5LeBFrgM4QycEZfQIHF6P+r4enqEaD3EN2lhHSan+SybimbVA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=j41wvefu
Subject: Re: [Buildroot] [PATCH v2 1/1] ppd-merge: speed up per-package-rsync
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
From: Herve Codina via buildroot <buildroot@buildroot.org>
Reply-To: Herve Codina <herve.codina@bootlin.com>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQnJhbmRvbiwKCk9uIEZyaSwgIDEgRGVjIDIwMjMgMTc6MDU6NTIgKzAwMDAKQnJhbmRvbiBN
YWllciA8YnJhbmRvbi5tYWllckBjb2xsaW5zLmNvbT4gd3JvdGU6Cgo+IFRoZSBwZXItcGFja2Fn
ZS1yc3luYyBzdGFnZSBjYW4gYWRkIGEgc2lnbmlmaWNhbnQgYW1vdW50IG9mIHRpbWUgdG8KPiBi
dWlsZHMuIFRoZXkgY2FuIGFsc28gYmUgYW5ub3lpbmcgYXMgdGhlIHRhcmdldC1maW5hbGl6ZSBh
bmQKPiBob3N0LWZpbmFsaXplIHRhcmdldHMgYXJlIHRoZSBzbG93ZXN0IGFuZCBydW4gb24gZXZl
cnkgYG1ha2UgYWxsYCwgd2hpY2gKPiBpcyB1c2VkIGZyZXF1ZW50bHkgZm9yIHBhcnRpYWwgcmVi
dWlsZHMuCj4gCj4gVGhlIHBlci1wYWNrYWdlLXJzeW5jIGlzIHNsb3cgYmVjYXVzZSBpdCBsYXVu
Y2hlcyBhIG5ldyByc3luYyBmb3IgZWFjaAo+IHNvdXJjZSB0cmVlLCBhbmQgZWFjaCByc3luYyBt
dXN0IHJlc2NhbiB0aGUgZGVzdGluYXRpb24gZGlyZWN0b3J5IGFuZAo+IHBvdGVudGlhbGx5IG92
ZXJ3cml0ZSBmaWxlcyBtdWx0aXBsZSB0aW1lcy4gV2UgY2FuIGluc3RlYWQgbWVyZ2UgYWxsIHRo
ZQo+IHJzeW5jIGNhbGxzIGRvd24gaW50byBvbmUgY2FsbCwgYW5kIHJzeW5jIGlzIHNtYXJ0ZXIg
YWJvdXQgc2Nhbm5pbmcgYWxsCj4gdGhlIHNvdXJjZSBkaXJlY3RvcmllcyBhbmQgb25seSBjb3B5
aW5nIG92ZXIgdGhlIGZpbGVzIGl0IG5lZWRzIHRvLgo+IAo+IFdlIGZlZWQgdGhlIHNvdXJjZSB0
cmVlcyB0byByc3luYyBpbiByZXZlcnNlLW9yZGVyLCBhcyB0aGlzIHByZXNlcnZlcwo+IHRoZSBv
cmlnaW5hbCBiZWhhdmlvdXIuIEkuZS4gd2hlbiB1c2luZyBtdWx0aXBsZSByc3luY3MsIHRoZSBs
YXN0IHNvdXJjZQo+IHRyZWUgd291bGQgb3ZlcndyaXRlIGFueXRoaW5nIGluIHRoZSBkZXN0aW5h
dGlvbi4gTm93IHdoZW4gdXNpbmcgYQo+IHNpbmdsZSByc3luYywgd2UgcHV0IHRoZSBsYXN0IHRy
ZWUgZmlyc3QgYXMgcnN5bmMgd2lsbCBzZWxlY3QgdGhlIGZpcnN0Cj4gZmlsZSBpdCBmaW5kcy4K
PiAKPiBUaGlzIG9ubHkgc3VwcG9ydHMgdGhlICdjb3B5JyBtb2RlLCB3aGljaCBpcyB1c2VkIGlu
IHRoZSBmaW5hbGl6ZSBzdGVwLgo+IFRoZSAnaGFyZGxpbmsnIG1vZGUgcmVxdWlyZXMgc3BlY2lm
eWluZyBlYWNoIHNvdXJjZSB0cmVlIHdpdGggdGhlCj4gLS1saW5rLWRlc3QgZmxhZyBidXQgZW5m
b3JjZXMgYSBtYXhpbXVtIG9mIDIwIHRyZWVzLgo+IAo+IEJlbG93IGlzIGEgYmVuY2htYXJrIHJ1
bm5pbmcgdGhlIGhvc3QtZmluYWxpemUgdGFyZ2V0IGZvciBhIGJ1aWxkIHdpdGgKPiAyMDAgcGFj
a2FnZXMuCj4gCj4gQmVuY2htYXJrIDE6IGJlZm9yZSBjb3B5Cj4gICBUaW1lIChtZWFuIMKxIM+D
KTogICAgIDI3LjE3MSBzIMKxICAwLjc3NyBzICAgIFtVc2VyOiA2LjE3MCBzLCBTeXN0ZW06IDE0
LjgzMCBzXQo+ICAgUmFuZ2UgKG1pbiDigKYgbWF4KTogICAyNi4zNDMgcyDigKYgMjguNTY2IHMg
ICAgMTAgcnVucwo+IAo+IEJlbmNobWFyayAyOiBhZnRlciBjb3B5Cj4gICBUaW1lIChtZWFuIMKx
IM+DKTogICAgICA2LjI5NiBzIMKxICAwLjE5NiBzICAgIFtVc2VyOiAyLjg3NCBzLCBTeXN0ZW06
IDUuNjAwIHNdCj4gICBSYW5nZSAobWluIOKApiBtYXgpOiAgICA2LjA5NCBzIOKApiAgNi43MDkg
cyAgICAxMCBydW5zCj4gCj4gU3VtbWFyeQo+ICAgYWZ0ZXIgY29weSByYW4KPiAgICAgNC4zMiDC
sSAwLjE4IHRpbWVzIGZhc3RlciB0aGFuIGJlZm9yZSBjb3B5Cj4gCj4gQ2M6IEhlcnZlIENvZGlu
YSA8aGVydmUuY29kaW5hQGJvb3RsaW4uY29tPgo+IENjOiBZYW5uIEUuIE1PUklOIDx5YW5uLm1v
cmluLjE5OThAZnJlZS5mcj4KPiBDYzogVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9u
aUBib290bGluLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBCcmFuZG9uIE1haWVyIDxicmFuZG9uLm1h
aWVyQGNvbGxpbnMuY29tPgo+IC0tLQo+IHYxOiBodHRwczovL3BhdGNod29yay5vemxhYnMub3Jn
L3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjMxMTI3MjI0MTM5LjM1OTY5LTEtYnJhbmRvbi5t
YWllckBjb2xsaW5zLmNvbS8KPiAKPiB2MjoKPiAtIFNpbXBsaWZ5IGxvZ2ljIGZvciAnY29weScg
bW9kZQo+IC0gRHJvcCBzdXBwb3J0IGZvciAnaGFyZGxpbmsnIG1vZGUKPiAKPiBTaWduZWQtb2Zm
LWJ5OiBCcmFuZG9uIE1haWVyIDxicmFuZG9uLm1haWVyQGNvbGxpbnMuY29tPgo+IC0tLQo+ICBw
YWNrYWdlL3BrZy11dGlscy5tayB8IDE4ICsrKysrKy0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hh
bmdlZCwgNiBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS9wa2ctdXRpbHMubWsgYi9wYWNrYWdlL3BrZy11dGlscy5tawo+IGluZGV4IDA1OWU4
NmFlMGEuLmJhZGEzMjg4MjkgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9wa2ctdXRpbHMubWsKPiAr
KysgYi9wYWNrYWdlL3BrZy11dGlscy5tawo+IEBAIC0yMTcsMTggKzIxNywxMiBAQCBpZmVxICgk
KEJSMl9QRVJfUEFDS0FHRV9ESVJFQ1RPUklFUykseSkKPiAgIyAkNDogbGl0ZXJhbCAiY29weSIg
b3IgImhhcmRsaW5rIiB0byBjb3B5IG9yIGhhcmRsaW5rIGZpbGVzIGZyb20gc3JjIHRvIGRlc3QK
PiAgZGVmaW5lIHBlci1wYWNrYWdlLXJzeW5jCj4gIAlta2RpciAtcCAkKDMpCj4gLQkkKGZvcmVh
Y2ggcGtnLCQoMSksXAo+IC0JCXJzeW5jIC1hIFwKPiAtCQkJLS1oYXJkLWxpbmtzIFwKPiAtCQkJ
JChpZiAkKGZpbHRlciBoYXJkbGluaywkKDQpKSwgXAo+IC0JCQkJLS1saW5rLWRlc3Q9JChQRVJf
UEFDS0FHRV9ESVIpLyQocGtnKS8kKDIpLywgXAo+IC0JCQkJJChpZiAkKGZpbHRlciBjb3B5LCQo
NCkpLCBcCj4gLQkJCQkJJChlbXB0eSksIFwKPiAtCQkJCQkkKGVycm9yIHBlci1wYWNrYWdlLXJz
eW5jIGNhbiBvbmx5ICJjb3B5IiBvciAiaGFyZGxpbmsiLCBub3QgIiQoNCkiKSBcCj4gLQkJCQkp
IFwKPiAtCQkJKSBcCj4gLQkJCSQoUEVSX1BBQ0tBR0VfRElSKS8kKHBrZykvJCgyKS8gXAo+IC0J
CQkkKDMpJChzZXApKQo+ICsJJChpZiAkKGZpbHRlciBoYXJkbGluaywkKDQpKSwgXAo+ICsJCSQo
Zm9yZWFjaCBwa2csJCgxKSxcCj4gKwkJCXJzeW5jIC1hIC0taGFyZC1saW5rcyAtLWxpbmstZGVz
dD0kKFBFUl9QQUNLQUdFX0RJUikvJChwa2cpLyQoMikvIFwKPiArCQkJCSQoUEVSX1BBQ0tBR0Vf
RElSKS8kKHBrZykvJCgyKS8gJCgzKSQoc2VwKSksIFwKPiArCQlwcmludGYgIiVzLyQoMikvXG4i
ICQoMSkgfCB0YWMgXAo+ICsJCQl8IHJzeW5jIC1hIC0taGFyZC1saW5rcyAtLWZpbGVzLWZyb209
LSAtLW5vLVIgLXIgJChQRVJfUEFDS0FHRV9ESVIpICQoMykpCj4gIGVuZGVmCj4gIAo+ICAjIHBy
ZXBhcmVzIHRoZSBwZXItcGFja2FnZSBIT1NUX0RJUiBhbmQgVEFSR0VUX0RJUiBvZiB0aGUgY3Vy
cmVudAoKT24gbXkgc2lkZSwgaXQgbG9va3MgZ29vZC4KClJldmlld2VkLWJ5OiBIZXJ2ZSBDb2Rp
bmEgPGhlcnZlLmNvZGluYUBib290bGluLmNvbT4KClJlZ2FyZHMsCkhlcnbDqQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
