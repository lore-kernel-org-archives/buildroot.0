Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85894D3C91A
	for <buildroot@archiver.kernel.org>; Wed, 10 Dec 2025 14:59:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BA0381E55;
	Wed, 10 Dec 2025 14:59:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hsW7GeQVylUH; Wed, 10 Dec 2025 14:59:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5637181DE3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765378793;
	bh=Am8HUXHWu/rv7lwQ8+uwe6MDwjlfldilADwbGRfT1mI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ktz4RJigBMUipHrZGLUmI5BkcsluZMi2I80M19+m0E6P/pw1YUK/jAev96G2K5+xq
	 3M8TCyzCP01r5E4t+te1/EMwjgk99NzgMufEabINvpuKYtW1aeOrhbzwrcGO8Sxkg1
	 TV4TMUrQS6S4dL9I6qTYkPnRBlDOHldSM9fK+0C+ip77xtilW2NusPhE5CC7b/igTH
	 xIi2gteKHvEaZ/0R7wZ4Gu50dTC3EDwQ0LD1HUwZ/VYHeUY+SeHJMtNQF/SwTSkaat
	 lATVaaEeC0E7QnZSKusr25Ajxej5DwI77K3R3PBgwUx+XzpoJXluSgq11EiGq41tmF
	 76ZPujglSFvKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5637181DE3;
	Wed, 10 Dec 2025 14:59:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C91D3E7
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 14:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE6F240DFA
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 14:59:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JT_GDdm1ABSC for <buildroot@buildroot.org>;
 Wed, 10 Dec 2025 14:59:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9F73F40DF4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F73F40DF4
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9F73F40DF4
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 14:59:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 598801A20AB
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 14:59:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 309C460714
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 14:59:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C3BD411931844; Wed, 10 Dec 2025 15:59:45 +0100 (CET)
Date: Wed, 10 Dec 2025 15:59:44 +0100
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Message-ID: <20251210155944.4f8d218a@kmaincent-XPS-13-7390>
In-Reply-To: <20251210153855.71c77aeb@kmaincent-XPS-13-7390>
References: <20251210102940.2535550-1-kory.maincent@bootlin.com>
 <20251210145715.50e51799@windsurf>
 <20251210151337.7c42babf@kmaincent-XPS-13-7390>
 <20251210152657.5422b252@windsurf>
 <20251210153855.71c77aeb@kmaincent-XPS-13-7390>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765378787; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=0jFZc1IvLFkzGrkNm9oz785E9WhyRj5WeMIaud/SJdI=;
 b=f7VgWlD0ZDBlWra7155Vg6lSUy3x4io2ZRrKPAOlp1dKXHxF3bMDMPqlvvcpUFJdUR3Ffj
 Twq39Z8uA92kOo1G5olg4s7M49mjzuyVHD97ai5TnBa8nriF+oyI5wP2dRuWpzxNQSm906
 KU6kvwhyfcvq74JmpQJfBGnkaLWOBapczlsXrZS3wqS4yjfd+Xb7SLp0qTSbatp+LI81a7
 w53J5bteFxWIdkpl69zl4misS+XPWg4Fpih/9JLhkcIwS0Ls4fnT7PcYzStaEvpA+ygsWl
 Hnu4gfYkrqJmCJ7VXQWX7uvzwo4bkYF8XZzJVv268MJpeGKHCmZk2YKHoEg7Uw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=f7VgWlD0
Subject: Re: [Buildroot] [PATCH] package/util-linux: Fix host uuidd build
 configuration
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
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: Kory Maincent <kory.maincent@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCAxMCBEZWMgMjAyNSAxNTozODo1NSArMDEwMApLb3J5IE1haW5jZW50IDxrb3J5Lm1h
aW5jZW50QGJvb3RsaW4uY29tPiB3cm90ZToKCj4gT24gV2VkLCAxMCBEZWMgMjAyNSAxNToyNjo1
NyArMDEwMAo+IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+
IHdyb3RlOgo+IAo+ID4gSGVsbG8sCj4gPiAKPiA+IE9uIFdlZCwgMTAgRGVjIDIwMjUgMTU6MTM6
MzcgKzAxMDAKPiA+IEtvcnkgTWFpbmNlbnQgPGtvcnkubWFpbmNlbnRAYm9vdGxpbi5jb20+IHdy
b3RlOgo+ID4gICAKPiA+ID4gPiBTb3JyeSwgYnV0IEkgZG9uJ3QgcmVhbGx5IHVuZGVyc3RhbmQg
dGhlIGNvbmZsaWN0LiAtLWVuYWJsZS1saWJ1dWlkIHRvCj4gPiA+ID4gbWUgZG9lcyBub3QgY29u
ZmxpY3Qgd2l0aCAtLWRpc2FibGUtdXVpZGQuIC0tZW5hYmxlLWxpYnV1aWQgZW5hYmxlcyB0aGUK
PiA+ID4gPiBsaWJ1dWlkIGxpYnJhcnksIC0tZGlzYWJsZS11dWlkZCBkaXNhYmxlcyB0aGUgdXVp
ZGQgZGFlbW9uLCB3aGljaCBjYW4KPiA+ID4gPiBvcHRpb25hbGx5IGJlIHVzZWQgYnkgbGlidXVp
ZCwgYnV0IGlzbid0IHN0cmljdGx5IG5lZWRlZC4gICAgICAKPiA+ID4gCj4gPiA+IE9oIHdvdywg
bXkgYnJhaW4gcmVhZCAtLWVuYWJsZS11dWlkIGFuZCAtLWRpc2FibGUtdXVpZC4KPiA+ID4gdXVp
ZCBhbmQgbGlidXVpZCBhcmUgaW5kZWVkIHR3byBkaXN0aW5jdCB0aGluZ3MsIHNvcnJ5IGZvciB0
aGUgY29uZnVzaW9uLgo+ID4gPiAgICAgIAo+ID4gPiA+IFdoaWNoIHNwZWNpZmljIHRvb2wgd2Fz
IG1pc3NpbmcgaW4geW91ciBjYXNlPyAgICAgIAo+ID4gPiAKPiA+ID4gSSB3YXMgbmVlZGluZyB0
aGUgdXVpZGdlbiB0b29sIG9uIG15IGNhc2UuCj4gPiA+IFRoYXQgd2h5IEkgbmVlZCB0byBlbmFi
bGUgdXVpZC4gICAgCj4gPiAKPiA+IEFuZCAtLWVuYWJsZS11dWlkZCBjb250cm9scyB3aGV0aGVy
IHV1aWRnZW4gaXMgYnVpbHQ/ICAKPiAKPiB5ZXMuCgpJbiBmYWN0IHRoaXMgcGF0Y2ggaXMgbm90
IG5lZWRlZC4gSSB3YXMgY29uZnVzZWQgYWJvdXQgdGhlIGJ1aWx0IHJlc3VsdCB3aGVuCmhhdmlu
ZyBCUjJfUEFDS0FHRV9IT1NUX1VUSUxfTElOVVggc2V0IG9yIG5vdC4KSWYgaXQgaXMgc2V0IHRo
ZSB1dWlkZ2VuIHRvb2wgaXMgd2VsbCBidWlsdC4KU29ycnkgZm9yIHRoZSBub2lzZSwgaXQgc2Vl
bXMgSSBuZWVkIHZhY2F0aW9uISA7KQoKUmVnYXJkcywKLS0gCkvDtnJ5IE1haW5jZW50LCBCb290
bGluCkVtYmVkZGVkIExpbnV4IGFuZCBrZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGlu
LmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
