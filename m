Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D96C25B5F
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 07:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF2044011A;
	Sun, 12 May 2024 07:56:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hbltsCtGON2S; Sun, 12 May 2024 07:56:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAE7C40497
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DAE7C40497;
	Sun, 12 May 2024 07:56:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 204FF1BF473
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 07:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 176A983FC1
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 07:56:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WVbQk4XAG7Oy for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 07:56:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E7D4F83FAF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7D4F83FAF
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E7D4F83FAF
 for <buildroot@buildroot.org>; Sun, 12 May 2024 07:56:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 48A4A240005;
 Sun, 12 May 2024 07:56:26 +0000 (UTC)
Date: Sun, 12 May 2024 09:56:25 +0200
To: Martin =?UTF-8?B?QsO2aA==?= via buildroot <buildroot@buildroot.org>
Message-ID: <20240512095625.6fb58c82@windsurf>
In-Reply-To: <20230223201733.222573-1-contact@martb.dev>
References: <20230223201733.222573-1-contact@martb.dev>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715500586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gjB/MaM0kyf0Mfblc71dQNJr2sYWg92p2ToPPkNnTy0=;
 b=cPL2p7G2A+sXhWRPoYB/HAZ1pIw+qXq2etgnY1sh2QOhPo3qtkZrjXQI13B4Km2C/cJXVk
 jsM0INgnQET3rdgUnlCcwFxN54h5H017rfyCugCG8Gn9Aeq4BGVOd8sJETIq8ZJx98bOA/
 BlDwrYJuf3O9T18L1msOOlujfRi4VDFvGL7qEIbN7NbqU7xDc+YJXsu+8Ajqs3SM4+Z3fX
 WePLWaC379Tu0PKDfC1S0InKknIFPCIVUMn/xAAeexBYdthkeKwzAigjQ8XCC3In7N80KA
 /5Z1xE0fkdKVBamX/1WNgUESP0fMk/HlA1T5c3Y/QiuiVJUsFOyGD81bAxQgDw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cPL2p7G2
