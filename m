Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4893EC25B10
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 21:32:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1640342C2A;
	Fri, 10 May 2024 21:32:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1NAonrG1Q3AM; Fri, 10 May 2024 21:32:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29F2C42C2C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29F2C42C2C;
	Fri, 10 May 2024 21:32:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6F0B21BF36A
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 21:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5BEB9614FD
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 21:32:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fTav4V1Vg5Cn for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 21:32:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5E7566148F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E7566148F
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E7566148F
 for <buildroot@buildroot.org>; Fri, 10 May 2024 21:32:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C57A6FF802;
 Fri, 10 May 2024 21:32:24 +0000 (UTC)
Date: Fri, 10 May 2024 23:32:24 +0200
To: =?UTF-8?B?QW5kcsOp?= Zwing <nerv@dawncrow.de>
Message-ID: <20240510233224.7682c02d@windsurf>
In-Reply-To: <20240326172822.1820862-1-nerv@dawncrow.de>
References: <20240326172822.1820862-1-nerv@dawncrow.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715376745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nqeR6KYrQiCNOQyXYO/D7YUAkjPhiWTZB+eP+90uqBs=;
 b=f2U1kDl6BxoKtZhqkiz+eeOm5EDtAXyNEf4UnJLi0G8DApY/ZCI3Y4+Olr+keNnRIcyVLs
 mVnl0CfvmzwwFVIDUF6OSp2t2eCKTan3oUDXs9Ie0oVyM49ucfMrAFNeQQmh2U0aXO8Rk6
 Re/4Qq5+JMlSto73n1VDoA5w1i836IopYRJUls0WMq3uoM7EwdkKxJdVpu1gl8PP1hoLK8
 LCRP1WOByykYHpJldR4U3otce3REYStAxb1JA3k5K/zEvSraxIhavIhxgafYmp8rPXwTIu
 aQ+1nWLZ2N2TScWqKlImb5ef5SYyg0/c3OaW5tno5VcN0a52G5ErSac5YwDbVQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=f2U1kDl6
Subject: Re: [Buildroot] [PATCH] package/libkrb5: bump to 1.21.2
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

T24gVHVlLCAyNiBNYXIgMjAyNCAxODoyODoyMiArMDEwMApBbmRyw6kgWndpbmcgPG5lcnZAZGF3
bmNyb3cuZGU+IHdyb3RlOgoKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyw6kgWndpbmcgPG5lcnZAZGF3
bmNyb3cuZGU+Cj4gLS0tCj4gIHBhY2thZ2UvbGlia3JiNS9saWJrcmI1Lmhhc2ggfCAyICstCj4g
IHBhY2thZ2UvbGlia3JiNS9saWJrcmI1Lm1rICAgfCA1ICsrKy0tCj4gIDIgZmlsZXMgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKQXBwbGllZCB0byBtYXN0ZXIsIHRo
YW5rcy4KClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgQ1RPLCBCb290bGluCkVtYmVkZGVk
IExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
