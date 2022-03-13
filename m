Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A19C9C433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Mar 2022 11:20:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2849C40195;
	Sun, 13 Mar 2022 11:20:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VLewLRyej2Fb; Sun, 13 Mar 2022 11:20:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 115A640104;
	Sun, 13 Mar 2022 11:20:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9C61B1BF47E
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 11:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A2F481B72
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 11:20:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sRQMwP82ySgT for <buildroot@lists.busybox.net>;
 Sun, 13 Mar 2022 11:20:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B5D6F81AAD
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 11:20:19 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id l10so7735516wmb.0
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 04:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZCc4z58K4ci9LpJyRYcx0qpmHvtj6Mjq3ELuLo4w1/o=;
 b=FRp9200JXJsMgo9WVoL6gQsDCmIUAvdaT1Xmg6csnKhI9Tqrh0Y5YAxopSGgLQEhCX
 IUWxeE3VzR8Qrr6RJcKI3MoYKdDfZCejHw72Vvu/3zxo6RVQG5vHoM00bzThGkHcZU1r
 DYc9OSLmuasdxsPVhnTBKYy7H/JEr+BZSAGuV6ZqJbjzxm0mUVZVidw9/9JxBvL9juzm
 hUABuuuDkdjqVRWW4n/v808s7VU20XNts0tnUP5GY4i4PPxwUHbT4nbzV4tM8OQhgIFq
 3ARB9FqUXsUPIkeLvgzg4syk2VsZcyxICxeb7g15ab7FoMKwb5zY8xxofANLygFEgkb6
 XL1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZCc4z58K4ci9LpJyRYcx0qpmHvtj6Mjq3ELuLo4w1/o=;
 b=sGwJbiWq8/Jsucf9dIP6otX4kgbEAlrUVrz3nRu8k43MAWL1SMZzY6KWvaDbcolX6G
 mTvWLpGrUSgJInqd40aYLAmF0x1UaDuG3s/76xWyWg73wlAjE8JliGcpk6Q7783GjXB3
 uNdmn0DHKx1aJF+9oEHCkWzUEG50lwacv2qE1sYuWh5xD0i5txsULkIYuZkTvpRsF/Wu
 Dz4T5msNmoJziCua3OUTYnG4Yoydmtd4BD9PGRQGhawJT6nfPiXhpysoRosHfwwwE8Sh
 ee1WnnN/PZi7x5S6DrZNVFvuniG35yGVoKlZEjiJPiUmrBGGRz5VkNq+NC9X7CI5Nhhr
 Hnxg==
X-Gm-Message-State: AOAM5332hne9Ok0KHVV77212boipSQOi/hmbX5MZ2IS3QcAuL6qtEPsa
 KetlPY+634WZFvVV//VfrtXn8qHgXEM=
X-Google-Smtp-Source: ABdhPJydzJdzkBZ65JGkUYqhJNvo7eOyreCSKP5A5EX9B3vsLPA8AvcTUQMfK5e4zkgUoJZIFWg+0Q==
X-Received: by 2002:a05:600c:1c13:b0:389:a475:9ed5 with SMTP id
 j19-20020a05600c1c1300b00389a4759ed5mr13554987wms.86.1647170417751; 
 Sun, 13 Mar 2022 04:20:17 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a05600c0a0500b0037bb8df81a2sm19350089wmp.13.2022.03.13.04.20.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Mar 2022 04:20:17 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 13 Mar 2022 12:19:21 +0100
Message-Id: <20220313111921.1116296-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/qt5/qt5base: fix CVE comments
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
Cc: Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 5770a645a3a49a3f0f02972131a4ff5283b4c11e forgot to update CVE
comments

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/qt5/qt5base/qt5base.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index a703481aed..f8edfe0847 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -14,8 +14,7 @@ QT5BASE_DEPENDENCIES = host-pkgconf pcre2 zlib
 QT5BASE_INSTALL_STAGING = YES
 QT5BASE_SYNC_QT_HEADERS = YES
 
-# 0010-Avoid-processing-intensive-painting-of-high-number-o.patch
-# 0011-Improve-fix-for-avoiding-huge-number-of-tiny-dashes.patch
+# 0006-Improve-fix-for-avoiding-huge-number-of-tiny-dashes.patch
 QT5BASE_IGNORE_CVES += CVE-2021-38593
 
 # A few comments:
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
