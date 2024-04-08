Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7218AC67861
	for <buildroot@archiver.kernel.org>; Mon,  8 Apr 2024 20:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F1F3408C5;
	Mon,  8 Apr 2024 20:36:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZbYFoYPQOrKr; Mon,  8 Apr 2024 20:36:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09AC040B60
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09AC040B60;
	Mon,  8 Apr 2024 20:36:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D8EA11BF2A7
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 20:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0F3E81F71
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 20:36:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TwNQ8FS_qS-r for <buildroot@lists.busybox.net>;
 Mon,  8 Apr 2024 20:36:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AC54D81F70
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC54D81F70
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AC54D81F70
 for <buildroot@buildroot.org>; Mon,  8 Apr 2024 20:36:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 89ECE60004;
 Mon,  8 Apr 2024 20:36:22 +0000 (UTC)
Date: Mon, 8 Apr 2024 22:36:21 +0200
To: Robert Marko <robimarko@gmail.com>
Message-ID: <20240408223621.39b37892@windsurf>
In-Reply-To: <20240403121807.2087547-1-robimarko@gmail.com>
References: <20240403121807.2087547-1-robimarko@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712608582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sbg8gzDlI73YLCA2a9zS8cJr4mk0b2mu1oOsSlaBs9w=;
 b=UZBDwWQujfW3f9laribA1/QeKACCoEcDd+o9QuxDKn3hMehjq2WjbWuN1jxnjlGMxY0BO5
 5rP2jdkvQUk18e4wTy0bNq3waD+vRvdvS/DhvHt5YdeAuC2dO7BHZA/iU2ehX7E+7XplLh
 q4Tt88M4YQDpBA48+/DgkFgPOPwcLaewgagTp4D48fNmTKGvDYFVAqkmpaCNMP1nWrx3C/
 2cQq8QV9Ppama7dek6VU1u93BQZDi+KeoMCwsk5P4N5qhyd1bChyvO6uNx8PSnQoCrbSTK
 U2hDBPAX0ppDDeE8O53j7rLJ5pftWGK6zMeYUTaIPevg+CmSUa5tKJersjxK7A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UZBDwWQu
