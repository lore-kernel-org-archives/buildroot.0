Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 381FEC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 14:14:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F40F2610CE
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 14:14:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F40F2610CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFC7040505;
	Sun, 12 Sep 2021 14:14:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SYo6LIrU_q7D; Sun, 12 Sep 2021 14:14:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B66740477;
	Sun, 12 Sep 2021 14:14:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 789691BF471
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 14:13:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6868E826DF
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 14:13:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3n5DMYfpuVFC for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 14:13:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7BD16825C6
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 14:13:28 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id u16so10397114wrn.5
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 07:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9jDFq4uW8y84lqXQbG1jqB+UMTaZHZlInySTN82ZiOY=;
 b=fQ2QE5iuPnrt8Gq+ythp8R+qp7tNrvx+qumrTBuSl7SP4bruT1AYR4KrbHtxm2BT7m
 qDsYpq6bDkHo+FXrcjj6ifn5xTWBBm6Nt7XbFt4lTZkD1Nbntf3OfrrLmANw9u6SYJbU
 sG2j6ypygHPWDz5Ss4m9Oygs8QLCsSTZ5cgzvJz3t3UY0ZXU8CpTsezNT1EvaXMxxQKS
 ibXzwBNKGBv1GZED/Xpu1uzLJo915bnK9/Wm+W9N66LwA/ZfyAbBL1ARorIqU//Mdvwf
 XE+1Z7Ik8CHVqcohsf+qd6bz7NBbJ3Grjum9Q0EA6Uhe0r6pZfSrla+xT8NEuM/A8TxO
 DRDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9jDFq4uW8y84lqXQbG1jqB+UMTaZHZlInySTN82ZiOY=;
 b=z5ObAUYQcEwGGf0uCiDMR/etbjf/NmpGQw+yiGwH7KUC2LaxTPA8oeZ3af7o913Qjo
 5LP1eKZQPE4IOGz8QLzgRYvPsuvS7ZtQFBCyVeQHWeHKF6lVxrICpRmorn9/QS40/i76
 ekGZpolFqjmf5eOxyl/dLDRGNVwgBbzEnHh53/gRKfvE9xsbElGf2JLBIq7lftlJG5Va
 VyVkodEsfeYSu7vUSNtMyjSbn2PpesfKIZ091RvzVF22Lja0Bv7KPa4HtqTDj3KM49o+
 KudeMx3VPDHVhYA7risEeb/ZdH3O6hnMvJNuV2FWg1VqZiS8d7UjvI6WYrGe5/ZaKnVD
 kPLg==
X-Gm-Message-State: AOAM532FvZOSiC/7fIGvFCaRU00kUIJxvV87eGKlIvBBELQ69ssMRQIq
 xitHv1YsLje7EeEWubZ4xfj0CjBJnWI=
X-Google-Smtp-Source: ABdhPJxg9I4+JbqpFd/uCZxxguoCF3XXvK1LLH3JMDzLNxPftpzJ+KK3YNiZVs8MJqSSDzmP6BY3Qw==
X-Received: by 2002:adf:e445:: with SMTP id t5mr7829157wrm.52.1631456006880;
 Sun, 12 Sep 2021 07:13:26 -0700 (PDT)
Received: from localhost.localdomain
 (2a01cb058f8a180022164e4eb697b4ce.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:2216:4e4e:b697:b4ce])
 by smtp.gmail.com with ESMTPSA id u23sm4183826wmc.24.2021.09.12.07.07.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 07:13:26 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 16:06:45 +0200
Message-Id: <20210912140658.253602-3-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210912140658.253602-1-romain.naour@gmail.com>
References: <20210912140658.253602-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 03/16] support/testing: test_f2fs: bump to
 kernel 4.19.204
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

The kernel 4.16.7 curently used by the test doesn't build with host
gcc >= 10 due the gcc default -fno-common. See GCC 10 porting guide [1].

/usr/bin/ld: scripts/dtc/dtc-parser.tab.o:(.bss+0x20): multiple definition of `yylloc'; scripts/dtc/dtc-lexer.lex.o:(.bss+0x0): first defined here

Bump to the next LTS release.

[1] https://gcc.gnu.org/gcc-10/porting_to.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 support/testing/tests/fs/test_f2fs.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/fs/test_f2fs.py b/support/testing/tests/fs/test_f2fs.py
index e6872f39c1..2d05a86418 100644
--- a/support/testing/tests/fs/test_f2fs.py
+++ b/support/testing/tests/fs/test_f2fs.py
@@ -20,7 +20,7 @@ class TestF2FS(infra.basetest.BRTest):
         # BR2_TARGET_ROOTFS_TAR is not set
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.204"
         BR2_LINUX_KERNEL_USE_DEFCONFIG=y
         BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
         BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
