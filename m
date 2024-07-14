Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95BE9C3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 15:06:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 633DF6062F;
	Sun, 14 Jul 2024 15:06:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t-G0W9ic96ZE; Sun, 14 Jul 2024 15:06:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFA8E60817
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFA8E60817;
	Sun, 14 Jul 2024 15:06:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 912BC1BF44A
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 15:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86C3A404EF
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 15:06:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dw_Vzs2Dw1OL for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 15:06:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0C1D4404F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C1D4404F4
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C1D4404F4
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 15:06:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3C969FF802;
 Sun, 14 Jul 2024 15:06:12 +0000 (UTC)
Date: Sun, 14 Jul 2024 17:06:11 +0200
To: "=?UTF-8?B?R2HDq2w=?= PORTAY" <gael.portay@gmail.com>
Message-ID: <20240714170611.6ba44e9f@windsurf>
In-Reply-To: <20240714135442.857934-1-gael.portay@rtone.fr>
References: <20240714135442.857934-1-gael.portay@rtone.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720969572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ap5YCyjYElSkwpxaQJVJPtvCM5dt2k5KJSQgpSfr3jc=;
 b=XNHNTk4E8WBdXNDdrVDk/zRuVL6vAAHmnXZcTjS9p/lN/RRvdnlnVg9gsbVwB6EDe0X2TP
 KLSOIIB4IGTGlC4BCI3ok/9quB1hA20Q7JlA1dwzJchtyOHXcHUxNQkoyTgCpDBcSy/CgS
 oYSNxwczJusBwc7sr0xSHFYG/bs6CXv7ZHgqAQ7q0c97TpiQKdhT7C/SGYR6qdK8prX/IH
 LcojeopBktw4CxIGE6sf6pVfqB9bJB0Cx4m0ot3v5EbKQ4UNkh3pM/raBNBidw4fLVBhOF
 HFSXnDXhhs5DYpHGAZNw51AHEncyHA+6CKTGrLxDHOv2EqpeDuZLrfxnlNtYLQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XNHNTk4E
Subject: Re: [Buildroot] [PATCH 1/1] configs/raspberrypi3_qt5we: fix path to
 in-tree device-tree blob
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
Cc: =?UTF-8?B?R2HDq2w=?= PORTAY <gael.portay@rtone.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCAxNCBKdWwgMjAyNCAxNTo1NDo0MiArMDIwMAoiR2HDq2wgUE9SVEFZIiA8Z2FlbC5w
b3J0YXlAZ21haWwuY29tPiB3cm90ZToKCj4gVGhpcyBmaXhlcyBjb21taXQgNTFiNDQyMTc1OCAo
Y29uZmlncy9yYXNwYmVycnlwaSo6IGJ1bXAga2VybmVsIHZlcnNpb24KPiB0byAxN2YxMzViICg2
LjYuMjgpKS4KPiAKPiBGaXhlczoKPiAKPiAJbWFrZVszXTogKioqIE5vIHJ1bGUgdG8gbWFrZSB0
YXJnZXQgJ2FyY2gvYXJtL2Jvb3QvZHRzL2JjbTI3MTAtcnBpLTMtYi5kdGInLiAgU3RvcC4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBHYcOrbCBQT1JUQVkgPGdhZWwucG9ydGF5QHJ0b25lLmZyPgo+IC0t
LQo+IEhlbGxvLAoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClRob21hcwotLSAKVGhvbWFz
IFBldGF6em9uaSwgQ1RPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5l
ZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
