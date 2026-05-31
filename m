Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A9DCD6E5F
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 15:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC01F61090;
	Sun, 31 May 2026 15:36:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4BOzkNOm7Vea; Sun, 31 May 2026 15:36:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB55A60FA5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780241789;
	bh=KUdsGkOFXrw1cow88n2nKY0Fyry3PVhvL6REzIvMGCU=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=X1RyQUbW+kA9vTQPHpyW82o/I0a7q9zU+jwF1VqgQ4KscbKu+oZjh8VxUIaNzKBuM
	 zXrJyF1z4gtJILC5X7IaKfZGWgtG2pIPaidyywXxpbjUmyYJOsjQQGRos43z2ud8oP
	 0FU3m/sxxEYlytqi2jdrrBRLdU2k0VfNCkzRXz7QWVbAIzn+8opbXZ5on3M9KuDKSR
	 Gziw7SRBoH72GFHGkh5Cr9tuUfuH7z7z+n9BzGGSH560ZvIXsfFheapH3LMyAWDShm
	 nO1csGAfX87ijiTZZjkzrb6J7bGnTi7YOZZsKrkSGsinDa3KVbQk3yVK/RIQS1oel3
	 W8Dq0kWHvxrhw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB55A60FA5;
	Sun, 31 May 2026 15:36:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 15BE4389
 for <buildroot@buildroot.org>; Sun, 31 May 2026 15:36:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EFB9160EF4
 for <buildroot@buildroot.org>; Sun, 31 May 2026 15:36:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g-n5q1pzvwrq for <buildroot@buildroot.org>;
 Sun, 31 May 2026 15:36:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0674160EBE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0674160EBE
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0674160EBE
 for <buildroot@buildroot.org>; Sun, 31 May 2026 15:36:20 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-490a7678b2dso4403275e9.2
 for <buildroot@buildroot.org>; Sun, 31 May 2026 08:36:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780241779; x=1780846579;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pMRBARZMeIAniEHAbPfGYy/AEI04QHfpgXj83PCG7ug=;
 b=RA/2LuetZNNqUUQEGOaIByireLWrrVTOsfWMRrV2Yic2xgEzVPjCERK6JRfxFMTn7e
 +g7P6gixf8Jx8FSNHswcKBa1OPgbQyBOnwftob5iusF+POjMN8h2VvxRpi710AKsBexQ
 kRChgwB/3hzK20MIKoZ9jUZYL0oJMW/6guWC+A+Gi6T+pOebe3MJDwFN+rZesOpENPLV
 /2efHDyaVJBco+GAwxtrR75ES8CgFzEmGo6GFUitfX0Xl1hXRMkxXbvpMebS/y+xPJ6o
 ezG2pwuBj9FjdRhhjen+MglbV+3k6LHpupZukG0KfgLXJUcB1Fc6BjWMMJRTBInp2+4+
 aHqQ==
X-Gm-Message-State: AOJu0YwWt5NAnveyIQ6nleaxed5xq8GRnWF3CViXs9JIuGz0ckbbTPQN
 l7ydowmfVNi8tlN2rnU3tORIkaXjcExNjDJxY7H6lsFN2cdDCeMdDIZVHAu+iND7MD2Qr0cHgZo
 qkRI0QIQ=
X-Gm-Gg: Acq92OFYrSg2/3Py7r3Wi8JFdNWKCh9Dk0PBbLpopaNMpABI3XXzhLl+o8canQMLG0s
 0tQ/VwicocvOLd6u1fk1ifpOuwo212vIpOKc4rOOjOBWu8YsGXjGbvn+j50v8nQ3MP2qWnAlX4H
 SdkjUiYET6QL7SBwA0o93paHkfMbcmj41Owtsi+8M4Xcl4kc5PWjpJEXWaxJftKKNupcrYAtWlG
 GmNi2LYMkmQKd83H/rhvmvHteaZzFbNdeEd/2QkkUBUZRCkgk5+r0CNLzBVfUKzqjrmn7T2D12d
 bsx2NzlzV57+iNx9WB7Rt4ZSzyQ3zmG09sr+VMyqyr2aNKCSLeuKdyInNIhpVcfscABph0pDoqc
 VS743C0XZeT6Ps9W7xaAoV1YwQILGe4N/JbF2d112OfMULyWY5ydo2kMSu1YZcGel896ZhF3Zk2
 juJeYCuwuoYkkuR3KMDYebkdDDh4XOph8TNByB1mfS/FLkicD10JOmTLksBNfN8w56oW0dMP0Mz
 gxxyL4nCv2yMfJqEWd/DhAhGsS+LCxY
