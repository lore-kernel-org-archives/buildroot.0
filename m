Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC8CEC4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 15:59:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 757046F563;
	Fri, 10 Nov 2023 15:59:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 757046F563
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a_Ja9YdhOYSP; Fri, 10 Nov 2023 15:59:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CB8861726;
	Fri, 10 Nov 2023 15:59:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CB8861726
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 164A91BF37B
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 15:58:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F206360D88
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 15:58:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F206360D88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yhm5NWKz1Npl for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 15:58:39 +0000 (UTC)
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2D93060B99
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 15:58:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D93060B99
Received: by mail-pf1-x442.google.com with SMTP id
 d2e1a72fcca58-6be0277c05bso2028011b3a.0
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 07:58:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699631918; x=1700236718;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iE8gUsMknHVjMEWhvW42GvPFDGBMvIR4o9Yl9T5jvKQ=;
 b=j9WQRmmuBW1zbny9VychUzp1CgqBBk2v1EOdii4YBw3yCzhnAKN1Etmn4dS0ChKFdB
 enUO28KK9QKvre4St+uIAa2/FICyzT7Ikza69fV5GfFvTIE01PS+wH32ix2jVcSxrmcu
 P09LxURT6ejJIjqIHo64iRgwrlSsx5esD6P894eIM0q3wWnaAJ+n/O4+PyoH+nhVpUfD
 hBLZcUV+sEf9rYHUVnL9xefpCfSU3dky8zTItOY6zUBCF9F5o8yHBNfW5oQxGdx4ikVl
 i1x+fds1Y75XDy7FBcJE4NUxvrDbicCoN6RZfggWyaW8fgRtTGEWUiyyGeUeTIXm718v
 YcLg==
X-Gm-Message-State: AOJu0YxeCBHuYirCHm7kFCxrHUDMG/RPmn8dvz+O6UCL6NuE9A7wAIQl
 oBeQ5H8Da61cFeSLt4EikTnbfXdUPb2eaeWsgF6BCl0rgo0=
X-Google-Smtp-Source: AGHT+IEN3lKVAe/KbjnUSVBT5kDRghlU/XSO4kfBh7MN7rDQRhLI35mtRpRYwEV8zqp/tHim1c2SWw==
X-Received: by 2002:a05:6a21:187:b0:161:28e0:9abd with SMTP id
 le7-20020a056a21018700b0016128e09abdmr10251644pzb.16.1699631918145; 
 Fri, 10 Nov 2023 07:58:38 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.106])
 by smtp.gmail.com with ESMTPSA id
 p55-20020a056a0026f700b006c2d53e0b5fsm12796153pfw.57.2023.11.10.07.58.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 07:58:37 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 10 Nov 2023 08:58:25 -0700
Message-ID: <20231110155826.10416-7-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231110155826.10416-1-adam.duskett@amarulasolutions.com>
References: <20231110155826.10416-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699631918; x=1700236718;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iE8gUsMknHVjMEWhvW42GvPFDGBMvIR4o9Yl9T5jvKQ=;
 b=DL2/DOqGONdiy7pKsUSa9k84jX62t3wAyz6G6bvuMPW0Dazg8Z4M1IGtsSG24QZ/J3
 JgPBVAXxsGnzam4X3JTAEIQYTwdzNpdBPjhkp//zvbVZiCwqTBk3XX+RPnxpYiJT5J+4
 htheLnYO1DRh+eOdt2tZor+NF17JegA6Um44I=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=DL2/DOqG
Subject: [Buildroot] [PATCH v3 6/7] package/scons: bump version to 4.5.2
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Update License hash due to a year change: 2019 -> 2021
- Install the packages to the site-packages directory, or else packages using
  scons to build fail with import errors.

Tested with benejson, gpsd, and mongodb.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v1 -> v2:
  - Add a line in the log about updating the license hash
  - Fix installation paths.

 package/scons/scons.hash | 4 ++--
 package/scons/scons.mk   | 9 +++++----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/scons/scons.hash b/package/scons/scons.hash
index a72fbaee5a..48b5077b2e 100644
--- a/package/scons/scons.hash
+++ b/package/scons/scons.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  7801f3f62f654528e272df780be10c0e9337e897650b62ddcee9f39fde13f8fb  scons-3.1.2.tar.gz
-sha256  72ed889165fb28378cadac14552be4a959f1ebab6b148abb5dd2b49712c3c6f6  LICENSE.txt
+sha256  ce26aac95d350a79a4192196b0beac3cb24f4ccabce0123eb28d3370f576f072  SCons-4.5.2.tar.gz
+sha256  2f6ac9a1fc98394d18b80dba9bedb9d5626006d44db3fecf7cf3e21cff7e8b1c  LICENSE
diff --git a/package/scons/scons.mk b/package/scons/scons.mk
index 6b75d3ddca..ffd6abf609 100644
--- a/package/scons/scons.mk
+++ b/package/scons/scons.mk
@@ -4,14 +4,15 @@
 #
 ################################################################################
 
-SCONS_VERSION = 3.1.2
+SCONS_VERSION = 4.5.2
+SCONS_SOURCE = SCons-$(SCONS_VERSION).tar.gz
 SCONS_SITE = http://downloads.sourceforge.net/project/scons/scons/$(SCONS_VERSION)
 SCONS_LICENSE = MIT
-SCONS_LICENSE_FILES = LICENSE.txt
-SCONS_SETUP_TYPE = distutils
+SCONS_LICENSE_FILES = LICENSE
+SCONS_SETUP_TYPE = setuptools
 
 HOST_SCONS_INSTALL_OPTS = \
-	--install-lib=$(HOST_DIR)/lib/scons-$(SCONS_VERSION)
+	--install-lib=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
 
 $(eval $(host-python-package))
 
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
