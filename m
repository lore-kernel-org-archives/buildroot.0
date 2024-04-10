Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D93CD11C2
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 21:20:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62F4A60647;
	Wed, 10 Apr 2024 21:20:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dzuEuCsOqlxn; Wed, 10 Apr 2024 21:20:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6341D60BFF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6341D60BFF;
	Wed, 10 Apr 2024 21:20:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B1F291BF4D6
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:20:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ABE1840359
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:20:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id As1oE4Tn3tUD for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 21:20:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 73E01402D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73E01402D4
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 73E01402D4
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 21:20:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4918060002;
 Wed, 10 Apr 2024 21:20:21 +0000 (UTC)
Date: Wed, 10 Apr 2024 23:20:20 +0200
To: Alexis =?UTF-8?B?TG90aG9yw6k=?= via buildroot <buildroot@buildroot.org>
Message-ID: <20240410232020.623f20ed@windsurf>
In-Reply-To: <20240329143138.214780-1-alexis.lothore@bootlin.com>
References: <20240329143138.214780-1-alexis.lothore@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712784021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=55SoDb5vAfEmIIEyeLd0ggNMxK8lkXKh+LZy1eSgY4Q=;
 b=oQ/BgetGn33FlKtbBtgH1k4PetsfIoJhSDUPqUToTIRMxiBEFsHhkLGKUh9cOE0XE/odxM
 4ciigDUjLKebCpcB0vZCdHJIsI3cUBmr0vLwuV4Bf59z7djrmgHzvpMZ7ossdCKdrln7Hv
 8TDBU3uUdfgyDlK0rSocKxNSoC+GAp5dWow2cx+31pXDxbNnwpKJhji2fS0rSTOyE9Qr/d
 K6uIWiIKsqBqcEl+Q1CeIbD7WBhJMGaxiQGU86/JuZRgz/q2edeqEH4R1s08nnoJo6C81u
 gEQq/+leUTY3k6G7bCD9TDjHpiQV4ZWm0o7gDh7ppvkIXtBrdi31ENoxQ2bZPw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oQ/BgetG
Subject: Re: [Buildroot] [PATCH 0/3] package/pppd: fix pppd startup with
 upstream patches
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Alexis =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>,
 Nicolas Carrier <nicolas.carrier@nav-timing.safrangroup.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQWxleGlzLAoKT24gRnJpLCAyOSBNYXIgMjAyNCAxNTozMTozNSArMDEwMApBbGV4aXMg
TG90aG9yw6kgdmlhIGJ1aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOgoK
PiBUaGUgaXNzdWUgaGFzIGFscmVhZHkgYmVlbiBkZXRlY3RlZCBhbmQgZml4ZWQgdXBzdHJlYW0g
KHNlZSBbMV0pIGFuZCBpcwo+IGV4cGVjdGVkIHRvIGJlIHJlbGVhc2VkIG9uIGEgdjIuNS4xLCBi
dXQgdGhpcyByZWxlYXNlIHNlZW1zIHRvIGJlIHN0YWxsZWQKPiBmb3Igbm93IChzZWUgWzJdKS4g
QSBtZXJlIGJ1bXAgb2YgdGhlIHBhY2thZ2UgaXMgdGhlbiBub3QgY3VycmVudGx5Cj4gcG9zc2li
bGUsIHNvIEkgYW0gcHJvcG9zaW5nIGEgcGljayBvZiB0aGUgMyByZWxldmFudCBwYXRjaGVzIHRv
IGZpeCB0aGlzCj4gc3RhcnR1cCBpc3N1ZSwgYm90aCBmb3IgbWFzdGVyIGFuZCAyMDI0LjAyLngK
ClRoYW5rcyBmb3IgdGhpcyBzZXQgb2YgcGF0Y2hlcy4gSG93ZXZlciwgdGhlIHdheSB5b3UgZm9y
bWF0dGVkIHRoZQpwYXRjaGVzIGlzIG5vdCBxdWl0ZSB3aGF0IHdlIGV4cGVjdC4KCldlIGV4cGVj
dCB5b3UgdG86CgogKDEpIGdpdCBjaGVycnktcGljayB0aGUgY29tbWl0cwoKICgyKSBBZGQgYW4g
VXBzdHJlYW06IHRhZyBhdCB0aGUgZW5kIG9mIHRoZSBjb21taXQgbWVzc2FnZSwgZm9sbG93aW5n
CiAgICAgYnkgeW91ciBTaWduZWQtb2ZmLWJ5IGxpbmUKCiAoMykgVXNlICJnaXQgZm9ybWF0LXBh
dGNoIC1OIiB0byBmb3JtYXQgdGhlIDMgcGF0Y2hlcwoKUmlnaHQgbm93IHlvdSBoYXZlIG1vcmUg
b3IgbGVzcyAid3JhcHBlZCIgdGhlIHBhdGNoZXMgaW50byBjb21taXRzIHlvdQphcmUgdGhlIGF1
dGhvciBvZiwgYW5kIHlvdXIgU2lnbmVkLW9mZi1ieSBsaW5lIGlzIG1pc3NpbmcuCgpMb29rIGF0
IHBhY2thZ2Uvd2F5bGFuZHBwLzAwMDEtYWRkLW1pc3NpbmctY3N0ZGludC1pbmNsdWRlLnBhdGNo
IGZvciBhbgpleGFtcGxlIG9mIGEgcHJvcGVybHkgZm9ybWF0dGVkIHBhdGNoLiBTZXJnZWkgVHJv
Zmltb3ZpY2ggaXMgdGhlCm9yaWdpbmFsIGF1dGhvciwgQmVybmQgS3VobHMgaXMgdGhlIHBlcnNv
biB3aG8gYnJvdWdodCB0aGUgcGF0Y2ggaW50bwpCdWlsZHJvb3QuCgpDb3VsZCB5b3UgcmV3b3Jr
IHlvdXIgcGF0Y2ggc2VyaWVzIGFjY29yZGluZ2x5PwoKVGhhbmtzIGEgbG90IQoKVGhvbWFzCi0t
IApUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCkVtYmVkZGVkIExp
bnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCmh0dHBzOi8vYm9vdGxpbi5j
b20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
