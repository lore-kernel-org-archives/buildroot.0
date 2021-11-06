Return-Path: <SRS0=GWv0=PZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C78BC433EF
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 13:43:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB5BE60E90
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 13:43:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AB5BE60E90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43BD860717;
	Sat,  6 Nov 2021 13:43:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pMeuVoIahS2E; Sat,  6 Nov 2021 13:43:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A75DA6069D;
	Sat,  6 Nov 2021 13:43:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 65D661BF387
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 13:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55B0E40260
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 13:43:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4eM2plY5ymNF for <buildroot@lists.busybox.net>;
 Sat,  6 Nov 2021 13:43:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 17BE44021D
 for <buildroot@buildroot.org>; Sat,  6 Nov 2021 13:43:04 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id b12so18220078wrh.4
 for <buildroot@buildroot.org>; Sat, 06 Nov 2021 06:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xvJCiLF301UmBfiY67RMMKLJfbPWj+W8Ke9xOmsCWn4=;
 b=VwfZ1zcPBOyiMy+EyIgSqEJueC3yYfieM6fD1ki/tkAFsZCWEOc9QItWrfcyQYkG5H
 yzhFKiLzr/EhLuk0IwMrakzP4bjWPOGLq3KIgVxlpsZDPvpWY7cRlS81wWnj5/h5q+At
 sB6ECsgyIJOP4MOhzBxvVeSfF/9s1+pjzvdLABMYgWuX7SuHFQf20LczisIElDJ9amVS
 dX9XGboOmqWvhQ5Xk300MXkTrxrERrN6lCaBv/Xt8Azwcg42M/BlXjQlQCnv7JHBuQZX
 w7Y6B0zjufc4lOYBCcTNtfgM9osy+htRVMgUDqKmoK+H21nXj8xS37dHNcRX/i0I8Nz4
 MwzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xvJCiLF301UmBfiY67RMMKLJfbPWj+W8Ke9xOmsCWn4=;
 b=pQtU4+xIHmnyu+X2WUyOvGxVAgx7L886Ot8ZaZWXoqUHC7uGTjcgUMMw16h5/uBtoo
 DKzVJqfMcX4zaHkLyvFvh/z4oM3llf5q/0UEDVja/KjNqthtOasL1SMjdqz6PEot8sUl
 6vpsuQo+0Ji1lvg5/SUC4C6YzbR05daYE4s2DNaQAiduY/b2LaAa1AP3vKOQ/BsAUjZl
 GuQZNMmx7Gvrt9SXLeRKkDiTtymwXSVIfwPBYqfvKxSc3jXnl29HF84s17cx8SM1S68v
 cKXWOevLR7h01Gxp1auwphGUjjlxNpSGhiWA+Bqy9mcsnIm3+FJBpq8AmTny524j238I
 L4LQ==
X-Gm-Message-State: AOAM530tNlgxhLdyoplP74/WJAdTlbjO0k3wMmc6qHTlQ/HuUw4x4NeV
 Pdsjw7izT/o3FBMUB1twcEvQgc1XmNM=
X-Google-Smtp-Source: ABdhPJzlhDP2/mUOrz+qLPGaLNYmYJtQYJi13tDgUx3AukWYakDaT5oKR6/pdHwDNUgJqfaromAQLg==
X-Received: by 2002:a5d:64c4:: with SMTP id f4mr2412474wri.6.1636206182078;
 Sat, 06 Nov 2021 06:43:02 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id n1sm8960318wmq.6.2021.11.06.06.43.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Nov 2021 06:43:01 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  6 Nov 2021 14:41:08 +0100
Message-Id: <20211106134108.3015865-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pipewire: fix build on arm926ej-s
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump to version 0.3.39 in
commit d9796f2db9866060b916487784b046bb6b76f9b6:

/tmp/ccsZ6haQ.s:467: Error: selected processor does not support `vmrs r3,fpscr' in ARM mode
/tmp/ccsZ6haQ.s:469: Error: selected processor does not support `vmsr fpscr,r3' in ARM mode
/tmp/ccsZ6haQ.s:490: Error: selected processor does not support `vmrs r3,fpscr' in ARM mode
/tmp/ccsZ6haQ.s:492: Error: selected processor does not support `vmsr fpscr,r3' in ARM mode

Fixes:
 - http://autobuild.buildroot.org/results/d449095c67b9477fc95ebbab5eb628e5eb4ea5c6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...u-disable-VFP-asm-when-not-available.patch | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/pipewire/0002-cpu-disable-VFP-asm-when-not-available.patch

diff --git a/package/pipewire/0002-cpu-disable-VFP-asm-when-not-available.patch b/package/pipewire/0002-cpu-disable-VFP-asm-when-not-available.patch
new file mode 100644
index 0000000000..297016edc2
--- /dev/null
+++ b/package/pipewire/0002-cpu-disable-VFP-asm-when-not-available.patch
@@ -0,0 +1,30 @@
+From 2cddd4a775c145570f4a8a30d28b57f551d43206 Mon Sep 17 00:00:00 2001
+From: Wim Taymans <wtaymans@redhat.com>
+Date: Mon, 25 Oct 2021 16:32:16 +0200
+Subject: [PATCH] cpu: disable VFP asm when not available
+
+Fixes #1746
+
+[Retrieved from:
+https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/2cddd4a775c145570f4a8a30d28b57f551d43206]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ spa/plugins/support/cpu-arm.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/spa/plugins/support/cpu-arm.c b/spa/plugins/support/cpu-arm.c
+index c07711f70..fe6222f7c 100644
+--- a/spa/plugins/support/cpu-arm.c
++++ b/spa/plugins/support/cpu-arm.c
+@@ -143,7 +143,7 @@ static int arm_zero_denormals(void *object, bool enable)
+ 			"msr	fpcr, %0		\n"
+ 			"isb				\n"
+ 			: "=r"(cw)::"memory");
+-#else
++#elif (defined(__VFP_FP__) && !defined(__SOFTFP__))
+ 	uint32_t cw;
+ 	if (enable)
+ 		__asm__ __volatile__(
+-- 
+GitLab
+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
