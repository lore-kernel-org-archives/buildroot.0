Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15830C61DA4
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 22:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A379A60E49;
	Wed, 22 Feb 2023 22:13:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A379A60E49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 27VYFo4GYaxZ; Wed, 22 Feb 2023 22:13:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E11BE60AED;
	Wed, 22 Feb 2023 22:13:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E11BE60AED
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D02E71BF3D2
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 22:12:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B756981F87
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 22:12:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B756981F87
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p2PHKFyUDHHK for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 22:12:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B02F381F7A
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B02F381F7A
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 22:12:11 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id fp16so9080801qtb.10
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 14:12:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9EoSxMmCs7qU8PeYW+nJGy3b/049yB0iwMTUOv5Qglo=;
 b=or3mlF8QO3QkMO99I8waeNpVJfEvxGWWRhC3x8wHL0emgsueHuKd6o9YTcCRB5HDRJ
 D61vXqj/CZZrXJLmTR7YbRdPqW8HE8OZ3jAiKKxYtSA0jgwbVeoPum6Id9X3qvJgG/fj
 oUftvnBQC3StJL2Zu76w4PCRFFtVBWTCUNv+nZLo1PMGS1nGkMyj6/NsD997R9On6TQm
 AgN/kp9VmjCCK9Ywasr96g7OHQTB67SJo57yyTFt/b6b+TyWmpCRSTQdoBXID9gPrqVM
 VeBfdW8cKxOymrb/4QbBMv2cOJPhbDHikFFIeXF/OC9KDdeeeh70cIu8T/b7ZZvpCNEm
 l5lQ==
X-Gm-Message-State: AO0yUKX7f+aThzJ8B4K6dKu3lbtnXjBFa7Bl1qSJMlUKOWL0CqODtRR5
 2cmrO9S9BCYqJNiLqD9RWQ56ZQjad7s=
X-Google-Smtp-Source: AK7set8L5tuf5b0pCa0OlhXQJvBcxgQC53rdzO5Hb67K+MN+vooJrNm7pza/8D7i3LxcmC1J97fPzw==
X-Received: by 2002:ac8:7c46:0:b0:3bf:a667:893 with SMTP id
 o6-20020ac87c46000000b003bfa6670893mr10768650qtv.15.1677103930244; 
 Wed, 22 Feb 2023 14:12:10 -0800 (PST)
Received: from abyss.attlocal.net
 (108-193-1-150.lightspeed.sntcca.sbcglobal.net. [108.193.1.150])
 by smtp.gmail.com with ESMTPSA id
 79-20020a370552000000b007422efb38fasm3042210qkf.39.2023.02.22.14.12.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 22 Feb 2023 14:12:09 -0800 (PST)
From: Charles Hardin <ckhardin@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 14:11:33 -0800
Message-Id: <20230222221134.25904-3-ckhardin@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230209231518.9458-1-ckhardin@gmail.com>
References: <20230209231518.9458-1-ckhardin@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9EoSxMmCs7qU8PeYW+nJGy3b/049yB0iwMTUOv5Qglo=;
 b=RIy5FTSgKRCXVp9xcjPJQmwAjql8TzGxO8z4yfdAidnisyZYaaGmXoD556+uzqBIQK
 FLuOXEfgNu1qbmdV4MQStleMGYDcscv8YOPd9h01AxMFAzMAYa+1CD5Z5UQ4xSJvjxLx
 Igxf+eDsgVBEyH4qsM5knFTnZUwIlAj4Z/DZsG/CsW5+XZuUR5Qv+IiDxfWdmBBWkqYu
 XA0FRL1/bhZiHY3hA5GOr8jTwqeiqaD4tbhjKE/1GK7qyiqG3B4rc57rkNcipm5V4ofY
 StkmRI3bHSnASQqOShLsHQrTBdDtNH6IBKr3c11HPndp7GkOvPM+mOVWRykeAsDkBd3g
 3rHw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=RIy5FTSg
Subject: [Buildroot] [PATCH v2 2/3] boot/uboot: add a scmversion rsync hook
 when overriding srcdir
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
Cc: Charles Hardin <ckhardin@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

During development the override srcdir is often used with a local
git repo and branch. To help track the builds used in those flows
it is useful to have the scm version available as part of the info.
With this hook, the auto generated version include will include the
example.

    #define PLAIN_VERSION "2018.03-01358-gbda75d6a8b"
    #define U_BOOT_VERSION "U-Boot " PLAIN_VERSION

Signed-off-by: Charles Hardin <ckhardin@gmail.com>
---
 boot/uboot/uboot.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 4eae8e95c3..edb6c646c7 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -28,18 +28,30 @@ UBOOT_SOURCE = $(notdir $(UBOOT_TARBALL))
 else ifeq ($(BR2_TARGET_UBOOT_CUSTOM_GIT),y)
 UBOOT_SITE = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_REPO_URL))
 UBOOT_SITE_METHOD = git
+UBOOT_SCMVERSION = YES
 else ifeq ($(BR2_TARGET_UBOOT_CUSTOM_HG),y)
 UBOOT_SITE = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_REPO_URL))
 UBOOT_SITE_METHOD = hg
+UBOOT_SCMVERSION = YES
 else ifeq ($(BR2_TARGET_UBOOT_CUSTOM_SVN),y)
 UBOOT_SITE = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_REPO_URL))
 UBOOT_SITE_METHOD = svn
+UBOOT_SCMVERSION = YES
 else
 # Handle stable official U-Boot versions
 UBOOT_SITE = https://ftp.denx.de/pub/u-boot
 UBOOT_SOURCE = u-boot-$(UBOOT_VERSION).tar.bz2
 endif
 
+ifneq ($(UBOOT_OVERRIDE_SRCDIR),)
+define UBOOT_SCMVERSION_HOOK
+	$(TOPDIR)/support/download/scmversion \
+		$(abspath $(UBOOT_OVERRIDE_SRCDIR)) $(@D)/.scmversion
+endef
+
+UBOOT_POST_RSYNC_HOOKS += UBOOT_SCMVERSION_HOOK
+endif
+
 ifeq ($(BR2_TARGET_UBOOT)$(BR2_TARGET_UBOOT_LATEST_VERSION),y)
 BR_NO_CHECK_HASH_FOR += $(UBOOT_SOURCE)
 endif
-- 
2.24.3 (Apple Git-128)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
