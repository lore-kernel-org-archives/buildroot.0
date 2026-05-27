Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ADB5CD4F54
	for <buildroot@archiver.kernel.org>; Wed, 27 May 2026 08:40:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6569941FA7;
	Wed, 27 May 2026 08:40:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DcFxveLe52Sp; Wed, 27 May 2026 08:40:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AFC641F98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779871234;
	bh=mf4TNz61nsyVLPFvYVbIwiCRddJR5hyyL/qSo4ckmaU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JsOkreRuzYkRCy1eNLK1WWrcEPz7FDmUT9kk1eqy46ZJwnho995GLUbP8Au2FAT7i
	 Yp5hiz8aCVkV2a/OQ14DF3jjRlzXCnPb2y8xaeyV4a1MgyXVdaVcaat7aig4AeT07U
	 ggOioAVcf3tL2Md0WtEL8roodex6uAifWJ+ik0chBKyOoUOYymWp7ustSOvEfGSBM9
	 l8dZoWMa1e7uHbVKnjT804f3Z+uGl/CnjuypqUSk1M/ph1vi8BU/iHEEoHKyOFnlCQ
	 Oe7a3EnKJNG4pypQK7rXtovAxeewdInnjlMfkNQdsaA91BygtYpA71IP15AajJWxlA
	 oGXWJN3t6vkQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AFC641F98;
	Wed, 27 May 2026 08:40:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 038CC21F
 for <buildroot@buildroot.org>; Wed, 27 May 2026 08:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D1AF461366
 for <buildroot@buildroot.org>; Wed, 27 May 2026 08:40:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AlDo82xU6VgO for <buildroot@buildroot.org>;
 Wed, 27 May 2026 08:40:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AE67161360
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE67161360
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AE67161360
 for <buildroot@buildroot.org>; Wed, 27 May 2026 08:40:29 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 05AD0C2C64B;
 Wed, 27 May 2026 08:40:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4CA47601A1;
 Wed, 27 May 2026 08:40:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 96D3D10888BA2; 
 Wed, 27 May 2026 10:40:24 +0200 (CEST)
Date: Wed, 27 May 2026 10:40:22 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Chen Pei <cp0613@linux.alibaba.com>
Message-ID: <20260527104022.480ea71d@kmaincent-XPS-13-7390>
In-Reply-To: <20260518185248.237609-1-ju.o@free.fr>
References: <20260518185248.237609-1-ju.o@free.fr>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1779871226; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=AyRnQ2WXyVudJ2quCE47M48W/1SfRKkCDJqJAN/74K4=;
 b=jm2yI0mWxqb7xN6V2pg07vADtrkXx4Fbp8CLkHfA7EiinO+mA3QAl2ilvgwfLAnE8ejnBY
 2h0FJY5Azhb08oeoGM9bUGYZsBm3E82j+nj/gP0GE68w/jrzGr2Lq6r/oLogD+jPs3V9Wd
 avYo/k7EZbTJl/fF2HbGigE+2bdiyZ/jjun1CMkHxx5ugizNhhuXyu//BqDrz2pqKSw5+Q
 xV5cFZg8twQJ3bGg4ZYuJDFOPyZCcAaCQ7V+LRthiQq4qltbLTJ/Doz9HwNzMFpnINIonP
 Wtj0xC/rODk8qrq2dgjMDU3/ORegsuYCQgd1SSwEs8PpkHudV+8A6+zzhCYVrQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=jm2yI0mW
Subject: Re: [Buildroot] [PATCH 1/2] package/drm-info: propagate json-c
 dependencies
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: Kory Maincent <kory.maincent@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCAxOCBNYXkgMjAyNiAyMDo1Mjo0NyArMDIwMApKdWxpZW4gT2xpdmFpbiA8anUub0Bm
cmVlLmZyPiB3cm90ZToKCj4gRml4ZXM6Cj4gCj4gV0FSTklORzogdW5tZXQgZGlyZWN0IGRlcGVu
ZGVuY2llcyBkZXRlY3RlZCBmb3IgQlIyX1BBQ0tBR0VfSlNPTl9DCj4gICBEZXBlbmRzIG9uIFtu
XTogQlIyX1RPT0xDSEFJTl9IQVNfU1lOQ180IFs9bl0KPiAgIFNlbGVjdGVkIGJ5IFt5XToKPiAg
IC0gQlIyX1BBQ0tBR0VfRFJNX0lORk8gWz15XSAmJiBCUjJfVE9PTENIQUlOX0hBU19USFJFQURT
IFs9eV0KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gT2xpdmFpbiA8anUub0BmcmVlLmZyPgoK
UmV2aWV3ZWQtYnk6IEtvcnkgTWFpbmNlbnQgPGtvcnkubWFpbmNlbnRAYm9vdGxpbi5jb20+CgpU
aGFuayB5b3UhCi0tIApLw7ZyeSBNYWluY2VudCwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQg
a2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
