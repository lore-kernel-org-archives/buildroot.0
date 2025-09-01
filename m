Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF91CA0FF0
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 09:01:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D6F56134F;
	Mon,  1 Sep 2025 09:01:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cL8_m9EfCp5F; Mon,  1 Sep 2025 09:01:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E6AD61325
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E6AD61325;
	Mon,  1 Sep 2025 09:01:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3791E169
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:01:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1676041409;
 Mon,  1 Sep 2025 09:01:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ysqFctLC61Wx; Mon,  1 Sep 2025 09:01:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4EF24413F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EF24413F9
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4EF24413F9
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:01:37 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-45b869d3560so14489735e9.1
 for <buildroot@buildroot.org>; Mon, 01 Sep 2025 02:01:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756717295; x=1757322095;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UFynBdfIqyZK8MpBo8ptHXqNcYzjel1qB+vsD4YUayo=;
 b=Bcfgz7D8FSBl7yy7MiMyxFkPQAuuAT9VUHbKzrCVFRqkthUBsqg/RBaXWN9rZp2QGB
 dbt58A+IUte9uiMiGpouTElFfM5b8Jbe+4q5kKY7FJ2xcn0QuBmvb/AOQFq0j1cCDjSp
 4qvxFj4P6ao9zC8gx5vwFEkhBTx8omxt/W7jcTAUMheftUWFb90mV85FrP3FIiZkJnst
 FseRoSzP8QNC2hYlJwhHyqv6WfO2JsPyFZOUqdo0jWWQhHa3ytVz/CkcMMLvs1B5M49A
 Fl9mD5ul9BjJc8wxf3p1rRzI2Pi1sNJWp3YGRLKRVQPfI38qfg1WINSKCH0vdr4p5a/C
 itOg==
X-Gm-Message-State: AOJu0YwpRbcCxAM8baYw/2/HeFeU2KinH1T348LrYbJCV2JsDXwT5WUS
 +WO/wZLo21czJXzvK5TEkSpLlZ+lCstkAlMmHEBge+h9pstXeBuGuR4AIhp7YA==
X-Gm-Gg: ASbGncshjrVe3hojwIxsRgI2yuXhHZzWolUWNrblFg4U7mxGmJK5JdDjNuKM0L2G+Os
 Cug284ywKAZ6GDV8OpK4wnFQMzDHkt1ydteVKwGA57Y4SMlh9/kO3wZHdxFoMdIqplqiiVjSpgk
 05QzG4m64HihbdqcU2usq6rnhIqwPpNpOjIRU/zOTWNQPp+vpCxuYZqVLTKt32qjxPBMPigxIYB
 KUzjj9zz0xYhtymIc7Vck3zjApPLcdQKVx5cE4Ief7XLtW41jWDO3X/PG088XMhPNwXhGAqgmD8
 YGGEoLu36anRfGJyHSURzBiBnnBYJDoF92MbMWe39tC5kaLMN7PPMQ5jNXyS2Y5GqH/yIx9LPpi
 Pvi4XpTFvrULrN/btr5Bv648y8DJnR4kR
X-Google-Smtp-Source: AGHT+IHhfE1kKiStQAJQMjqCLg+RvDIgn2zlH0XqM0GvOmyl7BKMXZUfPm8iWunfI6qZf9rTbH88wA==
X-Received: by 2002:a05:600c:3545:b0:45b:7a93:f108 with SMTP id
 5b1f17b1804b1-45b855261f1mr57768875e9.3.1756717295185; 
 Mon, 01 Sep 2025 02:01:35 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b8525a94bsm98171055e9.15.2025.09.01.02.01.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 02:01:34 -0700 (PDT)
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Mon,  1 Sep 2025 11:01:22 +0200
Message-ID: <ac3b2d308a68d0d0830e1da2b690edc117d594d5.1756717276.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1756717276.git.yann.morin.1998@free.fr>
References: <cover.1756717276.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756717295; x=1757322095; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UFynBdfIqyZK8MpBo8ptHXqNcYzjel1qB+vsD4YUayo=;
 b=dtIIwkA3BATCyLqfIScNkxW9mXw7ZtPjm0o75lf5P/N7Xw7rs2BPFnK+2l2HiMRuem
 NRx75Td19PTGJej91ekomUgSx6CGn6YOa8VDZ6wofv501182I4v8erQ/3FfY92YBEh45
 DEV12DpUAJXyZpGvSyxRW2uG/nvn/Ym3Gm0HT6gUusvVjAIssWfsAA7iLSrpNnC3KV+5
 VpkudOun63D8dpjaC/Nigs/qJJrNPJ95xmGRICeiZmRzasYaQMw94VN7bTVA5WOEUKjL
 tWmcA9T7zjK+YOgqJMLV8wKCTWFy4+lSZez9evWg8wcxJ5nrpa3duRsuJsuxhSfkne1L
 m8cA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dtIIwkA3
Subject: [Buildroot] [PATCH 13/18 v3] package/coreutils: no need for chroot
 workaround with merged-bin
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
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/coreutils/coreutils.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index a6d193b49e..60772c9e7b 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -125,6 +125,7 @@ define COREUTILS_CREATE_TEST_SYMLINK
 endef
 COREUTILS_POST_INSTALL_TARGET_HOOKS += COREUTILS_CREATE_TEST_SYMLINK
 
+ifeq ($(BR2_ROOTFS_MERGED_BIN),)
 # gnu thinks chroot is in bin, debian thinks it's in sbin
 ifeq ($(BR2_PACKAGE_COREUTILS_INDIVIDUAL_BINARIES),y)
 define COREUTILS_FIX_CHROOT_LOCATION
@@ -137,6 +138,7 @@ define COREUTILS_FIX_CHROOT_LOCATION
 endef
 endif
 COREUTILS_POST_INSTALL_TARGET_HOOKS += COREUTILS_FIX_CHROOT_LOCATION
+endif
 
 # Explicitly install ln and realpath, which we *are* insterested in.
 # A lot of other programs still get installed, however, but disabling
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
