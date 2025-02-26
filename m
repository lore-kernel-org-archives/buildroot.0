Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2956C021B8
	for <buildroot@archiver.kernel.org>; Wed, 26 Feb 2025 09:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DDFB81F02;
	Wed, 26 Feb 2025 09:01:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uOSWusZwvPGl; Wed, 26 Feb 2025 09:01:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 691E380D84
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 691E380D84;
	Wed, 26 Feb 2025 09:01:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D5DA02DE0
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 09:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C582281E6A
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 09:01:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cxh2sECKtua6 for <buildroot@buildroot.org>;
 Wed, 26 Feb 2025 09:01:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 04CB280D84
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04CB280D84
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 04CB280D84
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 09:01:13 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5dbf7d45853so1125177a12.1
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 01:01:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740560471; x=1741165271;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4c/kGlG53VfCzYS1PanqISZdFq0laGgSNKyoCyakce4=;
 b=wBqxtgmNnxEAd24VIS3Gw2TUEBFrE81702oSqnAVgjJBuzXjkQQBDiRtKnGtNoPIy6
 nDJg2271qHF9KqHHmKjVzSDF2vO1kTPb/BEI6O3egQFm62fxRbg5BwAtTLa2L+RHh05e
 +JFYgh28Dds91PW20EvoPWh29hpOV8GNVkfnv+3WCPpmTx5xmmRYOMaiArQe1oqzBqWY
 kzDNKYJBd/Ji+DAE6DruCaSwMnOlvlr3PEPK7Snu/iFtQ80RRCH0CD9etEdLgWuqN2pt
 3RVEiIyAghLKYtNkDUtdLUtMHHvgaj0vNIkdWkBLYolCnAjFl6UqZvt10g4hft/yGt3q
 E5Nw==
X-Gm-Message-State: AOJu0Yxh1efC+emIq5Z/v4OAsLq9pPX53MPv7YgVj7YWI0N5rOwIugjq
 K6LL/avYIZQqUL+x/pvvv1jctxj9AW/K5GDBU/Q8eEEfuC5IzyRBQvKv8RGMllfVHNoIlOT8ASz
 N
X-Gm-Gg: ASbGncuxbxZnwxbEykwkudEOJWjb//vfS/WK/mmNAp7Wf5sbR1MbR0zOTA47nP+PVo7
 qjXV99WQdP+WGZ8NsmkPkjyHba2udF8N+XK8cLxJIiWMb2e8ZZQ80nZPLfPGk+Bi7fCeip0bUkA
 jeu6wdXO1eybMEnhyT1qs/xvHYLPSXjL1GskMEI1pOQExokoFzveJc1RCxH/qvVV4bnWTXTxQXH
 suoVKBiIHeEJNP1laHPc7KLXd/hUao+BB3mUQa92ja/ljqk+nag16c0sxjtpUxHeIgSB+gQYXgo
 WCEE7JmSPuFGn6jO3fST8XThJtj/0ZbPEdMGYMwJ5R28SMysdFk0TfQDsanshkeSIWNsKWTjWF9
 l2rYyZ96Xzt+8v/bLwt6Y4Sew2DA6rZgsC1To6hk2hl4lpbqfiSIXW+Qt+Ma+ZRdDA7w=
X-Google-Smtp-Source: AGHT+IGnQPIgFqHYx8iyQZef+zbZCh0nl+1lpX+l3vF0lY6zEd/Gokt4PN2dYB3YWRcD15XE0Vp43A==
X-Received: by 2002:a17:907:96ac:b0:ab7:5fcd:d4db with SMTP id
 a640c23a62f3a-abc09e321a0mr726931666b.9.1740560471145; 
 Wed, 26 Feb 2025 01:01:11 -0800 (PST)
Received: from fedora.arnhem.chello.nl
 (2a02-a211-a140-6480-ea4e-3e0b-5fd4-931c.cable.dynamic.v6.ziggo.nl.
 [2a02:a211:a140:6480:ea4e:3e0b:5fd4:931c])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abed1da0befsm287927266b.74.2025.02.26.01.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 01:01:10 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Wed, 26 Feb 2025 10:01:08 +0100
Message-ID: <20250226090108.1007137-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1740560471; x=1741165271;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4c/kGlG53VfCzYS1PanqISZdFq0laGgSNKyoCyakce4=;
 b=Vr2Z/13D6wmP9UKMREyFTJmpFd7wbagpBskSog7wGVKSfsgDIFi7wqssjByQFcoGHO
 dLsrh0/Ek9U4B9N7BrwJ0kC+QlGWdXoPsHfi9y/ld9kevmM3IqA8qKyyd2npCYUQuUiO
 SnKz3heTcJR52apTGHKEMDIIn6xjfW1dHdVIE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Vr2Z/13D
Subject: [Buildroot] [PATCH 1/1] package/systemd: enable tmpfs kernel option
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

systemd automatically creates tmpfs mounts for /tmp, /run, /dev/shm, and
others. If tmpfs is not enabled in the kernel, systemd crashes with an
unknown filesystem error on boot. This hasn't manifested itself during
tests with defconfigs such as pc_x86_64_efi_defconfig for a few reasons:

  - No defconfig uses systemd as the init system by default
  - Even if a user does use pc_x86_64_efi_defconfig and changes to systemd,
    the board/pc/linux.config file enables CONFIG_PCI, which selects
    CONFIG_TMPFS.
  - The systemd init tests use a prebuilt kernel with tmpfs enabled.

Enable tmpfs unconditionally to ensure that systemd always boots, even with
a minimal kernel built.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/systemd/systemd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 28091a72a6..337d52b1f2 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -847,6 +847,7 @@ SYSTEMD_CONF_ENV = $(HOST_UTF8_LOCALE_ENV)
 SYSTEMD_NINJA_ENV = $(HOST_UTF8_LOCALE_ENV)
 
 define SYSTEMD_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_TMPFS)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUPS)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER)
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
