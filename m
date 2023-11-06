Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC120C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:11:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8784441920;
	Mon,  6 Nov 2023 22:11:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8784441920
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jiRlqAjKjRyc; Mon,  6 Nov 2023 22:11:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A92E64212A;
	Mon,  6 Nov 2023 22:11:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A92E64212A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1FE661BF271
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ECCA741FF0
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:11:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECCA741FF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H1YhM_cN3odG for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:11:19 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CD0C14192D
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:11:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD0C14192D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 00943E0002;
 Mon,  6 Nov 2023 22:11:16 +0000 (UTC)
Date: Mon, 6 Nov 2023 23:11:16 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20231106231116.378f405e@windsurf>
In-Reply-To: <20231105183719.3811015-1-peter@korsgaard.com>
References: <20231105183719.3811015-1-peter@korsgaard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699308677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G8OMFmvYMAkUMQ05zRNzMAUcEChIOdZeA+FSHIok6ZM=;
 b=g/IEQ0hNj4Iz3GQJzdI5dlMp0AzMWSD7Q9AJ9RoncPoLwe7Nqipr9r2Y1xIItPwwrqmIsk
 LAicb9Bi6dfYZJKfc8wXQxWJe0xE8kmo67ZQ2p4D/I2RIeXbfF3iykJLDFfZNP9knPvIVY
 CcKdZgjusHXT5FE1nSwXXF9cCjd7/52ibuo7daLPhAR5/tiKNGJCGxI7a2Onm4bw45fIbL
 Vy+DRxpDxUBLDgOYMULkxf0a5ks1M6NuqkYd8+kbpquA/uhuJWvhMJD+8tu1o6P6KTgLIT
 7qA6RL/CrFqEPNs7N0+mNY49PplN8/QmnHme4qGDc0WiZur2lZT/O6y3yJTtFg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=g/IEQ0hN
Subject: Re: [Buildroot] [PATCH 1/4] configs/stm32mp157a_dk1_defconfig:
 unbreak TF-A build with GCC >= 12
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
Cc: Bartosz Bilas <b.bilas@grinn-global.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCAgNSBOb3YgMjAyMyAxOTozNzoxNiArMDEwMApQZXRlciBLb3JzZ2FhcmQgPHBldGVy
QGtvcnNnYWFyZC5jb20+IHdyb3RlOgoKPiBXaXRoIHRoZSBtb3ZlIHRvIGRlZmF1bHQgdG8gR0ND
IDEyIGluIGNvbW1pdCBlMDA5MWU0MmVlZjkgKHBhY2thZ2UvZ2NjOgo+IHN3aXRjaCB0byBnY2Mg
MTIueCBhcyB0aGUgZGVmYXVsdCksIFRGLUEgbm93IGZhaWxzIHRvIGJ1aWxkIGFzIGEgd2Fybmlu
ZyBpcwo+IGdlbmVyYXRlZCBhbmQgaXQgYnVpbGRzIHdpdGggLVdlcnJvcjoKPiAKPiAgIENDICAg
ICAgcGxhdC9zdC9zdG0zMm1wMS9ibDJfcGxhdF9zZXR1cC5jCj4gZHJpdmVycy9zdC9pby9pb19z
dG0zMmltYWdlLmM6IEluIGZ1bmN0aW9uIOKAmHN0bTMyaW1hZ2VfcGFydGl0aW9uX3JlYWTigJk6
Cj4gZHJpdmVycy9zdC9pby9pb19zdG0zMmltYWdlLmM6MjQ5OjEzOiBlcnJvcjog4oCYcmVzdWx0
4oCZIG1heSBiZSB1c2VkIHVuaW5pdGlhbGl6ZWQgWy1XZXJyb3I9bWF5YmUtdW5pbml0aWFsaXpl
ZF0KPiAgIDI0OSB8ICAgICAgICAgaW50IHJlc3VsdDsKPiAgICAgICB8ICAgICAgICAgICAgIF5+
fn5+fgo+IGNjMTogYWxsIHdhcm5pbmdzIGJlaW5nIHRyZWF0ZWQgYXMgZXJyb3JzCj4gCj4gVGhp
cyBpcyBmaXhlZCBpbiBURi1BIHYyLjYgd2l0aCBjb21taXQgYzFkNzMyZDBkYjI0IChmaXgoaW9f
c3RtMzJpbWFnZSk6Cj4gdW5pbml0aWFsaXplZCB2YXJpYWJsZSB3YXJuaW5nKSwgYnV0IEkgZG8g
bm90IGhhdmUgdGhlIGJvYXJkIHRvIHZlcmlmeSBpZgo+IHYyLjYgd29ya3MsIHNvIGluc3RlYWQg
ZGlzYWJsZSAtV2Vycm9yIGJ5IG1hc3NzaW5nIEU9MC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQZXRl
ciBLb3JzZ2FhcmQgPHBldGVyQGtvcnNnYWFyZC5jb20+Cj4gLS0tCj4gIGNvbmZpZ3Mvc3RtMzJt
cDE1N2FfZGsxX2RlZmNvbmZpZyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCgpUaGFua3MgYWxsIGZvdXIgcGF0Y2hlcyBhcHBsaWVkLiBJIGZp
eGVkIHRoZSBtYXNzaW5nIC0+IHBhc3NpbmcgdHlwby4KCkJlc3QgcmVnYXJkcywKClRob21hcwot
LSAKVGhvbWFzIFBldGF6em9uaSwgQ1RPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJu
ZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
