Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC68CE7A88
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 16:29:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B72A440969;
	Sun, 24 Sep 2023 16:29:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B72A440969
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kX5G1-aiEQuf; Sun, 24 Sep 2023 16:29:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C353440922;
	Sun, 24 Sep 2023 16:29:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C353440922
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5DF121BF21A
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 16:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43B4381D2D
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 16:29:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43B4381D2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kariq1I6-pR1 for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 16:29:15 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E199A81D24
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 16:29:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E199A81D24
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-405524e6769so14992915e9.1
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 09:29:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695572952; x=1696177752;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q4fsQOyN2JUfHBWSS4AG0HDIdwl7ANIRZQUTVppTs0Y=;
 b=iRvGXbMgU2tKFYrJI6RNG2uoRWQ7KJ1UIkFZuKoZVrnxb73R5+7Mb9AG471j4UDzZM
 CxEvJpPlTfcwRc5BlmXSCXnr9JvHuUAtVXA0nvPtkHhqRQwybUD0EAB3a2RBTi96QICE
 scvt3r7YmOZavhOcQ+njQhAwX32W8pwK76lmdoctNTxDUuv9G/Kh33Xt0qyt0venDgzc
 ycIawkrPsOgpfWmdIbxx2f2HQP+qM10IGfIKRACTkvlb2IrypKiim5t02EeiA0OLqcko
 scoavHzVMG3kSBTQLzzGpb+0sYht/nvp7OSgwIRyKJ5WZ4vHApLHEqR2IPNt8Mcwbv09
 Rm6A==
X-Gm-Message-State: AOJu0Ywc2h+KsfT2n+aHtlNiyTpldXgo4ql8utoE3GicYOLzahBuJQrH
 3Drm/wkxBHdg+DOlcgWEGNORNLn19w4=
X-Google-Smtp-Source: AGHT+IGe8CSMb7UIqrmPoZ1MSPbIml4Txms/2KWl+VD8VU3OIM0Mvmr6/nhK4BKHt1eP/GSU3wJpEg==
X-Received: by 2002:a1c:7c11:0:b0:3fe:1587:fdf3 with SMTP id
 x17-20020a1c7c11000000b003fe1587fdf3mr3549096wmc.14.1695572952290; 
 Sun, 24 Sep 2023 09:29:12 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 g20-20020a7bc4d4000000b0040588d85b3asm1540552wmk.15.2023.09.24.09.29.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Sep 2023 09:29:11 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 18:29:09 +0200
Message-Id: <20230924162909.1019467-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695572952; x=1696177752; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=q4fsQOyN2JUfHBWSS4AG0HDIdwl7ANIRZQUTVppTs0Y=;
 b=O6A6CMjSSygQ3U7Uj2I9nvxUIFMNCfUlylzhcSsOoTPlHCCkHuVMWqP2snwMiyccyW
 Itc/VOFvJceCFrsiQGI8ixR07DVIQ5VQHRknou/P29thgaXFiRerFxO1msLNcSNsjpFm
 GIe5/G4tL6B99Ow0Z+AWq42Bj/awGodrKSNCmDp723k/ryLV1bGoCEyNIYiaHwxVhLSo
 qbaGbZayHPxTLznzALOESSARPIW0bvw2TVOkUHz8xIzBE8R4wD0GSxd2A5uEarXWExdK
 k6iAlzf1KAchGRAH6wzUaOH5LoQ0tzstG5uFuYEwesznS2d22ue3aryIqQX+GIl2sb2I
 DgoQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=O6A6CMjS
Subject: [Buildroot] [PATCH 1/1] package/pppd: drop
 PPPD_DROP_INTERNAL_IF_PPOL2TP_H
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

PPPD_DROP_INTERNAL_IF_PPOL2TP_H is not needed since bump to version
2.4.6 in commit 49b239ab20e632792a6c61173ba830cdc2128ebf and
https://github.com/ppp-project/ppp/commit/c41092dd4c49267f232f6cba3d31c6c68bfdf68d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pppd/pppd.mk | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index d9d6244f10..25d017a84f 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -37,15 +37,6 @@ PPPD_DEPENDENCIES += libpcap
 PPPD_MAKE_OPTS += FILTER=y
 endif
 
-# pppd bundles some but not all of the needed kernel headers. The embedded
-# if_pppol2tp.h is unfortunately not compatible with kernel headers > 2.6.34,
-# and has been part of the kernel headers since 2.6.23, so drop it
-define PPPD_DROP_INTERNAL_IF_PPOL2TP_H
-	$(RM) $(@D)/include/linux/if_pppol2tp.h
-endef
-
-PPPD_POST_EXTRACT_HOOKS += PPPD_DROP_INTERNAL_IF_PPOL2TP_H
-
 # pppd defaults to /etc/ppp/resolv.conf, which not be writable and is
 # definitely not useful since the C library only uses
 # /etc/resolv.conf. Therefore, we change pppd to use /etc/resolv.conf
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
