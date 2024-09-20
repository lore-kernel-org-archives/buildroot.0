Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49138CF9C5F
	for <buildroot@archiver.kernel.org>; Fri, 20 Sep 2024 18:12:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F3DC607B9;
	Fri, 20 Sep 2024 18:12:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x8IJmBShUQys; Fri, 20 Sep 2024 18:12:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07A906084C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07A906084C;
	Fri, 20 Sep 2024 18:12:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F37E61BF593
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 18:12:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E26F484BEA
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 18:12:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mCxt17Lfad4C for <buildroot@lists.busybox.net>;
 Fri, 20 Sep 2024 18:12:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E1AFB84463
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1AFB84463
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E1AFB84463
 for <buildroot@busybox.net>; Fri, 20 Sep 2024 18:12:40 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-42cae102702so18980595e9.0
 for <buildroot@busybox.net>; Fri, 20 Sep 2024 11:12:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726855959; x=1727460759;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2rMFAT203utsx9L6Alck4A9PxaE8kOtEWpcZ9DYUm7A=;
 b=hQ2RKdrIBf24b/qAQAYxRuJcsdqvOCwlP9ByIiWHjrI35MVN0c16aMlgYATDrjKY0R
 EcTbzkzkpeYVFB7VJHZtg1AYyKUnp2cW9OKGio7oapt2h91dJl3M1PNYX+DOLYICPyL3
 W+xQpy4kQP3WOy/cUaJUThLHtAZfbNLaDEJPWTMYZLrKQywCNgRb9xNvKPUMeMZwy8Ez
 k4NmH/YJPG4EnS8zPtui96k/thUGnW4Ji2Q+cR73OHeVS8bToXhB7vNoqKXwB/gSG9d+
 Te6QQBhnMGNSrqOIjqFPrxsAB+CqV5srsDn4FYsht2nb5fD7WZmN7VMSr4kqwjrp6xGp
 IvVw==
X-Gm-Message-State: AOJu0YyraPQHKDVeeZ1FfNLX57QRSCRp+ZrnhiwQ1wT24xGPOzFlwjQo
 dUjbfqa1he8+2+UEPZzOcbnq5DVeVJZkLt+NCvBT7d1NFYRcoC94ArdLXAedOg1xOdu6yfPZrY8
 zzA==
X-Google-Smtp-Source: AGHT+IGkVFD6zgy6bids20ZgUYtLPRii+a9bMrgBi6yW9t9x3bfILbgSGo/9H6vCHlWlrsy+DH+kQQ==
X-Received: by 2002:a7b:cc88:0:b0:42c:a7cc:cb6d with SMTP id
 5b1f17b1804b1-42e7d5c882dmr21380055e9.1.1726855958571; 
 Fri, 20 Sep 2024 11:12:38 -0700 (PDT)
Received: from vm-2404.. (55.6.65.37.rev.sfr.net. [37.65.6.55])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e7af898fasm29548805e9.15.2024.09.20.11.12.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Sep 2024 11:12:37 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 20 Sep 2024 20:12:11 +0200
Message-ID: <20240920181212.3572055-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240920181212.3572055-1-francois.perrad@gadz.org>
References: <20240920181212.3572055-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1726855959; x=1727460759; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2rMFAT203utsx9L6Alck4A9PxaE8kOtEWpcZ9DYUm7A=;
 b=K1fSTmC8UcMeSospdWPPmT0MxEtiKbfOBPCFdM3TeyfNAYiyGeN1KDHF/DOh+2Gwqs
 H1hI+QzRaDITRnR2mtYcRQ2KG3caqzTtwbPYPGyImtU0WzcSRJvFQlzgohE1awPNTVuz
 FIaUwwP/+bxD9l1b1SU7Q8kTR5Cfcm9tLtaFFOU0LbIHKJlzJGuA4yUgsh8TzIsymhU5
 KkXt/YzVQtZzXGdWPoQyvRfI8FS/NRzIyLVKZa23uryNeku6Uerlyb7g07a4sQZbrlu0
 mikX6fGADaXfBjswfRcvJ0xgIwUwLHRNNo+l8Dqh35Eeln7WhWYY5xnbmD12nRqC0a93
 yd5w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=K1fSTmC8
Subject: [Buildroot] [PATCH v2 1/2] package/busybox: handle
 LIBFOO_BUSYBOX_CONFIG_FIXUPS
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 docs/manual/adding-packages-generic.adoc | 6 ++++++
 package/busybox/busybox.mk               | 1 +
 package/pkg-generic.mk                   | 3 +++
 3 files changed, 10 insertions(+)

diff --git a/docs/manual/adding-packages-generic.adoc b/docs/manual/adding-packages-generic.adoc
index 89fc70045..f0b0508f5 100644
--- a/docs/manual/adding-packages-generic.adoc
+++ b/docs/manual/adding-packages-generic.adoc
@@ -631,6 +631,12 @@ different steps of the build process.
   This is seldom used, as package usually have no strict requirements on
   the kernel options.
 
+* +LIBFOO_BUSYBOX_CONFIG_FIXUPS+ lists the Busybox configuration
+  options that are needed to use this package especially in some scripts,
+  or at contrario the useless options. This shall be a set of
+  calls to one of the kconfig tweaking option: `KCONFIG_ENABLE_OPT`,
+  `KCONFIG_DISABLE_OPT`, or `KCONFIG_SET_OPT`.
+
 The preferred way to define these variables is:
 
 ----
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 204ebe010..ef5521105 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -411,6 +411,7 @@ define BUSYBOX_KCONFIG_FIXUP_CMDS
 	$(BUSYBOX_SET_SELINUX)
 	$(BUSYBOX_SET_LESS_FLAGS)
 	$(BUSYBOX_SET_INDIVIDUAL_BINARIES)
+	$(PACKAGES_BUSYBOX_CONFIG_FIXUPS)
 endef
 
 define BUSYBOX_BUILD_CMDS
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 171163dcb..fecb68fc6 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1237,6 +1237,9 @@ endif
 ifneq ($$($(2)_USERS),)
 PACKAGES_USERS += $$($(2)_USERS)$$(sep)
 endif
+ifneq ($$($(2)_BUSYBOX_CONFIG_FIXUPS),)
+PACKAGES_BUSYBOX_CONFIG_FIXUPS += $$($(2)_BUSYBOX_CONFIG_FIXUPS)$$(sep)
+endif
 ifneq ($$($(2)_LINUX_CONFIG_FIXUPS),)
 PACKAGES_LINUX_CONFIG_FIXUPS += $$($(2)_LINUX_CONFIG_FIXUPS)$$(sep)
 endif
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
