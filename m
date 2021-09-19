Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CA1EC433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 19:34:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C886560F6B
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 19:34:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C886560F6B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4A6F8402CA;
	Sun, 19 Sep 2021 19:34:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tqMRQyuUReDE; Sun, 19 Sep 2021 19:34:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 554AE402CF;
	Sun, 19 Sep 2021 19:34:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B37051BF2F5
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 19:34:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A92DD6073D
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 19:34:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3mMWEx7zR_it for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 19:34:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D53CE60607
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 19:34:43 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id w17so16655293wrv.10
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 12:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QxzakTaXzuZ4zPX/V6RJwYicpQEnyxT3NOt26qx34RA=;
 b=psrcsh3eeWPCmi8QhLyzToW8Lh6xbErcIOJ+zEeIW7OWJJpJKOMpEsyMAFgAOtNFT8
 JU6JA/ZUlya05XMhPdJ6pLNAXwXlo9bNn/aC6QcPdkcWn2rUUjyFPz97An+tOzhStEql
 27dVyTEdBxho7sj7RC0L4zoJUnBbbV8LS7zbQzzuddb89BO7bTNrV5o2meK8hzAaFXnc
 QFqBkJlh6xd+8dAuX9mPUeTKxZvkBVJws3LrjEpdINmoeIj/I6rHVi7H687wAL6+l6nF
 qQAetNma0xEMPFX/v5hRqDTs3MgQgXrHFBTuTqxg4boVAi6GcFMKXXJ0pS6A2sqjgVD0
 IiEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QxzakTaXzuZ4zPX/V6RJwYicpQEnyxT3NOt26qx34RA=;
 b=YEa4upptScZtP+8DzHuTXcrcl3MbsifcbV7x0+Fd64X5KAKeaB4sOLngS8ASah/61q
 k7BZF48je43bgBrWPJoXxkoWt0dfZeWbxQRRIUwete+gj21XXNaGHVVm+2Da/+I4+jDR
 PioZ47s2N1wCGwUXGn24qoUQV6K8CeO2silW8R8+enKckjeRfTcfe9RLLlUv8BWCtxgQ
 GkrpOt3XyiwlKSmte1CphprbatOi6aun844h9xS+tsBYYhcroSJVX4FDvrtnqFt7EcSi
 2PZ9FKrmm975/kI4bdCNGDQEacT1r1IcyrFE5JTsPgw8XR6JlAljs7hwzh4SH8pG0/LY
 IUjg==
X-Gm-Message-State: AOAM5332YoAjlHCmdk/rrs5U5opL/Dtk4IbHOdPkxyZrqI5ZvKbj54Rr
 V979U1Z+X+d4BIx3Hl0zZQ1kPjjRiEY=
X-Google-Smtp-Source: ABdhPJyF5SLQ5NAeGOHFy2tM+W9JIRoaYJpG+9u2Kgpn0gXiVTLirEzzFRRNyjoUTlTEHGQ6R+42wg==
X-Received: by 2002:a5d:6902:: with SMTP id t2mr23287251wru.23.1632080081756; 
 Sun, 19 Sep 2021 12:34:41 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id o2sm14866321wrh.13.2021.09.19.12.34.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 12:34:41 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Sep 2021 21:34:15 +0200
Message-Id: <20210919193415.3985522-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/xorriso: bump to version 1.5.4.pl02
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
Cc: Steve Kenton <skenton@ou.edu>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

https://lists.gnu.org/archive/html/bug-xorriso/2021-02/msg00014.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/xorriso/xorriso.hash | 2 +-
 package/xorriso/xorriso.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xorriso/xorriso.hash b/package/xorriso/xorriso.hash
index faaeab5fa0..cbbd360d92 100644
--- a/package/xorriso/xorriso.hash
+++ b/package/xorriso/xorriso.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  3b69f5c93ae7c40c5bbe4a847fa3963f5efc9c565551622f77121c5792fc17e7  xorriso-1.5.2.tar.gz
+sha256  3ec7393d4a9dcbf5f74309c28a415f55227ec62770b95ae993ac8d7a3b152972  xorriso-1.5.4.pl02.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256  72e99e72cd68f226415e5d898f3b38e24ae7991ed038ed72d789fff5b060f028  COPYRIGHT
diff --git a/package/xorriso/xorriso.mk b/package/xorriso/xorriso.mk
index ff3414fd8a..ac6b0cdf27 100644
--- a/package/xorriso/xorriso.mk
+++ b/package/xorriso/xorriso.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XORRISO_VERSION = 1.5.2
+XORRISO_VERSION = 1.5.4.pl02
 XORRISO_SITE = $(BR2_GNU_MIRROR)/xorriso
 XORRISO_LICENSE = GPL-3.0+
 XORRISO_LICENSE_FILES = COPYING COPYRIGHT
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
