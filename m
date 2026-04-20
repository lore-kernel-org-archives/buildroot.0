Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7336F55803
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 09:58:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A87A48284B;
	Mon, 20 Apr 2026 09:58:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qmiRP7nn1OEK; Mon, 20 Apr 2026 09:58:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE7E68277E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776679129;
	bh=+bJ8SD3UMg92JGa4f+hY26NuB+z6bSwMm/+PblpOLQA=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=UhfP5uAmiTp3gxEaIMZWlLipqoAnruWiPf3xITn65YiqL4vuapsxYUR7S4+LBDDap
	 iuANAWjFZibwnBqGvIxYacymmP4yLeX4LYVK8kfHeB+rTSKweYarmI0+M6c1vzqmpn
	 ojSVzswVbGWal63I0vrgfkcFzeyMW/zwrk1+EgG+fIefefeFDGLoLNL8r1SuRv5aX2
	 J/Jnx3u674nZ27rNgAygvHVTgJE6hGYxClPXVTYeWQfmXxcNguZU5eJuhP5/1ubDuv
	 psa18mNHg5d3d66FpaUO1aWmpVoSQAhafh+VwnM/f8iPGlp+TF0xZssJcbuoEpNAU5
	 zxMM90J0lE5fw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE7E68277E;
	Mon, 20 Apr 2026 09:58:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 903D824D
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 09:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8CB97610BE
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 09:58:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gfpUEjiPwiof for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 09:58:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B726B610B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B726B610B3
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B726B610B3
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 09:58:46 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-488a9033b2cso31890275e9.2
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 02:58:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776679124; x=1777283924;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2lsEG0SoP2y1yVEoKdjn14rM7sZEeKmrm6fScypOBsw=;
 b=MDY+kp6h/0FyPATvuvq6GmcM2U+KlM2qATfAMT6GwgpvbdBW2DPUg3X3Ptwv7+JStA
 bj3HjVLt/lEZQ2gWx+z/jJCf0YOyWQq/qPMXBWGNSmuRFRlF19uUkywn1niSTrT0B2qc
 BjqrnLAlhe9udzKALqoOzx5lcxuZhAth21Hma9X3gTygDy8i6L4+QFGeAuZ2YPgcYN4m
 VUhoQMspnsa4ttMtYKMDlTEPWQvCLGSl7TbU9Ylx2SrxQYEJqkHp+ZtidigZqT8Q5yYl
 X24O3mqF8y/QakLGKXJ6Kln375Ies445JK4vkfRKiH1qXPTPrdK57pqKmVrEEfmpUyrH
 zZrA==
X-Gm-Message-State: AOJu0Yzyisjn/XI2sLg9TsL0/Y4xZx5ezu6F27RqUBOhRSQ2qRas88N6
 Pav/tnrl1vGIcrHIqsCz6G8lw5WL7QwO+2/1/GA0yHwwxrxkNU8UhLbv+IRNWDV1NFWcohnO6NG
 QajfJ
X-Gm-Gg: AeBDieugjW627+cLosZlkmrSWWuEzcoY65nZ1o0IenSU8OTVj+mBf6Jm8908iD4Ofpl
 MDDseW7stkmE59iylZpKIGVHKa3Jf+2hMZbMFCy6YXpKIvkx0QSosjmxvPAjvUx2XdBgCimqKsM
 FEg94Mv67MwycGCFpgu9aUWcbyvayGjpgEMBlCR+kspw9PGfpLc2EMEHMorJL23HsmoZmsvWayz
 386ub6jx/2FMhggIIElCu/+HY2CxTyL4Ig18GZ++PEuJ+FdEhkap/sjtpG+XKnsBZSgWJewMc2I
 wXKaHylo2rA+4S7EiE8402VbyyvDi6iJn87uPFS5Mvhkon2Ubt2suPW9js3pM67LGCYkTqyO4Th
 eG2hP0Q20GuNyC5we7TWX3skyZF65R2GClFKvZ+GI5RD7V785PGJnCfM1qBxmuOXfQef6cDjIQ1
 WiF4HF2bcblDpPUav7+HO42kbTe9pZLUIeXgfKO9/bDTIqS5yPwmTPtQfyDwqvUr3SvcGeICJK3
 RYk
