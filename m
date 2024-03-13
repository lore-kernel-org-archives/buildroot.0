Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C99C54E58
	for <buildroot@archiver.kernel.org>; Wed, 13 Mar 2024 09:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D23DC40AC1;
	Wed, 13 Mar 2024 09:14:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9Ac8jnrZTtKg; Wed, 13 Mar 2024 09:14:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 999B140AC8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 999B140AC8;
	Wed, 13 Mar 2024 09:14:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A978D1BF3DF
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1C608133B
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:14:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J0J42iuH6xJZ for <buildroot@lists.busybox.net>;
 Wed, 13 Mar 2024 09:14:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=fperrad@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 09CC381346
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09CC381346
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 09CC381346
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 09:14:23 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-413e6d5500aso3759085e9.1
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 02:14:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710321262; x=1710926062;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F9wpu9oud4njmzEEvQKJESFqjIQBLt9GrjVgj2d4vbY=;
 b=O8aWzBhpU+sWyCdVVa0Erj/FIExhMC48XB4EZV4QgWgqgQ8ibyG7p5lwzebDYdpx1g
 B6SDo3JH6dec5GVa2w1VZQoLNme0iwDmXGhG+rqrKPVXq3JqMtdxfI3kN2EsJ/KSRTO3
 f0jrrP8mcG9aRWxjF9dTJfHbRCnTpzoLcx6ix3b0IVr2mG0IxJ3T2k1aQEUAs5KgsheM
 905OF2llrj2BKV67S0sNqijMmtRkRbGCW7Cj/0HBULavWydYC7YK+uteaazQ2hLbCwOx
 j4STS0GHme2TMYhYWFlmKblupfmOFhN4335ZB/sCSCq/aYjDN2qvrmN2Q76ssIW6jsvG
 OykA==
X-Gm-Message-State: AOJu0YwWvrYcrsKuRdLe23iXtT+0BzEw9HdXsx/lHOqkiOtTLLs+FCnZ
 O5DUfe1XXho3dmgVTODMfttSzcSw8GNtVaZ1JEH20H1egPb1BmpXY5B8VUGisjU=
X-Google-Smtp-Source: AGHT+IH24oKzD2oRVhwaqwooM6RNEyKTBRDe0ETp881aMsg4o74yGYknBzmTyq1X2EXqBmyKhFXYUQ==
X-Received: by 2002:a05:600c:46ce:b0:413:1318:b5d9 with SMTP id
 q14-20020a05600c46ce00b004131318b5d9mr8624015wmo.13.1710321262122; 
 Wed, 13 Mar 2024 02:14:22 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.92]) by smtp.gmail.com with ESMTPSA id
 u1-20020a05600c138100b00412e5f32591sm1699799wmf.28.2024.03.13.02.14.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 02:14:21 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 13 Mar 2024 10:13:43 +0100
Message-Id: <20240313091412.20865-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240313091412.20865-1-francois.perrad@gadz.org>
References: <20240313091412.20865-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710321262; x=1710926062; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F9wpu9oud4njmzEEvQKJESFqjIQBLt9GrjVgj2d4vbY=;
 b=ZTMxCIdKV+ALffe/ssb1WqD/tUO24hbIceHgTg2JMRb4ZmZ7aloDuqxVBPJaDr0kub
 OHexnim7a6Ia3WSJE6idDbcGDlppCGqRDf42Mh0/r3VSA9Z9BKkaGDCrVstWcM2K7W2H
 7lMvIsxQYryu8U8r5bUqlackC5KvNTDc/ZifZ+EbZVaU0zb8g9rvbFEoSArhQW61wGH4
 gtcrUYjC+1sIGrrkVivSKBg4FUafeb/dQeyUAwQfiYpuN39+ZPpKKGITtydCJBrq3KPF
 gKO6YOMGH7QA1Sqp7pC02mPXzNonFcx+OkWLrdvo1k7SQIlNa7Orltl6fUeC7aiUiiDx
 CghQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZTMxCIdK
Subject: [Buildroot] [PATCH 02/31] package/busybox: handle
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
index 9d365a10c..71712d465 100644
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
 
 ----------------------
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index eb5e7ad92..fea925b50 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -384,6 +384,7 @@ define BUSYBOX_KCONFIG_FIXUP_CMDS
 	$(BUSYBOX_SET_SELINUX)
 	$(BUSYBOX_SET_LESS_FLAGS)
 	$(BUSYBOX_SET_INDIVIDUAL_BINARIES)
+	$(PACKAGES_BUSYBOX_CONFIG_FIXUPS)
 endef
 
 define BUSYBOX_BUILD_CMDS
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 577a148c1..d08c0eb32 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1221,6 +1221,9 @@ endif
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
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
