Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A705C636D6
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 18:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3ED860E2B;
	Wed, 22 Feb 2023 18:22:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3ED860E2B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RNEWIk8AeEMl; Wed, 22 Feb 2023 18:22:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E66D760BC4;
	Wed, 22 Feb 2023 18:22:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E66D760BC4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 119091BF334
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 18:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DEA9A60BC4
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 18:22:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEA9A60BC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LeyV0O3yoGPD for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 18:22:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEF88605D8
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BEF88605D8
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 18:22:14 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id bo30so8152453wrb.0
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 10:22:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iOeHmf/K9+EXg/lqgzNjMyduTLWjqqMu1pYLDBl9I+A=;
 b=dIttO4WdyT3pyHJJO9Y2eFDYKePvxTdIQUSlWeKo1p5FyuS9ssar/5sn2pqjrgS9wo
 GARSq3Lnv33A53C1qYesi3YdmEJK2y1CU3R5f2qYSbLsMFMMBUV6482aXzEpamHtNTsl
 kZ0zq3qVzB4keRWH9t6lET419eNfisCqlRXsJW5EcMZyVcvICzcT4uUSyuEVedVRmh1j
 H9CpORQ0xnPmuiDJzYdIKBmCnd2TDijRxz7aatpYWvJaxT2WpfJSHQPjX27VRlWtF4ZD
 cyV5wLzTLS4SE5PR9U/7w33FPiA6KCh60QDCWSYh7E1z0CNxmQxCWlLbKW9RPtVNiM30
 UK0w==
X-Gm-Message-State: AO0yUKWN+PeKXk0ixm2j3m1/OngODOYwjGDgByBl8dYt8Ucw8eqt9fBY
 NOO0YoLny0FTC1s62HqkiYHvX4k3Ub8=
X-Google-Smtp-Source: AK7set/2vvE/Igw1lv6RA2Ue4g5PzX4pO7R2Uwq+4M516m/jfyl1qXH6uWgWiArvzxbY5QArRORkUg==
X-Received: by 2002:a05:6000:187:b0:2c5:99bf:18d2 with SMTP id
 p7-20020a056000018700b002c599bf18d2mr7592113wrx.67.1677090132369; 
 Wed, 22 Feb 2023 10:22:12 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 n9-20020a5d4c49000000b002c54536c662sm7814540wrt.34.2023.02.22.10.22.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 10:22:11 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 19:22:10 +0100
Message-Id: <20230222182210.2539248-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iOeHmf/K9+EXg/lqgzNjMyduTLWjqqMu1pYLDBl9I+A=;
 b=NP0+ilAIDigYrn5d2nLNPHSfom9WHEgGf/SDvQwTYlsQ5b665eQNHeyy1QgdHgCefl
 A93OcO9uVS+sgBQ+JPjTguz107YF9eWGdBb0ZXOrvSO+Atp7kL0DspDEVO3W/qf1FCcY
 UfU92ISsuFlabPDuaDCc8CaLdXZIRRRh6qVYPLmRmN5aDCB6hWsNJkueZXNk5gyP81/+
 dpnow2l0EOwDT0KSOoyFcX9B9DY3GLhqkOZxxwA9/WUsvLuxUmylhqbfivmYc5+Bi/2s
 MXuV5510anxE+hYywFLmy6hbIgut1KT1qBPPO0gHEMgBdoKvCPWupp83jRF929wDxVyR
 JqJw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=NP0+ilAI
Subject: [Buildroot] [PATCH 1/1] package/lightning: needs threads
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
Cc: Paul Cercueil <paul@crapouillou.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

threads are mandatory since bump to version 2.2.0 in commit
af6f7aa76db5aed1eada0b27bd0375610a2fc728 and
https://git.savannah.gnu.org/cgit/lightning.git/commit/?id=d5a7c8e4ad719e84dbb4904c532f906a1ef5a77b:

In file included from incr.c:2:
../include/lightning.h:27:10: fatal error: pthread.h: No such file or directory
   27 | #include <pthread.h>
      |          ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/62205869159d4a73c59a9795140fa77e9c3310ae

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lightning/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/lightning/Config.in b/package/lightning/Config.in
index a0542edce9..3cf7c28ae2 100644
--- a/package/lightning/Config.in
+++ b/package/lightning/Config.in
@@ -1,13 +1,14 @@
-comment "lightning needs a toolchain w/ dynamic library"
+comment "lightning needs a toolchain w/ dynamic library, threads"
 	depends on BR2_sparc || BR2_i386 || BR2_x86_64 || BR2_mips || \
 		BR2_mipsel || BR2_arm || BR2_powerpc || BR2_RISCV_64
-	depends on BR2_STATIC_LIBS
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_LIGHTNING
 	bool "lightning"
 	depends on BR2_sparc || BR2_i386 || BR2_x86_64 || BR2_mips || \
 		BR2_mipsel || BR2_arm || BR2_powerpc || BR2_RISCV_64
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  GNU lightning is a library that generates
 	  assembly language code at run-time.
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
