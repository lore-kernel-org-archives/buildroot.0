Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE495C61DA4
	for <buildroot@archiver.kernel.org>; Thu,  2 Feb 2023 13:32:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56BE041BC3;
	Thu,  2 Feb 2023 13:32:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56BE041BC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HwxWL6r9rgqj; Thu,  2 Feb 2023 13:31:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A7F741BBE;
	Thu,  2 Feb 2023 13:31:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A7F741BBE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 52C961BF30A
 for <buildroot@lists.busybox.net>; Thu,  2 Feb 2023 13:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2945281F90
 for <buildroot@lists.busybox.net>; Thu,  2 Feb 2023 13:31:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2945281F90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8vhgkhZCxtjT for <buildroot@lists.busybox.net>;
 Thu,  2 Feb 2023 13:31:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55E9781F83
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 55E9781F83
 for <buildroot@buildroot.org>; Thu,  2 Feb 2023 13:31:55 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id u5so1175632pfm.10
 for <buildroot@buildroot.org>; Thu, 02 Feb 2023 05:31:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QhgqWXnoZ6RXSSOgf9s8aVPOL/xbyfcgh3ejbdxTIzU=;
 b=u84y8+6rdBvJPVkrBbqYVeDEb8FlIfXGvIJAY4KmdKrUxmdVDKFd184922/5bSga96
 JnMxddcFQvL0WTCvtlYeXGcd/9dVNWop8ZmI9H73jLtrEvx33mCClXnazI7jEu8//EmL
 2kaFxgkkEpTJVSJkAQ9RWovcTqwxcLazaRWI5OP7b/L7h1VhOJZxp4K2CaDPxSpYJrfD
 p3zsU0USB1ipl+h7wM1g8BHgIjK2UaB905UuFPkJPh9KOmjO8kDzsxZt9LoggvsRWFnA
 0OyhYBOQU8kmn2w4/AeExErFqyfUYMUPsTYOXA7p/WODwv0SMWXMBT45mSqww3w60fNG
 cQTg==
X-Gm-Message-State: AO0yUKUhhpkej8/AHUoXaanhW4x/7vw2Z1bMXarbPNDnNzL6o1yhcHvw
 fyr6G7KBIZmfXAkyyFlRNjLT/dy1IRXZMA==
X-Google-Smtp-Source: AK7set8uE1X8/Sx4+NDQsmj4DAw8ar1hTvoSIei6mwn1H5h4c0as0MbN+fASvAbHCVQ8Don7jZbj9A==
X-Received: by 2002:a05:6a00:ace:b0:592:591f:196b with SMTP id
 c14-20020a056a000ace00b00592591f196bmr7321612pfl.18.1675344714276; 
 Thu, 02 Feb 2023 05:31:54 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 p6-20020a056a000a0600b00581013fcbe1sm13560563pfh.159.2023.02.02.05.31.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 05:31:53 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu,  2 Feb 2023 05:31:51 -0800
Message-Id: <20230202133151.1671576-1-christian@paral.in>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 1/1] package/cni-plugins: bump version to
 1.2.0
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

Adds new device driver main/dummy and various bug fixes/cleanups.

https://github.com/containernetworking/plugins/releases/tag/v1.2.0

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/cni-plugins/cni-plugins.hash | 2 +-
 package/cni-plugins/cni-plugins.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/cni-plugins/cni-plugins.hash b/package/cni-plugins/cni-plugins.hash
index fc3b5a7ead..0c3e07c91c 100644
--- a/package/cni-plugins/cni-plugins.hash
+++ b/package/cni-plugins/cni-plugins.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c86c44877c47f69cd23611e22029ab26b613f620195b76b3ec20f589367a7962  cni-plugins-1.1.1.tar.gz
+sha256  f3496ddda9c7770a0b695b67ae7ee80a4ee331ac2745af4830054b81627f79b7  cni-plugins-1.2.0.tar.gz
 sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
diff --git a/package/cni-plugins/cni-plugins.mk b/package/cni-plugins/cni-plugins.mk
index b30937095a..be02c2ff45 100644
--- a/package/cni-plugins/cni-plugins.mk
+++ b/package/cni-plugins/cni-plugins.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CNI_PLUGINS_VERSION = 1.1.1
+CNI_PLUGINS_VERSION = 1.2.0
 CNI_PLUGINS_SITE = $(call github,containernetworking,plugins,v$(CNI_PLUGINS_VERSION))
 CNI_PLUGINS_LICENSE = Apache-2.0
 CNI_PLUGINS_LICENSE_FILES = LICENSE
@@ -12,6 +12,7 @@ CNI_PLUGINS_LICENSE_FILES = LICENSE
 CNI_PLUGINS_BUILD_TARGETS = \
 	plugins/ipam/dhcp \
 	plugins/main/bridge \
+	plugins/main/dummy \
 	plugins/main/host-device \
 	plugins/main/ipvlan \
 	plugins/main/loopback \
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
