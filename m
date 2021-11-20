Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1684C433F5
	for <buildroot@archiver.kernel.org>; Sat, 20 Nov 2021 11:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FCD1819BC;
	Sat, 20 Nov 2021 11:34:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9-7Pa9poNWaz; Sat, 20 Nov 2021 11:34:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4E4D80C47;
	Sat, 20 Nov 2021 11:34:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 719581BF28D
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 11:34:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A44640388
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 11:34:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uskk-LEEc9Gd for <buildroot@lists.busybox.net>;
 Sat, 20 Nov 2021 11:34:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7285040387
 for <buildroot@buildroot.org>; Sat, 20 Nov 2021 11:34:04 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id 137so7272198wma.1
 for <buildroot@buildroot.org>; Sat, 20 Nov 2021 03:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IlHl43JYkAH8+eJeKiX5Ot/TQwZQx49JIHHZaSwpTKE=;
 b=EbiUNsUToGLWKe+C+gClgInknOadLkA4PL0DDM5FcnD7t/D2wLtOomJOtFWhVO14vZ
 wx7mKpwfE7Aw2KhL8jBWTfgraDq4BRskBQ7pFsBLjEQa309wVK3WLcHo/9GZS293ZiI5
 5pWF/XNEbE/82WqL+guKnOrhEQENGqSnT4m8a9298ZW7bdPmJHJMC3geAxsEcJCBMh2k
 K3CpwUpoyu47iTqhekUR3yYk8h/c0vbMzifS3JlsW1esKpiiizufzLw0VuC6Q5gkWqZq
 w4Uu4CY+3+9POTwctSXXNstR4dQAV4JHJtos9Ek6LMNJjTYT5D8dUpgPRnSc5V9zbd0t
 xXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IlHl43JYkAH8+eJeKiX5Ot/TQwZQx49JIHHZaSwpTKE=;
 b=mwb9HB+/JtLD81CW9vH77h0vqn/thBoyCut/i04LGz5K85lsVcnVU4+m5N27oOhHnC
 RwK3eeZ1ZCXBaHpFYRL1EKDcaqggfIKA8HMg/TL32egpyPotj+1NpDukyPcaXv4ffhqu
 LsOR4v1QKXln+HZC6UmHyqf7krspkCpDg/Yz3OrwfXQaQL8VXBWMNPTkMi+MJ3wGY6/y
 7blvPN6Idt+BSoI9S0eMvO5AFfUvkb/je7/IomPV0OCc9g9s5UcGhanYz75zCaT5lJjZ
 SirreTRiqP7MAxh1VnaSv7RlVwIRW/U0wZdvgt1UN5zs23r1J1KgUrA0bhM6TX4vPWiG
 cz0A==
X-Gm-Message-State: AOAM531KueQhOIsrMIWCFsbmxkzYDOrnbghMQcNljdLeQV5dHO9bOGKE
 WVNI5cZ7Uwl5QYyzF3DrVTzo7PBqDKI=
X-Google-Smtp-Source: ABdhPJxNqeqAZ+zzo7eSvs1nSCvuHJSsRVdcOeHQrnbCUZ3smx5GaPs1jBHj5nr8btGB05/Q1KysLg==
X-Received: by 2002:a05:600c:1d91:: with SMTP id
 p17mr9350891wms.193.1637408042353; 
 Sat, 20 Nov 2021 03:34:02 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id l4sm2458973wrv.94.2021.11.20.03.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Nov 2021 03:34:02 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 20 Nov 2021 12:31:47 +0100
Message-Id: <20211120113147.2886587-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/websocketpp: replace BSD-3c by
 BSD-3-Clause
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
 Ryan Barnett <ryan.barnett@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/websocketpp/websocketpp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/websocketpp/websocketpp.mk b/package/websocketpp/websocketpp.mk
index 59b365aa54..dd31e644a4 100644
--- a/package/websocketpp/websocketpp.mk
+++ b/package/websocketpp/websocketpp.mk
@@ -6,7 +6,7 @@
 
 WEBSOCKETPP_VERSION = 0.8.2
 WEBSOCKETPP_SITE = $(call github,zaphoyd,websocketpp,$(WEBSOCKETPP_VERSION))
-WEBSOCKETPP_LICENSE = BSD-3c, MIT, Zlib
+WEBSOCKETPP_LICENSE = BSD-3-Clause, MIT, Zlib
 WEBSOCKETPP_LICENSE_FILES = COPYING
 WEBSOCKETPP_CPE_ID_VENDOR = zaphoyd
 WEBSOCKETPP_INSTALL_STAGING = YES
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
