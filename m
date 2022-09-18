Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA201C54EE9
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 10:32:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D54760E31;
	Sun, 18 Sep 2022 10:32:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D54760E31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ylr4JMZbuisP; Sun, 18 Sep 2022 10:32:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 444B160E25;
	Sun, 18 Sep 2022 10:32:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 444B160E25
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DB32A1BF42D
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 10:32:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B574C4012E
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 10:32:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B574C4012E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mu65AO8WEAdn for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 10:32:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34E254011C
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 34E254011C
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 10:32:51 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id z6so10297253wrq.1
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 03:32:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=Z5gJgFFtNERf2s2tIaQiKs85w+NCYNrbaTRacz7qFDs=;
 b=j6VoPELYlJyyOqIhA/19bqxsuRl224gXJd466kBbBUvYyxXnGio5SvKaFB0HlznZJB
 I9fK4yqe9GlfloiDdUU6hRE/iEnSdlFU2UFQQLuVEVyL2qnEuYpSLguM54vRMLhcgxsN
 aueEhQfG/ZkwlgU/GPBlXhlowOKsCCVvQ9NPjml0DA3gRChNx/V1z51MM/goS8b0kqrV
 1B+i6k3GMJjsoWdXzUqfOfwmj5PJZQcH8utQ8fLNoUXB+IPaYQJqZbWgZTWLPKDXanRP
 2u+xeeT2SpVzUXTb8B0m98lDvR16YmDSyJzasjPkailTl1WofxaD/n6XQ0+/XoPzlAfY
 dtwQ==
X-Gm-Message-State: ACrzQf3PJ+FuheEOlPkVuNXvmk1cX2AhTcupNvmyxiU1tZjLFrXEzlU8
 PRDRdw3gs4CYEryrOzLd2d/LZvLOaxR1i9xhw3I=
X-Google-Smtp-Source: AMsMyM7CF0PDO0qc7uRnnMMYwp+dYP3fWTevY/A8zuGRTKpROGUafIArp/LRSMpJVdvGMjEblXOtFw==
X-Received: by 2002:a5d:4444:0:b0:22a:2a64:a0fd with SMTP id
 x4-20020a5d4444000000b0022a2a64a0fdmr7883033wrr.293.1663497170326; 
 Sun, 18 Sep 2022 03:32:50 -0700 (PDT)
Received: from arnoutx1.. ([79.140.217.34]) by smtp.gmail.com with ESMTPSA id
 t1-20020adfe441000000b0022a2bacabbasm10051880wrm.31.2022.09.18.03.32.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Sep 2022 03:32:49 -0700 (PDT)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 12:32:48 +0200
Message-Id: <20220918103248.31667-1-arnout@mind.be>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=Z5gJgFFtNERf2s2tIaQiKs85w+NCYNrbaTRacz7qFDs=;
 b=NzbAl+0JF+eeYKa8n8TlRmYFiUjdr+CE13seulk2XuTKOHAnEbosI0eMdhLnu5d+nj
 8yk3ea9R4AB9EAk//CI4jjyDkkyDPoB2vKs4/uIigs2E4kgaa0BFmCH5PRDrZa60NSVU
 G085CX9Esi5gdeYQcD//Z+decS7KeJ3JSrU4zkNXF7ZQcUQw3gcs+/iftT5x7yXo6Ggw
 QSb8mSIGMYCvJLrJHp+H7UDY0hIkHrBYh2UVSUjhknmwnFF6GNjz12LLtttaeAZ9BOFM
 aHHb3o2zAY938Y5wTPrFLy7fEGcTXy1oP7IgZog2rUG396TupFLBq/Ncijt2V3V8i7nu
 itUw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=NzbAl+0J
Subject: [Buildroot] [PATCH] arch/Config.in.powerpc: change conditions to
 positive logic
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The conditions in the target CPU choice mostly use negative logic, i.e.
"depends on !<something>". This makes it more difficult to understand
exactly on which ARCH variants the CPU _is_ supported. Therefore, change
all of the conditions to positive logic.

Since there is no little-endian variant of the 32-bit PowerPC, the
conditions are:

!BR2_ARCH_IS_64 <==> BR2_powerpc
!BR2_powerpc64le <==> BR2_powerpc || BR2_powerpc64

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 arch/Config.in.powerpc | 70 +++++++++++++++++++++---------------------
 1 file changed, 35 insertions(+), 35 deletions(-)

diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
index 949995d037..52802f6693 100644
--- a/arch/Config.in.powerpc
+++ b/arch/Config.in.powerpc
@@ -16,118 +16,118 @@ choice
 config BR2_generic_powerpc
 	bool "generic"
 	# No C library supports this variant on ppc64le
-	depends on !BR2_powerpc64le
+	depends on BR2_powerpc || BR2_powerpc64
 config BR2_powerpc_401
 	bool "401"
-	depends on !BR2_ARCH_IS_64
+	depends on BR2_powerpc
 config BR2_powerpc_403
 	bool "403"
-	depends on !BR2_ARCH_IS_64
+	depends on BR2_powerpc
 config BR2_powerpc_405
 	bool "405"
-	depends on !BR2_ARCH_IS_64
+	depends on BR2_powerpc
 config BR2_powerpc_405fp
 	bool "405 with FPU"
