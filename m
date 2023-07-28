Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C9A5EB64DD
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 07:19:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E14E4204D;
	Fri, 28 Jul 2023 07:19:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E14E4204D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WaY7SGmHMDmC; Fri, 28 Jul 2023 07:19:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CCC54201D;
	Fri, 28 Jul 2023 07:19:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CCC54201D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B45B41BF489
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 07:19:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A7974044C
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 07:19:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A7974044C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qv7M8cBgh4yv for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 07:19:29 +0000 (UTC)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B3CCC40103
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 07:19:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3CCC40103
Received: from relay1-d.mail.gandi.net (unknown [217.70.183.193])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 9E4BBCC445
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 07:04:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 40C9624000A;
 Fri, 28 Jul 2023 07:04:31 +0000 (UTC)
Date: Fri, 28 Jul 2023 09:04:29 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20230728090429.7ec0b588@bootlin.com>
In-Reply-To: <20230727225950.22bf4c14@windsurf>
References: <20230727125123.927568-1-herve.codina@bootlin.com>
 <20230727155944.GF3544423@scaer> <20230727225950.22bf4c14@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: herve.codina@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690527871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jvDyq5Gae+WZnHKMKlQL8oAXnoK4/zXXSUUcHGpBT8A=;
 b=c4HafGQaChpQ/Vml5OqLC4NTeiyxG9AsRQZuNwibCDNgxKUBcmatOAeLQyPAuCF8i9Oir7
 iFsSClQzlYhZXcwvLlYfZdesZMk08n9Gwi93Mk9XRgxBIPCN7/3C88umO6gx4KkygryVFc
 3mlLZ+y2K/POujX3Gu7h781jySXOXif1nHE4VjHB2Gw9KzR7IjYABfeR8xQFRKAoMPXICQ
 8hm/ftllHwNw36s0rf8eRXXZgQcqP2hMtGk1wR6KWivtr/7B7l/oEHX2Wo/Tg3JLO0Tm+L
 pJRuYkAtwCr8aR7kzzhMCCLgtUN6hB//HtwojrAmLTJ9kjr/LShMz+xHiGQLhg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=c4HafGQa
Subject: Re: [Buildroot] [RFC PATCH 1/1] support/download: allow to use part
 of file in checksum checking
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgWWFubiwgVGhvbWFzLAoKT24gVGh1LCAyNyBKdWwgMjAyMyAyMjo1OTo1MCArMDIwMApUaG9t
YXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKCj4gT24g
VGh1LCAyNyBKdWwgMjAyMyAxNzo1OTo0NCArMDIwMAo+ICJZYW5uIEUuIE1PUklOIiA8eWFubi5t
b3Jpbi4xOTk4QGZyZWUuZnI+IHdyb3RlOgo+IAo+ID4gIDIuIGZvciBzdWNoIHBhY2thZ2VzLCBh
ZGQgYSBwb3N0LWV4dHJhY3QgaG9vayB0aGF0IHByZXBhcmVzIHRoZSBsaWNlbnNlCj4gPiAgICAg
ZmlsZShzKSwgYW5kIHJlZ2lzdGVyIHRob3NlIGFzIF9GT09fTElDRU5TRV9GSUxFUyBpbnN0ZWFk
LiBCeSB1c2luZwo+ID4gICAgIGNvZGUsIHlvdSBjYW4gc2VhcmNoIGZvciBwYXR0ZXJucyByYXRo
ZXIgdGhhbiBkZXBlbmQgb24gY29uc3RhbnQKPiA+ICAgICBsaW5lIG51bWJlcnMuICAKPiAKPiBM
aWtlOgo+IAo+ICMgVGhlIEdpdGh1YiByZXBvc2l0b3J5IGRvZXNuJ3QgY29udGFpbiB0aGUgc291
cmNlIGNvZGUgYXMtaXM6IGl0Cj4gIyBjb250YWlucyBhIHRhcmJhbGwgd2l0aCB0aGUga2VybmVs
IGRyaXZlciBzb3VyY2UgY29kZSwgYW5kIGEKPiAjIHNlbGYtZXh0cmFjdGlibGUgYmluYXJ5IGZv
ciB0aGUgdXNlci1zcGFjZSBwYXJ0cy4gU28gd2UgZXh0cmFjdCBib3RoCj4gIyBiZWxvdywgYW5k
IGFsc28gZXh0cmFjdCB0aGUgRVVMQSB0ZXh0IGZyb20gdGhlIHNlbGYtZXh0cmFjdGlibGUgYmlu
YXJ5Cj4gZGVmaW5lIEdDTkFOT19CSU5BUklFU19FWFRSQUNUX0hFTFBFUgo+ICAgICAgICAgdGFy
IC0tc3RyaXAtY29tcG9uZW50cz0xIC14SmYgJChARCkvZ2NuYW5vLWRyaXZlci0kKEdDTkFOT19C
SU5BUklFU19EUklWRVJfVkVSU0lPTikudGFyLnh6IC1DICQoQEQpCj4gICAgICAgICBhd2sgJ0JF
R0lOICAgICAgeyBzdGFydCA9IDA7IH0gXAo+ICAgICAgICAgICAgICAgICAvXkVPRVVMQS8gIHsg
c3RhcnQgPSAwOyB9IFwKPiAgICAgICAgICAgICAgICAgICAgICAgICB7IGlmIChzdGFydCkgcHJp
bnQ7IH0gXAo+ICAgICAgICAgICAgICAgICAvPDxFT0VVTEEvIHsgc3RhcnQgPSAxOyB9JyBcCj4g
ICAgICAgICAgICAgICAgICQoQEQpL2djbmFuby11c2VybGFuZC1tdWx0aS0kKEdDTkFOT19CSU5B
UklFU19VU0VSTEFORF9WRVJTSU9OKS5iaW4gPiAkKEBEKS9FVUxBCj4gICAgICAgICBjZCAkKEBE
KSAmJiBzaCBnY25hbm8tdXNlcmxhbmQtbXVsdGktJChHQ05BTk9fQklOQVJJRVNfVVNFUkxBTkRf
VkVSU0lPTikuYmluIC0tYXV0by1hY2NlcHQKPiBlbmRlZgo+IAo+IEdDTkFOT19CSU5BUklFU19Q
T1NUX0VYVFJBQ1RfSE9PS1MgKz0gR0NOQU5PX0JJTkFSSUVTX0VYVFJBQ1RfSEVMUEVSCj4gCj4g
KHdoaWNoIGFtb25nIG90aGVyIHRoaW5ncyBleHRyYWN0cyB0aGUgRVVMQSBmaWxlLCB0aGF0IGlz
IHVzZWQgYXMgYQo+IGxpY2Vuc2UgZmlsZSkKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gCj4gVGhvbWFz
CgpUaGFua3MgZm9yIHlvdXIgZmVlZGJhY2suCgpJIGFtIGdvaW5nIHRvIGxvb2sgYXQgdGhlIFBP
U1RfRVhUUkFDVF9IT09LUyB0byBnZW5lcmF0ZSBhIGxpY2Vuc2UgZmlsZS4KCkJlc3QgcmVnYXJk
cywKSGVydsOpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
