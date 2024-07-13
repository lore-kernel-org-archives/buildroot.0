Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB08C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 20:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA35781F94;
	Sat, 13 Jul 2024 20:36:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BTFSydFV2rzm; Sat, 13 Jul 2024 20:36:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D193082051
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D193082051;
	Sat, 13 Jul 2024 20:36:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8EF621BF271
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 20:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8981660759
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 20:36:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jLdbjhIqhsxD for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 20:36:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 493E260753
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 493E260753
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 493E260753
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 20:36:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 54823C0003;
 Sat, 13 Jul 2024 20:36:22 +0000 (UTC)
Date: Sat, 13 Jul 2024 22:36:21 +0200
To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= via buildroot
 <buildroot@buildroot.org>
Message-ID: <20240713223621.37f3d317@windsurf>
In-Reply-To: <20240607163208.1445715-4-raphael.melotte@mind.be>
References: <20240216211344.1807353-2-raphael.melotte@mind.be>
 <20240607163208.1445715-1-raphael.melotte@mind.be>
 <20240607163208.1445715-4-raphael.melotte@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720902982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c6QvhmAaQ3hQcyQGMMRaJq6yJbrP7geF9eJ6i2z4hJ0=;
 b=orkFHyJ40f6pa6uzo7XkCcoK7cncmPltqiFqTMTrjgfBo7gXpsIO3Lb8HFQrMo6ZMIWqhN
 6/4mKdaQQdniW1tuxR7q1t3HJrFlfZkGFa2WunUW0CTVMq0AS97dhV8tdrz9HkAYWtOGv5
 xXn3Ie0DLsMNqtwdrakNlizJMxvrT8WHAJtHHYRr/7APrbKbpovi9/5l/ob6KZkUQo4f44
 2CjWrqA6WyRznx6N4EOoHqCE8nqMXGiDxY4VgMzj+eRmmKGpVpf8qzOGp+A/YamoKqAFCo
 DF8ZIpvb3f8SRrCu+Mqm6efZlkj3XuMPSaPrkb/0VS6iCCzdPJrf5ilGDgbhxQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=orkFHyJ4
Subject: Re: [Buildroot] [PATCH v2 4/5] package/mupdf: bump to version 1.23.9
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCAgNyBKdW4gMjAyNCAxODozMjowNSArMDIwMApSYXBoYcOrbCBNw6lsb3R0ZSB2aWEg
YnVpbGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cgo+IEZyb206IEphbWVz
IEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgo+IAo+IERyb3AgcGF0Y2ggd2hp
Y2ggaXMgbm93IHVwc3RyZWFtLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbWVzIEhpbGxpYXJkIDxq
YW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgo+IFtidW1wIHRvIDEuMjMuOV0KPiBTaWduZWQtb2Zm
LWJ5OiBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFwaGFlbC5tZWxvdHRlQG1pbmQuYmU+Cj4gLS0tCj4g
IC4uLmlzc2luZy1saW1pdHMuaC1pbmNsdWRlLWZvci1VSU5UX01BWC5wYXRjaCB8IDcwIC0tLS0t
LS0tLS0tLS0tLS0tLS0KPiAgcGFja2FnZS9tdXBkZi9tdXBkZi5oYXNoICAgICAgICAgICAgICAg
ICAgICAgIHwgIDQgKy0KPiAgcGFja2FnZS9tdXBkZi9tdXBkZi5tayAgICAgICAgICAgICAgICAg
ICAgICAgIHwgIDIgKy0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDczIGRl
bGV0aW9ucygtKQo+ICBkZWxldGUgbW9kZSAxMDA2NDQgcGFja2FnZS9tdXBkZi8wMDAxLUFkZC1t
aXNzaW5nLWxpbWl0cy5oLWluY2x1ZGUtZm9yLVVJTlRfTUFYLnBhdGNoCgpBcHBsaWVkIHRvIG1h
c3RlciwgdGhhbmtzLgoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBDVE8sIEJvb3RsaW4K
RW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29t
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
