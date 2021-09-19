Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B02E9C433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 14:53:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2376C6127B
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 14:53:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2376C6127B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF55F4016C;
	Sun, 19 Sep 2021 14:53:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AZw--Rb6Jbhp; Sun, 19 Sep 2021 14:53:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EED73400DE;
	Sun, 19 Sep 2021 14:53:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A2C3F1BF27A
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 14:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 90DD0400DE
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 14:53:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eGBeXUAn57St for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 14:53:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7175B400D9
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 14:53:47 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id t8so23999107wrq.4
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 07:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NvfciyMZA61qHrzkNCdxBG2ApWvztTFGJWe5k3qI8z4=;
 b=TzD1crpbx90Nwkkloyl2p/n/hc8lp+dBieCPcj8n7BCWzx7punvgR/Xh9+K/Ate33g
 V1bdoB4PEnjsL9/3yRCK8A6dQ91tTjwwEyTSAkotSTR/rMRlzACzXzESmmUiCkvK4w2/
 RxaaHNcMx9DI+PYJPsBB2gTS5po3BPsV2fGwpwk9ocgB5ww1XVLblwce29fUiuA9KfBL
 hXHQ5KE8MAKmPRwMpjwfHtBtXiSKOhXzNHU04qjhb6kZiGnMhv6L3ahGmAp5okb/q38+
 sPPsYK8pY7iH4ABGBsBRGWIgV9E4BLOuxmqFIfKuds6KkwoXGFgvc0W6SHtBnQrQN3Gs
 eYXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NvfciyMZA61qHrzkNCdxBG2ApWvztTFGJWe5k3qI8z4=;
 b=T81zNSHU8aMbnUf7YmkkDsVEVpT5gMPjlVU+KuENHTsSnrq66LTvzYp5qO8RlV08DT
 1ZwNZAbQUYA+dS/nDrAuWTum4dLUVjZm+RsCM6x7KdSXStEZwrSNEaKMDmpxtEacdWFo
 NW/WLlW2Mywg3unGfsbv3w0TmXM/FyPMC1MCvaVfzbvPfB1daaDEqSxnehWl6K2ED7b9
 36FFyfwJ6l2nAMTQQ03nMtD8k9OXUOSU7Jv34IUz+EJ5RQwXebQb+OTmmSZ8f4WtUgZl
 sDd8TvIRrBslzB0mHT6qlMtb8jYmS00Vt9rwVcS6TSiJ7wcDi0QFqTfqm0IS/9YTYs/Y
 kFdw==
X-Gm-Message-State: AOAM530+boiwRD5SU50clSoDORLXXd1nsm0Xnh2CgpCB+GMPJjhDDbvD
 0rDG6Xa1qQqdT6JgOeKzx/Aao5bRcAo=
X-Google-Smtp-Source: ABdhPJzpokpc07pc/i9kx/ek9NnbKeKKclzSJJ/Kh4S8cJQf2+Rywy1mm2O3trJ0qpEogNUDU0CCgQ==
X-Received: by 2002:adf:ec02:: with SMTP id x2mr23146689wrn.407.1632063225328; 
 Sun, 19 Sep 2021 07:53:45 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id z5sm17079571wmp.26.2021.09.19.07.53.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 07:53:44 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Sep 2021 16:53:30 +0200
Message-Id: <20210919145331.3492573-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/wavemon: add libcap optional
 dependency
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
Cc: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

libcap is an optional dependency which is enabled by default since
version 0.7.1 and
https://github.com/uoaerg/wavemon/commit/669c53e3359af5f6d4044126e22ab95f40a968f4
and can be explicitly enabled or disabled since version 0.9.0 and
https://github.com/uoaerg/wavemon/commit/af36fbe75649f745e205cd961302b656b8461e06

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wavemon/wavemon.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/wavemon/wavemon.mk b/package/wavemon/wavemon.mk
index 3ae1141ec4..d2af6c2bc0 100644
--- a/package/wavemon/wavemon.mk
+++ b/package/wavemon/wavemon.mk
@@ -13,4 +13,11 @@ WAVEMON_DEPENDENCIES = host-pkgconf libnl ncurses
 # Handwritten Makefile.in, automake isn't used
 WAVEMON_MAKE_OPTS = CC="$(TARGET_CC)"
 
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+WAVEMON_CONF_OPTS += --with-libcap
+WAVEMON_DEPENDENCIES += libcap
+else
+WAVEMON_CONF_OPTS += --without-libcap
+endif
+
 $(eval $(autotools-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