X-Received: by 2002:a05:600c:19d4:b0:48a:5339:ef0e with SMTP id
 5b1f17b1804b1-48a5339ef15mr218285e9.3.1776679124089; 
 Mon, 20 Apr 2026 02:58:44 -0700 (PDT)
Received: from dragon (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc0f82bbsm448033415e9.3.2026.04.20.02.58.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2026 02:58:43 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>,
	Sen Hastings <sen@hastings.org>
Date: Mon, 20 Apr 2026 11:58:23 +0200
Message-ID: <20260420095823.2561132-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776679124; x=1777283924; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2lsEG0SoP2y1yVEoKdjn14rM7sZEeKmrm6fScypOBsw=;
 b=N5SB55sLAhvpnYlFZQf8a6TY8NokQqktN5b6fMPeWzBeAwE/sGkaWpVyiboYLiHfMA
 lq2ka8fi1GwfCzrxd3ddU4UQl+nOHPagRooV0IvD61JTJQ62pRjElFJ4q9yoPUTEMp5F
 5fjxQE48TH91X4gjWnb4gzfHZ8c1G8Js0xvhymFB7ka3WYh88LzNa99v3YNgUm6zEbc6
 PvJFU73t3hBVvB0nHbZbA/+koJ6IGoDis55rp7sgNZ24yGYgWVpcHOg+VF8zredfz0X8
 of2R+mVt6juCMBh/TS+o3QrFDcGboh/UqzY3Qt+/QSprtwHH2nSGgX9dHt/BEz3vwo6y
 El2g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=N5SB55sL
Subject: [Buildroot] [PATCH] package/systemd: security bump to v258.7
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes the following vulnerabilities:

- CVE-2026-29111:
    systemd, a system and service manager, (as PID 1) hits an assert and
    freezes execution when an unprivileged IPC API call is made with
    spurious data. On version v249 and older the effect is not an assert,
    but stack overwriting, with the attacker controlled content. From
    version v250 and newer this is not possible as the safety check causes
    an assert instead. This IPC call was added in v239, so versions older
    than that are not affected. Versions 260-rc1, 259.2, 258.5, and 257.11
    contain patches. No known workarounds are available.
    https://www.cve.org/CVERecord?id=CVE-2026-29111

- CVE-2026-40226:
    In nspawn in systemd 233 through 259 before 260, an escape-to-host
    action can occur via a crafted optional config file.
    https://www.cve.org/CVERecord?id=CVE-2026-40226
    https://github.com/systemd/systemd/security/advisories/GHSA-9mj4-rrc3-gjcx

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/systemd/systemd.hash | 2 +-
 package/systemd/systemd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index d5a97ffcbd..e96d3ba7ad 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  5c95e54e555b21594ab11e76f91a092c6383553ed725292eb0a929bf2fe028ae  systemd-258.4.tar.gz
+sha256  6bd311c25f00d634ae3b4544d582e27df0d4166e6ba3d403b18b3129d7f44cae  systemd-258.7.tar.gz
 sha256  ac4985facb553559981f507982444d779115e3e3a4c8b7847ae956198490c1b3  LICENSE.GPL2
 sha256  6d9bb3b7fc818a8facc4cc296060a0883fef8710d6498f86165335846e82ee9d  LICENSE.LGPL2.1
 sha256  c9e7bf5b7c243c719b8b43c36158effb9b54c5e80abc9d82e4b2d4b2a4aa64ad  LICENSES/alg-sha1-public-domain.txt
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 4b488857fd..9ce4f8fef2 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -19,7 +19,7 @@
 # - Diff sysusers.d with the previous version
 # - Diff factory/etc/nsswitch.conf with the previous version
 #   (details are often sprinkled around in README and manpages)
-SYSTEMD_VERSION = 258.4
+SYSTEMD_VERSION = 258.7
 SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = \
 	LGPL-2.1+, \
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
