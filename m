Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D325C4167B
	for <buildroot@archiver.kernel.org>; Wed, 29 Nov 2023 18:04:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1FCB41BF2;
	Wed, 29 Nov 2023 18:04:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1FCB41BF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qi-c5HX2dsZh; Wed, 29 Nov 2023 18:04:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 162BA41BED;
	Wed, 29 Nov 2023 18:04:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 162BA41BED
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 95CBF1BF286
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 18:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E78D614F6
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 18:04:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E78D614F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BXeXOhhgK8Wa for <buildroot@lists.busybox.net>;
 Wed, 29 Nov 2023 18:04:35 +0000 (UTC)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C381F61426
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 18:04:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C381F61426
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-6cdd214bce1so12143b3a.3
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 10:04:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701281074; x=1701885874;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KU3ON0OfqEse3L86lGgopsemvYKSaCMOUB9E145VMGA=;
 b=Q9c2xVXVkedMBXrQLRi82XqflWoWSE7Ifo2Immp1kfREdFXKkXrcA90BjveoJXK95S
 ExXo53tc22JIwbFudhz34n8ixEsZDmSgVIDgxojzqEfg4fXt97VW2BlOJwiHEanLv5tv
 3v1vprA5E+J5OkAIO8LJEUvQi2iGr7DRAM6cRWEnfihms4oE/CZAu1e4ka2RRhTa0gW/
 hDXxV68pi+CnAN9zAzoT5osy578Pm8+fK0DXT7krn4up6BhXokMuUW3xuAJns8AtyGL9
 f6ZIDjZeZqVWeu/vPi7KDjmMqJcpRjzgE1Uxr0kmQp5+2vT2TJ6oa+hphLVv7YJtaYat
 vutg==
X-Gm-Message-State: AOJu0YxdD9MY8z3EeGprERBuT2/jY7GM434vxXiyT2I91weu3Q0FkcdK
 dGR443bNtkf2qxNbT7xgIh0gDCPoy6nWflVk9vk=
X-Google-Smtp-Source: AGHT+IGnieuia5lDgcSix9n65QLR9hjS86f4JjNMIeufnoPriKO3amQof8vstPEtc4I/1f+foF5uYQ==
X-Received: by 2002:a05:6a00:a18:b0:6cb:8a8a:4bb6 with SMTP id
 p24-20020a056a000a1800b006cb8a8a4bb6mr21452203pfh.11.1701281074285; 
 Wed, 29 Nov 2023 10:04:34 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.200.96])
 by smtp.gmail.com with ESMTPSA id
 x8-20020aa784c8000000b006cb7bdbc3besm11488788pfn.17.2023.11.29.10.04.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 10:04:33 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 29 Nov 2023 11:04:29 -0700
Message-ID: <20231129180429.436635-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1701281074; x=1701885874;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KU3ON0OfqEse3L86lGgopsemvYKSaCMOUB9E145VMGA=;
 b=j0P4DrCoStTt90vtMsyfOwE4vTJRf3e0ek/zWie7h+qd82AhxJF8jChUBZLh6N72ZZ
 Kvd7Q7djss3/KgzXxculqdn+aSoLUKbRialULlP9H5SaoT8V1+VwV2YnyoMR7iXTRjbP
 GfNz8BzjJoLiCPrSStp8TAqefJ7Gu0wjsKSfI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=j0P4DrCo
Subject: [Buildroot] [PATCH 1/1] package/openrc: bump version to 0.52.1
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

The runscript and rc binaries have been removed in this release. However,
Buildroot does not use those binaries, so only a simple version bump is
necessary.

Fixes:
  - cgroups being inconsistent
  - Start-stop-daemon did not work correctly on Linux 6.6

Tested on Debian 11 and Fedora 39 with the following command:
./support/testing/run-tests tests.init.test_openrc

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/openrc/openrc.hash | 2 +-
 package/openrc/openrc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openrc/openrc.hash b/package/openrc/openrc.hash
index 698acf4978..c1c16a8c45 100644
--- a/package/openrc/openrc.hash
+++ b/package/openrc/openrc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4ec46f2729c77c4387146b491c4d121f5cba48bff2f0aeaff99895dcda5cea85  openrc-0.51.tar.gz
+sha256  0b911eee4e64ad5e6945c6fed572220d537dfd0108838fa6d6797a2d7ff9f052  openrc-0.52.1.tar.gz
 sha256  6ac2bf77510808fbec7dc86cbfbca98dfc4c6b47dc99e4ca77b5370e097d8e70  LICENSE
diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
index 63aec7615e..0dd6a5d1ac 100644
--- a/package/openrc/openrc.mk
+++ b/package/openrc/openrc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENRC_VERSION = 0.51
+OPENRC_VERSION = 0.52.1
 OPENRC_SITE = $(call github,OpenRC,openrc,$(OPENRC_VERSION))
 OPENRC_LICENSE = BSD-2-Clause
 OPENRC_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
