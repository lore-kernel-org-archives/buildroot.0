Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05C8C4332F
	for <buildroot@archiver.kernel.org>; Thu,  2 Nov 2023 17:13:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46163816F5;
	Thu,  2 Nov 2023 17:13:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46163816F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TM8OBjenZC9X; Thu,  2 Nov 2023 17:13:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16C8685255;
	Thu,  2 Nov 2023 17:13:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16C8685255
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E37B41BF380
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 17:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B954843533
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 17:13:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B954843533
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zsMnHkF0Z1P8 for <buildroot@lists.busybox.net>;
 Thu,  2 Nov 2023 17:13:04 +0000 (UTC)
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AE2774351A
 for <buildroot@buildroot.org>; Thu,  2 Nov 2023 17:13:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE2774351A
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-507b9408c61so1398447e87.0
 for <buildroot@buildroot.org>; Thu, 02 Nov 2023 10:13:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698945181; x=1699549981;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NnjuRaWhvvQQE0qrFji6bNSHo/JkIFQOKhE9t2CgXqc=;
 b=ciM5hgVF517yjDYlOBX1sO89wT1Q1M30dWvXSJgX84nMyNAGmCSpq/XIHk+GkwQPDU
 ZXuWxJD9I9VfhfyG44k91TIJ+h7fYBBzHflLt92aGFU1VXign4gth2ly1kQqElXGdbme
 FVnxFKT8M3Qge6n1ZX0d2EKR1zrTOgQ1BlAGjYTmPMN75ifCH274WnDPmn75Lw8AOa1C
 PFKHaf/OQFbw73RmhgNCHwBXYkzKWXLmKpi2ABh61XYMlP5ZSjd7qB4F3NuZ/QvDGI6h
 scEjQA9xpsyqznpd2XD9oD/+SlMr33V2tP65VDA/0prD0SQ8qa7HsxayshVBNKcEJyTO
 I/lA==
X-Gm-Message-State: AOJu0YwhMg2vE6kRAGns7md9tfctsfnDFB2bJhbPgJMV0qk5peH5cjB5
 P+yS0AtsnVh6GSSfm9hJayMr4kSBSAc=
X-Google-Smtp-Source: AGHT+IEvRbUSuZOqIVzINIvgJCDGSQj2gAG/f9kAM9ADa1gusWHfBUHgB9b8OWAQeG5u11vXJzaYVA==
X-Received: by 2002:ac2:5def:0:b0:500:daec:2817 with SMTP id
 z15-20020ac25def000000b00500daec2817mr13457212lfq.54.1698945180770; 
 Thu, 02 Nov 2023 10:13:00 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 c7-20020adffb47000000b00317a04131c5sm2928718wrs.57.2023.11.02.10.13.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 10:13:00 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  2 Nov 2023 18:12:57 +0100
Message-ID: <20231102171257.5910-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698945181; x=1699549981; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NnjuRaWhvvQQE0qrFji6bNSHo/JkIFQOKhE9t2CgXqc=;
 b=MTfnyWzUBxR/JMcKcsv4chpP4s0Ek5Wy59DPRh2PUjTwbojMSgotFb4eTlUeDN0qoK
 dRQtMJtTOMrLsdWopXBRPGhQxlgz1REXxb5QLIzgABTc67IsWKxebOP8MuvyAxqjbtCz
 wAnDmikDqJJAcATeA8ho8A3IdpaaYKN/RDJ77nAGvBeRWvNldCb3txtmRLhBFoXyx3WP
 OlD/zPAuXDPEkUlHNLgCQ/fSkR9DmKP2Z9JV0vWZb0/nmDquVAqBkzujIu6Wp70Sytj3
 WdtET7IaolpQjdxE6tOxRpraPQfJ/VkwQdtUz+L8E3Fh0eOmR8nNipkPqzvXE+14H6VC
 RLyg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=MTfnyWzU
Subject: [Buildroot] [PATCH 1/1] package/strace: bump to version 6.6
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

- Update hash of COPYING (year updated with
  https://github.com/strace/strace/commit/b45ed94f6926c9a7aae6bfb54f9a47ea313c0646)
- This bump will fix the following build failure with kernel >= 6.6 raised
  since
  https://github.com/torvalds/linux/commit/182741d287fb1ea870ee6ef45aa1915a0b031233
  thanks to
  https://github.com/strace/strace/commit/4eda6d7b61f46d81f7f87afa6fa802dcbe136ca1:

In file included from btrfs.c:51:
xlat/btrfs_key_types.h:167:37: error: 'BTRFS_EXTENT_REF_V0_KEY' undeclared here (not in a function); did you mean 'BTRFS_EXTENT_DATA_KEY'?
  167 | static_assert((unsigned long long) (BTRFS_EXTENT_REF_V0_KEY)
      |                                     ^~~~~~~~~~~~~~~~~~~~~~~
      |                                     BTRFS_EXTENT_DATA_KEY

https://github.com/strace/strace/releases/tag/v6.6

Fixes:
 - http://autobuild.buildroot.org/results/da026b8307a4ef1406d2c90d42564df38a172a50

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/strace/strace.hash | 6 +++---
 package/strace/strace.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index c43d3aabbc..75a35d7cf4 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature with RSA key 0xA8041FA839E16E36
-# https://strace.io/files/6.5/strace-6.5.tar.xz.asc
-sha256  dfb051702389e1979a151892b5901afc9e93bbc1c70d84c906ade3224ca91980  strace-6.5.tar.xz
-sha256  d92f973d08c8466993efff1e500453add0c038c20b4d2cbce3297938a296aea9  COPYING
+# https://strace.io/files/6.6/strace-6.6.tar.xz.asc
+sha256  421b4186c06b705163e64dc85f271ebdcf67660af8667283147d5e859fc8a96c  strace-6.6.tar.xz
+sha256  6e5648c0ed522b163f9df1dc500c73491b1743495bd78388e99685cecfa79707  COPYING
 sha256  7c379436436a562834aa7d2f5dcae1f80a25230fa74201046ca1fba4367d39aa  LGPL-2.1-or-later
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index d2ffaafc43..6279622fdb 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 6.5
+STRACE_VERSION = 6.6
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = https://github.com/strace/strace/releases/download/v$(STRACE_VERSION)
 STRACE_LICENSE = LGPL-2.1+
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
