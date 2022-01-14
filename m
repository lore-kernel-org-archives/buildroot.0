Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA764C433EF
	for <buildroot@archiver.kernel.org>; Fri, 14 Jan 2022 05:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 158AD40275;
	Fri, 14 Jan 2022 05:07:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XuNwmPa-faWI; Fri, 14 Jan 2022 05:07:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0FDC740370;
	Fri, 14 Jan 2022 05:07:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3D2581BF836
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 05:07:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37EA440370
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 05:07:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NlFxFKyM22Rt for <buildroot@lists.busybox.net>;
 Fri, 14 Jan 2022 05:07:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E50E40275
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 05:07:49 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id i17so1787090pfk.11
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 21:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=schmorgal.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jPlWmlyeoBVJOYlLxsrL9SUggEOzpjjPdqvh3/3qxcM=;
 b=UWqBATjQtEYNZZxQYttBcB4I+XF7pMEHhC2Kuy0Wrs7864dGOujpwTuvBV9riAc81+
 nCx2rpHkPUorSnhMdhLJBXuMMjSfwMKJr3tC2nI98DP/MF6FHrgMgg7j3+YA9/zxOhqA
 C9TND2Ee+aFVwZYsksRwLm7Js8HdWN3Zd1lK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jPlWmlyeoBVJOYlLxsrL9SUggEOzpjjPdqvh3/3qxcM=;
 b=6XNOThBS5lAtKM+xrBBIXhXobAiED3nvqj5Tc1iBYzeaV11KbuiThPBo+9BhFAQV0z
 LDwQjEQjP6d9R28eyOuXnulHlGg5B6Gw5b1chVDTHPqBVNV9EB0OPQJTFM5R6B9ucMY5
 L9YULtjtWhwCMA4fAwk9Pp/DD0rS5eXicTizSE/yKSq+b+4zumNyo62kTayjoZmtBkjt
 +pmHZA6ufOSiBaIsEUbm7ytKXor/TyT/v7KKgJfBaknmmLTjP+A5QVOxVDfNV3io+8Cg
 gypQfAiTFzFTb/oqZMuBy0Q/Sk2rIhOacUX0wYsoJCytnYnHPBhgEAaYZCZituG7OBg7
 6fEQ==
X-Gm-Message-State: AOAM530JAv3vDDfsCaMH4OO2DvZdinDqaaW6No6sqQ7BNUsjG0u/JQ78
 GbzsyWmtVBRP/GPEUq4CUeJtmDVtaQRcbzzF
X-Google-Smtp-Source: ABdhPJw25zKma0T98z/CAvSkQrD0OsgD6b5aA3FSk4fN6QbYYkTrqATqAkrwQcS6fhYGcYwWTRaEag==
X-Received: by 2002:a63:9e01:: with SMTP id s1mr6664053pgd.45.1642136869250;
 Thu, 13 Jan 2022 21:07:49 -0800 (PST)
Received: from localhost.localdomain ([50.45.132.243])
 by smtp.gmail.com with ESMTPSA id l22sm4468800pfc.167.2022.01.13.21.07.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 21:07:49 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu, 13 Jan 2022 21:07:33 -0800
Message-Id: <20220114050734.497034-1-doug@schmorgal.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/rtl8723bu: bump to version
 19b4bdc05483a1e79a4f955a80f8f72cdd5dedc3
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
From: Doug Brown via buildroot <buildroot@buildroot.org>
Reply-To: Doug Brown <doug@schmorgal.com>
Cc: Doug Brown <doug@schmorgal.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This version fixes a bug that prevents the user from switching from one
access point to another.

Signed-off-by: Doug Brown <doug@schmorgal.com>
---
 package/rtl8723bu/rtl8723bu.hash | 2 +-
 package/rtl8723bu/rtl8723bu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8723bu/rtl8723bu.hash b/package/rtl8723bu/rtl8723bu.hash
index 04bc776a07..1dad7154b4 100644
--- a/package/rtl8723bu/rtl8723bu.hash
+++ b/package/rtl8723bu/rtl8723bu.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  4c7314dccebda1e55ec8dcf0d5ca8915c2490d17a9f56923f25e6e0e945c10cc  rtl8723bu-9ce1c38439f4f574bb7adaf33949835c25536a28.tar.gz
+sha256  1cd658742ce10b21c92877e09cecc98880680d5f150de3845553005abc542977  rtl8723bu-19b4bdc05483a1e79a4f955a80f8f72cdd5dedc3.tar.gz
diff --git a/package/rtl8723bu/rtl8723bu.mk b/package/rtl8723bu/rtl8723bu.mk
index c35fad5832..e490bddf09 100644
--- a/package/rtl8723bu/rtl8723bu.mk
+++ b/package/rtl8723bu/rtl8723bu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8723BU_VERSION = 9ce1c38439f4f574bb7adaf33949835c25536a28
+RTL8723BU_VERSION = 19b4bdc05483a1e79a4f955a80f8f72cdd5dedc3
 RTL8723BU_SITE = $(call github,lwfinger,rtl8723bu,$(RTL8723BU_VERSION))
 RTL8723BU_LICENSE = GPL-2.0, proprietary (*.bin firmware blobs)
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
