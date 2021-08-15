Return-Path: <SRS0=DPgg=NG=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14A46C4338F
	for <buildroot@archiver.kernel.org>; Sun, 15 Aug 2021 12:38:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D23261104
	for <buildroot@archiver.kernel.org>; Sun, 15 Aug 2021 12:38:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9D23261104
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1652A605CF;
	Sun, 15 Aug 2021 12:38:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qJ6Xkip5_6VP; Sun, 15 Aug 2021 12:38:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E707260705;
	Sun, 15 Aug 2021 12:38:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4044E1BF232
 for <buildroot@lists.busybox.net>; Sun, 15 Aug 2021 12:38:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F9EB606DC
 for <buildroot@lists.busybox.net>; Sun, 15 Aug 2021 12:38:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H_6NoeL45KLk for <buildroot@lists.busybox.net>;
 Sun, 15 Aug 2021 12:38:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5C479605CF
 for <buildroot@buildroot.org>; Sun, 15 Aug 2021 12:38:01 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 79-20020a1c0452000000b002e6cf79e572so3728729wme.1
 for <buildroot@buildroot.org>; Sun, 15 Aug 2021 05:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YGJiSNO+U7Fue/4rdGGa+rvyw6NrHh6Vsv+EbalNJR8=;
 b=Pp2KeTsjSP3Uz1K+LVBL0qVt5oOVAix/GPBY2sLUWC8I/d3oosWeRIP0DpoFvf6tws
 vS226GmkW7EjBd6S/Ue/ImASYAb1+ut+SFLXKqy5WV6snq6NKIKOKtRaWjk952oUCh0c
 7laJILL68AwcYyEflzIvenqEWFs5N394dTgwQ958KpyNnkzbvujQBMvgko2HIeU1RQEo
 3dTwEOP/Swjbadxvs96ANJWh22Em+MvPPXsZVzpNboTRbb1O+wMbHNnQPcecZ5EesZgP
 MKYEug34Y2vB9GrxJXQiuuLh/I9di8z81GSiDediIiTH5IYwfEnXR+dgAwDSwyM8RnbW
 Gv8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YGJiSNO+U7Fue/4rdGGa+rvyw6NrHh6Vsv+EbalNJR8=;
 b=NjPyJ8jopxvYYS64Io+IQ7a9WObluqLVMq02JBmitEx2pnjmTGlk9ljP+3Y48+Fql2
 FXI8OKdn9YWCwKK9X+QuV8ebm21MeZ4qEvpXheDkLt2p+dMwHY6DGtMW+Y0J6jC9oUnA
 XvltcYG9av4HI5N/Q+NWztfTt2vx360bBsDfV0QwHW+freiFAxtUZhYmfLdvM4sMoJjr
 QIGfPyzQVMoODWL6yZY8RiAy6m7y0N/imI0vQr+5YVC3NrnVJxlWdYenDG0/KKryQ84B
 mw/Eaw4x2qoxzOF0qAKleWBlD8SgN9N9tSptNLG8M8cVOfIoWjT9ebGy7idqRqh6Na4B
 TuEg==
X-Gm-Message-State: AOAM530ThLyykgiRVCJ+ripa/aqDQh5zuXC3qEIMuPV2phl1bZag2gS/
 6LqrBXXwxJSXzKIdGhw4I8eU7xvdIvfJ1Q==
X-Google-Smtp-Source: ABdhPJxa7Sygkv2DFZXoVRDQyar7mbvyBi6muSfIZYbInM4Iw7iT0pdooDRUrrTKX6NnvWCsx6h3/w==
X-Received: by 2002:a1c:1f07:: with SMTP id f7mr10945712wmf.116.1629031079829; 
 Sun, 15 Aug 2021 05:37:59 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id u23sm7042051wmc.24.2021.08.15.05.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Aug 2021 05:37:59 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Aug 2021 14:37:46 +0200
Message-Id: <20210815123746.1389936-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/terminology: set eet path
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Set eet path to avoid the following build failure raised since bump to
version 1.9.0 in commit	6ac557a54bb4613e79728ad96724e7681c9c3c18 and
https://git.enlightenment.org/apps/terminology.git/commit/?id=f15dd2881a5e87e7f3b03594983826f7480c12e7:

/home/buildroot/autobuild/instance-2/output-1/build/terminology-1.9.0/data/colorschemes/add_color_scheme.sh: 30: /home/buildroot/autobuild/instance-2/output-1/build/terminology-1.9.0/data/colorschemes/add_color_scheme.sh: /usr/bin/eet: not found

Fixes:
 - http://autobuild.buildroot.org/results/767acf73e4eade48cd3fdb43e9dd599ba7ef9661

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/terminology/terminology.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/terminology/terminology.mk b/package/terminology/terminology.mk
index c17a6b0771..29b59fb39e 100644
--- a/package/terminology/terminology.mk
+++ b/package/terminology/terminology.mk
@@ -12,7 +12,9 @@ TERMINOLOGY_LICENSE_FILES = COPYING
 TERMINOLOGY_CPE_ID_VENDOR = enlightenment
 
 TERMINOLOGY_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) efl host-pkgconf
-TERMINOLOGY_CONF_OPTS = -Dedje-cc=$(HOST_DIR)/bin/edje_cc
+TERMINOLOGY_CONF_OPTS = \
+	-Dedje-cc=$(HOST_DIR)/bin/edje_cc \
+	-Deet=$(HOST_DIR)/bin/eet
 
 ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
 TERMINOLOGY_CONF_OPTS += -Dnls=true
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
