Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 820BAC83F1B
	for <buildroot@archiver.kernel.org>; Mon, 14 Jul 2025 20:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB4D882166;
	Mon, 14 Jul 2025 20:26:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H1ySyfPAqzd5; Mon, 14 Jul 2025 20:26:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFAAC8213C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFAAC8213C;
	Mon, 14 Jul 2025 20:26:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EE73967
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 20:26:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 00DC8406FD;
 Mon, 14 Jul 2025 20:26:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4fb5PSOeR5X3; Mon, 14 Jul 2025 20:26:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F0F62406AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0F62406AA
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F0F62406AA
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 20:26:12 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a6cdc27438so3950090f8f.2
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 13:26:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752524771; x=1753129571;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jxDJ2vCVSNg+nLNFP5swRDJkcU0+3ZKXalrsMANl5/k=;
 b=Ou7b48oGutf8+QmLEVpXxpi/NUrNTtBADyY863n+KrDtCIaQGn5B1b1gljMg2wqfGS
 c6PoHHHqtKGoaBIlQ4sJ/cx9/RpH4voVNAp+DI7oWaAUFTcWWOtHmHaasvuNRWEIVBpS
 j3fce4UXRSPFyW5NyeUNX0OuEdvsqwwq0vQfNh7pWFZXIc883l4H9guEEhczcUyEEBgH
 n1G62xFdSvFT4VpTlvqMwfxXaKCgH0mzNnFi6IvC3dEN/V+6eyip0AMB4VS5ZDmK5UX0
 C4eWUzC8eLQWti1VODp9vVt7Ljv2Tk7ddJB4GCrRS7qZYDvAEHqX4kGH+qgk4Zo+HLXo
 v6LQ==
X-Gm-Message-State: AOJu0YwaXC4fLnzXpuP/G7gSVnV2t6vQXkZNLCsED0ZYpRzdzAByGdcl
 PF/oXeF41S4mb0L7jk1OHIW9Zq+fZOd23JW0ocFohnmfDZ5J+PCS2gRz6BcmFA==
X-Gm-Gg: ASbGncv5j0CSsrBT4k3e2HeUWgXcTkzDOaEYWAgxX356VyPeNYY8YgEcyB9X+49qxYm
 0G36iP/MxTomun218R8L7bQlWdeM4ejpTaSRNsYkGU47LnTtH2YChXq7Z46/mJjsQnshKWrLQoY
 uoLGgmD+9FAjNw6ZdnaQUOFD0xDPd05EnUYK7+tIselQM/Izq7mUiWcBh0BjTf8qIvwKrgh71kO
 0I7+MamEMJUrO6UNHAz0yeOmsgDZ5aDGS5xBXMOLtF5cYF7gsOVwPrdOqPH/zE1UMZcvBQs3bXA
 BAXiBCACpgO6hKgwLw0UrZTOvcoUKRAC7pYf8RCPSzA8D2GGtc8mugbYE/xVwhBY7CrL0rKJPua
 i/no0ASqYeHlpG+O++/nsl/9SzSgUQLoVuaINt/VILMY=
X-Google-Smtp-Source: AGHT+IHZeHIeXwGHmaoX6zJqhkJWfnrYS170/qwsoMwlBQrsClzEcDLMv7Q5ZL/4JaqJmUJ3spapwQ==
X-Received: by 2002:a05:6000:22c1:b0:3a4:e6e6:a026 with SMTP id
 ffacd0b85a97d-3b5f2e1b3d4mr11845208f8f.28.1752524770797; 
 Mon, 14 Jul 2025 13:26:10 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8dc91e3sm13144838f8f.43.2025.07.14.13.26.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 13:26:10 -0700 (PDT)
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart <christian@aperture.us>
Date: Mon, 14 Jul 2025 22:25:58 +0200
Message-ID: <5b483c498374de09d0bc3275f95d25c0e8f952b2.1752524763.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1752524763.git.yann.morin.1998@free.fr>
References: <cover.1752524763.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752524771; x=1753129571; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jxDJ2vCVSNg+nLNFP5swRDJkcU0+3ZKXalrsMANl5/k=;
 b=jfa1udr7vEPJfRCbjSBnPyDx4MRvvhGMIfGfqbjWQkA3suP+QtSekfYeGyws+B4wrB
 CeHyEqH+z8x/DCWt1hfuj84sqSWulRS80NsE3ZOMtg+vHTHXlD7ZPUgiln40Z0MXpqOH
 3zD/4d9waxUXacwAmO9PVR75S7dxrYummGovT/mW9HNKYV3yA5imYCGrWArg+u1mkq6E
 hdQrpYqhzVON7XoqSkkmbJwCdgoj6D5ihWLoAlkPF2RgveWwdCHG+GFnUDLdB+TffOxM
 H3EcL7vIlC/QYQ8DYk2D8U4BX6wVltAZogCbn6CvCHtGCsxW7TLGftrgQEO/AaV1lsnT
 75nw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jfa1udr7
Subject: [Buildroot] [PATCH 04/13] package/crun: bump to version 1.22
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
Cc: Christian Stewart <christian@aperture.us>
---
 package/crun/crun.hash | 2 +-
 package/crun/crun.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/crun/crun.hash b/package/crun/crun.hash
index 6f2d676bed..c2aaab6edc 100644
--- a/package/crun/crun.hash
+++ b/package/crun/crun.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  fdd530a398e32c36ccb597a43d17692631257374b9121027d88bbc5bccb24442  crun-1.18.2.tar.gz
+sha256  5f0c6c10d18569381142f20c4ad7a9a766d26ed8a241933ae9b2af48cbe2efb1  crun-1.22.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.libcrun
diff --git a/package/crun/crun.mk b/package/crun/crun.mk
index 255c1b8861..b4db276602 100644
--- a/package/crun/crun.mk
+++ b/package/crun/crun.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CRUN_VERSION = 1.18.2
+CRUN_VERSION = 1.22
 CRUN_SITE = https://github.com/containers/crun/releases/download/$(CRUN_VERSION)
 CRUN_DEPENDENCIES = host-pkgconf yajl
 
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
