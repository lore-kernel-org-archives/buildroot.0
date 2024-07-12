Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C66CFC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 15:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20A2E41494;
	Fri, 12 Jul 2024 15:35:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fb07Ou0kb723; Fri, 12 Jul 2024 15:35:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 162CF41497
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 162CF41497;
	Fri, 12 Jul 2024 15:35:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B114E1BF5D7
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 15:35:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F831611DE
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 15:35:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lBDW-tCzhXNG for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 15:35:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9AEC060590
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9AEC060590
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9AEC060590
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 15:35:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 61E97C000A;
 Fri, 12 Jul 2024 15:35:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 17:35:06 +0200
Message-Id: <20240712153509.2583089-2-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240712153509.2583089-1-kory.maincent@bootlin.com>
References: <20240712153509.2583089-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: kory.maincent@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720798512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2HoIhn13OR/sFqoYWsbe8Xj84GdEStwQENaLEFpWAr4=;
 b=lrMe3qlH93a6RlZ0sXAZAUE2o4onBhM9WFtNKe4T/3fE63sQIj7HvW8p4dKrJEpzfrn93b
 OCAmNXEHOXOGXbDj5BpTVfHUm9oPvzla4lZlpKez8I/v1SjZE4XqppTUBG00WPxlAs70K3
 YbPldad8khsHYkfk2QSHzQ3JBThciC6Qw4rv98VZZahhKzwRIfdthe6vnzeG3Wb+whILCp
 Fsh3ZEPkR6TbmApFpU+FhP5cptgs+ipW8ofkE1mI7XC81rA/x6BfWNeTNFggS51hgvfG4F
 na62Du2SqPPBjFZCpZTHvBH8P8GijB1OG/kOr91nLl2a/omj1ZAZSrxmnOo6xw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lrMe3qlH
Subject: [Buildroot] [PATCH v4 1/4] package/python-intelhex: Add support for
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
 package/python-intelhex/python-intelhex.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-intelhex/python-intelhex.mk b/package/python-intelhex/python-intelhex.mk
index cc8b973f0f..56f758e643 100644
--- a/package/python-intelhex/python-intelhex.mk
+++ b/package/python-intelhex/python-intelhex.mk
@@ -12,3 +12,4 @@ PYTHON_INTELHEX_LICENSE = BSD-3-Clause
 PYTHON_INTELHEX_LICENSE_FILES = LICENSE.txt
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