Subject: Re: [Buildroot] [PATCH 1/1] kconfig/lxdialog: fix check() with GCC14
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
Cc: Petr Vorel <petr.vorel@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUm9iZXJ0LAoKT24gV2VkLCAgMyBBcHIgMjAyNCAxNDoxODowNyArMDIwMApSb2JlcnQg
TWFya28gPHJvYmltYXJrb0BnbWFpbC5jb20+IHdyb3RlOgoKPiBHQ0MxNCBub3cgdHJlYXRzIGlt
cGxpY2l0IGludCB0eXBlcyBhcyBlcnJvciBzbyB3aGVuIGNoZWNrKCkgZnJvbQo+IGNoZWNrLWx4
ZGlhbG9nLnNoIGlzIGNhbGxlZCB0byBjaGVjayB3aGV0aGVyIHdlIGNhbiBsaW5rIGFnYWluc3Qg
bmN1cnNlcwo+IGl0IHdpbGwgZmFpbCBzaWxlbnRseSBhbmQgdGhlIGhlbHAgdGV4dCBpbmRpY2F0
aW5nIHRvIGluc3RhbGwgbmN1cnNlcyBpcwo+IHByaW50ZWQuCj4gCj4gSG93ZXZlciwgdGhpcyBp
cyBub3QgZHVlIHRvIG1pc3NpbmcgbmN1cnNlcyBidXQgb25jZSB0aGUgc3RkZXJyIHJlZGlyZWN0
Cj4gdG8gL2Rldi9udWxsIGlzIHJlbW92ZWQgd2UgY2FuIHNlZSB0aGUgcm9vdCBjYXVzZToKPiA8
c3RkaW4+OjI6MTogZXJyb3I6IHJldHVybiB0eXBlIGRlZmF1bHRzIHRvIOKAmGludOKAmSBbLVdp
bXBsaWNpdC1pbnRdCj4gCj4gU28sIGluIG9yZGVyIGZvciBtZW51Y29uZmlnIHRvIHdvcmsgd2l0
aCBHQ0MxNCBsZXRzIGp1c3Qgc3BlY2lmeSB0aGUKPiByZXR1cm4gdHlwZSBvZiBtYWluKCkgYXMg
aW50Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJvYmVydCBNYXJrbyA8cm9iaW1hcmtvQGdtYWlsLmNv
bT4KClRoYW5rcyBhIGxvdCBmb3IgdGhlIHBhdGNoLiBIb3dldmVyLCBtYWtpbmcgY2hhbmdlcyBp
biBzdXBwb3J0L2tjb25maWcvCmluIEJ1aWxkcm9vdCByZXF1aXJlcyBhIGJpdCBtb3JlIGNhcmUu
IEluZGVlZCwgdGhpcyBjb2RlIGlzIHRha2VuIGZyb20KdGhlIExpbnV4IGtlcm5lbCBjb2RlLCBh
bmQgd2UgdHJ5IHRvIGtlZXAgYSB3ZWxsLWRlZmluZWQgbGlzdCBvZgpjaGFuZ2VzIG9uIHRvcCBv
ZiB0aGUgb3JpZ2luYWwgY29kZSBmcm9tIHRoZSBrZXJuZWwuCgpBcyBleHBsYWluZWQgaW4gc3Vw
cG9ydC9rY29uZmlnL1JFQURNRS5idWlsZHJvb3QsIHRoZSBjdXJyZW50IGNvZGUgaW4Kc3VwcG9y
dC9rY29uZmlnLyBpcyB0YWtlbiBmcm9tIExpbnV4IDQuMTctcmMyLCBvbiB0b3Agb2Ygd2hpY2gg
dGhlCnBhdGNoZXMgaW4gc3VwcG9ydC9rY29uZmlnL3BhdGNoZXMvIGhhdmUgYmVlbiBhcHBsaWVk
LgoKU28gZnJvbSB0aGlzLCB5b3UgaGF2ZSB0d28gb3B0aW9uczoKCigxKSBBZGQgYSBuZXcgcGF0
Y2ggaW4gc3VwcG9ydC9rY29uZmlnL3BhdGNoZXMvIHdoaWNoIGltcGxlbWVudHMgdGhlCiAgICBj
aGFuZ2UgeW91IG5lZWQgZm9yIEdDQzE0IGNvbXBhdGliaWxpdHkKCigyKSBVcGRhdGUgdGhlIGNv
ZGUgaW4gc3VwcG9ydC9rY29uZmlnLyB0byB0aGUgbGF0ZXN0IGNvZGUgYXZhaWxhYmxlIGluCiAg
ICB0aGUgTGludXgga2VybmVsIHNjcmlwdHMva2NvbmZpZyBkaXJlY3RvcnksIHJlYmFzZSBvdXIg
cGF0Y2hlcywgYW5kCiAgICB2ZXJpZnkgaXQgYWxsIHdvcmtzLgoKT2J2aW91c2x5LCAoMSkgaXMg
dGhlIGVhc2llc3QgcGF0aC4gKDIpIGlzIG5pY2VyIGxvbmcgdGVybSwgYXMgd2UKYmVuZWZpdCBm
cm9tIGFsbCBuZXcgZmVhdHVyZXMvZml4ZXMgYWRkZWQgYnkgdGhlIExpbnV4IGtlcm5lbApkZXZl
bG9wZXJzLiBUdXJucyBvdXQgdGhhdCBpbiB0aGUgdXBzdHJlYW0ga2VybmVsLCB0aGUKY2hlY2st
bHhkaWFsb2cuc2ggc2NyaXB0IGhhcyBiZWVuIHJlbW92ZWQgYW5kIHJlcGxhY2VkIGJ5IHNvbWV0
aGluZwpkaWZmZXJlbnQsIHdoaWNoIG5vIGxvbmdlciBoYXMgdGhpcyBtYWluKCkgZnVuY3Rpb24g
ZGVmaW5pdGlvbi4KCkNvdWxkIHlvdSBoYXZlIGEgbG9vayBhdCBpbXBsZW1lbnRpbmcgZWl0aGVy
ICgxKSBvciAoMikgPwoKVGhhbmtzIGEgbG90IQoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25p
LCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5n
aW5lZXJpbmcgYW5kIHRyYWluaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
