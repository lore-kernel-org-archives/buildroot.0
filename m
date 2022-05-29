Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F66C433F5
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 13:20:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DEFA847A3;
	Sun, 29 May 2022 13:20:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5M7ilVHqeLA6; Sun, 29 May 2022 13:20:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 342A2847D0;
	Sun, 29 May 2022 13:20:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4B0861BF4D8
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 13:18:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35C3361105
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 13:18:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b3lhtqYv28sl for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 13:18:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C4E0960F08
 for <buildroot@buildroot.org>; Sun, 29 May 2022 13:18:33 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 n124-20020a1c2782000000b003972dfca96cso5097949wmn.4
 for <buildroot@buildroot.org>; Sun, 29 May 2022 06:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E3fMcVlZqozcExDdnKo3Sc2fBBxSKlxhFpJyeDleQr0=;
 b=NXjWXX1ka8EKe6Pwvl8itX+AwFnNDRbE63D2+lEZ99LmSCPOsxKdOskVmbrYZmJi1x
 A8fqEGx9ndWpK3yvNZPTQ12//vztAKsW1VWdCrHW7G+LUoDtqsV34RzGPLJIc3g+BMVs
 pVzqG/uoaDmC8sZlZS89ItXN3KEDolvVPJIhSbWHa1FB2SPpUrH4u9CDRaqtjMs72LSp
 5NrKDZT11QL/Bszwx7F77cbPoVdLwsDf6PKgn6VR8ARNgKQgbdGi15K4WURx/WJXMum9
 LVAnFjXSMw+ttNLqdRUM11fzbymSBBWObBCYhaaLzjpI1cHWqKaDEvxVeQ2PMjMvzqDa
 4SMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E3fMcVlZqozcExDdnKo3Sc2fBBxSKlxhFpJyeDleQr0=;
 b=ThJj5MMzY+QX+Qjbl+wcPTc6ZbYT3IAYrVnhM7NHTYRqWGRXT74p4MQ4vFlUtSKAUQ
 RiJxXH1YPKnK08qwAZg8dX3wuYr+reVIsiIMnPgD4ycqGodGz1cnWILnpFBsOXOWh9OX
 2yMUNPttPtHFJazowOCYh0DUIgFRPvIBY21gA1FsAin1jbntLoS5qXgt0W2XAEy9SGzr
 wqTXKnlN6FnhvvgWPP08DHKrZDGzLFcl8VhFG5OqZtrbvvJ2/gYBq8fQL1546cPc1G8Q
 v1NaQAR2Gp/gLbDHvMC8CsBS+tVkDkqEY11E0REoKiFrK4aFcA/bk9NGsIO9acohXONU
 HjsQ==
X-Gm-Message-State: AOAM530AiRoVVJY43OjiKBfg25aurajw7TeHtGJ+LfIt2g9ZHHyBNHI/
 X2t9yqaEo5cP4pJNQs7iZB8bIahmKyk=
X-Google-Smtp-Source: ABdhPJy2T3x1mzu19AkqqOdPqUuGGJvbDminoIyt8pJcFbSB9whke5IOLfKtxyaNxd0uGEZM3AcQpg==
X-Received: by 2002:a05:600c:a44:b0:38e:3ce3:3148 with SMTP id
 c4-20020a05600c0a4400b0038e3ce33148mr14862952wmq.26.1653830312022; 
 Sun, 29 May 2022 06:18:32 -0700 (PDT)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 d15-20020a05600c34cf00b003949dbc3790sm7492562wmq.18.2022.05.29.06.18.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 May 2022 06:18:31 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 29 May 2022 15:18:09 +0200
Message-Id: <20220529131811.481017-9-romain.naour@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220529131811.481017-1-romain.naour@gmail.com>
References: <20220529131811.481017-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for-next 09/11] arch: add
 BR2_ARCH_NEEDS_GCC_AT_LEAST_12
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This new symbol will be used by architectures introduced with gcc 12.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 arch/Config.in             | 4 ++++
 package/gcc/Config.in.host | 1 +
 2 files changed, 5 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index 49e16fce38..966ceaa397 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -321,6 +321,10 @@ config BR2_ARCH_NEEDS_GCC_AT_LEAST_11
 	bool
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_10
 
+config BR2_ARCH_NEEDS_GCC_AT_LEAST_12
+	bool
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_11
+
 # The following string values are defined by the individual
 # Config.in.$ARCH files
 config BR2_ARCH
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index bcf0743b23..afaa4d2191 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -51,6 +51,7 @@ config BR2_GCC_VERSION_10_X
 
 config BR2_GCC_VERSION_11_X
 	bool "gcc 11.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_12
 	# powerpc spe support has been deprecated since gcc 8.x.
 	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
 	depends on !BR2_powerpc_SPE
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
