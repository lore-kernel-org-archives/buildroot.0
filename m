Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 715F3C433FE
	for <buildroot@archiver.kernel.org>; Wed, 30 Nov 2022 07:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECBFF60ADB;
	Wed, 30 Nov 2022 07:44:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECBFF60ADB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wIgm5HTto2Lp; Wed, 30 Nov 2022 07:44:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 291AC60C28;
	Wed, 30 Nov 2022 07:44:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 291AC60C28
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A2FC51BF853
 for <buildroot@lists.busybox.net>; Wed, 30 Nov 2022 07:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7904581EAD
 for <buildroot@lists.busybox.net>; Wed, 30 Nov 2022 07:44:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7904581EAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sN8S5T2D-fdM for <buildroot@lists.busybox.net>;
 Wed, 30 Nov 2022 07:44:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE73C81E64
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BE73C81E64
 for <buildroot@buildroot.org>; Wed, 30 Nov 2022 07:44:48 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id k79so1554482pfd.7
 for <buildroot@buildroot.org>; Tue, 29 Nov 2022 23:44:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IsgCQN5jNHez5qkupVin+fJbZwMTnEwBi0ywf6BhLas=;
 b=UV+DmxdM63v35EPrQ9Exu9DMw/+9R9y73tCohbZDXeix6CXAEv+MzYnV5jHbUe3kj9
 v26T1zGD0rET0GyTDkUt2TY5sIuMj6bQ2cewAE12MWtfSs0fmHSCl5whhwak3/hQUDv5
 ZQGOidK65aFAkb1rfW+mEMf0/pyUywrNLQjrd0kjSrCHepQQNsBxL88LFT2ESYdwobQo
 Q+53S/47UUkbo/p36n5pYcLeZPpybFFqZjOJ6JbLxk0m/DYvjb28FcZgePrzxLx4myGF
 jJjoJkanc6iYWN6La7U+K6FZOdwozal/jLUX0vUdBcwmoHpMMuVIfrDAxizqxHG5627S
 E7Ng==
X-Gm-Message-State: ANoB5pn8gxYZAebB/PV8umevcMvIm711YbqV/ZSbSWJXs7PFjaQS3lka
 dKmpqdzHNlZtSvcQQ90eR/7Ui/CH8ME=
X-Google-Smtp-Source: AA0mqf5N5eB+Fj6BZxFtrDlwb8eqrjqvTyaADQk+L8KvKlS9uVd25rlqoyF0EQtKqCByxkLnn68Sug==
X-Received: by 2002:a63:d443:0:b0:477:c8ea:b734 with SMTP id
 i3-20020a63d443000000b00477c8eab734mr28287988pgj.294.1669794287627; 
 Tue, 29 Nov 2022 23:44:47 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 w64-20020a17090a6bc600b00219025945dcsm2512810pjj.19.2022.11.29.23.44.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 23:44:46 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue, 29 Nov 2022 23:44:43 -0800
Message-Id: <20221130074444.829636-1-christian@paral.in>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/balena-engine: bump to version
 20.10.21
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/balena-os/balena-engine/blob/v20.10.21/CHANGELOG.md

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/balena-engine/balena-engine.hash | 2 +-
 package/balena-engine/balena-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/balena-engine/balena-engine.hash b/package/balena-engine/balena-engine.hash
index ef590881f5..4adb8ce561 100644
--- a/package/balena-engine/balena-engine.hash
+++ b/package/balena-engine/balena-engine.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  43f4c985b855a4f731a5cdac214f1adf6c4cc2021cbad3f93856009df246d61c  balena-engine-20.10.12.tar.gz
+sha256  4fb38109d133d499de366466a612fb6f523ea99d56fcd69b45dc494a75fbce0f  balena-engine-20.10.21.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/balena-engine/balena-engine.mk b/package/balena-engine/balena-engine.mk
index 0afcea3d7e..ecfb62bfbf 100644
--- a/package/balena-engine/balena-engine.mk
+++ b/package/balena-engine/balena-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BALENA_ENGINE_VERSION = 20.10.12
+BALENA_ENGINE_VERSION = 20.10.21
 BALENA_ENGINE_SITE = $(call github,balena-os,balena-engine,v$(BALENA_ENGINE_VERSION))
 
 BALENA_ENGINE_LICENSE = Apache-2.0
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