Subject: Re: [Buildroot] [PATCH 1/1] package/gr-osmosdr: add missing
 host-python-six dependency to python support
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Martin =?UTF-8?B?QsO2aA==?= <contact@martb.dev>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCAyMyBGZWIgMjAyMyAyMToxNzozMyArMDEwMApNYXJ0aW4gQsO2aCB2aWEgYnVpbGRy
b290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cgo+IE9zbW9zZHIgZmFpbGVkIHRv
IGJ1aWxkIGRvY3Mgd2hlbiBweXRob24gc3VwcG9ydCBpcyBlbmFibGVkLgo+IFsgNDElXSBDb3B5
aW5nIG9zbW9zZHIgZG9jc3RyaW5nIHRlbXBsYXRlcyBhcyBweWJpbmQgaGVhZGVycyAuLi4KPiBU
cmFjZWJhY2sgKG1vc3QgcmVjZW50IGNhbGwgbGFzdCk6Cj4gICBGaWxlICIvaG9tZS9tYXJ0Yi9T
Y2hyZWlidGlzY2gvRGlzY29TQVQvc2F0b3Mvb3V0cHV0L2J1aWxkL2dyLW9zbW9zZHItMC4yLjQv
ZG9jcy9kb3h5Z2VuL3VwZGF0ZV9weWRvYy5weSIsIGxpbmUgMjIsIGluIDxtb2R1bGU+Cj4gICAg
IGZyb20gZG94eXhtbCBpbXBvcnQgRG94eUluZGV4LCBEb3h5Q2xhc3MsIERveHlGcmllbmQsIERv
eHlGdW5jdGlvbiwgRG94eUZpbGUKPiAgIEZpbGUgIi9ob21lL21hcnRiL1NjaHJlaWJ0aXNjaC9E
aXNjb1NBVC9zYXRvcy9vdXRwdXQvYnVpbGQvZ3Itb3Ntb3Nkci0wLjIuNC9kb2NzL2RveHlnZW4v
ZG94eXhtbC9fX2luaXRfXy5weSIsIGxpbmUgNjksIGluIDxtb2R1bGU+Cj4gICAgIGZyb20gLmRv
eHlpbmRleCBpbXBvcnQgRG94eUluZGV4LCBEb3h5RnVuY3Rpb24sIERveHlQYXJhbSwgRG94eUNs
YXNzLCBEb3h5RmlsZSwgRG94eU5hbWVzcGFjZSwgRG94eUdyb3VwLCBEb3h5RnJpZW5kLCBEb3h5
T3RoZXIKPiAgIEZpbGUgIi9ob21lL21hcnRiL1NjaHJlaWJ0aXNjaC9EaXNjb1NBVC9zYXRvcy9v
dXRwdXQvYnVpbGQvZ3Itb3Ntb3Nkci0wLjIuNC9kb2NzL2RveHlnZW4vZG94eXhtbC9kb3h5aW5k
ZXgucHkiLCBsaW5lIDMxLCBpbiA8bW9kdWxlPgo+ICAgICBmcm9tIC5nZW5lcmF0ZWQgaW1wb3J0
IGluZGV4Cj4gICBGaWxlICIvaG9tZS9tYXJ0Yi9TY2hyZWlidGlzY2gvRGlzY29TQVQvc2F0b3Mv
b3V0cHV0L2J1aWxkL2dyLW9zbW9zZHItMC4yLjQvZG9jcy9kb3h5Z2VuL2RveHl4bWwvZ2VuZXJh
dGVkL2luZGV4LnB5IiwgbGluZSAxMywgaW4gPG1vZHVsZT4KPiAgICAgZnJvbSAuIGltcG9ydCBj
b21wb3VuZAo+ICAgRmlsZSAiL2hvbWUvbWFydGIvU2NocmVpYnRpc2NoL0Rpc2NvU0FUL3NhdG9z
L291dHB1dC9idWlsZC9nci1vc21vc2RyLTAuMi40L2RvY3MvZG94eWdlbi9kb3h5eG1sL2dlbmVy
YXRlZC9jb21wb3VuZC5weSIsIGxpbmUgMTUsIGluIDxtb2R1bGU+Cj4gICAgIGZyb20gLiBpbXBv
cnQgY29tcG91bmRzdXBlciBhcyBzdXBlcm1vZAo+ICAgRmlsZSAiL2hvbWUvbWFydGIvU2NocmVp
YnRpc2NoL0Rpc2NvU0FUL3NhdG9zL291dHB1dC9idWlsZC9nci1vc21vc2RyLTAuMi40L2RvY3Mv
ZG94eWdlbi9kb3h5eG1sL2dlbmVyYXRlZC9jb21wb3VuZHN1cGVyLnB5IiwgbGluZSAxNSwgaW4g
PG1vZHVsZT4KPiAgICAgaW1wb3J0IHNpeAo+IE1vZHVsZU5vdEZvdW5kRXJyb3I6IE5vIG1vZHVs
ZSBuYW1lZCAnc2l4Jwo+IG1ha2VbMl06ICoqKiBbcHl0aG9uL2JpbmRpbmdzL0NNYWtlRmlsZXMv
b3Ntb3Nkcl9kb2NzdHJpbmdzLmRpci9idWlsZC5tYWtlOjczOiBweXRob24vYmluZGluZ3MvZG9j
c3RyaW5nX3N0YXR1c10gRmVobGVyIDEKPiBtYWtlWzFdOiAqKiogW0NNYWtlRmlsZXMvTWFrZWZp
bGUyOjMzMjogcHl0aG9uL2JpbmRpbmdzL0NNYWtlRmlsZXMvb3Ntb3Nkcl9kb2NzdHJpbmdzLmRp
ci9hbGxdIEZlaGxlciAyCj4gCj4gU2lnbmVkLW9mZi1ieTogTWFydGluIELDtmggPGNvbnRhY3RA
bWFydGIuZGV2Pgo+IC0tLQo+ICBwYWNrYWdlL2dyLW9zbW9zZHIvZ3Itb3Ntb3Nkci5tayB8IDIg
Ky0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpBcHBs
aWVkIHRvIG1hc3RlciBhZnRlciBhZGRpbmcgYSByZWZlcmVuY2UgdG8gdGhlIGF1dG9idWlsZGVy
IGZhaWx1cmUKYmVpbmcgZml4ZWQuIFRoYW5rcywgYW5kIHNvcnJ5IGZvciB0aGUgc3VwZXIgbG9u
ZyBkZWxheSEKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgQ1RPLCBCb290bGluCkVtYmVk
ZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
