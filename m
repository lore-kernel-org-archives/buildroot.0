Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F587C433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 07:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B9F20404B9;
	Wed, 27 Apr 2022 07:25:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gBDfJbErPxYN; Wed, 27 Apr 2022 07:25:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C95A14016A;
	Wed, 27 Apr 2022 07:25:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E078E1BF48C
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 07:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCFF882E5F
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 07:25:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PEjDCDa-Sssz for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 07:25:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A42C282D49
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 07:25:44 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id 125so1822036iov.10
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 00:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MZH/W1zM1Kf1Z+iiWkNVZy5au1WfRA2nlLMf1Emq/K4=;
 b=ns1h0erJlu5vrcpvqx9GdRV/j+TuzYA8rSyDYVUN9Ctxb0C/zS+Qx+viwSP5C6DnlF
 lSAa+i6QabZ7X6vHdC8SME9f9N0ByGLpiR3OQT4hbyJkT3GiuAQ/Venz8tQJKO37p+wt
 xIDAkzJuXJJMdB/XKoY51WuVUr6xmm52zn/fuPdI9fUl+/V5tNcegJrTjBAp38RJRYId
 KRgq9ko5gQLrx0cdBhcLxPvqE9yR6Y+wblipGboc6qD/CE6BfVwcQLSF0+2QdutM5ewA
 JaOZlY2qy++QeJUalZRcqv1PnPBvgQtqo88eg4y/28pyu+A2/lT2L37bi0n0k//qfA+/
 40mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MZH/W1zM1Kf1Z+iiWkNVZy5au1WfRA2nlLMf1Emq/K4=;
 b=c4TgwWA5WO/GYbf9XXpE3swUp8dwIvHYdHYl29bmvS6LQuYHUjosNgra6YbDCiJ6WP
 SP6XW5lXdz2dToc/Sty76jKGDDIvluBd33Ml+fcq5PzdWPRRk/tc6EMxixg5Q2vbDAae
 5rZhLD+HUR7pTJl/Y/GSQpdh9c5f0x3i6+vMrCuzU+pLdmec8sK6RfnOIcJ9DCnz+H0j
 HXkXHaRRonUqCe6uPzji+imhi0gDaJoPS6C2lZl0Sy2uqv3f8eckUbN5fyPYKrj1//5H
 EuxANb6ll3dV2CA7tgNG8v9OP0bJ/W7PvVV71Dr5spwOfEKInJMWANelgUrqWZLzEQX0
 isgg==
X-Gm-Message-State: AOAM533IaeG2eOi4QuDdEEnZJYKer1GDsgAp4AwO2C1uttTx0uENNBTd
 LcxUCwQAyO3N8G6yNUFxK1m9hiC/bk4=
X-Google-Smtp-Source: ABdhPJxrCKLMMhwRBN7IcD0RI0wSpttmiohCVzl4aijfZSkF7oq5ZpPZhBYpSm75WPYOL6Ue7KQ7EQ==
X-Received: by 2002:a05:6602:1510:b0:657:277e:8096 with SMTP id
 g16-20020a056602151000b00657277e8096mr11345844iow.152.1651044343462; 
 Wed, 27 Apr 2022 00:25:43 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 y4-20020a92d0c4000000b002cd8a7db5f5sm6355472ila.11.2022.04.27.00.25.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 00:25:43 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Apr 2022 01:25:41 -0600
Message-Id: <20220427072541.4082648-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] package/wilc-driver: add missing
 BR2_LINUX_KERNEL dependency
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Kris Bahnsen <kris@embeddedTS.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
 - http://autobuild.buildroot.net/results/40b/40b8aa0c19917f64c3f272f5479068e7631ffcc3

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - add comment when !BR2_LINUX_KERNEL
---
 package/wilc-driver/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/wilc-driver/Config.in b/package/wilc-driver/Config.in
index caf46ae281..24a7b05b17 100644
--- a/package/wilc-driver/Config.in
+++ b/package/wilc-driver/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_WILC_DRIVER
 	bool "wilc kernel module"
+	depends on BR2_LINUX_KERNEL
 	help
 	  External kernel module for WILC1000/3000 devices.
 
@@ -16,6 +17,9 @@ config BR2_PACKAGE_WILC_DRIVER
 
 	  https://github.com/embeddedTS/wilc3000-external-module
 
+comment "wilc kernel module needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
 if BR2_PACKAGE_WILC_DRIVER
 
 config BR2_PACKAGE_WILC_DRIVER_SPI
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
