Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B7ACC3DA42
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 15:26:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABE9782081;
	Wed, 10 Jul 2024 15:26:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1FGItGcjOT7e; Wed, 10 Jul 2024 15:26:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 375B3820C3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 375B3820C3;
	Wed, 10 Jul 2024 15:26:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 49C641BF5A7
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 15:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 446E0606D6
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 15:26:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7hv6Hg3rW5pw for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 15:26:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BC1BF606EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC1BF606EA
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BC1BF606EA
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 15:26:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3748FC0002;
 Wed, 10 Jul 2024 15:26:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Jul 2024 17:25:48 +0200
Message-Id: <20240710152551.332680-3-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240710152551.332680-1-kory.maincent@bootlin.com>
References: <20240710152551.332680-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: kory.maincent@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720625167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x7jD1Upmc0WOwiPsBsJYBsRVP5JKiOEOaZFCE5ba2oU=;
 b=Hs7oA03Hn1dJjDuy0bm02JkPIaz4AUiIn3Zd5j+f800/1+LGR2TfO9TWN9vhcADucNJyTA
 T9uNuzbFIwMGyLI50/3qeYl1Zmvi+0JhYRH+ChBZn/eQhWDLb9OaCUddy9hnD2RjxY05JQ
 JiAZBJjUbW3GkoB/41g7ZzlAFYpdUhhpPgRn1kPDEGukY8YvCy48NtYX5vSIb0HPa5R5/d
 hSNykg9oio53sPkCbuxwJn9KcF8crNdt2pAtj/MrNZOvHnMKzCzLNB/cZu/J67sGTTSQTi
 fjhOVPX55ogSZuyRRGyuPK9q21zu47jUPBc9A33IqPoXdYHBKHHLffVny0n7mQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Hs7oA03H
Subject: [Buildroot] [PATCH v3 2/4] package/python-click: Add support for
 host package
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
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Kory Maincent <kory.maincent@bootlin.com>, Asaf Kahlon <asafka7@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, thomas.petazzoni@bootlin.com,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add support for the host package to enable future support for
TrustedFirmware-M, which depends on it.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 package/python-click/python-click.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-click/python-click.mk b/package/python-click/python-click.mk
index 0e29ff034e..3223ab39ce 100644
--- a/package/python-click/python-click.mk
+++ b/package/python-click/python-click.mk
@@ -12,3 +12,4 @@ PYTHON_CLICK_LICENSE_FILES = LICENSE.rst
 PYTHON_CLICK_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
