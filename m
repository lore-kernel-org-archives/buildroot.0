Return-Path: <SRS0=yDzA=MT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BBFEC4338F
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 11:24:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5473F619E7
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 11:24:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5473F619E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B82D83133;
	Tue, 27 Jul 2021 11:24:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k2M6aLnXyOGd; Tue, 27 Jul 2021 11:24:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 748BB83103;
	Tue, 27 Jul 2021 11:24:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3ACD51BF863
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 11:24:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2126B404E5
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 11:24:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y6c7GKktbYqb for <buildroot@lists.busybox.net>;
 Tue, 27 Jul 2021 11:24:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4605F404E1
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 11:24:04 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id m19so3484405wms.0
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 04:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gvILDWVhAURDMTJSUofcjiJWU8wpFibKGvw/44R1l1Q=;
 b=COvKnlaqIY5Mu6Cf6SgQkjEpVBSVbrnpw6JbPUkRBL//fZODhWPVAsv3AtTTSndCSh
 WGUNovk5xvvq/QMTkAOhuAb2vEW5QmhQGYvwUkHIffXlnb3mo7824xcWMTe3gJ8Qmejf
 MIwF0qbRmHXZtL4TfAWMZE5z4ujufDDUfX6wyKaJEK0rI4EB3mgJBgUcdplaQnx04W1c
 BkNZMbWAcHcZVpYs5O3QxtOoJmy3GrGz6KQcGLWuwV7qXXjh+Muvwkwi5enXgo4Jejf0
 enLP0aTGhoFCqUR3GYcGXFEWC94hSEUl1yQoaFaj9TuftaOaPBJB9hbaQhKUAU6j4bGW
 7kFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gvILDWVhAURDMTJSUofcjiJWU8wpFibKGvw/44R1l1Q=;
 b=EXnixSXXbJ6LblLFlH+OyVVswtLBUsICu64WZvj3R4WnlBSMoJZvRos8Lq+amkXbF/
 GOsi0TSiFEzAzAHsNbjz64cM6JvX20qnH/QyuDNy18Ht0e1a9jjUNHSiCymi+3axQMlD
 QBXoq4w8KqMJq/03gKIyD/jQziHIitLgYWx95facIpqGYbIU+m9ijuxtC6LbjFkQto1D
 41XVNt5n798J3AHakCJ3Sy+iLHUZPszeS14Bz6/Ll7yTDuyA2y9SSSjOtHU6SqtXG+UT
 l+a5KsSuv/ggeUSLLjCbs6XnqE348SrqpUS5/JI1K+lyh3yXgbUE8ko2lXXa8sXE6pdl
 CaJw==
X-Gm-Message-State: AOAM531gFEhslS7JmKl2oVXiFWyaWbOZHbPLazQbd2A6xw1R5iDF1U8g
 gEoiathGnvN7ZEsByZ5fnV8Hjv/vmHozyw==
X-Google-Smtp-Source: ABdhPJy7rYKXAsdR7DBv3C4bLGAS5OwebslfpNaWknQyRK4A3UDeRgNV95Wd8kbx2UhicdDHqzzSLw==
X-Received: by 2002:a05:600c:2306:: with SMTP id
 6mr3593691wmo.144.1627385042222; 
 Tue, 27 Jul 2021 04:24:02 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id p11sm2886352wro.78.2021.07.27.04.24.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 04:24:01 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 27 Jul 2021 13:22:50 +0200
Message-Id: <20210727112250.2373449-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/boinc: bump to version 7.16.18
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/boinc/boinc.hash | 2 +-
 package/boinc/boinc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/boinc/boinc.hash b/package/boinc/boinc.hash
index 0482b0589c..981d9141ea 100644
--- a/package/boinc/boinc.hash
+++ b/package/boinc/boinc.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  0d5656a9f8ed1048936a5764270848b892d63f27bdb863d0ace447f1eaae6002  boinc-7.16.16.tar.gz
+sha256  e66fe2e2a804687c1fef2a0d2819d634dc24c9af1cb371c71ac468352f7a562a  boinc-7.16.18.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING.LESSER
diff --git a/package/boinc/boinc.mk b/package/boinc/boinc.mk
index 5d9a8abe3b..079b065efd 100644
--- a/package/boinc/boinc.mk
+++ b/package/boinc/boinc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 BOINC_VERSION_MAJOR = 7.16
-BOINC_VERSION = $(BOINC_VERSION_MAJOR).16
+BOINC_VERSION = $(BOINC_VERSION_MAJOR).18
 BOINC_SITE = \
 	$(call github,BOINC,boinc,client_release/$(BOINC_VERSION_MAJOR)/$(BOINC_VERSION))
 BOINC_LICENSE = LGPL-3.0+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
