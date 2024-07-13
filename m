Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB2A0C3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 20:35:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81AF281F7C;
	Sat, 13 Jul 2024 20:35:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pro7AHRVtmLA; Sat, 13 Jul 2024 20:35:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8826B81F84
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8826B81F84;
	Sat, 13 Jul 2024 20:35:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 265721BF271
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 20:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 201AD404C1
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 20:35:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LXNB-BsFtC6M for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 20:35:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C42D0404BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C42D0404BF
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C42D0404BF
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 20:35:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0E70B1BF203;
 Sat, 13 Jul 2024 20:35:29 +0000 (UTC)
Date: Sat, 13 Jul 2024 22:35:29 +0200
To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= via buildroot
 <buildroot@buildroot.org>
Message-ID: <20240713223529.6d8961bd@windsurf>
In-Reply-To: <20240607163208.1445715-2-raphael.melotte@mind.be>
References: <20240216211344.1807353-2-raphael.melotte@mind.be>
 <20240607163208.1445715-1-raphael.melotte@mind.be>
 <20240607163208.1445715-2-raphael.melotte@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720902930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=82qYapXf7jXKD9sRXp05KgZJwMxHxK//SyFR9r+B/7U=;
 b=mjQxmpG+AP4P8naQN9enIbXB0d09Uw66NaYbMNq0ODTYiQxYvBYwI1gZ4eDojjUkFe1Q/O
 FpOy/quz2ulgl9ym3+7gq54gUN8SHMwF+LrwZsWfeTqPm3qGPd7gHhJ2NbRZjZ13xEx1yA
 0pXKZ/qIRcE+4ADGZ8zKu7Mtz9fNV7Yz8xcfmNQ3aAKAL4Jn4/RQCxOEAOoW0aHN9hGI9J
 tWjtOi5ZM/2SQRZ8rnPr03J/nL7knw3glnbZNR2eaE+7El7ehOT+aKgCXggWG521Bvpoot
 ac6jCjkCiHPlYDh8EWABZsIM2x9oBDAaxaEuyveimML7G4KKyntrPfh+o6xtXw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mjQxmpG+
Subject: Re: [Buildroot] [PATCH v2 2/5] support/testing: add new test for
 python-pymupdf
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
Cc: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpPbiBGcmksICA3IEp1biAyMDI0IDE4OjMyOjAzICswMjAwClJhcGhhw6tsIE3DqWxv
dHRlIHZpYSBidWlsZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cm90ZToKCj4gVG8g
Z2l2ZSB1cyBhIGNoYW5jZSB0byBjYXRjaCBydW50aW1lIGlzc3VlcyAoc3VjaCBhcyBtaXNzaW5n
Cj4gZGVwZW5kZW5jaWVzKSBtb3JlIGVhc2lseSwgYWRkIGEgdGVzdCB0aGF0IHdyaXRlcyBhIHNh
bXBsZSBQREYgZmlsZSwKPiByZWFkIGl0IGJhY2sgYW5kIHZlcmlmeSB0aGUgdGV4dCB0aGF0IHdh
cyByZWFkLgo+IAo+IExpa2Ugc2ltaWxhciBwYWNrYWdlcyB0aGF0IGxlYWQgdG8gYSBiaWcKPiBy
b290ZnMgKGUuZy4gcHl0aG9uLWJvdG9jb3JlKSwgdGhpcyB0ZXN0IHJlcXVpcmVzIGEgc2VwYXJh
dGUgZXh0Mgo+IHJvb3RmcyB0byBhdm9pZCBmaWxsaW5nIHRoZSBkZWZhdWx0IGFtb3VudCBvZiBS
QU0gYXZhaWxhYmxlCj4gZW50aXJlbHkgKHdoaWNoIHdvdWxkIGNhdXNlIG1pc3NpbmcgZmlsZXMg
ZnJvbSB0aGUgcm9vdCBmaWxlc3lzdGVtIGFuZAo+IGluIHR1cm4sIHRlc3QgZmFpbHVyZXMpLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IFJhcGhhw6tsIE3DqWxvdHRlIDxyYXBoYWVsLm1lbG90dGVAbWlu
ZC5iZT4KClZlcnkgZ29vZCBpZGVhIHRvIGhhdmUgYSB0ZXN0IQoKCj4gK2NsYXNzIFRlc3RQeXRo
b25QeTNQeU11UERGKFRlc3RQeXRob25QYWNrYWdlQmFzZSk6Cj4gKyAgICBfX3Rlc3RfXyA9IFRy
dWUKPiArICAgIGNvbmZpZyA9IFRlc3RQeXRob25QYWNrYWdlQmFzZS5jb25maWcgKyBcCj4gKyAg
ICAgICAgIiIiCj4gKyAgICAgICAgQlIyX1BBQ0tBR0VfUFlUSE9OMz15Cj4gKyAgICAgICAgQlIy
X1BBQ0tBR0VfUFlUSE9OX1BZTVVQREY9eQo+ICsgICAgICAgIEJSMl9QQUNLQUdFX1hPUkc3PXkK
CkluIGZhY3Qgd2FzIG5vdCBuZWVkZWQuCgo+ICsgICAgICAgIEJSMl9VU0VfV0NIQVI9eQo+ICsg
ICAgICAgIEJSMl9JTlNUQUxMX0xJQlNURENQUD15CgpUaGVzZSB0d28gb3B0aW9ucyB3ZXJlIG5v
dCByZWxldmFudCwgb3VyIFRlc3RQeXRob25QYWNrYWdlQmFzZS5jb25maWcKdXNlIGFuIGV4dGVy
bmFsIHRvb2xjaGFpbiBieSBkZWZhdWx0LgoKPiArICAgICAgICBCUjJfVEFSR0VUX1JPT1RGU19F
WFQyPXkKPiArICAgICAgICBCUjJfVEFSR0VUX1JPT1RGU19FWFQyX1NJWkU9IjI1ME0iCgpSZWR1
Y2VkIHRvIDEyME0sIHdoaWNoIHdhcyBlbm91Z2ggbm93IHRoYXQgd2Ugbm8gbG9uZ2VyIGhhdmUg
WC5vcmcuCgpBcHBsaWVkIHdpdGggdGhvc2UgY2hhbmdlcyEKClRob21hcwotLSAKVGhvbWFzIFBl
dGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2Vy
bmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
