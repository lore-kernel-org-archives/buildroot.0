Return-Path: <SRS0=2n7N=M5=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 287AFC4338F
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 18:44:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAA9460ED6
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 18:44:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CAA9460ED6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 898CE82B1A;
	Fri,  6 Aug 2021 18:44:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rI2-sM4cQLZC; Fri,  6 Aug 2021 18:44:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D82EB8274D;
	Fri,  6 Aug 2021 18:44:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D29B01BF83B
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 18:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CFC1D605CB
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 18:44:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DHYV763V4chC for <buildroot@lists.busybox.net>;
 Fri,  6 Aug 2021 18:44:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EB8F160067
 for <buildroot@buildroot.org>; Fri,  6 Aug 2021 18:44:17 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 d131-20020a1c1d890000b02902516717f562so6746872wmd.3
 for <buildroot@buildroot.org>; Fri, 06 Aug 2021 11:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/WMoSgSQ07UPGG1jVkOZQcB+UnrK3JN2z3N8/LEonPg=;
 b=jty8KFav8qOKsdRthXUM9UNCwGPSsXA045kfTnycWEPoLSQzLMABkoIqC8rANBOw7v
 8g3SWiqV00rgoRkCjIjyX9yoGwEscioUDH/cbAtRHDdSO7Vzx7pjm/cyFE6lFXqFCZ0a
 htVuNx6aXcSZTBWAdSjDkpCw2RHYDfVzlRWjFKirUH+eLMGcLO01cW7QbZKgfDGWoyMm
 pED1kBAQY4KHEEmNl0TyNbC7hJdbOyBu16strNPPwC5GUPxjIvWaE8kpKff2KA6ji+uw
 jxCht2Vixpw1tyfQ8eUDvUAIInrYG9iZu8SeY6C/MhFT0wkukjLNkfS0zWGA1AmfBmdi
 O51Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/WMoSgSQ07UPGG1jVkOZQcB+UnrK3JN2z3N8/LEonPg=;
 b=dpGLTtpu5MScif7qMut0uIm9nTMpYVUzdvWOf44bVQ/mQmZ7f5LP7hr2hdNykrOYLU
 tzQHYwekaKbtub2IC1hq1tp1Q06u7JbH4gZDz6/U+NqYGRKMIyNIypdX7ugadNBsd0V2
 GWL1qzawhWTzGTxYeugTiJLpdJZWb99qE+iMVu1xQlAi/L8PYmMewUZGW7qBlSZBYZg1
 F6WzIyVkMge14o4CZ8ZCnL8A5wifIJ+pvBXJBfH5zraVCAJJG+a2KB8Qq/4q3uG1LlZs
 /SO+LD30hK4K4QNZjSRoSnou2KbeLXGtZpc8Fb0ccC9OW1Ru0u/8NjQR8/ZMaETfC92M
 NSuw==
X-Gm-Message-State: AOAM5314oIqyFNh79tZKrMMBApZSJTxIhXjXVbjFSirc+FTcZ9WLCshx
 B7md1MRMnhulr8ACtreWhozj4vqVnNi87g==
X-Google-Smtp-Source: ABdhPJyYkLn8nNQhv6JIOUgymSY0SJEpnxBmpEMrar0ncfplOP3EHv27BiFmLI5ChFXUaPj6uu5z5w==
X-Received: by 2002:a05:600c:350a:: with SMTP id
 h10mr3508900wmq.89.1628275455763; 
 Fri, 06 Aug 2021 11:44:15 -0700 (PDT)
Received: from kali.home (pop.92-184-97-157.mobile.abo.orange.fr.
 [92.184.97.157])
 by smtp.gmail.com with ESMTPSA id d5sm10228210wre.77.2021.08.06.11.44.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 11:44:15 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Aug 2021 20:44:11 +0200
Message-Id: <20210806184411.4062961-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/guile: fix build on riscv32
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fix the following build failure on riscv32:

system/base/target.scm:132:16: In procedure triplet-pointer-size:
unknown CPU word size "riscv32"

Fixes:
 - http://autobuild.buildroot.org/results/6705630c1484239ec8b73d57ebc2e2570fbfc8f8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...stem-base-target.scm-support-riscv32.patch | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/guile/0004-module-system-base-target.scm-support-riscv32.patch

diff --git a/package/guile/0004-module-system-base-target.scm-support-riscv32.patch b/package/guile/0004-module-system-base-target.scm-support-riscv32.patch
new file mode 100644
index 0000000000..cadd040f12
--- /dev/null
+++ b/package/guile/0004-module-system-base-target.scm-support-riscv32.patch
@@ -0,0 +1,33 @@
+From 995a5e1da735b75733f059615c593c330b534d80 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 6 Aug 2021 19:49:37 +0200
+Subject: [PATCH] module/system/base/target.scm: support riscv32
+
+Fix the following build failure on riscv32:
+
+system/base/target.scm:132:16: In procedure triplet-pointer-size:
+unknown CPU word size "riscv32"
+
+Fixes:
+ - http://autobuild.buildroot.org/results/6705630c1484239ec8b73d57ebc2e2570fbfc8f8
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ module/system/base/target.scm | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/module/system/base/target.scm b/module/system/base/target.scm
+index 2088cd866..5544e234f 100644
+--- a/module/system/base/target.scm
++++ b/module/system/base/target.scm
+@@ -121,6 +121,7 @@
+           ((member cpu '("sparc" "powerpc" "mips" "mipsel" "nios2" "m68k" "sh3" "sh4")) 4)
+           ((member cpu '("s390x" "alpha")) 8)
+           ((string-match "^arm.*" cpu) 4)
++          ((string-match "^riscv.*" cpu) 8)
+           (else (error "unknown CPU word size" cpu)))))
+ 
+ (define (triplet-cpu t)
+-- 
+2.30.2
+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
