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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9B98C433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 19:52:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 454BD6104F
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 19:52:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 454BD6104F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D422840452;
	Sun, 19 Sep 2021 19:52:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sRtmm89yHWDS; Sun, 19 Sep 2021 19:52:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D90D4044B;
	Sun, 19 Sep 2021 19:52:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E073F1BF4E4
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 19:52:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DCBE76075E
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 19:52:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DImPXR0QRd6f for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 19:52:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F0B9160717
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 19:52:29 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id 140so11506773wma.0
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 12:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PuIw+L1NZa9KI6PAeOYwEAlYrkPIYblqfWn5TkIeAkE=;
 b=dS62lvTtUDRqOgw9F9zMO2aTGkPA8tsVg19ZxF0Mhm5NgAv4cqtlH6HBP8zROUly1s
 rGUUFVQO3feMXs5aplkIFnBXyJSYOnUVk4Hwjh+II0sG+1M3j9F6i950shESIakgvb+o
 KaXvHVJHeuS7qIjS6Voyf5YC8057Wvr+K/eq+o3ZeQ4rsWX5MThSjf4Cmlc5lRqPCLzK
 ef70R5da3D+4vSAMASGxKOIJGJn1+osDsvMFbZRW/aP0xaNId5lyJiHX5UoA0K2nS/JG
 gpI1jwY+hyfFmOEcJ74VDkTGQZIf7jt3HV6otSkYGiFHFdkvvyd+4MVAh4Afxof42Qlu
 3TDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PuIw+L1NZa9KI6PAeOYwEAlYrkPIYblqfWn5TkIeAkE=;
 b=Xs2tCzZyN+vAP0tl4qHgOOIrceUCm8MlJzIsQ6aHXoFAA17mziN2zOlNVaXwKZxXV0
 DARyJJK8Fv84rfEFBunwbDXu3cXaU7iyjVm58Qb0RyNKRb3DeqJ40/sKVPCQ0j4/0Xsz
 Im+3WL/aB55ukHCn/7xcugn/D2NS+Jv1P//VQjx5HZ8sEAoKCGKIk9ZLSQMTjquBLBIa
 jtk3SkUQdBmqJDVJr/CiJPij7U8bOGLtdCWKVK6Wy+0d7B3Fjy4X+iFqcDKTRBoz/1E/
 9WIBxohaWsXABD9/GPPe46EHytR3B9pMmOHBXmJW3TGpAzZMTalhd9hzVrvi3ri4LY0w
 1Rdw==
X-Gm-Message-State: AOAM5314bFffr/mMPR1f8OQb+tPRk0i5Y9u+lGNdvCZSxArpyr8Hnwa7
 fXkQljIDxDieRLGAOTPKlDQ8Olrgfv4=
X-Google-Smtp-Source: ABdhPJzXB6ORrK2fXIkcVP4Im2aRFDJTnoTvqwk3PjcuWa9230lRQ6CuCxvm6Rej+E+4nhK+7gwG1Q==
X-Received: by 2002:a7b:ce93:: with SMTP id q19mr21142326wmj.195.1632081147946; 
 Sun, 19 Sep 2021 12:52:27 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id v8sm13414476wrt.12.2021.09.19.12.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 12:52:27 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Sep 2021 21:52:00 +0200
Message-Id: <20210919195200.4034023-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/acpid: bump to version 2.0.33
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Update indentation in hash file (two spaces)

https://sourceforge.net/p/acpid2/code/ci/2.0.33/tree/Changelog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/acpid/acpid.hash | 8 ++++----
 package/acpid/acpid.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/acpid/acpid.hash b/package/acpid/acpid.hash
index f325325b9c..d5e5bcc14b 100644
--- a/package/acpid/acpid.hash
+++ b/package/acpid/acpid.hash
@@ -1,7 +1,7 @@
 # From https://sourceforge.net/projects/acpid2/files/
-md5	248995264b9d1cd8bdb923d5b190fd44	acpid-2.0.32.tar.xz
-sha1	a194e99c5b596186c7865e7ddfec55dea6d7fc73	acpid-2.0.32.tar.xz
+md5  b2f2ca633b30ae893c47981fa4d3b258  acpid-2.0.33.tar.xz
+sha1  b3e06c3f2213db8ee1a9024cf372fb30e2fab637  acpid-2.0.33.tar.xz
 
 # Locally computed
-sha256	f2d2d30b3edc3234bd82f6f7186699a6aa3c85c8d20bc4e30e9b3c68a1ed157e	acpid-2.0.32.tar.xz
-sha256	91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad	COPYING
+sha256  0856f71b3eb34a1b663d0a8e6363dfcbc519e63d847330498898658e2972dbe8  acpid-2.0.33.tar.xz
+sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
diff --git a/package/acpid/acpid.mk b/package/acpid/acpid.mk
index 1214251dc3..5d5138baa3 100644
--- a/package/acpid/acpid.mk
+++ b/package/acpid/acpid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ACPID_VERSION = 2.0.32
+ACPID_VERSION = 2.0.33
 ACPID_SOURCE = acpid-$(ACPID_VERSION).tar.xz
 ACPID_SITE = http://downloads.sourceforge.net/project/acpid2
 ACPID_LICENSE = GPL-2.0+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
