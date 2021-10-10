Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B223C433F5
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 20:16:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D4C160E9C
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 20:16:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8D4C160E9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59251606BE;
	Sun, 10 Oct 2021 20:16:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PqRNG44dfMFr; Sun, 10 Oct 2021 20:16:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B83C460698;
	Sun, 10 Oct 2021 20:16:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 04B5A1BF41E
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 20:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF5C74019A
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 20:16:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vY20qyiqB5gB for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 20:16:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2998E40101
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 20:16:48 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id r7so48925398wrc.10
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 13:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pLevAGnwBNbuhhjgz+d5e4ljJjvgpW08scabREbauE8=;
 b=PiWO8TpurJlYiRgFTl9XUFpW7SyhWiERullKHzpPH2t+P6cChcMFGjVU9/8m6jMERa
 wsiH9nDdOmeYiEbQ1v3qbowiVf2eR0fHx1hfDoAxc3KGM5O249rG4AgW3mksBWjuXPsk
 fR2+KqiMuAEa+NpDPeoRkKruwbmeHI23sfEBFqVEIUYCvywOXaKRFDiE/IH9IG9KnrSC
 NogwTciRI+Kl0Yj9nBZCeG4vokAhfn5YnkNZjVQvHfVVY08RSl0cuRUA4TTuHIUdqBNJ
 RHE+leQZRHQpiopm7bzwRBV5voxgeBOtaESokvc3XTCbc2dFpMAnDzVxSGtvAmGuW1ew
 sbdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pLevAGnwBNbuhhjgz+d5e4ljJjvgpW08scabREbauE8=;
 b=msf8Wp7An9rNIdib/U05lqjrMKKEmlKzKDSS8XQHxfR4W0n0sKoSod78sNwp9fTw3b
 sXc2zfUNljWLfaTGR/pxreHXjtqZDoON+vSPsUVDiYc+d4Mo7KJoMxB2NjwRCumwbfOw
 qc7Tph1ANBkmAuho7G79D07KwCOl5pfSKk8IEdw33K6Z+710/NyYYhQWsqe6zB17mSra
 4eWQl686hj6/1r0bHaLl1dsrQcPXBRP1eNpGf5C42ihhEy9TfrtYW+UbiRQs8YFjR/XZ
 qk+gJWe+KYpG2LvV4z22qPUtMzxavousQjX1xt0I+2kxqjOjrBlkocKdTD9anY2I3KAr
 VdAQ==
X-Gm-Message-State: AOAM5318egp9hID2UOMw/Y758Pr96psf/TlZBi3Fo+YPI4S4OnMMJQ5P
 LiwuPC8Huj1HqDXdxq5rcx8686WsWnE=
X-Google-Smtp-Source: ABdhPJwVfRPJeJooQAjnZWK+4ijI3th+IIRudN0QguOiV7DTpynyjild8wcQkKy0xPF18VKqjA4LMQ==
X-Received: by 2002:a05:600c:22d0:: with SMTP id
 16mr6763070wmg.35.1633897007122; 
 Sun, 10 Oct 2021 13:16:47 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id c18sm5895540wmb.27.2021.10.10.13.16.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Oct 2021 13:16:46 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 10 Oct 2021 22:15:41 +0200
Message-Id: <20211010201541.1422863-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/triggerhappy: use git tag instead
 of hash
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

Use release/0.5.0 tag instead of commit hash so
http://autobuild.buildroot.org/stats will report package as up to date

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/triggerhappy/triggerhappy.hash | 2 +-
 package/triggerhappy/triggerhappy.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/triggerhappy/triggerhappy.hash b/package/triggerhappy/triggerhappy.hash
index ab736cada3..0bb53f9455 100644
--- a/package/triggerhappy/triggerhappy.hash
+++ b/package/triggerhappy/triggerhappy.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1b3221963b9adca26eacc5442d8c2422cf2072f8adde1dbd691a69b37a583fb1  triggerhappy-b822888066129350e51ad79f1cf307fa38dae4f7.tar.gz
+sha256  af0fc196202f2d35153be401769a9ad9107b5b6387146cfa8895ae9cafad631c  triggerhappy-0.5.0.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/triggerhappy/triggerhappy.mk b/package/triggerhappy/triggerhappy.mk
index f83a557804..bb30e7ce1d 100644
--- a/package/triggerhappy/triggerhappy.mk
+++ b/package/triggerhappy/triggerhappy.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-TRIGGERHAPPY_VERSION = b822888066129350e51ad79f1cf307fa38dae4f7
-TRIGGERHAPPY_SITE = $(call github,wertarbyte,triggerhappy,$(TRIGGERHAPPY_VERSION))
+TRIGGERHAPPY_VERSION = 0.5.0
+TRIGGERHAPPY_SITE = \
+	$(call github,wertarbyte,triggerhappy,release/$(TRIGGERHAPPY_VERSION))
 TRIGGERHAPPY_LICENSE = GPL-3.0+
 TRIGGERHAPPY_LICENSE_FILES = COPYING
 TRIGGERHAPPY_DEPENDENCIES = host-pkgconf
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
