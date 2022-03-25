Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E154C433EF
	for <buildroot@archiver.kernel.org>; Fri, 25 Mar 2022 21:24:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD5C5827AA;
	Fri, 25 Mar 2022 21:24:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jMm5S5huN5pF; Fri, 25 Mar 2022 21:24:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0C2A826B0;
	Fri, 25 Mar 2022 21:24:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EFA011BF380
 for <buildroot@lists.busybox.net>; Fri, 25 Mar 2022 21:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DDCC14186F
 for <buildroot@lists.busybox.net>; Fri, 25 Mar 2022 21:24:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4dvFlYRGkt1Y for <buildroot@lists.busybox.net>;
 Fri, 25 Mar 2022 21:24:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C56741863
 for <buildroot@buildroot.org>; Fri, 25 Mar 2022 21:24:08 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-de48295467so9322218fac.2
 for <buildroot@buildroot.org>; Fri, 25 Mar 2022 14:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C2YDgFmCpUtY5MCCyYsSIT3nw10w8G+TUkOVvU3hIH4=;
 b=VYqI/TxvlgXWJ1R1y5nAduwULZnyc07wJIn5xMdeoGO5QUZY6smGQrrLQBoD2UzKS3
 2yIomI7m4Oq3/NmLxtcpkF44mxXaMbVaKlN0DDqvcjFtGL73ogGd6smREVmyHGLdqXQg
 mq83QuNHiPwhD82Rq/17IvY/ByVyy345VDkt+g9n7UKEFoV0AI3X2Op8vIKtKUwBRoNx
 9xFR8XQDkrWIjVuuRoI14XhAXSI876/zxMZPtCEk4fddIk42cbkiKH8bJHFW+WIxvJO8
 Ay+jQLraFwBMS0hKUnPwv1PbabQRFqVte/8w8vwx2ZER7IJd1sI/5wTJf6YwOlzcHDEX
 5WPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C2YDgFmCpUtY5MCCyYsSIT3nw10w8G+TUkOVvU3hIH4=;
 b=ndePzBennEKWDr6jVBTdt6QhQ5vgkqA1GfdsH2rw9ndSmMS2axQU0qZTYuVZvEhfyJ
 WxK5PugvoziiRQjBB+lBndu9q2oTvmvAIjl4SgoTxzcPlhEdKhoxz/HjtYEEBIvG3RML
 mtvqJ9siHp83qiQxePXD2E39em0pYIkV98E9oUaqAvdPmbkpUOX4rYvD+kPAC5vIDnbk
 ku9zQgbBmzp2qbZcycRBrr+3lxxSJB3rbvtlTJF5KKIKgtXX9IoHl9DYlzVkjBSET9Fy
 gGDPFxGr828QN5vpqPbzw4IE2m60giKqGwEGZpR7E1FOP+0+xzpEiRJeuf8Z0cmZk3wY
 yWXw==
X-Gm-Message-State: AOAM533bnYIk3swjWRUuWV/5H6vnxMVvNZQOiNkFitiddJCjatW3Pz1G
 UZ6zLyLFWVcym5pT5VVgBuB5aNGH9jyTmA==
X-Google-Smtp-Source: ABdhPJxlRDf7QzBqEBz2QDXzgQv4wgKhWCdVs8k8mHSzN5FggXI8wRuD0i5Hxhx67bzfBC0J1QM/4Q==
X-Received: by 2002:a05:6870:c154:b0:dd:986c:afa9 with SMTP id
 g20-20020a056870c15400b000dd986cafa9mr5913698oad.160.1648243447726; 
 Fri, 25 Mar 2022 14:24:07 -0700 (PDT)
Received: from james-x399.localdomain (71-218-122-133.hlrn.qwest.net.
 [71.218.122.133]) by smtp.gmail.com with ESMTPSA id
 t4-20020a0568301e2400b005c9781086d9sm3178739otr.9.2022.03.25.14.24.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 14:24:07 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 25 Mar 2022 15:24:05 -0600
Message-Id: <20220325212405.25243-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/meson: bump to version 0.61.4
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/meson/meson.hash | 4 ++--
 package/meson/meson.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index d909709b24..8389adb243 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/0.61.3/meson-0.61.3.tar.gz.asc
-sha256  9c884434469471f3fe0cbbceb9b9ea0c8047f19e792940e1df6595741aae251b  meson-0.61.3.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/0.61.4/meson-0.61.4.tar.gz.asc
+sha256  4e3733ddc66bac38e38c63b739c9b8b8fc5a866de5333396b0c85c2b144ddee9  meson-0.61.4.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 4615e839fe..e9c3145183 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 0.61.3
+MESON_VERSION = 0.61.4
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
