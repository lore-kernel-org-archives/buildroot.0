Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BED2C77B7F
	for <buildroot@archiver.kernel.org>; Wed,  3 May 2023 23:52:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2DD941E1F;
	Wed,  3 May 2023 23:52:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2DD941E1F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zjqka0W-r8-6; Wed,  3 May 2023 23:52:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A086C41BCD;
	Wed,  3 May 2023 23:52:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A086C41BCD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4B01C1BF3DC
 for <buildroot@lists.busybox.net>; Wed,  3 May 2023 23:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32459417AB
 for <buildroot@lists.busybox.net>; Wed,  3 May 2023 23:52:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32459417AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jQFEez52wnCX for <buildroot@lists.busybox.net>;
 Wed,  3 May 2023 23:52:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE2394031E
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BE2394031E
 for <buildroot@buildroot.org>; Wed,  3 May 2023 23:52:39 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-1aae5c2423dso50370655ad.3
 for <buildroot@buildroot.org>; Wed, 03 May 2023 16:52:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683157959; x=1685749959;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jiAg8SGy4bV6+6ZqMTlmqnnFE08YRyhT1Z2wUqrE9f4=;
 b=Jk0gmYbJCzqyDZn0Zz+j451/NlkiiRNmiv8tCCGLqLLG8n4ayzAFrzwM3PDcii2wzc
 yumdSpS1l15nMDZGKmdJBIOZXEfUuDIixLE7ElHqyR0lOCFx122cDdvDYpRP0qoJ3cfS
 cbJHO+wnfMjjdkIsJFbw1meSdKbL8Jc0xFTfAQ74DYINfBZj2TVvOQLu+Ao9pT7HCOSP
 9UYPNPttKab7jna/FaG/fzlYQONBnjWlo7U/O18NIpXlzbJdke3+gKQZLtwGBFcbZpal
 F4cjvNq0k9tYW2F8iwsVFgApkVJWnVgjMwxw3BtyLo7evHGYKJ74Jz2I2wMnQPaRYe8x
 lOXg==
X-Gm-Message-State: AC+VfDx16A7ytYmwr0rqgPRw9F04hrsNTin91Z+mxS4/BLt2M7DN9GWT
 QXZssVEwc9Qk9uUsrAjGIfpSd9Liv1QrAQ==
X-Google-Smtp-Source: ACHHUZ64WagtFg6mgxEy62g9IQj70P9ATVKLFRJhKZieDFEARcpT37uHSV2tPMdYCrb3XtjNQjrWCw==
X-Received: by 2002:a17:903:2292:b0:1a6:84be:a08f with SMTP id
 b18-20020a170903229200b001a684bea08fmr2055394plh.64.1683157958580; 
 Wed, 03 May 2023 16:52:38 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 d7-20020a170902cec700b001aada56298csm8251492plg.199.2023.05.03.16.52.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 16:52:37 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed,  3 May 2023 16:52:34 -0700
Message-Id: <20230503235235.1441019-1-christian@aperture.us>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/docker-engine: bump version to
 23.0.5
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
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/moby/moby/releases/tag/v23.0.5

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index 0dc974ce85..092ec989cf 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2f74aef0eadf5bfe652b1822f1349fa0baf7412f83b856a9cfb9a8fbfd686880  docker-engine-23.0.3.tar.gz
+sha256  f502eba135828ae52cefb12f1c74092c8865e39cb94f5daed0f3f6717a8d50a3  docker-engine-23.0.5.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index c0f2c73b69..f904793aa2 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 23.0.3
+DOCKER_ENGINE_VERSION = 23.0.5
 DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
