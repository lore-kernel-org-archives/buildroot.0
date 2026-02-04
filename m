Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE48E95396
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 12:44:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7FA560717;
	Wed,  4 Feb 2026 12:44:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d1OXvDnI51LC; Wed,  4 Feb 2026 12:44:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9EF9607F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770209073;
	bh=CtuwIQ8LSz5w+8y4XFaIl1GYzFnD0+rrKgX982n+cIs=;
	h=From:To:CC:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hVJg59VfdEo75zpavR2BOx0zDBxkreE0A7C1ZJAs3Chx9glALNOwHBvKaWPnwq1FE
	 Q02j0yfNmhYYnsgg91o3bfnbnVDj7QETPTIJj8LZxyJgNyzydxlRXPumwFw9eXGw3N
	 UGNIxKGnjnEd2akaYzx51M7BuFIWSefKMf9sU0/5O+Swnl6srOXUpcgrkDavYmRDk/
	 BoEczOInSMW/6JIgBjenwr1NdlI7lRqWnGS0SX22kyN1hGvxZLl0Pjtv/UyCQcV/ZX
	 zkpY79UG/vG+Wt2KJYFOIDi+ZgvdPfMC6dkqy6WFW5xGuHyt60CP1IV8e3bz3dIYY0
	 Zfp0rT93KsYrQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9EF9607F0;
	Wed,  4 Feb 2026 12:44:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6147BF4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 12:44:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 412A8400FB
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 12:44:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gz4HO5fWpgH4 for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 12:44:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.123;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 180AA40363
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 180AA40363
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.123])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 180AA40363
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 12:44:28 +0000 (UTC)
X-CSE-ConnectionGUID: jSCuCbeNROKB47Rm7G900A==
X-CSE-MsgGUID: mYAw8SFXReSl0KqONKtKVw==
Received: from unknown (HELO opfedv3rlp0c.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 04 Feb 2026 13:37:20 +0100
Received: from unknown (HELO OPE16NORMBX507.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0c.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 13:37:20 +0100
Received: from OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] by
 OPE16NORMBX507.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Wed, 4 Feb 2026 13:37:19 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61;
 Wed, 4 Feb 2026 13:37:18 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Wed, 04 Feb 2026 13:37:17 +0100
X-CSE-ConnectionGUID: juqLwwyJTkCQoSoz9Mm3FA==
X-CSE-MsgGUID: rfK2QyNsS5Ko/nHJrqMGsQ==
X-IronPort-AV: E=Sophos;i="6.21,272,1763420400"; d="scan'208";a="389103464"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>, Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed, 4 Feb 2026 13:37:15 +0100
Message-ID: <4c48662c61c8013e554a69d28bdc2216e32a5973.1770208629.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1770208629.git.yann.morin@orange.com>
References: <cover.1770208629.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX601.corporate.adroot.infra.ftgroup
 (10.115.26.29) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1770209069; x=1801745069;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xrumCI7yVA4WJYZzAN7io3ojdW94TWrV2Jjpu0WSkDA=;
 b=W7baiv6iEKY5frjdTWrj2SHwjXxuxqFGdEyqY1IMZjOSEeL5Vx/u/Zqz
 mV7Da9oGa9pPDH0PQkfkHhaWlHmelaBFJVLlz01egAZO/nJvgnbyoRjpB
 rr13SFf31Yxe1xZA8iRInmPTWfN9qPwuJAAnvF/TQujquy0mtt0tIoVwp
 ZARDb4kzzE8JQU2a+uUHi9HW9T4WvsXBA5gYuq27FBZfEhk+Z+5jFjhDT
 NK+KZ07QNDWdiGZKpsZclfZe9B5aKvXvkQClEuveVYvDlhCaQ54rYyCD6
 shJUrss1j2YXPFgF6cWKtfxGlN8XRl8BcTFt6VvV7MxhkCWGLap5wBFP2
 A==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=W7baiv6i
Subject: [Buildroot] [PATCH 2/3] package/blake3: bump to version 1.8.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/blake3/blake3.hash | 2 +-
 package/blake3/blake3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/blake3/blake3.hash b/package/blake3/blake3.hash
index 6bcfefb2b8..6e7d02db6c 100644
--- a/package/blake3/blake3.hash
+++ b/package/blake3/blake3.hash
@@ -1,5 +1,5 @@
 # sha256 computed locally
-sha256  6b51aefe515969785da02e87befafc7fdc7a065cd3458cf1141f29267749e81f  blake3-1.8.2.tar.gz
+sha256  5a11e3f834719b6c1cae7aced1e848a37013f6f10f97272e7849aa0da769f295  blake3-1.8.3.tar.gz
 sha256  00fcc7a934ddbc9ece2a7cc063ac788e284b703b1d705ccbba72d462aa97921e  LICENSE_A2
 sha256  a5695f57ea0c221e0e8b7d784ff774c35e88c3d3270353646a925880bb3492cc  LICENSE_A2LLVM
 sha256  a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499  LICENSE_CC0
diff --git a/package/blake3/blake3.mk b/package/blake3/blake3.mk
index 1055a2c073..a2094fc4c0 100644
--- a/package/blake3/blake3.mk
+++ b/package/blake3/blake3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BLAKE3_VERSION = 1.8.2
+BLAKE3_VERSION = 1.8.3
 BLAKE3_SITE = $(call github,BLAKE3-team,BLAKE3,$(BLAKE3_VERSION))
 BLAKE3_SUBDIR = c
 BLAKE3_LICENSE = Apache-2.0 or Apache-2.0 with exceptions or CC0-1.0
-- 
2.34.1

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
