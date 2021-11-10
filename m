Return-Path: <SRS0=ghJV=P5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 607DEC433F5
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 07:37:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6915611ED
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 07:37:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C6915611ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5615C4046F;
	Wed, 10 Nov 2021 07:37:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7REj3sCZJwm9; Wed, 10 Nov 2021 07:37:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B87884046A;
	Wed, 10 Nov 2021 07:37:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3A1AC1BF376
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 07:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 24F944046A
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 07:37:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zLHSZ71ApCjN for <buildroot@lists.busybox.net>;
 Wed, 10 Nov 2021 07:37:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9200440469
 for <buildroot@buildroot.org>; Wed, 10 Nov 2021 07:37:03 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id w1so6754263edd.10
 for <buildroot@buildroot.org>; Tue, 09 Nov 2021 23:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D56v6lqSAWXrpaOiVGl1sos/RXTWO9AXlu2b2NyPv00=;
 b=Q5ULabH1vzMt/eEI9nEmLVauNQhW4hTN7rHaraMICt4MkEa69ZdUNZI0+pKOI3QEiD
 3mfTMbePRdZ+okvUDoCOVxcekUHrjq6BrIbcV3lpa+WS8/YrkwPamBIFlwxBGX18OGyd
 JVkPJui7s7ZkX4CLJz5GpVGYeteuZo6iq+LbRYXDRE2wteos3xdFMzQRXWXbPn+wRvwd
 qllL5BiXeO8Ov4eluZER/FpebP4QYoPfdeEBMRTX644BYFrAGakRXMXqN44VJMl0sJQS
 MJIaMqI5CAlm13Kf1z1Q1M666TMnntWMWB64Il8835gLp6iAWC4nxRSbJt9rcpV35tUR
 CpVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D56v6lqSAWXrpaOiVGl1sos/RXTWO9AXlu2b2NyPv00=;
 b=MJ/RvkfCezEnWL5BjcMzK3/HfTos3o1N6UMrPATizwdNBbHjx2pFMWrfaDb74pQI7k
 abKAKnn93v7bUqkHzudRQRwnU7A/5uBT9icXtdKCFNT8gTvoYU8NSUdWpZtzlhsjCBdS
 tw+hVpw1L4IUk5JwkajLivZe7pVx+jKWZLrsPP//df5pB/l0Ou01Eo3hOGqwAdtslO2C
 0yzCsJynCC+fFD/ImEFV9dGq1k5gFl1CHUqENlbqDHkhj3c2JuCVMOLXJ768zXnACfyD
 qP59W3D42+FwYr4u9PF2a/6puOEEhSJLiJ+OINc+s0+ZXJZan9JAFethR+0NfOz0Jxqb
 eFJQ==
X-Gm-Message-State: AOAM532UAODVprVYS883OpxuyiXf+AlPPEqNwVHWCsCUFudkaA9u9Yt7
 uriZsZ+jUBt6SY6AF+agdgXFlTSNez8=
X-Google-Smtp-Source: ABdhPJwxXFECPeI7unbeY6cOTyaIT/QuP1huvBYChldXdlzJDxM2LuSIr6+noTHRxZFCA+5E2+21/Q==
X-Received: by 2002:a17:906:b090:: with SMTP id
 x16mr17708041ejy.438.1636529821652; 
 Tue, 09 Nov 2021 23:37:01 -0800 (PST)
Received: from envy.example.org (router-taduha-nat-l.pilsfree.net.
 [212.79.110.139])
 by smtp.gmail.com with ESMTPSA id qk13sm7291432ejc.3.2021.11.09.23.37.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 23:37:01 -0800 (PST)
From: Jan Kraval <jan.kraval@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Nov 2021 08:36:37 +0100
Message-Id: <20211110073638.22135-1-jan.kraval@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] rtl8189fs: bump revision to e10294d2
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
Cc: Jan Kraval <jan.kraval@gmail.com>, Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update out-of-tree driver to make it work with Linux kernel v5.15.

Signed-off-by: Jan Kraval <jan.kraval@gmail.com>
---
 package/rtl8189fs/rtl8189fs.hash | 2 +-
 package/rtl8189fs/rtl8189fs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8189fs/rtl8189fs.hash b/package/rtl8189fs/rtl8189fs.hash
index f42799b48e..a7c3641841 100644
--- a/package/rtl8189fs/rtl8189fs.hash
+++ b/package/rtl8189fs/rtl8189fs.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  7d425e18ebc427b3df5ff31185b4dc29c6bfd54f8e167f57c2254cea341a26c6  rtl8189fs-62c31d577c385316bb99107f60e63169dacc37db.tar.gz
+sha256  2350a15f866ac82a33c11f9505f2deb0f4aa819b9ac1f4809f8d6893412e73fd  rtl8189fs-e10294d2ded27586149fedee1f834d75477b8b40.tar.gz
diff --git a/package/rtl8189fs/rtl8189fs.mk b/package/rtl8189fs/rtl8189fs.mk
index 4112b135ad..83c7f3ee0d 100644
--- a/package/rtl8189fs/rtl8189fs.mk
+++ b/package/rtl8189fs/rtl8189fs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8189FS_VERSION = 62c31d577c385316bb99107f60e63169dacc37db
+RTL8189FS_VERSION = e10294d2ded27586149fedee1f834d75477b8b40
 RTL8189FS_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189FS_VERSION))
 RTL8189FS_LICENSE = GPL-2.0
 
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
