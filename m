Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5747EC64ED6
	for <buildroot@archiver.kernel.org>; Sun, 26 Feb 2023 19:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45FC640929;
	Sun, 26 Feb 2023 19:44:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45FC640929
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KBE1pXVwK9Wx; Sun, 26 Feb 2023 19:44:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14A4C4091F;
	Sun, 26 Feb 2023 19:44:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14A4C4091F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 860741BF36E
 for <buildroot@lists.busybox.net>; Sun, 26 Feb 2023 19:44:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F0B94091F
 for <buildroot@lists.busybox.net>; Sun, 26 Feb 2023 19:44:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F0B94091F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TScGS9lq2txD for <buildroot@lists.busybox.net>;
 Sun, 26 Feb 2023 19:44:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6A734091C
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E6A734091C
 for <buildroot@buildroot.org>; Sun, 26 Feb 2023 19:44:32 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id bw19so4121844wrb.13
 for <buildroot@buildroot.org>; Sun, 26 Feb 2023 11:44:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Art/EenhKmkayoatth2y+3iFMfAwyciU7++bgvfU7yA=;
 b=IUzGAntEOAckjY3cZnZhsUFVRxtkxQTE/KktZBdewDxybWHR5g4XzdRHdPB3dhZCuv
 E7uBFPELpy9FRxK/nKLR5CTWMwNU1bxAGGIxtse1Duat8AofuCtfkSW73bUcnP2arKK6
 nHlGw484p5Uwit08/kLgDAoQF4jYbvKIaWoev6kPPsILI1TiS/GctLS+Bx3sIkk4az4g
 2l5g2rqcCdGNVBFdsULvTfJHz5GXTE1lzEflJa2PYExYLl45L3ByqtkcqAlOyQVL+hNW
 kpRS+qO5sdfVhm+V1q2ml7ysAllyh3MYlwqVLKZin6V0Efeeb7INUObpDPxU3Tn3cwPz
 SANA==
X-Gm-Message-State: AO0yUKWGtXE6iJO1lvl5kDJtVhXACD6BUt6IvND6NFnGoQneXxKDXxCt
 kyQ1fitHHCgjI/t4muZW04JolvutY4E=
X-Google-Smtp-Source: AK7set9MhJfAG74Id0Q695YsaOCDwJUYwc2XAF5b5VOAEeOV9rYBqF5pNRhO6SFni3MTBSoW6gZdGA==
X-Received: by 2002:adf:ef8e:0:b0:2c7:adb:db9 with SMTP id
 d14-20020adfef8e000000b002c70adb0db9mr12749448wro.63.1677440670523; 
 Sun, 26 Feb 2023 11:44:30 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 f7-20020adffcc7000000b002c7163660a9sm5222454wrs.105.2023.02.26.11.44.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 11:44:29 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Feb 2023 20:44:27 +0100
Message-Id: <20230226194427.979515-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Art/EenhKmkayoatth2y+3iFMfAwyciU7++bgvfU7yA=;
 b=f08VtFKxkSZQTtRFrtflBQ7ZdVaAyfYIuRv1/4EdLWXFh0qvu9YTdGWetAKpBjeT4c
 RnkEPITXsWMG8lIS3OlQdGWpohSP36PvoEvZ5UUDnRiAdUNsi2K8VWKU43/YnDsa65Zp
 eiEsbaJ0YU7kth+nAA48vbFrTwS7lqNLiBNie4E4lx8GWbLIsn6pmW2gq0n8Dy5SEr8m
 XjDk+7h3AMMem6CVGjNm38lnpxFdQhkhtfxcjusR2BBglWkKEaxnAgtAiWtSL5AKgC4I
 dJTJthzJXVcr+Cy97hphubiFnTWvIavkJuDP99D108EWeKbwv/ODVjMS5oVBpv6M2JaF
 4BLA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=f08VtFKx
Subject: [Buildroot] [PATCH v2,1/1] linux: fix CIP RT kernel on microblaze
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with CIP RT kernel on microblaze raised
since bump to version 5.10.83-cip1-rt1 in commit
b5778d7b76c098010a4abc339938f2694e8cf57f and
https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git/commit/?id=32ac92b5a39e2ef91308929bf5ed0804094b4183:

arch/microblaze/mm/init.c:71:2: error: #endif without #if
   71 | #endif /* CONFIG_HIGHMEM */
      |  ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/27291870cf7539d26e45c45f34322d24a6dbca33

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Move patch to correct directory

 ...-arch-microblaze-mm-init.c-fix-build.patch | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 linux/5.10.162-cip24-rt10/0001-arch-microblaze-mm-init.c-fix-build.patch

diff --git a/linux/5.10.162-cip24-rt10/0001-arch-microblaze-mm-init.c-fix-build.patch b/linux/5.10.162-cip24-rt10/0001-arch-microblaze-mm-init.c-fix-build.patch
new file mode 100644
index 0000000000..4760d9e4fb
--- /dev/null
+++ b/linux/5.10.162-cip24-rt10/0001-arch-microblaze-mm-init.c-fix-build.patch
@@ -0,0 +1,37 @@
+From 1fc03e1fdc8bb606d1c95e9fa557a9e5f6df17ec Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 25 Feb 2023 17:26:56 +0100
+Subject: [PATCH] arch/microblaze/mm/init.c: fix build
+
+Fix the following build failure on microblaze raised since
+https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git/commit/arch/microblaze/mm/init.c?h=v5.10.168-cip27-rt11&id=32ac92b5a39e2ef91308929bf5ed0804094b4183:
+
+arch/microblaze/mm/init.c:71:2: error: #endif without #if
+   71 | #endif /* CONFIG_HIGHMEM */
+      |  ^~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/27291870cf7539d26e45c45f34322d24a6dbca33
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: sent to
+Sebastian Andrzej Siewior <bigeasy@linutronix.de>]
+---
+ arch/microblaze/mm/init.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/arch/microblaze/mm/init.c b/arch/microblaze/mm/init.c
+index 1f4b5b34e600..a444778e59de 100644
+--- a/arch/microblaze/mm/init.c
++++ b/arch/microblaze/mm/init.c
+@@ -49,6 +49,7 @@ unsigned long lowmem_size;
+ EXPORT_SYMBOL(min_low_pfn);
+ EXPORT_SYMBOL(max_low_pfn);
+ 
++#ifdef CONFIG_HIGHMEM
+ static void __init highmem_init(void)
+ {
+ 	pr_debug("%x\n", (u32)PKMAP_BASE);
+-- 
+2.39.1
+
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
