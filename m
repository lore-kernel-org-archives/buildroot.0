Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB92C3DA5D
	for <buildroot@archiver.kernel.org>; Wed, 17 Jul 2024 21:20:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83C02400B8;
	Wed, 17 Jul 2024 21:20:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AdWVIcZFsPN5; Wed, 17 Jul 2024 21:20:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E4C940E80
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E4C940E80;
	Wed, 17 Jul 2024 21:20:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 05C7F1BF385
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 21:20:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0063660AD0
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 21:20:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3zVbMCMg0o4Q for <buildroot@lists.busybox.net>;
 Wed, 17 Jul 2024 21:20:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E9A256071D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9A256071D
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E9A256071D
 for <buildroot@buildroot.org>; Wed, 17 Jul 2024 21:20:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 14C0740006;
 Wed, 17 Jul 2024 21:20:15 +0000 (UTC)
Date: Wed, 17 Jul 2024 23:20:15 +0200
To: "=?UTF-8?B?R2HDq2w=?= PORTAY" <gael.portay@gmail.com>
Message-ID: <20240717232015.2f015a10@windsurf>
In-Reply-To: <20240716054359.92966-4-gael.portay@rtone.fr>
References: <20240716054359.92966-1-gael.portay@rtone.fr>
 <20240716054359.92966-4-gael.portay@rtone.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721251216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0yK587y+Lrt6YITD2wyqzr6Qj4Py8tHVPAcX+aLapxM=;
 b=JgXjb2kiheXNjeb7IpbqKOuOWywZFfDF+3zTtsbl4h8KwGWxWdA6P08alQ9KcwypEY76YV
 aeWKo8rL3cgH8pxt/+m+Qg6wrFjXU0XNdnckGtCQ5XEdKEoX2Jo269n9p3ZlZbCoRPGFIy
 kT8HdRX16HEaeQ9ZvGCfqUtDYOtf1Ae1MKzqqDp9uPxsir7XPHkg60CB3gIjyuCwaosnfK
 G0v/y1olecp5tMkgZQ64p4xmZsC2uGYsxsc312vGdzDBXa320ZOJR8MXV0UQR7xeL3zVBV
 O4z60AZdJY+B6kt3g8NohlE419wXMIrHbvPkBfNZzzEcmDQCVRbj513O03s2Dg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JgXjb2ki
Subject: Re: [Buildroot] [PATCH 3/8] configs/raspberrypi3_64: install
 Compute Module 3 device-tree blob
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
Cc: =?UTF-8?B?R2HDq2w=?= PORTAY <gael.portay@rtone.fr>,
 Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCAxNiBKdWwgMjAyNCAwNzo0Mzo1NCArMDIwMAoiR2HDq2wgUE9SVEFZIiA8Z2FlbC5w
b3J0YXlAZ21haWwuY29tPiB3cm90ZToKCj4gVGhpcyBpbnN0YWxscyB0aGUgZGV2aWNlLXRyZWUg
YmxvYiBmb3IgdGhlIENvbXB1dGUgTW9kdWxlIDMuCj4gCj4gTm90ZTogVGhlIHJhc3BiZXJyeXBp
M19kZWZjb25maWcgaW5zdGFsbHMgdGhlIHNpbmNlIGE3MjZjN2RmZjgKCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeXl4gYSB3b3JkIHdhcyBtaXNzaW5nIGhl
cmUKClNvIEkgcmV3b3JkZWQgaXQgYSBiaXQuCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmks
IGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdp
bmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
