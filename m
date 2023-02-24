Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E77AC7EE2E
	for <buildroot@archiver.kernel.org>; Fri, 24 Feb 2023 16:15:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5C4040B08;
	Fri, 24 Feb 2023 16:15:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5C4040B08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qMS9M0BjrFGM; Fri, 24 Feb 2023 16:15:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 08AE640AA3;
	Fri, 24 Feb 2023 16:15:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08AE640AA3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8BBDE1BF2AF
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 16:15:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64F1782171
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 16:15:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64F1782171
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aDPoDmag4lwN for <buildroot@lists.busybox.net>;
 Fri, 24 Feb 2023 16:15:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9AD28216B
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D9AD28216B
 for <buildroot@buildroot.org>; Fri, 24 Feb 2023 16:15:49 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id j3so9840wms.2
 for <buildroot@buildroot.org>; Fri, 24 Feb 2023 08:15:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=buYSfVh5o4o/P+jASdqGl5/bYE3Ya0KRlfC0O78yCSA=;
 b=SajqMiSMNacD1XwfN+MvbxywKjrMsCDWOzBt8TBInHofVEVnmGiqCHk5lY53i3peL6
 Ylwhr6uXkSPyEsnwP+1vOWaUGlPaBxFsRckUVBRkXK0b8kq3zbuxbxurqQBpPAMtlNq7
 JC1X+9eObaktWS2DE/NTBOsahcE9/0AdN/yMKKZl8vAnZGEhXqWqR7boJqDhmVvFp5+P
 bRT+0ufG8jA6XaIJh4WwXcT3qEWXr9G/u4UOCYaSn84io2rtiJe3J6ZWVennSSGQ0qdx
 0QzeDU59WfDghVHef2sb7o6gy5B2AdPwkr2wYS3wx6zsPh7gUQeB/I29pjktPNgjGl3r
 v9yw==
X-Gm-Message-State: AO0yUKWByz/el/VobiX5L97DZeE0qyijfIx1qiJlm11bhKLvdEekdbs3
 RRucqYb1ROwnD8oLiipXeb0+okW3VM4=
X-Google-Smtp-Source: AK7set9Wy1hWWElvSCfX7x4DhiOOPlgP/5JGf5+PCERD8UF87SsqRe+Z5+soKQwU/arvmwUc902B+A==
X-Received: by 2002:a05:600c:1609:b0:3e2:1592:ccf5 with SMTP id
 m9-20020a05600c160900b003e21592ccf5mr10358958wmn.8.1677255347423; 
 Fri, 24 Feb 2023 08:15:47 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 z10-20020a5d4d0a000000b002c8476dde7asm459096wrt.114.2023.02.24.08.15.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 08:15:46 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Feb 2023 17:15:43 +0100
Message-Id: <20230224161543.27879-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=buYSfVh5o4o/P+jASdqGl5/bYE3Ya0KRlfC0O78yCSA=;
 b=HncoCxihkWOX/ZmfBuEcxh3mBKaPSZXqiMIEPW3U/fjgmZtRUDEO79NAbIges6oSET
 G/ow2j8CKKL8lXKh7oymwhYor/gmxkHaWJOm3kcSKXEQLKUJbj/SI5KkLoAhtRMcPyDP
 5zdrTuP90wE9n6QtdhP/EquI6fC34Imh4UJ3XaJaPlET6opsfRlsRv1NCtyBdK8Obnz/
 oc8xaXM3OEyvtwJtruA7NS+oKQFr9o9/XJICVqSDHlaS8QI4P1BgFU6eERNakCJbWnXY
 +OudZg4RDphOjOHPBGIrmggTxJfDdvagNPLYqoxQKq8n+tVInFxpZYMouJdDxMv4AOX3
 F8Zw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=HncoCxih
Subject: [Buildroot] [PATCH v2,1/1] package/systemd: fix build with -Ofast
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
Cc: Norbert Lange <nolange79@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Sen Hastings <sen@phobosdpl.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update -Ofast workaround as suggested by Yann E. Morin to avoid the
following build failure raised since bump to version 252.4 in commit
a2c823d1f548d5a0120d27d6c000603192360f7b and
https://github.com/systemd/systemd/commit/60f97fee2d2f948c8e8963ea8ff767008cb93cae:

../output-1/build/systemd-252.4/meson.build:397:8: ERROR: Problem encountered: -Ofast, -ffast-math, or -ffinite-math-only is specified in c_args.

Fixes:
 - http://autobuild.buildroot.org/results/8f41c4984b645851724e554c3162b83bc312bee7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni and Yann E. Morin):
 - Update workaround instead of disabling with -Ofast

 package/systemd/systemd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index cce9162f6d..63467171ed 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -100,7 +100,7 @@ SYSTEMD_CONF_OPTS += \
 
 SYSTEMD_CFLAGS = $(TARGET_CFLAGS)
 ifeq ($(BR2_OPTIMIZE_FAST),y)
-SYSTEMD_CFLAGS += -O3
+SYSTEMD_CFLAGS += -O3 -fno-finite-math-only
 endif
 
 ifeq ($(BR2_nios2),y)
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
