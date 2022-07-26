Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC4BC43334
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 13:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C39BA84745;
	Tue, 26 Jul 2022 13:13:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C39BA84745
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FbQ35txKL5DA; Tue, 26 Jul 2022 13:13:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1301840DE;
	Tue, 26 Jul 2022 13:13:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1301840DE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F36C21BF2B4
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 13:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D9CD840248
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 13:13:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9CD840248
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nsds73ZBpDRG for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 13:13:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 299D540167
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 299D540167
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 13:12:59 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 157F8240004;
 Tue, 26 Jul 2022 13:12:55 +0000 (UTC)
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Buildroot List <buildroot@buildroot.org>,
 =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>
Date: Tue, 26 Jul 2022 15:12:46 +0200
Message-Id: <20220726131249.2009383-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658841177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JOYv8jGcuejLEJVFzZubyyS7bTGqTaY6Wldy4Y+M9Lg=;
 b=Z10uio/DxG6CbVCG6UolEfgZf3AqiO5QpdsmiEj5VheMqdIxFDb2DPLioiNkla7lSvgjPL
 STZvZgQVPpGpVkILR7hPq3tlseuCIv7hLiicrUr1aE2rUtMun3f5vEvZqs/srJJa24xqrs
 OrZ/xDj9wGXNFaVYZFf6MvUsCr2FAwwHo7m5u9Dq4MjWWP7e76Xyz2vZF2riPSEFaoB46f
 TsXTysWVYU3yG/PoFm/QRdZWm4gZ67iA7BGcYgCj77srgtVVU4EejylhWf4ff2KbTc+RBm
 QPPrgxSRs++Z1R1YMOzHD5DNGg88EzybrL7kHu/tupYdWve+HSWvTnt099zASQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Z10uio/D
Subject: [Buildroot] [PATCH 0/2] Add support for configurable page size on
 ARM64
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpIZXJlIGlzIGEgbmV3IGl0ZXJhdGlvbiBvZiB0aGUgc3VwcG9ydCBmb3IgY29uZmln
dXJhYmxlIHBhZ2Ugc2l6ZSBvbgpBUk02NCwgYmFzZWQgb24gZWFybGllciB3b3JrIGZyb20gxYF1
a2FzeiBTdGVsbWFjaAo8bC5zdGVsbWFjaEBzYW1zdW5nLmNvbT4sIGJ1dCBmYWlybHkgc2lnbmlm
aWNhbnRseSBjaGFuZ2VkLgoKSG9wZWZ1bGx5IHRoaXMgaXRlcmF0aW9uIGNhbiBtYWtlcyBpdCB3
YXkgdXBzdHJlYW0hCgpUaG9tYXMKClRob21hcyBQZXRhenpvbmkgKDIpOgogIHBhY2thZ2UvdWNs
aWJjOiBkZWZpbmUgQlIyX1VDTElCQ19UQVJHRVRfQVJDSCBmb3IgQVJNNjQKICBhcmNoOiBhZGQg
c3VwcG9ydCBmb3IgY29uZmlndXJhYmxlIHBhZ2Ugc2l6ZSBvbiBBUk02NAoKIGFyY2gvQ29uZmln
LmluLmFybSAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDI1ICsrKysrKysKIGFyY2gvYXJj
aC5tayAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDExICsrKysKIGFyY2gvYXJj
aC5tay5hcmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA5IC0tLQogbGludXgvbGlu
dXgubWsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDggKysrCiBwYWNrYWdlL3Vj
bGliYy9Db25maWcuaW4gICAgICAgICAgICAgICAgICAgICAgfCAgMSArCiBwYWNrYWdlL3VjbGli
Yy91Y2xpYmMubWsgICAgICAgICAgICAgICAgICAgICAgfCAxMyArKysrCiAuLi4vdGVzdHMvdG9v
bGNoYWluL3Rlc3RfYWFyY2g2NF82NGsucHkgICAgICAgfCA2NSArKysrKysrKysrKysrKysrKysr
CiA3IGZpbGVzIGNoYW5nZWQsIDEyMyBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQogY3Jl
YXRlIG1vZGUgMTAwNjQ0IHN1cHBvcnQvdGVzdGluZy90ZXN0cy90b29sY2hhaW4vdGVzdF9hYXJj
aDY0XzY0ay5weQoKLS0gCjIuMzcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
