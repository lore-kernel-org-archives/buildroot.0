Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E19C3DA61
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 16:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEC21605D2;
	Sun, 21 Jul 2024 16:18:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2vFW4oEB-CWK; Sun, 21 Jul 2024 16:18:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6CCE605F0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6CCE605F0;
	Sun, 21 Jul 2024 16:18:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B02621BF321
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:18:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9DDAD605F0
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:18:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t93RilGXGBum for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 16:18:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 93F1B605D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93F1B605D2
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 93F1B605D2
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 16:18:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 68073240006;
 Sun, 21 Jul 2024 16:18:20 +0000 (UTC)
Date: Sun, 21 Jul 2024 18:18:19 +0200
To: "J. =?UTF-8?B?TmV1c2Now6RmZXI=?= via buildroot" <buildroot@buildroot.org>
Message-ID: <20240721181819.48656d0c@windsurf>
In-Reply-To: <20240719-micropython-v1-1-9d71f1125e49@gmx.net>
References: <20240719-micropython-v1-0-9d71f1125e49@gmx.net>
 <20240719-micropython-v1-1-9d71f1125e49@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721578700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5BAy0LohMpln98jbSA9yfpTLfuGMQ39YWT0JuU0SYWk=;
 b=Zr9AaRRz5Hj4w7fGi7W/Y+oLBthnFKlEEuS9mECRbUt7/KuXVYrjkA4qG2qCP6+Rbqdjo0
 0MPvM84AFDTuPtdT0yEqEeoo/JM6L8Fb+Un5ewHTSrUtG4No0kz7waqY00ZK6x99wHrNsf
 dGUB8j8ax/TO1owJd8dBpRBxACn9QIdUvrN1pQGHPdgkaKoGQTzzyQzd3DnSdKP4XHOl3Q
 e+Bmu8zGC4GR58GX+7qbPd5MaBfzLrFhLNtC/jbNarq14KGUU4vxs99YsWt6asU34Sqqox
 iiv3hK4iej2W/ohwtdaysrqlxLDWJk5Pv5xgQ/bSm2vx5+8zzyURA/FjDMEZmg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Zr9AaRRz
Subject: Re: [Buildroot] [PATCH 1/2] package/micropython: Change URL to HTTPS
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
Cc: Chris Packham <judge.packham@gmail.com>,
 "J. =?UTF-8?B?TmV1c2Now6RmZXI=?=" <j.neuschaefer@gmx.net>,
 "J. =?UTF-8?B?TmV1c2Now6RmZXI=?=" <j.ne@posteo.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCAxOSBKdWwgMjAyNCAxNjoxNzo1OSArMDIwMApKLiBOZXVzY2jDpGZlciB2aWEgYnVp
bGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cgo+IFNpZ25lZC1vZmYtYnk6
IEouIE5ldXNjaMOkZmVyIDxqLm5ldXNjaGFlZmVyQGdteC5uZXQ+Cj4gLS0tCj4gIHBhY2thZ2Uv
bWljcm9weXRob24vQ29uZmlnLmluIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKCkJvdGggYXBwbGllZCwgdGhhbmtzIQoKVGhvbWFzCi0tIApU
aG9tYXMgUGV0YXp6b25pLCBDVE8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBl
bmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
