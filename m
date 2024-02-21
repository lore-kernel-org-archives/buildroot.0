Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64063C48BEB
	for <buildroot@archiver.kernel.org>; Wed, 21 Feb 2024 23:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5AF08121E;
	Wed, 21 Feb 2024 23:01:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IOoy1yF7SN5B; Wed, 21 Feb 2024 23:01:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC05F81E95
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC05F81E95;
	Wed, 21 Feb 2024 23:01:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0EB101BF47A
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 23:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F04DD6061A
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 23:01:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hir3N5GkL-sE for <buildroot@lists.busybox.net>;
 Wed, 21 Feb 2024 23:01:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 03E7E60F8F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03E7E60F8F
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 03E7E60F8F
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 23:01:24 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-41275855dc4so8693015e9.0
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 15:01:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708556482; x=1709161282;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=COqJTzVwDfpMtCWXodkyaW76rtg+HaZLrDl9fVX/gx0=;
 b=ZphxRQnZTDWvaOay1jg17KIG09c82+CwVxV5To+z23C6XW/Zm59gQZRXsuDFggK5UR
 nqp1++B7LdjYOipFXWKnirRcUe5RyKiHr8GdOC2wndNea6kPCUNRPirx1zWe6WHn6e2X
 4JlQN0/pk5hlILhI836WBDGdZTrXjU9vQcgttafUSLKmOZ9ayzKcCCJUGiQkcoAvhJgQ
 KVK317uDgEuGsBnDUNHwYGUxPWXv1MClR2DsevdEp7+FAI/NUMp8SPK0x/BdtMec5cY4
 Us3hZcapWQiqa6484yGoKZtdbA8amvuB5u6lBzXfN0JkRlexAf4wehAJFojzyX12T8qq
 RQ9Q==
X-Gm-Message-State: AOJu0YwPcXZOccUPxceInrqQM19LILHtZJtWhx1OEn7zYDSYkOAtHe+a
 1+BxpY81oTSAhxYnEr8YWDI0vvWhoqOAz8YNCreNfFQOr7n6xHDTIwKWhykn
X-Google-Smtp-Source: AGHT+IHeihoUQMd1UeqbjiHzP3spAvFU07v3j6EDfO4o2rKLqm2CYvJX247CAq07rFiI9UwCuMLKQg==
X-Received: by 2002:a05:600c:6009:b0:412:78c8:aa95 with SMTP id
 az9-20020a05600c600900b0041278c8aa95mr1519806wmb.15.1708556482437; 
 Wed, 21 Feb 2024 15:01:22 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 ew19-20020a056000241300b0033d7f6a6ae0sm3141202wrb.93.2024.02.21.15.01.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Feb 2024 15:01:22 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 22 Feb 2024 00:01:17 +0100
Message-ID: <20240221230117.1688400-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708556482; x=1709161282; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=COqJTzVwDfpMtCWXodkyaW76rtg+HaZLrDl9fVX/gx0=;
 b=DfrMAp9/D5ZVkNtN/hvtFuqd1myn0PzYKnZPoHOgEAXaXZSXpRvIKFxlJp2QO5WlUR
 FPxsANGfJRgP3NX83BHUGEOVWZMISCHFcCIvToR2rh0cDgTacQ6P1L/6h8K9yBirbWm7
 ZCz/3AFWPDbUdcRW2cXFFtjlClBm7KxKzQXw80ccih/ZkliR3ysl8txnkeXrePtW60rF
 810MJEzcKXZAJ0m1pyVdEf5aM83Jy7dt5EQ9Dnj4hvZVYpNK6ULufWja7sC3+mrsQdGm
 YUKcqa9cmkanU8zDyUmVyyAGRYlkEDxWtOpnUh9oDm56WYnqEALNEe50iC/6Y6cVMoKC
 sjWQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=DfrMAp9/
Subject: [Buildroot] [PATCH 1/1] package/udpxy: bump to version 1.0-25.1
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
Cc: David Bachelart <david.bachelart@bbright.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Switch site to get latest release
- Set ALL_CFLAGS to drop -Werror
- Update hash of README (changes not related to license)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/udpxy/Config.in  |  2 +-
 package/udpxy/udpxy.hash |  4 ++--
 package/udpxy/udpxy.mk   | 12 ++++++------
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/udpxy/Config.in b/package/udpxy/Config.in
index f442a2f2fe..84a754bed4 100644
--- a/package/udpxy/Config.in
+++ b/package/udpxy/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_UDPXY
 	  forwards UDP traffic from a given multicast subscription to
 	  the requesting HTTP client.
 
-	  http://www.udpxy.com/
+	  https://github.com/pcherenkov/udpxy/
diff --git a/package/udpxy/udpxy.hash b/package/udpxy/udpxy.hash
index 8455fcdb1a..e0dbd06a35 100644
--- a/package/udpxy/udpxy.hash
+++ b/package/udpxy/udpxy.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6ce33b1d14a1aeab4bd2566aca112e41943df4d002a7678d9a715108e6b714bd  udpxy.1.0.23-9-prod.tar.gz
-sha256  60ead3913246c7cd930fe653c0053aba1af2cd9f82b266befdbbd6e0b8ecb750  README
+sha256  a1a16e60895c6b2fd151321db47f5d5373843116f1b98ed9749e6c25a6c44497  udpxy-1.0-25.1.tar.gz
+sha256  aac36b21c5afa931fd0e5d796814e29102a3b1f2742fb8694a26ef135aebf943  README
diff --git a/package/udpxy/udpxy.mk b/package/udpxy/udpxy.mk
index 22467948a5..787f6e58ed 100644
--- a/package/udpxy/udpxy.mk
+++ b/package/udpxy/udpxy.mk
@@ -4,19 +4,19 @@
 #
 ################################################################################
 
-UDPXY_VERSION = 1.0.23-9-prod
-UDPXY_SOURCE = udpxy.$(UDPXY_VERSION).tar.gz
-UDPXY_SITE = http://www.udpxy.com/download/1_23
+UDPXY_VERSION = 1.0-25.1
+UDPXY_SITE = $(call github,pcherenkov,udpxy,$(UDPXY_VERSION))
 UDPXY_LICENSE = GPL-3.0+
 UDPXY_LICENSE_FILES = README
 
 define UDPXY_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		ALL_CFLAGS="$(TARGET_CFLAGS)" -C $(@D)/chipmunk
 endef
 
 define UDPXY_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) PREFIX=/usr \
-		-C $(@D) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/chipmunk DESTDIR=$(TARGET_DIR) \
+		PREFIX=/usr -C $(@D)/chipmunk install
 endef
 
 $(eval $(generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
