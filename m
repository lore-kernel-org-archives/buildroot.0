Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 053C1C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 11:43:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0598610A6
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 11:43:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B0598610A6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70DFA403ED;
	Sun,  1 Aug 2021 11:43:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UZdO8tbBQTO4; Sun,  1 Aug 2021 11:43:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDA08403EA;
	Sun,  1 Aug 2021 11:43:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7C1621BF303
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 11:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D251607A4
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 11:43:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PVacipf8ytu6 for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 11:43:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 789376075A
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 11:43:23 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id u15so8720565wmj.1
 for <buildroot@buildroot.org>; Sun, 01 Aug 2021 04:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=StZ+t9WGnxHKgcH73WYWf1G1tWl7qJLwgo85VtGQaPM=;
 b=LCSBQUtrTqViiFtcOqU2sL9VgPgYu1o6tRHUonvaPVceSJAT3FvVnaZiNkvfTod4bq
 nF3Kqd9pqStd3osFC4M+He2XhisKVvq7hnlclBOtDYF5kcJqucWwg2rZ6VhSshZQpsuQ
 BR3fPbPgntrXIbENVJOyfcK+CTf1r1iOe/uf6mzJm2dLiR8bKUAs/RmWBadi7xkWzERD
 tResxXjL0lBtIaLL0nyhBbXKkvYuiKJPvdku2pIv0dLYPgwvp1RKlref8E3gxCtVsnhm
 JsRKvIZ4qE4eb53LcLnQzh1z6fBvdSUsdijj2W/Yh4QCD7kNRtkgm4WbBeAM/22WT/zd
 OZgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=StZ+t9WGnxHKgcH73WYWf1G1tWl7qJLwgo85VtGQaPM=;
 b=E+SIHR2QzIzj6cxudMezfC8npnLpvv6F5ZPEzkyMardWzIL/sz9JH9kfmKpyvi8uRm
 eSGNOcowyqyszLWZe4rlYpvemSKPUggRyAowOijG/YZrI95lGr/4yMcWn4JO5hoTu1k9
 m5eVS5Nb9WvDmcHBhMaYNNnrZHhuWJ5a+cmU3TSU8irzw+1nYvCW3ALxI7Tr+vy/MYCy
 gLm9XweJW2IiSJBzOe2xxbXOwV3SjSNNYUXIRwSfAfxoX0FVgHh1vm3cITr185eldaoG
 prTAX8arC2yxfRn78BWSa3A47hhQb6nsdPqVTJLTOGfpQM/bKIHtB0rvFbFqBgDMOuJ2
 Df0Q==
X-Gm-Message-State: AOAM5328yWBmihLFcGmQojinLqrJlON+M808X/W3Dowl8Q8NycDoyQgp
 Ycl9IZWNB5SYcf98BSl8LdVjvnGv/ieWjA==
X-Google-Smtp-Source: ABdhPJz81EAd1Nlrxu2tLYRpA3EgQIqkAgLQFJuDf0MU6DXqMjtSbP8+NM75+mMx9SyJfRf7rT7xEA==
X-Received: by 2002:a1c:1f88:: with SMTP id f130mr12271414wmf.24.1627818201313; 
 Sun, 01 Aug 2021 04:43:21 -0700 (PDT)
Received: from kali.home (pop.92-184-116-62.mobile.abo.orange.fr.
 [92.184.116.62])
 by smtp.gmail.com with ESMTPSA id n5sm7209560wme.47.2021.08.01.04.43.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 04:43:20 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Aug 2021 13:43:17 +0200
Message-Id: <20210801114317.2763207-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/smartmontools: add SELinux module
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Support for smartmontools is added by the services/smartmon module in
the SELinux refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/smartmontools/smartmontools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/smartmontools/smartmontools.mk b/package/smartmontools/smartmontools.mk
index 215db1ae69..2e2bbcd4e2 100644
--- a/package/smartmontools/smartmontools.mk
+++ b/package/smartmontools/smartmontools.mk
@@ -9,6 +9,7 @@ SMARTMONTOOLS_SITE = http://downloads.sourceforge.net/project/smartmontools/smar
 SMARTMONTOOLS_LICENSE = GPL-2.0+
 SMARTMONTOOLS_LICENSE_FILES = COPYING
 SMARTMONTOOLS_CPE_ID_VENDOR = smartmontools
+SMARTMONTOOLS_SELINUX_MODULES = smartmon
 
 ifeq ($(BR2_PACKAGE_LIBCAP_NG),y)
 SMARTMONTOOLS_CONF_OPTS += --with-libcap-ng
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
