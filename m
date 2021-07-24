Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B6A1C4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 21:19:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A0F460E92
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 21:19:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2A0F460E92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F02C8605E9;
	Sat, 24 Jul 2021 21:19:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rFQczBawp6Uw; Sat, 24 Jul 2021 21:19:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CB86605D6;
	Sat, 24 Jul 2021 21:19:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5401D1BF2AA
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 21:19:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43856401CE
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 21:19:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dvT5PClxORtF for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 21:19:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6E96F40130
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 21:19:26 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 u15-20020a05600c19cfb02902501bdb23cdso771734wmq.0
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 14:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A+VCLKxh8VqvbCtZEEqXqjRMil6kwBJL6I1UMqzu9iE=;
 b=uUQ7yzI0z8tsGMqwEx0sWLBOWkG3sDz3mZg/brV/YHJcWDlHUS3WeNxt8KIuvxH7eu
 zVb4/xaz0mRIkNeDFXk3ZZD0jHIFlQeh25MU1FG2rdHrM3VlZOHpZv68Q81MCUHUyuAs
 n3OczeaadHnHQkQY6hHmFMjr4y5TJ8PfzYW2IBYNuCcQy2CdlRlzHhZ1iZXllYLxqjTH
 2q3OPTm8EKXb2X7jQ4mjGm6YdAO1Eud3bosv2D/B7ohHwDccB+OfBZiLj68oM1/4W6ol
 IAjYQ4KE4KbIxX6fY1ehkqQgjjn7CeAvFHguOKfIx6+hOnVdyyQPUQBUem8ejyknLSJV
 T90w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=A+VCLKxh8VqvbCtZEEqXqjRMil6kwBJL6I1UMqzu9iE=;
 b=VcqzqnAG1EsEKMv5OJ7bmbo8E3RV5SaDtBnGr3AaHrjBrFN7duKm9zPDbkTkMdyU5/
 P6Nq7GAcQ/3nzIwmdpj4t1WncMyKQ92H4pXrjOB5QpLIo75kTnsqtzMr1hXOAjMvdA/J
 8Z/gwH6GEc6QQOidwz22DWMq+WfUy4sLM2ajZ02Vq5AQT2s/giWtevQtiw90J+UYw10J
 pQZCB8w7Dzs2aWH9P/SJRCfrpIzksMJ+PsoNc84QwzvCFSu0g2B6sao30Dq3mpYDTFtz
 zmZMAyCgtfnEj8OAeQpN6ZF9fr+e8NinCd91l4KFhh16u+Qo9HZXORDlMx8c1aKOwl6k
 uFFw==
X-Gm-Message-State: AOAM533w1LIJCyEeFwVKzFuOyAjMegBkeQpJXFneaB7NXKA6xKes6cke
 fK/gk8sefrQdfs3iv8XQyFlAIPAGbVY=
X-Google-Smtp-Source: ABdhPJzzDmM7CQbpp6zsud7pu+RVJ35Bpw+J+hKYw+zgzdBiDzuoeJ5002HUdDrvDSgHlNpqmS8E9Q==
X-Received: by 2002:a05:600c:3593:: with SMTP id
 p19mr10043867wmq.33.1627161564768; 
 Sat, 24 Jul 2021 14:19:24 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b51:cb00:4802:7ee4:40b0:1519])
 by smtp.gmail.com with ESMTPSA id o5sm8469908wms.43.2021.07.24.14.19.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jul 2021 14:19:24 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 24 Jul 2021 23:19:20 +0200
Message-Id: <e8fa1826e60786d87de8b716d55bfd23aef84c17.1627161553.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1627161553.git.yann.morin.1998@free.fr>
References: <cover.1627161553.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/4] package/pkg-kconfig: move defaults before
 calling pkg-generic
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Currently, we define the default values for kconfig-specific variables
after we call into the generic package infrastructure.

So far, this was totally unconsequential, because there was no kconfig
variable that could influence the generic parts. But conversely, there
are generic variables that do influence the kconfig part (e.g. $(2)_DIR
that is used in some dependency definitions), but none that do influence
the kconfig variables.

However, we are going to add a new kconfig-related variable that will
have an impact on the generic parts, so we will want that kconfig
variable to be defined before calling into the generic infrastructure.

For consistency, move all the defaults before calling the generic infra.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
---
 package/pkg-kconfig.mk | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index dd727b7200..49074f9220 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -78,6 +78,14 @@ endef
 
 define inner-kconfig-package
 
+# Default values
+$(2)_MAKE ?= $$(MAKE)
+$(2)_KCONFIG_EDITORS ?= menuconfig
+$(2)_KCONFIG_OPTS ?=
+$(2)_KCONFIG_FIXUP_CMDS ?=
+$(2)_KCONFIG_FRAGMENT_FILES ?=
+$(2)_KCONFIG_DOTCONFIG ?= .config
+
 # Register the kconfig dependencies as regular dependencies, so that
 # they are also accounted for in the generated graphs.
 $(2)_DEPENDENCIES += $$($(2)_KCONFIG_DEPENDENCIES)
@@ -88,14 +96,6 @@ $(2)_DEPENDENCIES += $$($(2)_KCONFIG_DEPENDENCIES)
 # dependency expression
 $(call inner-generic-package,$(1),$(2),$(3),$(4))
 
-# Default values
-$(2)_MAKE ?= $$(MAKE)
-$(2)_KCONFIG_EDITORS ?= menuconfig
-$(2)_KCONFIG_OPTS ?=
-$(2)_KCONFIG_FIXUP_CMDS ?=
-$(2)_KCONFIG_FRAGMENT_FILES ?=
-$(2)_KCONFIG_DOTCONFIG ?= .config
-
 # Do not use $(2)_KCONFIG_DOTCONFIG as stamp file, because the package
 # buildsystem (e.g. linux >= 4.19) may touch it, thus rendering our
 # timestamps out of date, thus re-trigerring the build of the package.
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
