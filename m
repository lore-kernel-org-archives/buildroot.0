Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB4EC25B10
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 15:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A72083D77;
	Thu,  9 May 2024 15:17:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y47S1bqrmJOv; Thu,  9 May 2024 15:16:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FC8B83D9C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FC8B83D9C;
	Thu,  9 May 2024 15:16:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 98AB51BF39C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 15:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E6C283D77
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 15:16:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uyN7lvgDMNUU for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 15:16:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3B8E183D74
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B8E183D74
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3B8E183D74
 for <buildroot@buildroot.org>; Thu,  9 May 2024 15:16:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CB7CF20002;
 Thu,  9 May 2024 15:16:52 +0000 (UTC)
Date: Thu, 9 May 2024 17:16:51 +0200
To: Gero =?UTF-8?B?U2Nod8Okcmlja2U=?= <gero.schwaericke@posteo.de>
Message-ID: <20240509171651.644f3cda@windsurf>
In-Reply-To: <20240417212614.963345-1-gero.schwaericke@posteo.de>
References: <20240417212614.963345-1-gero.schwaericke@posteo.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715267813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5rf+zu7AL0sJesWlSjDltnAQ7TeVEbiA5liYCJX66Os=;
 b=NHhiXwQidQoyp4cq/QQic3IUkxhB9hnLLsVgSkluGOV8JNK3wOfvZFrDgYwsWt5TqGBnbX
 2kOdEqQYUOyUmiNflsH+TUT0ZNJ1D5P3RU3WuKcfJFDdS8TUuLsNYnhxf+wzyqfjtsCYy4
 ugfX+fTz/0X8dqGa42wk6yp1YND8yes6h0F9GaTStuwsCCPDZ6BAYQ4IG/L7es/VtwSzLG
 rtTvxVjhhi7IODjhXWJaOGsNhdfbONuvWeDFurYGW8rtoDZuRhFX+JE7KIpfyWeabm3ITJ
 cO7Vhu10HSfuJTJJmlEJl0HmCeg0rCTtLQj2F2zUORuF1Rp2DDrJTyXZsvE6Gw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NHhiXwQi
Subject: Re: [Buildroot] [PATCH 1/2 v2] package/linux-firmware: RTL_88XX_BT:
 install all binary blobs
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
Cc: Bernd Kuhls <bernd@kuhls.net>, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCAxNyBBcHIgMjAyNCAyMToyMzo0MiArMDAwMApHZXJvIFNjaHfDpHJpY2tlIDxnZXJv
LnNjaHdhZXJpY2tlQHBvc3Rlby5kZT4gd3JvdGU6Cgo+IFVzZSBnZW5lcmljIHBhdHRlcm4gcnRs
ODgqLmJpbiB0byBpbnN0YWxsIGFsbCBiaW5hcnkgYmxvYnMuCj4gCj4gU2lnbmVkLW9mZi1ieTog
R2VybyBTY2h3w6RyaWNrZSA8Z2Vyby5zY2h3YWVyaWNrZUBwb3N0ZW8uZGU+Cj4gLS0tCj4gQ2hh
bmdlcyB2MSAtPiB2MjoKPiAgIC0gZm9yZ290IHRvIHNpZ24tb2ZmIChzb3JyeSBmb3IgdGhlIG5v
aXNlKQo+IC0tLQo+ICBwYWNrYWdlL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlLm1rIHwg
MiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKClRo
YW5rcyBmb3IgeW91ciBjb250cmlidXRpb24sIEkgaGF2ZSBhcHBsaWVkIGJvdGggcGF0Y2hlcywg
YWZ0ZXIgbWFraW5nCnRoZSBjb21taXQgbG9nIGZvciBQQVRDSCAxLzIgYSBsaXR0bGUgYml0IG1v
cmUgcHJlY2lzZToKCiAgICBwYWNrYWdlL2xpbnV4LWZpcm13YXJlOiBpbnN0YWxsIGFsbCBydGw4
OCBCbHVldG9vdGggYmluYXJ5IGJsb2JzCiAgICAKICAgIFVzZSBnZW5lcmljIHBhdHRlcm4gcnRs
ODgqLmJpbiB0byBpbnN0YWxsIGFsbCBiaW5hcnkgYmxvYnMuIFRoZQogICAgZGlmZmVyZW5jZSB3
aXRoIHRoZSBjdXJyZW50IHZlcnNpb24gb2YgbGludXgtZmlybXdhcmUgaXMgdGhhdCB0aGlzCiAg
ICB3aWxsIGFkZGl0aW9uYWxseSBpbnN0YWxsIHRoZSBydGxfYnQvcnRsODg1MmN1X2Z3X3YyLmJp
biBmaWxlLCB3aGljaAogICAgaXMgdXNlZCBieSB0aGUgZHJpdmVycy9ibHVldG9vdGgvYnRydGwu
YyBMaW51eCBrZXJuZWwgZHJpdmVyIHNpbmNlCiAgICBMaW51eCA2LjYuCiAgICAKICAgIFNpZ25l
ZC1vZmYtYnk6IEdlcm8gU2Nod8Okcmlja2UgPGdlcm8uc2Nod2Flcmlja2VAcG9zdGVvLmRlPgog
ICAgU2lnbmVkLW9mZi1ieTogVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290
bGluLmNvbT4KCkJlc3QgcmVnYXJkcywKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgQ1RP
LCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9i
b290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
