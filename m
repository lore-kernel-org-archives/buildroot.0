Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E93C3271E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jul 2024 01:11:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0C3C8463A;
	Fri,  5 Jul 2024 01:11:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9YHc9KNT2MPA; Fri,  5 Jul 2024 01:11:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE8DC8463B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE8DC8463B;
	Fri,  5 Jul 2024 01:11:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B93BC1BF294
 for <buildroot@lists.busybox.net>; Fri,  5 Jul 2024 01:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A70D68463B
 for <buildroot@lists.busybox.net>; Fri,  5 Jul 2024 01:11:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oZrv2mmBdzVR for <buildroot@lists.busybox.net>;
 Fri,  5 Jul 2024 01:11:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A4BC98463A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4BC98463A
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A4BC98463A
 for <buildroot@buildroot.org>; Fri,  5 Jul 2024 01:11:19 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-7f64942fc54so44466339f.3
 for <buildroot@buildroot.org>; Thu, 04 Jul 2024 18:11:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720141878; x=1720746678;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0jd8Mgi2pVmC7l1OEOn+5RY/WmBuDk4z7Ko381Jjwhs=;
 b=KjQsyuvZoTs4jRx4E10qvRj1bzRsIG9GZuw0JULlBYLKUTvSHzbL2MVTNAShBOgaFx
 WHoyG7lwah4jp62EvjMnJcm9FLCtnanRoArXmoTNTWm43hFm+RyS/2vngGFVPUo8sd07
 gAxQ0Y1JT9URXwPwQRUHYGlx+vSYmv/FMLdMV9+ZVL6H2yt0l+WH2lwXcarSUfm6g4j7
 NvIzuqGOsdCsq4zB3a2FMx95oIlU6EDaoJnK5XgFHYHM78VFcmg4WJBtxEME9a9r49Tt
 OYPXTc9jtdzMfgymlxDw2DblXNpf63lbBMyrJ49/rPKYBfEcp6fRENeobFiGcusaEt8c
 9w2Q==
X-Gm-Message-State: AOJu0YyEem8ZryZTJPi7+QA9ZmDmcGa4g4eDhvY5NdykjwrVbYNSlCMW
 JZQlvYLAk+W6bGW8fp5ivKHCPwPJmPlnPD2Ni17YYZ5l61eKYCTudYIRpbLm
X-Google-Smtp-Source: AGHT+IG9lNg6srEc9lfS5jRQG+QFWycU0FEy25MvgnOAUifmw3dUoeplmChD8DZRLvrPpX34ag/few==
X-Received: by 2002:a05:6602:124b:b0:7eb:78b4:faee with SMTP id
 ca18e2360f4ac-7f66de9be60mr359258839f.3.1720141878357; 
 Thu, 04 Jul 2024 18:11:18 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4c07f938dcbsm35043173.114.2024.07.04.18.11.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jul 2024 18:11:18 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  4 Jul 2024 19:11:14 -0600
Message-Id: <20240705011114.1313589-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720141878; x=1720746678; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0jd8Mgi2pVmC7l1OEOn+5RY/WmBuDk4z7Ko381Jjwhs=;
 b=fTNDktdLm4CcuPrdnz7zsM+l0iN3n4h6mHYhm68WAqvLWpOh1am5c7hsvQ5wcQlyQo
 j4m11eBHNv/XnjNMsokfdY46/Po9NmU4QymvUiQVK4UyCT2qOIrwyvKycUMGZjkUEH62
 m0QjjHaSC86puDdlBhoPM9WZysFywhHivNLaAkMo7zOgSoFjtlDLMfrU8wHQUV+8xmK2
 loR9l6njaNi02/Tg8rqX46lWhU3OFkbwtDyp3DvjhPzw6zLlqiPPK9+mM57dSE/4SQn7
 bQ2TIEKG6a9GITu3AjzKmNCenpyEdP8FvKgTIfnsJ8S6gifpjU98HfIw2tF4PiDDgNNs
 TTTg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=fTNDktdL
Subject: [Buildroot] [PATCH v2 1/1] package/systemd: enable required oomd
 kernel options
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Sen Hastings <sen@hastings.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In order for systemd-oomd to run CONFIG_PSI and CONFIG_MEMCG must be
enabled in the kernel config.

See:
https://github.com/systemd/systemd/commit/e7b3f1a6c358dd3eaf0b50547bd52130ad4126ae
https://github.com/systemd/systemd/commit/aa329b89223a79793cde8288b1bc6e93db174938

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - add links to readme commits
---
 package/systemd/systemd.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 6b3553723c..52fa344807 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -480,6 +480,10 @@ endif
 ifeq ($(BR2_PACKAGE_SYSTEMD_OOMD),y)
 SYSTEMD_CONF_OPTS += -Doomd=true
 SYSTEMD_OOMD_USER = systemd-oom -1 systemd-oom -1 * - - - systemd Userspace OOM Killer
+define SYSTEMD_OOMD_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_PSI)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_MEMCG)
+endef
 else
 SYSTEMD_CONF_OPTS += -Doomd=false
 endif
@@ -804,6 +808,8 @@ define SYSTEMD_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_AUTOFS4_FS)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_TMPFS_POSIX_ACL)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_TMPFS_XATTR)
+
+	$(SYSTEMD_OOMD_LINUX_CONFIG_FIXUPS)
 endef
 
 # We need a very minimal host variant, so we disable as much as possible.
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
