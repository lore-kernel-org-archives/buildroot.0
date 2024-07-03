Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9666FC30653
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 19:03:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C4686100D;
	Wed,  3 Jul 2024 19:03:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nbZPyerM8rjM; Wed,  3 Jul 2024 19:03:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B87F761004
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B87F761004;
	Wed,  3 Jul 2024 19:03:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DEDEC1BF2C7
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 19:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CAE6E419CC
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 19:03:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Nn1fw9gdRXX for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 19:03:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D3C9941959
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3C9941959
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D3C9941959
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 19:03:23 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-7f3cd802729so203399139f.1
 for <buildroot@buildroot.org>; Wed, 03 Jul 2024 12:03:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720033402; x=1720638202;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GhzLZTYk4ZDs5QF47s6/Kkjh/q8Adqy3CCLt1/Z0TzA=;
 b=vabxi1rfi55YP0gzXSCLV46lKOii8IMx9zRWJLlqV50DhGFS2thNAN7xH1nf9q6zpy
 x1YNxoKN1WB+IEtxyXtUlLTw2iq02WxcrrMoq5K7cql1c2RGo0iKuHgNXP9gw33Dahon
 95TtfHRxujpEA1SiLR4c2xnC8Bced0Rc9Rkwq3cLzx22Thxr7cMQj1wDFUWQgj6Zgi2V
 fMrA9uOT//XRKRqZzRfH+96AxzwRIWSkjG4GGKigV2yuoJcAZJywmtHrkKra9RVDUX7M
 N1ZcR+CBuqhFuj7hz2tmCGLvM1h7IBzbTbDLtvQzQHQDtErxIo/OdxNkVs0VVS2OAlZD
 jiLQ==
X-Gm-Message-State: AOJu0YxJ5WOEvDNiYvoNeUehYQaXlzMM8cv64q7MWS3iRp8oVE2ouvYD
 Ki1soS4Bw7pe5jhi0CkoKlyzeUdqChmQO7YeSxQmu99ZEZ732WFWg/kZ1A==
X-Google-Smtp-Source: AGHT+IFr13FJFCPgA0dkihdaFHgEjenJ2ueLQ2sICDjaD12hdIPuVyBMmsJHiNYUkTuvJhWKgYYhSw==
X-Received: by 2002:a5e:c70b:0:b0:7f6:565d:9046 with SMTP id
 ca18e2360f4ac-7f6565d9317mr556443939f.19.1720033402389; 
 Wed, 03 Jul 2024 12:03:22 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4bb742f1d72sm3536207173.175.2024.07.03.12.03.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 12:03:22 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  3 Jul 2024 13:03:16 -0600
Message-Id: <20240703190316.970385-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720033402; x=1720638202; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GhzLZTYk4ZDs5QF47s6/Kkjh/q8Adqy3CCLt1/Z0TzA=;
 b=EKQjPGit016En1n4OGxuVLl1KTYsRbFwODHLsnX+thegtcs7oeV3cENXW1vEC/ZfYe
 g4LlalFq1rLct/Wswj0hmQ2pZJncWzWz+03uWJSB2PCURJgphYPsdByZ55M+21erDy3s
 GWTEhkdNVAf26wlGBq6Y4iT6rCbanVG5jhTD1fYrln3+glakN3/d+PB9+S6PSmxjD4LE
 L8zUpgJqd2F3tmZcfrNNYc5OskSq9GhJKGTBaCsbtGAIY/9zrGFUda6AXJMB6MHQgVN9
 fFbKpqqoM+3BKhtfIvWev1xpwfce3lB1YikA5gG7h4vFOiN7Qt6ZrrTSfb/VfcjNovz4
 /+/w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=EKQjPGit
Subject: [Buildroot] [PATCH 1/1] package/systemd: enable required oomd
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
 Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In order for systemd-oomd to run CONFIG_PSI and CONFIG_MEMCG must be
enabled in the kernel config.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
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
