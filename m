Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A72B7C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 22:32:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E11E820EB;
	Thu,  8 Dec 2022 22:32:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E11E820EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AatIQdknTcw3; Thu,  8 Dec 2022 22:32:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D6E7820E4;
	Thu,  8 Dec 2022 22:31:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D6E7820E4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A31F11BF35F
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:31:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7783060AD7
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:31:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7783060AD7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h6lOHJihHuNX for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 22:31:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68DC760A74
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 68DC760A74
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 22:31:57 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id p24so2966955plw.1
 for <buildroot@buildroot.org>; Thu, 08 Dec 2022 14:31:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iJZV3pxifws1aJ5aPz6c90J7LwTFknz5fvkSPKcOzlA=;
 b=Ev3UWlfEczLMtXB7oNdz2H+LBxeElwOHDMuB/q/yqw0iX4UpGlzY2J1LDvy23oTbf6
 0cEHliMsI7x5yuHMDaBPbF9MuDWuwduuRXLXtLoQYFkXcWkX0ablcVRvEyUK6rNX35e5
 c8SVlfAlyoMVPijsKzWkrd+ZfZuMxKr/zVkKWXTmSRAwIe9JDrGBlV309qynkO/aWfAA
 56S8n/KKjKTz12D2RP8rsFjX1kYVWUaoJRDtVzCBurdAyVcDD7fKoVsvLgW7ymNfOSDw
 oPDUbRZXkGtBGVfGiBAk87v9mAekvXf7JsdE93d6xwDxo0yFuKKSJSjXXJaabTK4vnf8
 hX7w==
X-Gm-Message-State: ANoB5pm5q+o4AnkAdAzMxqWpFKqt5CJ8Hokd17aiCYywcrT1UD9qbCs3
 7QVyH6ZyoCdW/Tz6ZMFtifbQIWEPYgg=
X-Google-Smtp-Source: AA0mqf6OcQe7VGIO0crHH0rrW5vq8hRzl2UILoOcx6mxOJxpMTGEa92tCpaaAHX5Bjir2sjeXUYP9A==
X-Received: by 2002:a05:6a21:168e:b0:a7:9730:6c13 with SMTP id
 np14-20020a056a21168e00b000a797306c13mr4188624pzb.21.1670538716429; 
 Thu, 08 Dec 2022 14:31:56 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 ij27-20020a170902ab5b00b00188f7ad561asm17046280plb.249.2022.12.08.14.31.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 14:31:55 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 14:31:53 -0800
Message-Id: <20221208223153.4189684-1-christian@paral.in>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/moby-buildkit: security bump to
 version 0.10.6
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

CVE-2022-39253: git vulnerability mitigation.

... and other bugfixes.

https://github.com/moby/buildkit/releases/tag/v0.10.6

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/moby-buildkit/moby-buildkit.hash | 2 +-
 package/moby-buildkit/moby-buildkit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/moby-buildkit/moby-buildkit.hash b/package/moby-buildkit/moby-buildkit.hash
index cfd1c0c946..43ee1b12c9 100644
--- a/package/moby-buildkit/moby-buildkit.hash
+++ b/package/moby-buildkit/moby-buildkit.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  5877faf02cbddfb6c988f44b5b373739fed87f4aeb8802c6777fe7be2f772506  moby-buildkit-0.10.0.tar.gz
+sha256  5ffe5a2d11736719649dae962461f66df394ae4cc1e58294e5f2bd4d4632d9d0  moby-buildkit-0.10.6.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/moby-buildkit/moby-buildkit.mk b/package/moby-buildkit/moby-buildkit.mk
index 667383bf50..59d68a7dca 100644
--- a/package/moby-buildkit/moby-buildkit.mk
+++ b/package/moby-buildkit/moby-buildkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOBY_BUILDKIT_VERSION = 0.10.0
+MOBY_BUILDKIT_VERSION = 0.10.6
 MOBY_BUILDKIT_SITE = $(call github,moby,buildkit,v$(MOBY_BUILDKIT_VERSION))
 MOBY_BUILDKIT_LICENSE = Apache-2.0
 MOBY_BUILDKIT_LICENSE_FILES = LICENSE
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
