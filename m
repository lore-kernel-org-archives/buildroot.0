Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0149C432BE
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 06:45:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B473260F11
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 06:45:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B473260F11
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86E3F4028A;
	Mon, 26 Jul 2021 06:45:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HDiVXsVca0tZ; Mon, 26 Jul 2021 06:45:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C62CE40286;
	Mon, 26 Jul 2021 06:45:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 881731BF3A8
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 06:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 801014025B
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 06:45:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rCzqaISpbkE9 for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 06:45:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 93CD0401C8
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 06:45:39 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 k14-20020a05600c1c8eb02901f13dd1672aso7077043wms.0
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 23:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=81EurCy3kqQ8SJ42aRjwQQKA7jwFh1YWsWwMc+t9PyU=;
 b=SrlAlPMD6X8Br2ZW/mUb4v0usDk5UKJwO7+TZzndd+kaD0D5TlrHKM7ZIHioxJU36Q
 qB+aPxNM8BfPUueF/4G81kUtMLFLvVD7TcK8xJ4Cm6ccVx5u2weXm/RHspcThDUQ/5cT
 Q/EIoBNsqS9gYBvOJ2KQYoDfrFAJMyKOzLqIKTmfsOSIMeNPuw3/6pWctVxJUb03zE8w
 cakQiCEyAXidViPjTgTsb5FLkNU4uKjD1Bv8PM42NZFSbShzz6lszuZbczDOYE04E2vR
 9wcpfBJ4i8BgvKCwrI2oM9EurYnt/ysfhdDrEwv/deOaTVvHlIWROqhgT/FgxnlVjR2p
 QOfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=81EurCy3kqQ8SJ42aRjwQQKA7jwFh1YWsWwMc+t9PyU=;
 b=BKiz+eRS3kW6JuZXHMZn1qvmqWYzq8rsUKq75oUBG6Ji7hGwbHeKihhfNf0+gdKmsA
 xipehoJRiLESgj3xJD6PrFMduCl4tf8WkZA8nOm/g+TlL9JwdHBJxyFC/iTLRNHC62JU
 cck6/oE1J7EbIw7A5GtIi8y/K02FXo98UwSidVexNMgOcqEirZNGDfZGT0HJ67xv/VZB
 mCabm5Dzjo/JN8zZ2p8lstzwlHMs8xe4QCgBN/2ihFhR4JxRuxLvJlOkTfIGbKFRL/QA
 93l8R/LnoPxU6Dai4P6ICumQPF2H5CnHgZWiJzPTJlhyiF/eYtZyoZ7JKf9TgvSjFmcq
 dUMw==
X-Gm-Message-State: AOAM530CY42jdl5r9Y06Fz+zuSgJw2NeK7xKOhnHJ8J/z1pbaBvRWUnM
 TmD8rbdJvrT2LQuvD7id3h/cjYiAC1KyUg==
X-Google-Smtp-Source: ABdhPJzLPh4u8/FKyi5yZtlqKoPDOnnFy5Hm+mwWPKZKGkAafh7sk0YqIY4sFmLBmQJSN9nbsw6mnw==
X-Received: by 2002:a1c:f613:: with SMTP id w19mr25998740wmc.136.1627281937462; 
 Sun, 25 Jul 2021 23:45:37 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id k22sm33099368wms.47.2021.07.25.23.45.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 23:45:37 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 08:45:29 +0200
Message-Id: <20210726064529.1699708-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/daq3: bump to version 3.0.4
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

This bump will fix a build failure with snort3 raised since its bump to
version 3.1.6.0 in commit e66f2fd310374779d415fa683813cc5f5ccf6be9

https://github.com/snort3/libdaq/releases/tag/v3.0.4

Fixes:
 - http://autobuild.buildroot.org/results/0019eac13bfb17da853d42ff52d6b12aebd3d45b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/daq3/daq3.hash | 2 +-
 package/daq3/daq3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/daq3/daq3.hash b/package/daq3/daq3.hash
index 33ad2e388b..e4cf4ebefe 100644
--- a/package/daq3/daq3.hash
+++ b/package/daq3/daq3.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  920344f5c98ac68b401d1bc92ebaed78b0d15779b0480c213db279d0a60acc32  daq3-3.0.3.tar.gz
+sha256  a376c7625d1442ddb7e3c75954c910cc9d64440e2f8f345981aa5fa6999ea206  daq3-3.0.4.tar.gz
 
 # Hash for license files:
 sha256  64601289158eddad72cb4de72652f9e64dc886942c910b38ddee93ba13b0db26  COPYING
diff --git a/package/daq3/daq3.mk b/package/daq3/daq3.mk
index 50e0eaccba..b726031d39 100644
--- a/package/daq3/daq3.mk
+++ b/package/daq3/daq3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DAQ3_VERSION = 3.0.3
+DAQ3_VERSION = 3.0.4
 DAQ3_SITE = $(call github,snort3,libdaq,v$(DAQ3_VERSION))
 DAQ3_LICENSE = GPL-2.0
 DAQ3_LICENSE_FILES = COPYING LICENSE
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
