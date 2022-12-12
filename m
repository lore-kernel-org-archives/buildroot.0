Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E7DC4332F
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 09:29:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7E8E813D9;
	Mon, 12 Dec 2022 09:29:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7E8E813D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f8_eQKjOTFN1; Mon, 12 Dec 2022 09:29:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06A0E813C3;
	Mon, 12 Dec 2022 09:29:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06A0E813C3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4DDD21BF2C0
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 09:29:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 137D54045C
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 09:29:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 137D54045C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RLinwix9o2x9 for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 09:29:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF4E3400F2
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AF4E3400F2
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 09:29:53 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A03541BF20A;
 Mon, 12 Dec 2022 09:29:50 +0000 (UTC)
Date: Mon, 12 Dec 2022 10:29:49 +0100
To: Aleksander Morgado <aleksander@aleksander.es>
Message-ID: <20221212102949.5cb69b6c@windsurf>
In-Reply-To: <CAA3JqEceuWkLuDjCviOdHmi12X96+KMfPb0s2Us8a5WgwKa-rw@mail.gmail.com>
References: <20221208133928.303101-1-heiko.thiery@gmail.com>
 <20221208133928.303101-3-heiko.thiery@gmail.com>
 <20221211144611.437eda70@windsurf>
 <CAA3JqEceuWkLuDjCviOdHmi12X96+KMfPb0s2Us8a5WgwKa-rw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670837391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RnqaPFvlXuHWYakOisqgEVjBSHxYFPB87U5xxAPR/qw=;
 b=gfn93XN/Uy5PVmBzqS4AZwE2uC43I5deUhdYZwytYIwZFQnL2vWZEiaRNeQeAuXGXn/R7V
 7sbatR/PdOWkZlS2lOzzutAuj4nsFVElhBvAYyvf7W3Dyyr2HSyM2Vdt6ja204//icWmJ6
 KS3TpfKi9FcH+2mPBt1MHk9xcq7pXlEah3N+Ix65FJtDYIdIWMfa5+nJhipL0a8x6jy+Ms
 XOaPWemFM2zkvNJKXi5KJxMm0XjzdKangOdn8cW+3yEhO5IucMCb6h6iNH1rM1APpDnPbM
 5dTM1f3BoiWFNLwIeXzQYlHbjLV1NGhKjkLS0Y9Bqh/1PT009dzPow9VEZjacA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gfn93XN/
Subject: Re: [Buildroot] [PATCH v2 3/3] package/modem-manager: bump version
 to 1.20.2
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Heiko Thiery <heiko.thiery@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCAxMiBEZWMgMjAyMiAxMDoxOTozMiArMDEwMApBbGVrc2FuZGVyIE1vcmdhZG8gPGFs
ZWtzYW5kZXJAYWxla3NhbmRlci5lcz4gd3JvdGU6Cgo+IFRoZSBidWlsZC10aW1lIGRlcGVuZGVu
Y3kgb24gREJ1cyBpcyBleGNsdXNpdmVseSB0byByZWFkCj4gImludGVyZmFjZXNfZGlyIiBhbmQg
InN5c3RlbV9idXNfc2VydmljZXNfZGlyIiBmcm9tIHRoZSBwa2ctY29uZmlnCj4gKC91c3IvbGli
L3BrZ2NvbmZpZy9kYnVzLTEucGMpIGZpbGUgaW5zdGFsbGVkLiBJIGFncmVlIHRoaXMgaXMgbm90
Cj4gdmVyeSBwcmV0dHksIGFzIHdlIGRvbsK0dCByZWFsbHkgcmVxdWlyZSBhIGZ1bGwgd29ya2lu
ZyBEQnVzLCBqdXN0IHRoZQo+IHBrZ2NvbmZpZyBmaWxlIDovCgpBQ0shCgo+IE5vLCB1ZGV2ZGly
IGlzIHJlcXVpcmVkIGV2ZW4gaWYgLUR1ZGV2PWZhbHNlLiBUaGUgcmVhc29uIGlzIHRoYXQKPiB1
ZGV2ZGlyIGlzIHVzZWQgdG8gaW5zdGFsbCB0aGUgdWRldiBydWxlcyBmaWxlcywgYW5kIE1vZGVt
TWFuYWdlciBoYXMKPiBhIGJ1aWx0LWluIHVkZXYgcnVsZXMgcGFyc2VyIHVzZWQgd2hlbiB0aGUg
ZGFlbW9uIGlzIGJ1aWx0IHdpdGhvdXQKPiB1ZGV2IHN1cHBvcnQgKGUuZy4gZGVmYXVsdCBpbiBv
cGVud3J0KS4gVGhlIHVkZXYgcnVsZXMgc3BlY2lmeSBwb3J0Cj4gdHlwZSBoaW50cyBhbmQgb3Ro
ZXIgdGhpbmdzLCBNTSB3b24ndCB3b3JrIGZpbmUgd2l0aG91dCB0aG9zZSBydWxlcy4KCk9LLCB0
aGFua3MgZm9yIHRoZSBpbmZvcm1hdGlvbi4KCkhlaWtvOiB3aWxsIHlvdSBmb2xsb3ctdXAgd2l0
aCBhbiB1cGRhdGVkIHBhdGNoPwoKVGhhbmtzIQoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25p
LCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5n
aW5lZXJpbmcgYW5kIHRyYWluaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
