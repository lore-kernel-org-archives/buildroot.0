Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F7FC61DA4
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 22:32:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAB2460B9B;
	Wed, 22 Feb 2023 22:32:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAB2460B9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b-WFN5lIg_uj; Wed, 22 Feb 2023 22:32:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3B416177C;
	Wed, 22 Feb 2023 22:32:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3B416177C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A5D991BF3D2
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 22:31:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 80D1E4037E
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 22:31:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80D1E4037E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kXTAqLXPtzDk for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 22:31:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9468B40131
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9468B40131
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 22:31:09 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id x1so9844508qtw.3
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 14:31:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r9ygjNFz9+vKwtefGimzNTrmUuifrBNIgaZUvzppyJ4=;
 b=RZGJTVrFVedzC6pBEvdmYyw5n53/HdJ7chTL59JnBbtPX/jYGlQA7ps7pq8qKCcO5f
 rwD6vCTBIR5eNV8KemhbiU2/OoySp3Hg9W4WdXcJm0dQaU4Lccm9p2fhGkOExM5Oins+
 Ol2z+2OHS4KG5gDnkIAEBaBsMYBDTR7XWuymJaS6ChaFMaMcYDajlhVJCrE/K+CybVnJ
 D95OH4Qy4Fr2NhasUuUdILjVoHmEpD/9RmNcu4XlcZ0dEK48QqQDzZP3+cg0nQlovmM7
 CBeOOWiojUCAevwcvRykvj/iRSEaTV0HK5ZIu8Vwob1FVRKRLV92WqrlTP+NABBecD5e
 PoSg==
X-Gm-Message-State: AO0yUKWeLvWxx5hP1eNErnbIOkBDzLEi1YVOADP1Z2ZKTWhLbF44CIdV
 wFECVebofRFg1mlXaN4Ta+vyxrl2pys=
X-Google-Smtp-Source: AK7set9elSpoJlzuO4NEa/JmvjmPsUhRX0snM5hOVozVHsNI0Yg9WdwTP3kG8IhxERlUX2e0MX/0uA==
X-Received: by 2002:ac8:5dc9:0:b0:3b8:429e:c6f5 with SMTP id
 e9-20020ac85dc9000000b003b8429ec6f5mr28980268qtx.30.1677105068107; 
 Wed, 22 Feb 2023 14:31:08 -0800 (PST)
Received: from abyss.attlocal.net
 (108-193-1-150.lightspeed.sntcca.sbcglobal.net. [108.193.1.150])
 by smtp.gmail.com with ESMTPSA id
 d191-20020a3768c8000000b0073b4d8cb4a5sm3538837qkc.60.2023.02.22.14.31.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 22 Feb 2023 14:31:07 -0800 (PST)
From: Charles Hardin <ckhardin@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 14:30:53 -0800
Message-Id: <ac3d46f3e8aeab83ccbd617fff5d69f7c82eb3ad.1677104777.git.ckhardin@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1677104777.git.ckhardin@gmail.com>
References: <20230209231518.9458-1-ckhardin@gmail.com>
 <cover.1677104777.git.ckhardin@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r9ygjNFz9+vKwtefGimzNTrmUuifrBNIgaZUvzppyJ4=;
 b=EpawnigBwv0QX0/gVc1+axCx0lNTKD/OtCU3tcBGJUU6Oh3GhUOEdHItK8Y/Au6PjK
 OzfiuvGR21e8e11TrPuBJOgZTdxbMl9NMcVr3FpcDn35JrZ42A9N2+wpbzbeVtmxCaGr
 udUzcpk+69aVTVDJNgb+rKJ29tw6LvWkC8FAu+4cQ5KMi0Y3MWT7ajf7HADfOzx3LHm3
 vahHoQfjWUJcFzPSv+cPbyKKER8gkvMMyYSZ+1jkWeUkrxguVPhVu6HD8jKnoMUB70lG
 V9iet17VGkWkBSGzzi76txrUT9lPCsKC+5Mjtk7MzLK0jXi9MGE5Bv5shR6v/UKbxAAw
 O2mg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=EpawnigB
Subject: [Buildroot] [PATCH v2 3/3] linux: add a scmversion rsync hook when
 overriding srcdir
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
Cc: Charles Hardin <ckhardin@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

During development the override srcdir is often used with a local
git repo and branch. To help track the builds used in those flows
it is useful to have the scm version available as part of the info.
With this hook, the auto generated version include will include the
example.

    #define UTS_RELEASE "5.4.70-00031-g92c23d10d003"

Signed-off-by: Charles Hardin <ckhardin@gmail.com>
---
 linux/linux.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 7645b5f507..b72318e3f2 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -24,12 +24,15 @@ LINUX_SOURCE = $(notdir $(LINUX_TARBALL))
 else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_GIT),y)
 LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
 LINUX_SITE_METHOD = git
+LINUX_SCMVERSION = YES
 else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_HG),y)
 LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
 LINUX_SITE_METHOD = hg
+LINUX_SCMVERSION = YES
 else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_SVN),y)
 LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
 LINUX_SITE_METHOD = svn
+LINUX_SCMVERSION = YES
 else ifeq ($(BR2_LINUX_KERNEL_LATEST_CIP_VERSION)$(BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION),y)
 LINUX_SOURCE = linux-cip-$(LINUX_VERSION).tar.gz
 LINUX_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git/snapshot
@@ -46,6 +49,15 @@ LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v$(firstword $(subst ., ,$(LINUX_
 endif
 endif
 
+ifneq ($(LINUX_OVERRIDE_SRCDIR),)
+define LINUX_SCMVERSION_HOOK
+	$(TOPDIR)/support/download/scmversion \
+		$(abspath $(LINUX_OVERRIDE_SRCDIR)) $(@D)/.scmversion
+endef
+
+LINUX_POST_RSYNC_HOOKS += LINUX_SCMVERSION_HOOK
+endif
+
 ifeq ($(BR2_LINUX_KERNEL)$(BR2_LINUX_KERNEL_LATEST_VERSION),y)
 BR_NO_CHECK_HASH_FOR += $(LINUX_SOURCE)
 endif
-- 
2.24.3 (Apple Git-128)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
