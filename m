Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3EA4C3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 21:23:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF06582234;
	Sat, 23 Dec 2023 21:23:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF06582234
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MuE60f5flqNK; Sat, 23 Dec 2023 21:23:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E19582226;
	Sat, 23 Dec 2023 21:23:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E19582226
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5729D1BF869
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 21:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 30413821CB
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 21:22:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30413821CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9y01uVNPpvRO for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 21:22:29 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E30C78218C
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 21:22:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E30C78218C
Received: by mail.gandi.net (Postfix) with ESMTPSA id 28E9F20003;
 Sat, 23 Dec 2023 21:22:26 +0000 (UTC)
Date: Sat, 23 Dec 2023 22:22:25 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231223222225.601aad4b@windsurf>
In-Reply-To: <20231203041841.492885-3-adam.duskett@amarulasolutions.com>
References: <20231203041841.492885-1-adam.duskett@amarulasolutions.com>
 <20231203041841.492885-3-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703366546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a+G5aUzC2681tads3k2qACqQj9llic/sqT7r58ruBfA=;
 b=ljwjY/LYgHm0ZRPEQkooNBV77wuh/anrBt4EbjVDcz7YOTifJ333lRplhYl+jps1flRFXr
 mcxkMKd7ihhdXMT4kGc3ZQnOseCkodvmrfrOwp+TQ1OK5ByknkIDa93S7720rmP7DbtT0p
 QwLI+jMParxfcPcCxY4y5Yo2lYSZgo2PvSOieEV/MA+hZMGI7eNHNBGsw6b4oDuSph/MU+
 MAmtljTuMHn+2tKgaECVUy6fw3X7alY/wT0F4Mc8gG919N+BdMaM1RoTnY/c2pUqh4fFgP
 BrEpykHZ2AtCYEP+nUebIJkoMVNL781NKDSm6bmXCtDOYofYW/VxqSANlZVc1g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ljwjY/LY
Subject: Re: [Buildroot] [PATCH 3/6] package/google-breakpad: fix building
 on newer systems
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
Cc: Pascal Huerst <pascal.huerst@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU2F0LCAgMiBEZWMgMjAyMyAyMToxODozNiAtMDcwMApBZGFtIER1c2tldHQgPGFkYW0uZHVz
a2V0dEBhbWFydWxhc29sdXRpb25zLmNvbT4gd3JvdGU6Cgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcg
ZXJyb3Igd2hlbiBidWlsZGluZyBhZ2FpbnN0IEZlZG9yYSAzOToKPiDigJh1aW50cHRyX3TigJkg
aXMgZGVmaW5lZCBpbiBoZWFkZXIg4oCYPGNzdGRpbnQ+4oCZOyBkaWQgeW91IGZvcmdldCB0bwo+
IOKAmCNpbmNsdWRlIDxjc3RkaW50PuKAmT8KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBZGFtIER1c2tl
dHQgPGFkYW0uZHVza2V0dEBhbWFydWxhc29sdXRpb25zLmNvbT4KPiAtLS0KPiAgLi4uYWRkLWNz
dGRpbnQtdG8tbWluaWR1bXBfZGVzY3JpcHRvci5oLnBhdGNoIHwgMzIgKysrKysrKysrKysrKysr
KysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgcGFja2FnZS9nb29nbGUtYnJlYWtwYWQvMDAwMS1hZGQtY3N0ZGludC10by1taW5pZHVt
cF9kZXNjcmlwdG9yLmgucGF0Y2gKCkkndmUgYXBwbGllZCwgYnV0IGFmdGVyIGJhY2twb3J0aW5n
IGluc3RlYWQgdGhlIHVwc3RyZWFtIGNvbW1pdCwgYW5kCmFkZGluZyBhIHJlZmVyZW5jZSB0byB0
aGUgYXV0b2J1aWxkZXIgZmFpbHVyZSBiZWluZyBmaXhlZCBieSB0aGlzCnBhdGNoLiBUaGFua3Mh
CgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIENUTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51
eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
