Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA1CBC433EF
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 17:51:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46B5661056
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 17:51:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 46B5661056
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 08BF8401E5;
	Sun, 14 Nov 2021 17:51:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SwKwLvespXhu; Sun, 14 Nov 2021 17:51:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 14A4740156;
	Sun, 14 Nov 2021 17:51:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3F8DE1BF2BA
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 17:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B17D80D24
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 17:51:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aLdgmyeJDlO5 for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 17:51:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A68A80D19
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 17:51:33 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id o29so11976164wms.2
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 09:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GpMpNIWCAsEoxSoDJNBhmQEM9MHVmpms2zNvrCPs3P8=;
 b=qO3MitiutdXb0N/xTJk9Y1DZec3IV8tjR9gjMu7Ki7S8XHrqAjzmSFNB5+MQ/zhKlW
 lvqnKNnfnoiuo/j+LAdW766qz78s4eC3BlT8lOMOJb8kR61cIJa0s1DsFTrX/U91d/oV
 sXy2kxVrKBJw9TAu3Nm2s50XMS0PbsGKQyQ9Fufi51FTq61JInY+8JrRczdcOKEZwvSC
 jOHvXjOxDW6iyXns3IJepKoW6VF6Pj/JL1DOCJPc/n1zeUiumlX092Uy/+bFS8KsfZeu
 mbHDyWI1n0C2lQtI04Yl+QRspc0WnC5QjeM/4V5/DQRPdObJxsBeZL3KnLkFc2G+dkPg
 NKow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GpMpNIWCAsEoxSoDJNBhmQEM9MHVmpms2zNvrCPs3P8=;
 b=AF0mdcVlzngVV2KZ5uZB8Z/0qOspXBLF0qdEXEqiPbsEAaqsgNMZv2WrGpmwiPNgty
 eZ/rLiOkU+S3VJoUALiDKDajmT/pZKGYwa3tllGsUOHJz6XTY5dDv7/CegseU1wneDZu
 M/SDyRaev7uQF8D4PSMC4jgVMQNumHecloghG9MqIQogROmJpNQfEI/Nx27aT4E77crl
 gUaZ2+mjW1fCePzU01zYtIi8fiPMlQdwcKd8Xg4dW3d2UQTYJS6LJDjEHDr6yM+gVk6W
 hQ7vSYr0q25o3Q7IpkUmP4vhXeLgTOF4A3uqI+QE8GFM3M9wrh6gjyyoVMcpNXmJzy9L
 SyLQ==
X-Gm-Message-State: AOAM5339AL4s0XC9P7JnOp1JsjhXohb1CEQuL6RUsxAUZi5gE20iJ+qT
 Gd8cXVf8fHq9FllNrq96hr1GKQDQwMk=
X-Google-Smtp-Source: ABdhPJyvAjkYT0F9MApF158wyugchqbK3g4gCSjpzVdWi2VKB57x9AIq1Q1mMmiclBRrFLrmdvtSZQ==
X-Received: by 2002:a05:600c:22c7:: with SMTP id
 7mr35276293wmg.58.1636912291450; 
 Sun, 14 Nov 2021 09:51:31 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id t189sm11535525wma.8.2021.11.14.09.51.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Nov 2021 09:51:31 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 18:49:21 +0100
Message-Id: <20211114174921.3136770-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/log4cxx: select boost chrono and
 date-time with gcc < 7
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since commit
4e267a7d3d5d350710a81ada188a1629348e4b4a:

-- Found Boost: /home/buildroot/autobuild/instance-3/output-1/host/sh4-buildroot-linux-uclibc/sysroot/usr/include (found version "1.77.0") found components: thread chrono atomic missing components: date_time

Fixes:
 - http://autobuild.buildroot.org/results/e7443e3bc955e7eddd7bed63e2728880dabb31a7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/log4cxx/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/log4cxx/Config.in b/package/log4cxx/Config.in
index 6f1956f829..27a5f06988 100644
--- a/package/log4cxx/Config.in
+++ b/package/log4cxx/Config.in
@@ -12,6 +12,8 @@ config BR2_PACKAGE_LOG4CXX
 	select BR2_PACKAGE_APR_UTIL
 	select BR2_PACKAGE_BOOST if !BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	select BR2_PACKAGE_BOOST_ATOMIC if !BR2_TOOLCHAIN_GCC_AT_LEAST_7
+	select BR2_PACKAGE_BOOST_CHRONO if !BR2_TOOLCHAIN_GCC_AT_LEAST_7
+	select BR2_PACKAGE_BOOST_DATE_TIME if !BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	select BR2_PACKAGE_BOOST_THREAD if !BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	help
 	  Apache log4cxx is a logging framework for C++ patterned
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
