Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BC79C4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 08:29:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF01460F48
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 08:29:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EF01460F48
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C26204040A;
	Mon, 26 Jul 2021 08:29:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JMq867n5kUF1; Mon, 26 Jul 2021 08:29:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB62C403ED;
	Mon, 26 Jul 2021 08:29:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9845C1BF293
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 08:29:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 876DA401C0
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 08:29:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uz2o9cMeyB6Y for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 08:29:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1DC7540208
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 08:29:32 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 l11-20020a7bc34b0000b029021f84fcaf75so7610413wmj.1
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 01:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O8kmeCap6b1usN3/AyPn7ZAh9JCf+QnyQEau29htJr8=;
 b=m/UzTwr1jcMlCz0eKcQKeXhLqYv/kY2K/RGySZ+EKurtHZoAqvtM0f2ZiyfrDl2MyR
 YNDasGhVuG+PGNXFiKZ7V9Z8TTgRx7HLAshK60+KSo0gZugUKywXnrPc3PBnbg2v4W8t
 ZfSEa28RbVuCAkKEBTOMy2LsmNHeuvVsV0Q+qhH8CoECXGC5wcDtzI0hxdlt0s0CB10A
 4uDUx1tnYxwhTxzCSk57IS5KysMx/13pAlXlVWhxn88RA0fMt+7wPz15zCpqtxt3v9SP
 ijEM+Rw11/cS+zyhJJpYBIiCEYDr/95uh1SA7kHhiBQffqYEz0KTs6nF4XtKq2KC9Mn7
 uEIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O8kmeCap6b1usN3/AyPn7ZAh9JCf+QnyQEau29htJr8=;
 b=Pc6G+H+TmuGD+PKfL9lCtbLYCJNoT+17u/1ZAz53CHONI8WQbEIrHYh1cM71ZjZ8cV
 lPW4ELF847s4OS9zCzfn8u9Y4khsBDbYzfgwBUDZiIizYOcPRDLBS7TUhnS5TqN73Rws
 dBHtiy0UDWsgPvhmvaW9nTE9MYAkG5OLZ3TxZvzaBtxF0394vML3sLHl7RLRF4N9iBIt
 4uXA/m6sPbMC+RpBFHuoYk7IJzKLwk0TiD5uDm3qFJxtXVZIhx9IIW0u0jBf+Ve4xB05
 hJO4Sx3eEGGXPwe+pIGwmBKhaoEDAFGKeNB7GhFTuhdvUebJPiWrMvRriVG29BKWUTCs
 t67g==
X-Gm-Message-State: AOAM531REzEsEJNjnQ7RhFYfywI0g6FM838BMmftApklVjG5jq+nt5Xc
 7YD+NJ6y/I5J9wWgvhuSD7Mfa8j+e4JEkQ==
X-Google-Smtp-Source: ABdhPJwCg5cqkFOeGAoS/q+7bn9sZm8xEkljDBHuksv03JB8K7w2ivPsuvvfzS4AAg4CBUYj7hTHIw==
X-Received: by 2002:a1c:4d06:: with SMTP id o6mr16058309wmh.55.1627288169962; 
 Mon, 26 Jul 2021 01:29:29 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id a191sm2406875wme.15.2021.07.26.01.29.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 01:29:29 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 10:29:19 +0200
Message-Id: <20210726082919.1706836-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/git: add SELinux module
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Support for git is added by the services/git module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/git/git.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/git/git.mk b/package/git/git.mk
index 6958f8d9b6..3c3ad9d825 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -10,6 +10,7 @@ GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
 GIT_LICENSE_FILES = COPYING LGPL-2.1
 GIT_CPE_ID_VENDOR = git-scm
+GIT_SELINUX_MODULES = git
 GIT_DEPENDENCIES = zlib $(TARGET_NLS_DEPENDENCIES)
 # We're patching configure.ac
 GIT_AUTORECONF = YES
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
