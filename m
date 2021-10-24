Return-Path: <SRS0=WrHH=PM=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCEEBC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 07:12:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F18B460E0C
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 07:12:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F18B460E0C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9038140357;
	Sun, 24 Oct 2021 07:12:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kzseKfydW7K0; Sun, 24 Oct 2021 07:12:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE71240346;
	Sun, 24 Oct 2021 07:12:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C59591BF574
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 07:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ADD5B6069C
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 07:12:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aP6oYhhtGQoT for <buildroot@lists.busybox.net>;
 Sun, 24 Oct 2021 07:12:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8CBEF6061D
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 07:12:19 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 o4-20020a1c7504000000b0032cab7473caso1617497wmc.1
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 00:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CJyF8d6brJulfvkb4J9wtWyjZB0JgSz/Z0vV4hgZw1U=;
 b=R3GiaphFb3qFLxVu1u/4fjXMwXAKPIAlIo1tDmBPokN7H9hjp90DVzRV0tlo3OpyD+
 lnet63MSJiwxPidRzBMvAOizoM7TXqcm9xhaptDZoqp2XMcMGkFshx+ZjEIo6kF1+04B
 Hm4rsWat2nEsholjdUJ3CDFuDtRbIMravF/QwXtyI4y1ydqTYCJ84xIMbDoYtO1JbNzG
 JTw4c454TOhrTLz41wveEBJQ4f1sGjPcCAhbuT0t/QJ7zLqE/V7Z9FwARP9hsSS/G2ik
 bhpqE9cfemKaaHjDbosZQnmNe3jwHHfXX39VBlSPjpoE/ON8UQ8C+iPZRhXHgdNkP37e
 QNDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CJyF8d6brJulfvkb4J9wtWyjZB0JgSz/Z0vV4hgZw1U=;
 b=MYLcx/9kgFLHcL0nNcyAmW2quh2r5KynL/3pcLQQUyMZnhHrkmcptcFNSxWi65PS/3
 MnyyN8DsbODEzpoU42+8EyHfZSIgoc7EGQE/nOhEDoFWprZYcdm8T1sYekjSYuNmf1Tq
 lybIkPYogJlAO3TjKu2yEAHwXNW0W6Yq3xOKGjBJq8vWmdGyA2kvt9i5vgMZYmGVVfT6
 SxaJA17Yt65Z4YLphLEJdQcdap3QbF9cgJHlpc36OglhYqgoJMvbW0lM19X+fFalsxHJ
 BvkFNTiVFd9T+077A/Bnxv34VWwZJSFTUDfDZ0oHhr56x9gkgy4D4eX9c0B9WhcK10XM
 OB8g==
X-Gm-Message-State: AOAM5301xKfFRHTIjiGT1LmbeQ+hlXvNHYxzVKUhsMk6Z648HkFlPtbA
 JM5Z3rFAdHPrGJXrF2cJD9QUVPGZYMY=
X-Google-Smtp-Source: ABdhPJyn6woX6h2MvNDn1CK96Rh5BL0CZlQwqGnz+gk4NN0FhN7hgiKzZbCwrLxJQNXtYW6kgdY/fw==
X-Received: by 2002:a05:600c:378d:: with SMTP id
 o13mr35812935wmr.41.1635059537492; 
 Sun, 24 Oct 2021 00:12:17 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id a2sm12682317wru.82.2021.10.24.00.12.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Oct 2021 00:12:17 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Oct 2021 09:10:47 +0200
Message-Id: <20211024071047.2241497-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/motion: bump to version 4.4.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use LICENSE file added with
https://github.com/Motion-Project/motion/commit/34091a770c679da79f5be58f392020a8514521ee
instead of doc/COPYING removed with
https://github.com/Motion-Project/motion/commit/13d8fdc37c6ea42ef9c49ddc594e2b96d43cd36f

https://github.com/Motion-Project/motion/releases/tag/release-4.4.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/motion/motion.hash | 4 ++--
 package/motion/motion.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/motion/motion.hash b/package/motion/motion.hash
index 96ab1c4338..085ac90449 100644
--- a/package/motion/motion.hash
+++ b/package/motion/motion.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  dafa4264b2d8e4778f8be5871f09b6c0ec710d5a836182c583469c18db944d70  motion-4.3.2.tar.gz
-sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  doc/COPYING
+sha256  3fb0d14fff8a8a143716223b5d2d55c0f52b11badf13a2e485b98bae3cf1b572  motion-4.4.0.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/motion/motion.mk b/package/motion/motion.mk
index 29b70fd85f..dae812b9a4 100644
--- a/package/motion/motion.mk
+++ b/package/motion/motion.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-MOTION_VERSION = 4.3.2
+MOTION_VERSION = 4.4.0
 MOTION_SITE = $(call github,Motion-Project,motion,release-$(MOTION_VERSION))
 MOTION_LICENSE = GPL-2.0
-MOTION_LICENSE_FILES = doc/COPYING
+MOTION_LICENSE_FILES = LICENSE
 MOTION_DEPENDENCIES = host-pkgconf jpeg libmicrohttpd $(TARGET_NLS_DEPENDENCIES)
 # From git
 MOTION_AUTORECONF = YES
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
