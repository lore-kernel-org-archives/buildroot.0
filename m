Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 216B9C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 07:25:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2F2F60EB4
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 07:25:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C2F2F60EB4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 884914011D;
	Sun, 25 Jul 2021 07:25:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kWtztYq01ReM; Sun, 25 Jul 2021 07:25:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E763240105;
	Sun, 25 Jul 2021 07:25:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 00B8A1BF48C
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 07:25:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3EA260618
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 07:25:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D19lTKM8KSkz for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 07:25:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0733D60614
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 07:25:20 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id b7so7059687wri.8
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 00:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SrvK4G8wVGEUYRoKCQKoYS0T49ywJL6SE61PYpFwvSc=;
 b=VYNGe0rvooX4N7QDQgURMYNq35h8DlGN1xkwE/7/ET+g8r+zybPW48Q062K+3dG42g
 O1cQ3OZBThEFuJPEyhThBE+GSIs6r5PkqN4B88O8YEQs2Zr+w+b+Jk5PDBqMD2B7I3qX
 YWpgz3eYkMA3Uz+ojPaeGt8Vq+SZrgAddXAgPnet7AXRAwrfNbYkCiWxU6arRbzPW6Wu
 CH8NemUDRva81mJ5PFQjsMO4Bc1vN5xxvfExJVyQEo6pQqgXlZCDaxtEOQwCt7qQbC8K
 FWVsPeDpwLDZBdUvPvjuJlW2KT9Qqy0kyfcyqqR9hHhnL0a4atZlIqc39xnUoJffjM4a
 zC6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SrvK4G8wVGEUYRoKCQKoYS0T49ywJL6SE61PYpFwvSc=;
 b=Nao+3U3hEmh5vasX5vqX2JObk6IKF0Sostk1rW1ZloMYLDVYI0O7f3+rAB7Q71pbFm
 IvuxbAABa2wtnNqmarmc8Me7pghxaAGtCja4NhswHjcPcLXxQRWiKzDwPsI4NVrck9L2
 qHenoAC51jzojjoRG5FZ69ucelkDeJhfPeT1e++hi0zCPwYUPwJoeCl9ngGuAW3lD4Oq
 RJ/b8RW3oNgie5nVODdwQrlggjiVybYFLt+ez1KmypwuJ4RJCKVJ1G6aYXeUuOGHKwMS
 5Hr9T9Au/e2nZuIPSNJHQtakKzquF0xzaGdiUbPGYELhy0ZRFvmo0c2FnAs4mt6XiDD+
 4ADQ==
X-Gm-Message-State: AOAM533dAgzn0vEPYgRe6p8tqSxTwWGfxRi2Ubj/k1JRjXnorF/CWr+1
 wu06OKLHIKODBP4IIafwVgv+1g+NWTaNCg==
X-Google-Smtp-Source: ABdhPJyO8PSVwSeBoChiJCx0wK3j+FnJJn5jBHoTxUH0g8qHyixpVTbFAwEJN4qH0Ci+8XcdscanGQ==
X-Received: by 2002:adf:eec9:: with SMTP id a9mr5310039wrp.157.1627197918903; 
 Sun, 25 Jul 2021 00:25:18 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id p5sm41925531wrd.25.2021.07.25.00.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 00:25:18 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 09:24:37 +0200
Message-Id: <20210725072437.851215-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gtest: fix legal info
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Michael Nosthoff <buildroot@heine.tech>, Stephan Hoffmann <sho@relinux.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Commit 9dfbbbb4105c47602da048c9bb9499fb8862e768 forgot to removed
googletest from GTEST_LICENSE_FILES

Fixes:
 - http://autobuild.buildroot.org/results/848238f9f99bee6919b1b71acd078835e94a8501

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gtest/gtest.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
index 3e8220cddf..29c85e698f 100644
--- a/package/gtest/gtest.mk
+++ b/package/gtest/gtest.mk
@@ -9,7 +9,7 @@ GTEST_SITE = $(call github,google,googletest,release-$(GTEST_VERSION))
 GTEST_INSTALL_STAGING = YES
 GTEST_INSTALL_TARGET = NO
 GTEST_LICENSE = BSD-3-Clause
-GTEST_LICENSE_FILES = googletest/LICENSE
+GTEST_LICENSE_FILES = LICENSE
 GTEST_CPE_ID_VENDOR = google
 GTEST_CPE_ID_PRODUCT = google_test
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
