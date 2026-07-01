Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E3ECC43458
	for <buildroot@archiver.kernel.org>; Wed,  1 Jul 2026 06:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8F3C41583;
	Wed,  1 Jul 2026 06:10:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hLKA9qNCwsqp; Wed,  1 Jul 2026 06:10:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC71540B50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782886258;
	bh=hxB7lj7byGaHBmteZtTXiiy9OYHYYg38ssnsUqOEfjo=;
	h=From:To:CC:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rzgNoW3xLpiHFC/gR62Z+9ZbutnEUhpW5vzEjcQI1cclz7AA6ak6PW0js8MrLaitl
	 JlVdQelOaSOKjbb6Vu1vwXUYvTcMzFA9padTxwlVjglXai2qV18/uAAMdZsXfoiTrD
	 uCwoJzLs4meMWFJEesiyXlzCaE3dsma//LcbwjhlZCLZV8zOJefy9jtz22iQNP1zXl
	 hFfbbrTx+X+F1D6Jhk919A+ML03FSDGKvIrIUHQsFA88CojpOdx1Mvjr6E1o2AtVHQ
	 1mtXXWwL22flm1t/ZAxhU240gaqS3P6AzeEVcT/lwgZkzFz/R2M86suzoo689mJuwG
	 /dwcOG47IORdA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC71540B50;
	Wed,  1 Jul 2026 06:10:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E02F62D5
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 06:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C18384025C
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 06:10:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id arZ9Z2WNnmUq for <buildroot@buildroot.org>;
 Wed,  1 Jul 2026 06:10:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.124;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B4E1340201
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4E1340201
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B4E1340201
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 06:10:53 +0000 (UTC)
X-CSE-ConnectionGUID: 1KfUVrWURZG1+FLY11CiRA==
X-CSE-MsgGUID: rYtOSBP1QsKi9osTZcuEQQ==
Received: from unknown (HELO opfedv1rlp0e.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 01 Jul 2026 08:10:50 +0200
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0e.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 08:10:50 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43;
 Wed, 1 Jul 2026 08:10:49 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Wed, 01 Jul 2026 08:10:48 +0200
X-CSE-ConnectionGUID: NE9tUZPmSdKk/JP4X4Rp7w==
X-CSE-MsgGUID: u5N1GKK7QZCc4ArjCiBkwQ==
X-IronPort-AV: E=Sophos;i="6.24,235,1774306800"; d="scan'208";a="444845370"
X-Amp-Result: SKIPPED(no attachment in message)
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>, Raphael Pavlidis <raphael.pavlidis@gmail.com>
Date: Wed, 1 Jul 2026 08:10:48 +0200
Message-ID: <6f000416ccf3c83ade242ea0619c1df08aa9af64.1782886248.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1782886254; x=1814422254;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LsgXZe4tK3NXr6tlbtp1NtB2Vbz/q/MGR2m2ks+rNgw=;
 b=Gt44x5/D9vPsCvlJEHdbyZ6RQHh9JDoqXwYDWnzf4JlIX6ciYqiu7pmr
 wkqdoIOLV6qkrW5BYgj/XB6X4Xr3JXhlFmuligGeE6kDubtFboG/zOEQd
 DMJqO5cjMekBiCSGPWjEnIBnoHTSqTr7OLoqn1Erv2ojujIVls1qvwfaI
 Yl8SkfzOzqR/vK+0xaoL/WcXmvwIew2ZW6Y3pMsMw0/su5VgY3n8VNmqL
 cN90HfsmiP8Mk56n2iKpSKfbFcUdUhJgGnzXPfbLGj6ffAG9hQQPgbgt/
 lTy8gTay83Nr68rQzOP1s1B4na8zAgtUdqm/5RBv7Jey8J9uGrWsbqkVr
 Q==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=Gt44x5/D
Subject: [Buildroot] [PATCH] package/shadow: needs host-pkgconf
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

Since version 4.14.0 and upstream commit 2a5b8810bb17, shadow has
required pkgconfig to find libbsd.

Add a dependency on host-kgconf.

Fixes: https://autobuild.buildroot.org/results/90f/90ff13ff4c519b0606888eaa90acbd8cd0c0f73a/

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>

---
Can be backported to all maintenance branches still active, as the
oldest already contain shadow >= 4.14.0, and so are affected.
---
 package/shadow/shadow.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/shadow/shadow.mk b/package/shadow/shadow.mk
index cf05fc1bdc..5f9b69ef88 100644
--- a/package/shadow/shadow.mk
+++ b/package/shadow/shadow.mk
@@ -10,9 +10,12 @@ SHADOW_SOURCE = shadow-$(SHADOW_VERSION).tar.xz
 SHADOW_LICENSE = BSD-3-Clause
 SHADOW_LICENSE_FILES = COPYING
 SHADOW_CPE_ID_VENDOR = debian
-SHADOW_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 SHADOW_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 
+SHADOW_DEPENDENCIES = \
+	host-pkgconf \
+	$(TARGET_NLS_DEPENDENCIES)
+
 SHADOW_CONF_OPTS = \
 	--disable-man \
 	--without-btrfs \
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