X-Received: by 2002:a05:600c:6385:b0:490:601f:d766 with SMTP id
 5b1f17b1804b1-490a2900dc2mr168184005e9.1.1780241778754; 
 Sun, 31 May 2026 08:36:18 -0700 (PDT)
Received: from dragon.localdomain
 (lputeaux-658-1-173-117.w92-154.abo.wanadoo.fr. [92.154.108.117])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909ca6575csm278098585e9.4.2026.05.31.08.36.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2026 08:36:18 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 31 May 2026 17:35:48 +0200
Message-ID: <20260531153557.2375580-5-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260531153557.2375580-1-titouan.christophe@mind.be>
References: <20260531153557.2375580-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780241779; x=1780846579; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pMRBARZMeIAniEHAbPfGYy/AEI04QHfpgXj83PCG7ug=;
 b=DKx6nuuLMcLAOJrE8lv7uoecLTdJQF+fk3+erdhz7PDLZmCGejav2JPzYgu6eMsG23
 0QeMdRJgnfYP/063MvH1LkFvnFEiT63ynxH2BnGnISp4KbKm8C1YtGThXsuCSRTtdL4g
 D5uYNFiCLXSeg5UpCCzD7KDRD0soSWKMA2ZA52KVFgR/ANZKtEVBZGXAQBAQfqb+JDzB
 NKk8LpFBBvLxLM12JQtNoRFO9kkmtpOLh8JhEJiss6wfcuIEU3wvEHagP/dd9d2kRGqn
 x/o3bCMs70jn8jizEv/Z4UEEkaASIZDscprO/nRS+5g1WyjqRF1vWowe9hF5fqV/nuVL
 +E3g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DKx6nuuL
Subject: [Buildroot] [PATCH v4 4/9] toolchain-external: do not expand ARCH
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: yann.morin@orange.com, ps.report@gmx.net, thomas.petazzoni@bootlin.com,
 petr.vorel@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- escape ARCH usage to force to not expand at configure time (but at make
  time), needed for upcoming kconfig update (see upstream commit [1])

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=104daea149c45cc84842ce77a9bd6436d19f3dd8

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 support/scripts/gen-bootlin-toolchains                          | 2 +-
 .../toolchain-external-bootlin/Config.in.options                | 2 +-
 .../toolchain-external-custom/Config.in.options                 | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
index 75fa2c7e0f..88bfc312b8 100755
--- a/support/scripts/gen-bootlin-toolchains
+++ b/support/scripts/gen-bootlin-toolchains
@@ -505,7 +505,7 @@ def gen_config_in_options(toolchains, fpath):
         f.write("if BR2_TOOLCHAIN_EXTERNAL_BOOTLIN\n\n")
 
         f.write("config BR2_TOOLCHAIN_EXTERNAL_PREFIX\n")
-        f.write("\tdefault \"$(ARCH)-linux\"\n")
+        f.write("\tdefault \"\\$(ARCH)-linux\"\n")
 
         f.write("\n")
 
diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
index e98ee023cb..f4407356e0 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
@@ -49,7 +49,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCH_SUPPORTS
 if BR2_TOOLCHAIN_EXTERNAL_BOOTLIN
 
 config BR2_TOOLCHAIN_EXTERNAL_PREFIX
-	default "$(ARCH)-linux"
+	default "\$(ARCH)-linux"
 
 config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
 	default "toolchain-external-bootlin"
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 9ca024f5b8..096d8ef487 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -23,7 +23,7 @@ config BR2_TOOLCHAIN_EXTERNAL_REL_BIN_PATH
 
 config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX
 	string "Toolchain prefix"
-	default "$(ARCH)-linux"
+	default "\$(ARCH)-linux"
 	help
 	  Component name prefix used by your external toolchain.
 
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
