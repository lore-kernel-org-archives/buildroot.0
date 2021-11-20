Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09906C433F5
	for <buildroot@archiver.kernel.org>; Sat, 20 Nov 2021 23:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BFC980E1E;
	Sat, 20 Nov 2021 23:10:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bsm0t-P29CxJ; Sat, 20 Nov 2021 23:10:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E17380E25;
	Sat, 20 Nov 2021 23:10:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B2ED01BF3BC
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 23:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A150B40167
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 23:10:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0cu8NeTJVwf4 for <buildroot@lists.busybox.net>;
 Sat, 20 Nov 2021 23:10:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 603A540106
 for <buildroot@buildroot.org>; Sat, 20 Nov 2021 23:10:28 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 b184-20020a1c1bc1000000b0033140bf8dd5so10388814wmb.5
 for <buildroot@buildroot.org>; Sat, 20 Nov 2021 15:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0tJKtNGR0iUJV0Guewo1WQb9UV5RyRCR52eOzSnNP04=;
 b=JCFz4sWXxugLd4UrkssAsRfDrI6XMH/d5djEqt24DCiBbT9EaFJqk/jOhGwBwImGZd
 rKkTMm3KR+JNnzAcxvm/OHJZBpnmAajnMDQ5xgfCk1NKmY7oGE7ZmhzcM1I37e5lusUP
 Ewg9k7nUuFKsPmdGE+/IJjLzQr5VCu0+eVoRsaQ7pBs1hvrIJhK3xHDPacDSAKKn/4ih
 Iy26+Ax5n9gO+bHaoEiukEwhopZkzLw+KYGNk/LaSGrUQ+TzSzXrjM8/Q5xQErwiD60W
 Tmye7c1FUyQWcfRG9wT926zRHrtvkb83BIi8SzyyHN/dl3iEYMHKniISIJumK3KnCeE0
 j6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=0tJKtNGR0iUJV0Guewo1WQb9UV5RyRCR52eOzSnNP04=;
 b=R5sbT62wsoipU8MNZkv9iB+cfwOxje1QgtrKjgarxWXhEwXA6OXeKhX6JEIjryvq1C
 3mOQ51S5swNUzaEE8dcM8CS8Z/O1dHst31Ukpad+LfaBO51oEy3qzRVztVTupIKCyOzj
 1j530jXC7J+fkoHC+rn0VH+jOMeH2sd+CzEh06loPI8mHDx/kNLlvxylGPx2CnKCGhrD
 NRbQf/S/qdNhBSOjA+VViqPrZXGR+9bmyUWsEYb337RxDaOmBjai/hXKmnpL7a6pwyt9
 Mz2hLD1sqv2HmiGcYHLP2sDPA9bXa3jJD8IqQ+T7QG8lcXLJHoWgEx7MusHitQNCJ7EC
 E6TA==
X-Gm-Message-State: AOAM532vG74aPH2Xs5G5WS8vuelmlV97K691v/sFkxuioDADiIKdOsUb
 UmD6XK3KNQmbI3YrEbaHIu12hoskyGzIFw==
X-Google-Smtp-Source: ABdhPJx9AByWWn2o/5DQ4X8mMtP+30Va7YS5qkQuMNMSdn3H8nEXaM40jaVzpuSQYI2W/HUOdX562Q==
X-Received: by 2002:a7b:cd93:: with SMTP id y19mr14039539wmj.190.1637449826432; 
 Sat, 20 Nov 2021 15:10:26 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:a1df:22c7:4448:7943])
 by smtp.gmail.com with ESMTPSA id t127sm17569072wma.9.2021.11.20.15.10.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Nov 2021 15:10:26 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 21 Nov 2021 00:10:07 +0100
Message-Id: <20211120231007.1944130-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH:LTS] gitlab-ci: update the image version
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
Cc: Romain Naour <romain.naour@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We get newer CA certificates, to get rid of the annoying issues with the
now-expired Let's Encrypt root certificate.

Suggested-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@gmail.com>

---
Before applying this patch, first check that the image is available
on the Docker hub, as pushing 650+MiB takes quite some time on my
DSL line...
---
 .gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index e85ac32033..61194d4a54 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,7 +1,7 @@
 # Configuration for Gitlab-CI.
 # Builds appear on https://gitlab.com/buildroot.org/buildroot/pipelines
 
-image: buildroot/base:20200814.2228
+image: buildroot/base:20211120.1925
 
 stages:
   - generate-gitlab-ci
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
