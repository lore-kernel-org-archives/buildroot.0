Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2F9C3DA42
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 20:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE0AD82C4D;
	Wed, 10 Jul 2024 20:27:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gqCZqyXLYMDs; Wed, 10 Jul 2024 20:27:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D1AC82EB4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D1AC82EB4;
	Wed, 10 Jul 2024 20:27:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 490E41BF599
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 20:27:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 35E7240248
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 20:27:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Lz0KbNTuISV for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 20:27:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 04AC140141
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04AC140141
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 04AC140141
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 20:27:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 296BBC0003;
 Wed, 10 Jul 2024 20:27:36 +0000 (UTC)
Date: Wed, 10 Jul 2024 22:27:35 +0200
To: Lance Fredrickson <lancethepants@gmail.com>
Message-ID: <20240710222735.56b2aaec@windsurf>
In-Reply-To: <20240623033804.105858-1-lancethepants@gmail.com>
References: <20240623033804.105858-1-lancethepants@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720643256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ptd8GSjUzTc3EHH/uYaqfiSzTYta6O1+6l9SLNmKd8E=;
 b=GBeZkSqgD/sk0J1zgscuEgYmmQmyaLvNfvJvipfDz/h5E3YrQxaX97l00H9OTPaknVUIVb
 qxYf1K9l749rSkNj6xpT4zftdBhP7b2ylxUz2YfG8aMYzrAIRtCRTbZPZoGQjgIDld9pix
 UjkKsYN54v2QW/3ElwHoYjz7FqWoylCasNEQOV3W2MMsKPKfcz04AuUNy/MmRys6Sx7xO6
 ybyM41GA2ZE51Uc87GXrhga+eqUmuGRSf5os5qxbt/dx4T1j1UVsmzKwupUt1iVmj2/C8N
 n29dYx5qt48bKyGVDnc4stQYjX/U1iu7YOY8s+PdnwWN0o1j5MMu6kJXCvpQTQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GBeZkSqg
Subject: Re: [Buildroot] [PATCH 1/1] boot/syslinux: Fix building syslinux
 with GCC 14.x
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU2F0LCAyMiBKdW4gMjAyNCAyMTozODowNCAtMDYwMApMYW5jZSBGcmVkcmlja3NvbiA8bGFu
Y2V0aGVwYW50c0BnbWFpbC5jb20+IHdyb3RlOgoKPiBGcm9tOiBMYW5jZSBGcmVkcmlja3NvbiA8
bGFuY2V0aGVwYW50c0BnbWFpbC5jb20+Cj4gCj4gQWRkIG1pc3Npbmcgc3RkaW8uaCBpbmNsdWRl
LiBXaXRob3V0IGl0IHJlc3VsdHMgaW4gdGhlIGZvbGxvd2luZyBlcnJvciB1bmRlciBHQ0MgMTQu
eAo+IAo+IC4uLy4uLy4uL2NvbTMyL2xpYi9zeXNsaW51eC9kZWJ1Zy5jOiBJbiBmdW5jdGlvbiDi
gJhzeXNsaW51eF9kZWJ1Z+KAmToKPiAuLi8uLi8uLi9jb20zMi9saWIvc3lzbGludXgvZGVidWcu
Yzo5MTo1OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYcHJpbnRm
4oCZIFstV2ltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQo+ICAgIDkxIHwgICAgIHByaW50
ZigiRHluYW1pYyBkZWJ1ZyB1bmF2YWlsYWJsZVxuIik7Cj4gCj4gVXBzdHJlYW06IGRlYWQgKGxh
c3QgcmVsZWFzZSBpbiAyMDE0KQo+IFNpZ25lZC1vZmYtYnk6IExhbmNlIEZyZWRyaWNrc29uIDxs
YW5jZXRoZXBhbnRzQGdtYWlsLmNvbT4KPiAtLS0KPiAgLi4uLzAwMjAtcHVsbC1pbi1zdGRpby1o
LWZvci1nY2MxNC5wYXRjaCAgICAgIHwgMzQgKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUg
Y2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYm9vdC9zeXNs
aW51eC8wMDIwLXB1bGwtaW4tc3RkaW8taC1mb3ItZ2NjMTQucGF0Y2gKCkFwcGxpZWQgdG8gbWFz
dGVyLCB0aGFua3MuCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIENUTywgQm9vdGxpbgpF
bWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