-	depends on !BR2_ARCH_IS_64
+	depends on BR2_powerpc
 config BR2_powerpc_440
 	bool "440"
-	depends on !BR2_ARCH_IS_64
+	depends on BR2_powerpc
 config BR2_powerpc_440fp
 	bool "440 with FPU"
-	depends on !BR2_ARCH_IS_64
+	depends on BR2_powerpc
 config BR2_powerpc_464
 	bool "464"
-	depends on !BR2_ARCH_IS_64
+	depends on BR2_powerpc
 config BR2_powerpc_464fp
 	bool "464 with FPU"
-	depends on !BR2_ARCH_IS_64
+	depends on BR2_powerpc
 config BR2_powerpc_476
 	bool "476"
-	depends on !BR2_ARCH_IS_64
+	depends on BR2_powerpc
 config BR2_powerpc_476fp
 	bool "476 with FPU"
-	depends on !BR2_ARCH_IS_64
+	depends on BR2_powerpc
 config BR2_powerpc_505
 	bool "505"
-	depends on !BR2_ARCH_IS_64
+	depends on BR2_powerpc
 config BR2_powerpc_602
 	bool "602"
-	depends on !BR2_ARCH_IS_64
+	depends on BR2_powerpc
 config BR2_powerpc_603
 	bool "603"
-	depends on !BR2_ARCH_IS_64
+	depends on BR2_powerpc
 config BR2_powerpc_603e
 	bool "603e"
-	depends on !BR2_ARCH_IS_64
+	depends on BR2_powerpc
 config BR2_powerpc_604
 	bool "604"
-	depends on !BR2_ARCH_IS_64
+	depends on BR2_powerpc
 config BR2_powerpc_604e
 	bool "604e"
-	depends on !BR2_ARCH_IS_64
+	depends on BR2_powerpc
 config BR2_powerpc_620
 	bool "620"
-	depends on !BR2_powerpc64le
+	depends on BR2_powerpc || BR2_powerpc64
 config BR2_powerpc_630
 	bool "630"
-	depends on !BR2_powerpc64le
+	depends on BR2_powerpc || BR2_powerpc64
 config BR2_powerpc_740
 	bool "740"
-	depends on !BR2_ARCH_IS_64
+	depends on BR2_powerpc
 config BR2_powerpc_7400
 	bool "7400"
-	depends on !BR2_ARCH_IS_64
+	depends on BR2_powerpc
 	select BR2_POWERPC_CPU_HAS_ALTIVEC
 config BR2_powerpc_7450
 	bool "7450"
-	depends on !BR2_ARCH_IS_64
+	depends on BR2_powerpc
 	select BR2_POWERPC_CPU_HAS_ALTIVEC
 config BR2_powerpc_750
 	bool "750"
-	depends on !BR2_ARCH_IS_64
+	depends on BR2_powerpc
 config BR2_powerpc_821
 	bool "821"
-	depends on !BR2_ARCH_IS_64
+	depends on BR2_powerpc
 config BR2_powerpc_823
 	bool "823"
-	depends on !BR2_ARCH_IS_64
+	depends on BR2_powerpc
 config BR2_powerpc_860
 	bool "860"
-	depends on !BR2_ARCH_IS_64
+	depends on BR2_powerpc
 config BR2_powerpc_970
 	bool "970"
 	depends on BR2_powerpc || BR2_powerpc64
 	select BR2_POWERPC_CPU_HAS_ALTIVEC
 config BR2_powerpc_8540
 	bool "8540 / e500v1"
-	depends on !BR2_ARCH_IS_64
+	depends on BR2_powerpc
 	select BR2_POWERPC_CPU_HAS_SPE
 config BR2_powerpc_8548
 	bool "8548 / e500v2"
-	depends on !BR2_ARCH_IS_64
+	depends on BR2_powerpc
 	select BR2_POWERPC_CPU_HAS_SPE
 config BR2_powerpc_e300c2
 	bool "e300c2"
-	depends on !BR2_ARCH_IS_64
+	depends on BR2_powerpc
 config BR2_powerpc_e300c3
 	bool "e300c3"
-	depends on !BR2_ARCH_IS_64
+	depends on BR2_powerpc
 config BR2_powerpc_e500mc
 	bool "e500mc"
-	depends on !BR2_ARCH_IS_64
+	depends on BR2_powerpc
 config BR2_powerpc_e5500
 	bool "e5500"
-	depends on !BR2_powerpc64le
+	depends on BR2_powerpc || BR2_powerpc64
 config BR2_powerpc_e6500
 	bool "e6500"
-	depends on !BR2_powerpc64le
+	depends on BR2_powerpc || BR2_powerpc64
 	select BR2_POWERPC_CPU_HAS_ALTIVEC
 config BR2_powerpc_power4
 	bool "power4"
-	depends on !BR2_powerpc64le
+	depends on BR2_powerpc || BR2_powerpc64
 config BR2_powerpc_power5
 	bool "power5"
-	depends on !BR2_powerpc64le
+	depends on BR2_powerpc || BR2_powerpc64
 config BR2_powerpc_power6
 	bool "power6"
 	depends on BR2_powerpc || BR2_powerpc64
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
