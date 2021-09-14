Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFC1CC433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 19:28:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CD68600CD
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 19:28:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3CD68600CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D74AB403A5;
	Tue, 14 Sep 2021 19:28:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id reI6Z3XUQ1fi; Tue, 14 Sep 2021 19:28:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EA634039A;
	Tue, 14 Sep 2021 19:28:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A2AEB1BF228
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 19:28:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8DE084010F
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 19:28:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5fBYTcjSin9J for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 19:28:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C8C4F400A4
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 19:28:20 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id q26so5458wrc.7
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 12:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lTwzNscev2a4BDZAmKfusQIPVMRfh1OYN9kA8OuG7c0=;
 b=mrDh9/Ricnda2Hwux8ok67yj5q5gYKKesJP56KpK7seEXOAqVGF5FNK12w/nNPwM/b
 Q9M3OXp6bPyyj1JRABB5lcepmEgT9B2BIUnE1BaliXBPoBtaNoJs3+l9J0+88VLtNqkL
 Nw6HirS6nkDWM9rkB7Cl54YfLLNnhpEuxwL3Fj4nnai3vNBsRve31zaXkqz5Af2qHE80
 kKUuz7llSDIdyjmpSmT8+DsllIe5h04+6huEiqHErjFiUI41xY4eemGsQfXXwsw7XAaw
 lzqsImtB9r87yBzC62l3yAfH+UFlFqTR0Pmcdid1df1VvlkC73y9BHU79rMziX6LGHvW
 gEIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lTwzNscev2a4BDZAmKfusQIPVMRfh1OYN9kA8OuG7c0=;
 b=o5D2mXVQvC86HGOv1MwK557pel0+al0Yz+XeuFw6QjmV0zIbTLtNqCcXKCYL5jcv9M
 luWmvJ+WK4fqy3+NTMNek4s9ukZZPWtq2Vp9Xxn9Hpgpx/+OGI0G7cjyG9rlg+qeo/Ql
 Km53sFJPAjZKBOSYjPrbikTGZB7QLB3pRMQ8zU2ilcItKcqyYkIfBozRfUeO+BkAqAxq
 XU3PQvG7we7o2FC/VUYBaS8k2g0FutdJVUYm4Tw3K+lpC8G/VTJ0nnzVqsqdTZzTirPU
 GmeufdTmK7xl6ZNzs2Tp5l6/vKY1NnnsNt+RVBhHmHznuEXys9j82RuFR7lhAphKzLur
 cvFA==
X-Gm-Message-State: AOAM530/lUXRkKkpTQ4EwGSrHzqvPM76LOhBP64KObmqKVDInwuNVXWQ
 Z0L5h4i1y7emdVqdVDqLYq3h6AsSLfNZDv38
X-Google-Smtp-Source: ABdhPJzGhzkZ3x+EjKxENkYO3Nduw9I/D6q9EsftqD3fK5gAigc2OtN+HQ3wtWLDoHHJ45twArnYPQ==
X-Received: by 2002:a5d:444a:: with SMTP id x10mr870459wrr.360.1631647698839; 
 Tue, 14 Sep 2021 12:28:18 -0700 (PDT)
Received: from t450s.fritz.box (ip5f5bdc1b.dynamic.kabel-deutschland.de.
 [95.91.220.27])
 by smtp.gmail.com with ESMTPSA id q19sm2021878wmq.29.2021.09.14.12.28.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 12:28:18 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 14 Sep 2021 21:27:42 +0200
Message-Id: <20210914192741.26306-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] boot/uboot: fix hook to copy imx firmware files
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Simplification has broken it. Fix it again.

Fixes: af99e7a5f3863049 ("boot/uboot: copy IMX firmware files to uboot package dir")
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 boot/uboot/uboot.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 184f822af4..2eb1792de9 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -194,7 +194,7 @@ define UBOOT_COPY_IMX_FW_FILES
 		cp $(BINARIES_DIR)/$(fw) $(@D)/
 	)
 endef
-UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_IMX_DDR_FIRMWARE
+UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_IMX_FW_FILES
 endif
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_DTC),y)
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
