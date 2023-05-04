Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A70CFC7EE21
	for <buildroot@archiver.kernel.org>; Thu,  4 May 2023 07:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E07A41DBB;
	Thu,  4 May 2023 07:22:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E07A41DBB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZVBtcOJBw4K9; Thu,  4 May 2023 07:22:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8ABCE41DCC;
	Thu,  4 May 2023 07:22:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8ABCE41DCC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7BDEC1BF3C8
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 07:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 54A09614A0
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 07:22:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54A09614A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oXGUzCivNI5P for <buildroot@lists.busybox.net>;
 Thu,  4 May 2023 07:22:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D2F460C1C
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0D2F460C1C
 for <buildroot@buildroot.org>; Thu,  4 May 2023 07:22:29 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1aaf21bb427so606715ad.1
 for <buildroot@buildroot.org>; Thu, 04 May 2023 00:22:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683184949; x=1685776949;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Rj4J5ZqtE4LrNHPT+/Aac3TxoAHGPwp6neGs22D5StA=;
 b=emeijp6iH/tNayi9m6sTQbE5Yhv+5c6abeXTB/5beVypxJ0YtxzPuKHcVNavKuBbT2
 WMTNQn+vyZWxqhV48cnDpQKNGWG5bZQq4ToAxZeFEGq40rEYJYnf8RwgTnEp+uD2/EBO
 o/GxiYWdSB4lQm2OyRc6RYeq0eBuYzzGKqupmXq3h2YptO66ESaTrBGs0j5L23kWsChv
 qMNxb3VrEr23C2w26+v6A0CqFHHCik5nb54htdgqnGZHCNQGHrncli5xVs3295fXHWrK
 hudYF57b6a2fJ5jIij/83zFlRTLUHt5Jb1DqtKAdIo1WuKxqg88Bz/AO8FMIVw/UXYqt
 ISpg==
X-Gm-Message-State: AC+VfDxv/t0HdbAR50FgmH4bUaRy5zShMe9WCO4vNFlc9k2psa/A3pW0
 fyCDL2YSndv+A5r94o6nQuP+JpfbHKJsA884h9NaGkogmRw=
X-Google-Smtp-Source: ACHHUZ6thR7AaMLkXkc+kqNL8rc9Et+qLJxkoiPOX9FPpbB0Gnnz6eOcg6I/kSoskOo9OEeXZo7lgA==
X-Received: by 2002:a17:902:ce8b:b0:1aa:feca:b616 with SMTP id
 f11-20020a170902ce8b00b001aafecab616mr3193575plg.65.1683184949217; 
 Thu, 04 May 2023 00:22:29 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 e17-20020a17090301d100b001ab39cd875csm975873plh.133.2023.05.04.00.22.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 00:22:28 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu,  4 May 2023 00:22:26 -0700
Message-Id: <20230504072226.3443740-1-christian@aperture.us>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1683184949; x=1685776949;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Rj4J5ZqtE4LrNHPT+/Aac3TxoAHGPwp6neGs22D5StA=;
 b=wnASf5Uzndrz1NGiZuxaz5z/jccRHG2xXSIqNG1p1l69YEL4uJDIy3BM8nimpOlT0g
 g6oM2usPo4zpY/v08D5/MisWnsAwPy6FM96hCw16pNfaKv1OZ4Js+A/hObiQK7yiPQ8B
 hK7Ihr5b3hHzOai8VywyGWAKqfeSukH2ux3yzWPh/HpSDKLJNvmQDX9hY4U7+LtCrAfb
 Hkay70zE7k7hJVCQiHJjhyyKuYhivN/LxgZQhDVrCLGfAjNKQ2Rqjr5RmzD5o2DU5yiO
 Q81uzKKrqsDk+DpanSiPiO+Z3KRsK/rAdeFG8NBs9TQip/pu4xRYqBsbZSOw80pvsOH2
 pqfg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=wnASf5Uz
Subject: [Buildroot] [PATCH v3 1/1] package/fuse-overlayfs: bump version to
 1.11
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/containers/fuse-overlayfs/releases/tag/v1.11

Signed-off-by: Christian Stewart <christian@aperture.us>

---

v1 -> v2:

 - fix filename in hash file

v2 -> v3:

 - fix hash in hash file
 - apologies for all the revisions: was a mix-up between multiple branches

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/fuse-overlayfs/fuse-overlayfs.hash | 2 +-
 package/fuse-overlayfs/fuse-overlayfs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fuse-overlayfs/fuse-overlayfs.hash b/package/fuse-overlayfs/fuse-overlayfs.hash
index aa5438755e..b8df6c88a5 100644
--- a/package/fuse-overlayfs/fuse-overlayfs.hash
+++ b/package/fuse-overlayfs/fuse-overlayfs.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  4351eaed7cf26a5012c14c6e0fc883ef65a7b5dcc95ba129ce485904106c25a9  fuse-overlayfs-1.10.tar.gz
+sha256  320a411425414679736dcb7f3b05146430ca4af20ded0096c69ac3c7540ebca2  fuse-overlayfs-1.11.tar.gz
 # Locally computed
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/fuse-overlayfs/fuse-overlayfs.mk b/package/fuse-overlayfs/fuse-overlayfs.mk
index 1633d3bd41..4db2ccd7d5 100644
--- a/package/fuse-overlayfs/fuse-overlayfs.mk
+++ b/package/fuse-overlayfs/fuse-overlayfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FUSE_OVERLAYFS_VERSION = 1.10
+FUSE_OVERLAYFS_VERSION = 1.11
 FUSE_OVERLAYFS_SITE = $(call github,containers,fuse-overlayfs,v$(FUSE_OVERLAYFS_VERSION))
 FUSE_OVERLAYFS_LICENSE = GPL-3.0
 FUSE_OVERLAYFS_LICENSE_FILES = COPYING
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
