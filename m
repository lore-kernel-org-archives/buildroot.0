Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F74EF4EC0
	for <buildroot@archiver.kernel.org>; Mon,  6 Apr 2026 07:50:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0168405A9;
	Mon,  6 Apr 2026 07:50:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Ip8jj_MYChQ; Mon,  6 Apr 2026 07:50:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 115D340504
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775461821;
	bh=ZDfzTi98x5LApFPkBD85NZAK7uLY5iIJ5UlStdn13x0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ef/Bn0232kCklf9oSy2qLU8mP4i35tQGykPe79lrQZD0JRqJ38G2gUF3/KsQ5NdC9
	 F9t/Zly83FzTfSU2Wsmn81w8GrjkA8xWjodH2+buI13XiHpefFdl7cx6rb1KHO2W6S
	 cGpiEl6CWlhaQz+6JGVK4lG+DC3sr/mC7H3UJECWHEOiVvPZDhTju5q5yc3p5+uqSD
	 bjcdR+w+u4FM+lAGADk61qyc8h2F16BId8PZEAkDt54BgnAZQ7eEZKCogEGtbmgo5Q
	 CY4aPW88BO4E0HBrrfJ2bcIfJiS2VMUkoF9x5SOUeIOlbvQu6as4q9DBoqD/NjxNM7
	 C3nEdy97/evxA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 115D340504;
	Mon,  6 Apr 2026 07:50:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 362AA1EB
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 07:50:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1BD3D605F0
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 07:50:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id luRHMeTPcjz8 for <buildroot@buildroot.org>;
 Mon,  6 Apr 2026 07:50:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F1C84605E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1C84605E8
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F1C84605E8
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 07:50:18 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-48896199cbaso30345755e9.1
 for <buildroot@buildroot.org>; Mon, 06 Apr 2026 00:50:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775461816; x=1776066616;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=epJpicdV6FIGA6FO8kl702H8eX7gqgfDiY+k8O68Kfo=;
 b=iBo2YfEbgKpATewloHGq03Nvw+8v9s0en8wcSim2a6bMESVEbh/bP/TTaTKHwZN7+3
 ZheBAOI/JglGRsPXwXVpUg3ckfYdhPLeF5dCInPHtp2QLUcosWDIPxVLJqOOPUCU+o2t
 lNeLj/DGWsNxYDLAhkVHz+PAWutcV+xtGbpRxbv9dG15rCv+v8md7rOiHCC/NKhKxR+2
 XR/EdKq0/XUj9fdhtsSC5d+FlK28CQlZCNTZAKrd/iq3AjahpVDRZd64RNpXqUGm8541
 8tS+OZaG8xMFpnqj/hs3c9HGMJ8dfpCvPlrdyN26+yRSzhGkeKqeNKIRj2IaFUHPHd/q
 BZIA==
X-Gm-Message-State: AOJu0Yxi/++J8AUFAX24KbvY4y7f9FL74KMHKg8OTfRaRwM6l2jy3JaQ
 pUw2KDoqC6dxY2roLkdgUlnE4VT8yiDsufrCopoTa0ulp4tnOPlkqbTjAJ4gTcDmDBE8aMwgYqu
 1usR8
X-Gm-Gg: AeBDietISyvy97r8qytQrOr1lLrtJmHl/TzOizYCycCEoSx7gcIF3o2EO5PAb/6j2IE
 uwPJp2U9IHKAGOdPQEP+UvA4JNK4U9YFAib41AGEdVMAUrJnMnKSrHcnPkxZq9pf8ryrcZowhrW
 /FrVTGIrfp/g15b+J/UiOH383Kd35rJHKuz+ehhf9k0wxk5FpSbao9XDjobnCuNTVSNYSA2Q8lX
 wMch9sj3TqzY732VaY5CmrUcTkidhXzwbRTCrCAf3Mni15sMfxi927FAlaZW1joqVOw+Qmbmt7D
 4xMM3wASfnng1dlKv/C1t7xv0sWYBbsy+J/dzAuGUBbihC8k+OiSu7LMJIZoXlrD4dPrdxE/mNB
 JkgwK1IqZL9V175ZOOaMDS9e10zul4IFsdRTKLpYZQ92zFQpzJxzagdPpbFVtKfkBzW9Ac7p4Sg
 RJYUt5vEkrfbA+SoX8p3Ud5N9MUHGU1UhiAy3U3t90l/5vLTHv/Iw2DqhN1Ihxi8ckVkPoBv/xF
 8clvptH+gP7u83LplFrX5wneaUn95FfWKxSIJGnC44WMFpe/DKlZ5kByxbJhUtcOFnrLUeTe6Nr
 37WG7QnSUdaplXlXehv8tE8p
X-Received: by 2002:a05:600c:46d5:b0:486:fdba:f5db with SMTP id
 5b1f17b1804b1-488995d5fa9mr173279575e9.0.1775461816322; 
 Mon, 06 Apr 2026 00:50:16 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-87-9-100-184.retail.telecomitalia.it. [87.9.100.184])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488980e312csm86430275e9.7.2026.04.06.00.50.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2026 00:50:15 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Mon,  6 Apr 2026 09:50:12 +0200
Message-ID: <20260406075012.3450533-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1775461816; x=1776066616;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=epJpicdV6FIGA6FO8kl702H8eX7gqgfDiY+k8O68Kfo=;
 b=o4e2aa1v0G38OWstMgenWCql0q26Hy8CpqNkONjn+ckTYhBKVQKxwOXETji3uAJwKU
 dDSiLgeQafJZApNJA3JnLSOVviW1aMJHY6T3d2JOmSXVaj8XphRSOWRBvN0GAGDlLgpm
 VEGHOkCpsleMdEqBaamgiPvVglvk1SUKvWAEk=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=o4e2aa1v
Subject: [Buildroot] [PATCH 1/1] package/pocketpy: bump to version 2.1.8
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

The LICENSE sha256 changed because of a date update (2025 -> 2026),
not due to any substantive license modification.

Release notes:
https://github.com/pocketpy/pocketpy/releases/tag/v2.1.8

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/pocketpy/pocketpy.hash | 4 ++--
 package/pocketpy/pocketpy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pocketpy/pocketpy.hash b/package/pocketpy/pocketpy.hash
index 9f0fb868f4db..d6ba6e5da27c 100644
--- a/package/pocketpy/pocketpy.hash
+++ b/package/pocketpy/pocketpy.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  b0e4ee0ffcc6111f67a405c6418f5539caa0ab0368adb2027af23fbf17de88a6  pocketpy-2.1.6.tar.gz
-sha256  9dab6fe9086f93847540387be578edc94b6b280004db5ed7c850ccf8f086fd66  LICENSE
+sha256  2b840e0c87c36ae00100fe892301565d7d905e07e1ce1f69cb4b9fcd65bc82ef  pocketpy-2.1.8.tar.gz
+sha256  5ad14c41f26ed1b8c9a0039ae566bc7ce00277aec1634220eae5db2bb8fc54ef  LICENSE
diff --git a/package/pocketpy/pocketpy.mk b/package/pocketpy/pocketpy.mk
index 06aa0faca014..23789dd62028 100644
--- a/package/pocketpy/pocketpy.mk
+++ b/package/pocketpy/pocketpy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POCKETPY_VERSION = 2.1.6
+POCKETPY_VERSION = 2.1.8
 POCKETPY_SITE = $(call github,pocketpy,pocketpy,v$(POCKETPY_VERSION))
 POCKETPY_LICENSE = MIT
 POCKETPY_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
