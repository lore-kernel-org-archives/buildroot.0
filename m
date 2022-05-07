Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E73B6C433EF
	for <buildroot@archiver.kernel.org>; Sat,  7 May 2022 23:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3BE16405B6;
	Sat,  7 May 2022 23:10:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TPJnuJim75hx; Sat,  7 May 2022 23:10:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42DCB4051E;
	Sat,  7 May 2022 23:10:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9A7051BF4D6
 for <buildroot@lists.busybox.net>; Sat,  7 May 2022 23:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E798825C6
 for <buildroot@lists.busybox.net>; Sat,  7 May 2022 23:10:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EXN_4XhSCFAM for <buildroot@lists.busybox.net>;
 Sat,  7 May 2022 23:10:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0FD8382560
 for <buildroot@buildroot.org>; Sat,  7 May 2022 23:10:54 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id d17so10734014plg.0
 for <buildroot@buildroot.org>; Sat, 07 May 2022 16:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6yt4bqYuD5Ynr9U6Ulsg9adjQlZVms39kHOu+Rl4/5Q=;
 b=AwNqmf86MIMtciEepVHPtlQwjoti6GrQQE7dZ7Q6Bn8mjHhz8m0VOBd84XPAhFZaq8
 KPUUlVLyexNICj70zA6+DfJ5ypCyMLa01tMdN1GrJEJICdBx0ugt/E/m8Owpw1XFKXEx
 K4Vur4Z/uCr+NidCoOPP/L+/3b3552zVBhFOStpHPnQbVnlVW44uLQ0mFlz9kM7JWySa
 O+Wt/Ng3MubYLbFlQD8jPGBRYmX60tRuANrqTYGEX5PWSHwzfJr+16ghzpFx/da574x2
 GcALuiwzlzOhqYdsDMc5n+jESrpfIGy1EYQa6S5+45nN/ToMyAwHEtobOzRhF6nmsOjG
 bevQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6yt4bqYuD5Ynr9U6Ulsg9adjQlZVms39kHOu+Rl4/5Q=;
 b=2hRlYOLxdRiROvbEl+viQEI4MVeA8hjPhr8xe5j2a9A6xenJa5V49XC/4tqIC2ptKg
 N+BMGZyqdCo4d5meZOWnU+H2HnfsM3XuubqHp35aLu4wsQuqozJX1jtDl1bg+nG7mbmF
 p9rYvUpDGfJUPtr+Si5XFzc+Ajf2c9T5MqrZ58Gwzv0O2FWepZ7oqFCN7q9ZjAIyuLh2
 XVWiQQcfuozSd/SyIA/GVxh2M+9nfO/QD3wYOJMX4jRxZWi3Zrsvsk4NmjnpOzrA2pVO
 b7JROv3/Fb0kGPT1VgtnzgjFALFzmXVPoiIpvnZA3+RKtwynaGCNmMTImumLZgB0HpvQ
 S62Q==
X-Gm-Message-State: AOAM533yybA1ihybdevgVBCJFcANZ+laIPEAvhK/yJkcg1Z6RHMg/i0o
 8Qn4eRfvglCKtT6E53IYO/YWr8GS1C8=
X-Google-Smtp-Source: ABdhPJzuLH0W04TOKfe9MyQql8CBFPt05D+3utp0xZDyCnDoH73bUA8HUaQ0/OL5XW6i6GjQ0ieBBQ==
X-Received: by 2002:a17:90a:d308:b0:1dc:eff1:d74e with SMTP id
 p8-20020a17090ad30800b001dceff1d74emr5244301pju.109.1651965054005; 
 Sat, 07 May 2022 16:10:54 -0700 (PDT)
Received: from localhost.localdomain (ip72-194-116-95.oc.oc.cox.net.
 [72.194.116.95]) by smtp.gmail.com with ESMTPSA id
 k17-20020a170902ba9100b0015e8d4eb2c2sm4123936pls.268.2022.05.07.16.10.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 May 2022 16:10:53 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  7 May 2022 16:10:46 -0700
Message-Id: <20220507231046.3590-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/cpulimit: Added missing dependency on
 threads
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
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, mmayer@broadcom.com,
 yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpulimit requires a toolchain supporting threads, see the following
build failure reports:

http://autobuild.buildroot.net/results/55e1af96f01a0786b4a95665736453db72be9c13
http://autobuild.buildroot.net/results/2e50face429553a6431ba5e8cda9527e5c876699

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Fixes: 9e8e80d1e335 ("package: Add cpulimit")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 package/cpulimit/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cpulimit/Config.in b/package/cpulimit/Config.in
index 6ff24f8381a3..7cab152fc0ea 100644
--- a/package/cpulimit/Config.in
+++ b/package/cpulimit/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_CPULIMIT
 	bool "cpulimit"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Cpulimit is a tool which limits the CPU usage of a process
 	  (expressed in percentage, not in CPU time)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
