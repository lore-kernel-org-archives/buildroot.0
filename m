Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F78C636D6
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 22:13:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40CA560AED;
	Wed, 22 Feb 2023 22:13:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40CA560AED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J_fHzfxUYCXI; Wed, 22 Feb 2023 22:13:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 570C76175E;
	Wed, 22 Feb 2023 22:13:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 570C76175E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3635A1BF3D2
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 22:12:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E13A81F87
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 22:12:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E13A81F87
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 33W3VFryTV84 for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 22:12:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B04F81F7A
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2B04F81F7A
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 22:12:14 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id y3so9764586qvn.4
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 14:12:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r9ygjNFz9+vKwtefGimzNTrmUuifrBNIgaZUvzppyJ4=;
 b=JORMxsHA0O4H72kEfIoPQg1IGSRO+BgsqC/qqGmA6oXl9hrrNmtYjvprDgy18ENInL
 dCQNJl8nLlxxzzEgr1IM0rITnMnKjpkTjxQR1S9kx3VfAO+9ohKAxgw8jsOUUFVXDpsD
 hES0+xuR7ThFPS5trt1iEFIT9XKxAzVax79vIUh7mEE7kENeJod2Gw+F+UcgrJZImr1D
 vhKE8+JfBzTNMM+LafCOlQpYgQRU67+6eMnNkiPCtn7eTA9M1jVIMhCvnaXpX5SXKbrA
 rAeBStpeAb6FY/dcuD2PvAIXY+AUlzKtfjlvIil7e0bT4J8Me1RUkhZgvcaN53iXiiFI
 apKQ==
X-Gm-Message-State: AO0yUKXeLxZtfUEbMSLQTy+20e/8Hbu5GIWQIpks8UWbiBO1cwX8IXKB
 mcvVJOao5QDq16ar5tJz6+4mkdDkipc=
X-Google-Smtp-Source: AK7set+r2rlfpy6BftnHOTiopkkhScvH2aWWQ2yON1i7t2mAjQ3LL2UF1fJHr8QuyEvO1n/JFr+Tmw==
X-Received: by 2002:a05:6214:202d:b0:56e:9f19:71f9 with SMTP id
 13-20020a056214202d00b0056e9f1971f9mr21097772qvf.17.1677103932709; 
 Wed, 22 Feb 2023 14:12:12 -0800 (PST)
Received: from abyss.attlocal.net
 (108-193-1-150.lightspeed.sntcca.sbcglobal.net. [108.193.1.150])
 by smtp.gmail.com with ESMTPSA id
 79-20020a370552000000b007422efb38fasm3042210qkf.39.2023.02.22.14.12.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 22 Feb 2023 14:12:12 -0800 (PST)
From: Charles Hardin <ckhardin@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 14:11:34 -0800
Message-Id: <20230222221134.25904-4-ckhardin@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230209231518.9458-1-ckhardin@gmail.com>
References: <20230209231518.9458-1-ckhardin@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r9ygjNFz9+vKwtefGimzNTrmUuifrBNIgaZUvzppyJ4=;
 b=KvnKf6+eosD8i963pURpVqCVgWfG0oEJDWlKNvF6DoM1QSfbgioBwowLMbz3fI8Hnn
 JhSP9XqR32klnvzPDJA+jh0Y8I1udNned4uOdh+Yvfn7BQCwm8UGioJTvYODc1dh6Oc0
 dSiGxnU18nHcrobgLrZ/yCWwsDWjs+8sk9S9oGieBWkzSdR6MZjKAicpXNjW+PvYzLUm
 99wXrpQA9TK0xtM1Pu7lk3eGYwOlAPqsibQ1o1w6QIYJoNXvWoNYzi7avMD4fN8y82lS
 hfyn3MQ7sdrZiJD1FvUgcrc4DUjB6At9qIlXwQWoTC+cX8O9Q2gILbAndiWh+H44nAYI
 C9pg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=KvnKf6+e
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
