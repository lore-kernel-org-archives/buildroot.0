Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D156AC00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 21:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32DE640320;
	Mon,  8 Aug 2022 21:56:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32DE640320
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AVOGCtmUiOrr; Mon,  8 Aug 2022 21:56:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 261AF402E4;
	Mon,  8 Aug 2022 21:56:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 261AF402E4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1B81D1BF3BF
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 21:56:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA5F981589
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 21:56:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA5F981589
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VFwO2sGShy3S for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 21:56:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C910C81429
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C910C81429
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 21:56:18 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id a11so5420031wmq.3
 for <buildroot@buildroot.org>; Mon, 08 Aug 2022 14:56:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=uijwOtMmn5zpdTCMjNdvxG6lbeDuJK+rexzsekmOLC4=;
 b=u2v9tFwZA0TqO2/hPpzj9sBe7h/8lzXsIxJHmTJj4SuvPpz+eNj7ZGxky++Ax3Bvnq
 qvWxyMW9rsAWeu/Z0a1w/vMIEruDXsDlZmsNjo2iE9emd1MZzX9SQmItMIcGIZXuKjjS
 GkFQBw31Gd0pjpa1PIfQjebXUz2Z/7t1ZEXc2iRua7INwB/aqJDxiYHci2CZuTCdEzR5
 3pP4KNpZcNLAdrF/K1W477HKY6Lq+MnEMPfnKAk3UvybHsNmCF5DktRroKorIw6DGMxa
 nSs5fXAKGFtpNh+Y5Ifiz9njUR5NaJKKV5PqHH5tB85dmA+3DRunXUeUXxi/OQtfSMuP
 kOxA==
X-Gm-Message-State: ACgBeo2rUMsfAYL9bt5JwiVn3T3VSn/H0kARWuWrp92HMNZAaL+lfpah
 8qt3Wkr5VaCyZDsEzGpcWGHf4hTzcuY=
X-Google-Smtp-Source: AA6agR61BIYG1JO7c1eg0q0jEJgExme8ePgrUacY0EOFACeuTeIcIbRDt4Lso+M1NYnKZG+6eJ/0Vw==
X-Received: by 2002:a7b:c3c5:0:b0:3a2:e327:ba6d with SMTP id
 t5-20020a7bc3c5000000b003a2e327ba6dmr17964393wmj.184.1659995776869; 
 Mon, 08 Aug 2022 14:56:16 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 f10-20020a05600c4e8a00b003a30fbde91dsm21857266wmq.20.2022.08.08.14.56.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 14:56:16 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  8 Aug 2022 23:56:11 +0200
Message-Id: <20220808215612.1805008-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=uijwOtMmn5zpdTCMjNdvxG6lbeDuJK+rexzsekmOLC4=;
 b=Xw6HdAiolo5DBo9GGufReQ8I+jXUGmMKNpNzT/Zjj4Btp5jzylkSJDlnsfDRdCjmEP
 TPZOKqgKt8WP2/2b6Iv8cMuRTEcP+hpje+UU9Hnnl5ZJL3Y6I3fkR7Fj5dLZEznTj6oK
 f74PoHtSomxrsPAp7wVIxRDRa9bxgZxZAc6KxZSxXudE0ZDHqVtU3toele66QhNtxPaN
 0yLf+0b8ereXdDGY7laMI70tn0NNSf/JjDFGVHLMeS03egtT1GZNL/NhitXsCACd/UP+
 PJzBZguzIQwiRYHcrgYcVFhIHwywYzks9dud9fQyfK/rS9nOFlrg1UCIrpgCKNgnUC/A
 kWDQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Xw6HdAio
Subject: [Buildroot] [PATCH v2,1/2] package/serd: bump to version 0.30.14
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
 James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Switch to meson-package
- Update hash of COPYING (update in year:
  https://github.com/drobilla/serd/commit/0e7053de7086423484e5a8f2c0db76efba4ed257)

https://github.com/drobilla/serd/blob/v0.30.14/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Always set static to false

 package/serd/serd.hash |  6 +++---
 package/serd/serd.mk   | 12 ++++--------
 2 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/package/serd/serd.hash b/package/serd/serd.hash
index d64a2aa271..c8a45a0831 100644
--- a/package/serd/serd.hash
+++ b/package/serd/serd.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking signature
-# http://download.drobilla.net/serd-0.30.10.tar.bz2.sig
-sha256  affa80deec78921f86335e6fc3f18b80aefecf424f6a5755e9f2fa0eb0710edf  serd-0.30.10.tar.bz2
-sha256  e06562d6bcf0341b2ac2ad0f0ca36801d2ebf388d5ef297011625e4c36e963f0  COPYING
+# http://download.drobilla.net/serd-0.30.14.tar.xz.sig
+sha256  a14137d47b11d6ad431e78da341ca9737998d9eaccf6a49263d4c8d79fd856e3  serd-0.30.14.tar.xz
+sha256  13b62d3705cabee6a21730eb24f773249271c2d95e9ecbab16069e729d4ae147  COPYING
diff --git a/package/serd/serd.mk b/package/serd/serd.mk
index 85b16f6866..7922e777c8 100644
--- a/package/serd/serd.mk
+++ b/package/serd/serd.mk
@@ -4,17 +4,13 @@
 #
 ################################################################################
 
-SERD_VERSION = 0.30.10
+SERD_VERSION = 0.30.14
 SERD_SITE = https://download.drobilla.net
-SERD_SOURCE = serd-$(SERD_VERSION).tar.bz2
+SERD_SOURCE = serd-$(SERD_VERSION).tar.xz
 SERD_LICENSE = ISC
 SERD_LICENSE_FILES = COPYING
 SERD_INSTALL_STAGING = YES
 
-SERD_CONF_OPTS += --largefile --no-coverage
+SERD_CONF_OPTS += -Ddocs=disabled -Dstatic=false -Dtests=disabled
 
-ifeq ($(BR2_STATIC_LIBS),y)
-SERD_CONF_OPTS += --static --no-shared --static-progs
-endif
-
-$(eval $(waf-package))
+$(eval $(meson-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
