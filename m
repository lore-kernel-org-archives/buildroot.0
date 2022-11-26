Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04EB4C43217
	for <buildroot@archiver.kernel.org>; Sat, 26 Nov 2022 12:26:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4261341C14;
	Sat, 26 Nov 2022 12:26:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4261341C14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6LyZdYwbc_9R; Sat, 26 Nov 2022 12:26:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 275AB418EC;
	Sat, 26 Nov 2022 12:26:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 275AB418EC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DEE901BF426
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 12:25:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B788B418EC
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 12:25:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B788B418EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e28KCGECGv6J for <buildroot@lists.busybox.net>;
 Sat, 26 Nov 2022 12:25:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 344DC41893
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 344DC41893
 for <buildroot@buildroot.org>; Sat, 26 Nov 2022 12:25:56 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id g12so10199653wrs.10
 for <buildroot@buildroot.org>; Sat, 26 Nov 2022 04:25:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4MqberK27NcelwXu45u5ZUlfp4/N9DDQ7Z11Gb8oH0U=;
 b=3f0BOlwtsBSQl9byjP9ndhKPTNS4nQxI+EZbvz/yjXqn/BQoS0YITyjx2Bx4CkryoE
 5s6RReVJ+G0I9tju9FHFrdn+32j4SqLhZJjCop191p7pe9hXOigdOtq+maYjZoleDy0F
 QqrfSGEPxuv3AE34g6v0YMgKgXs0UZkNxv0f36Wd3UvLmRncu8ayJvVgfOtv1/06mV+S
 kJq6m9z069RgbJnkHD2ALrsrhPPIHLaptx+XTFCKWqkvkEGEuQeNAJEVNIlqmVWRK5Z6
 2yNvlQSnVBQs3HDD7+9kVNh3HYeFYsi5y8xipEqfeooyA1Lj7O1oIhRIUzpi80SFy0vC
 MFHg==
X-Gm-Message-State: ANoB5pkbpDqhmTP1eRJ1rxt0pavjSszZlMg0JcEUj8MIBw6fT+eWIGN5
 OkAFqCxArZEh4pygbEgihshnRw1enm0=
X-Google-Smtp-Source: AA0mqf5VASg63L3E4qhhYMNvULB6hBcAvPuEZis81TEFVO+sCkk8dn31vhGM3W0E4W/3n65NxigriQ==
X-Received: by 2002:adf:cd82:0:b0:238:b29e:4919 with SMTP id
 q2-20020adfcd82000000b00238b29e4919mr26367277wrj.583.1669465554577; 
 Sat, 26 Nov 2022 04:25:54 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 n2-20020a5d4002000000b00241727795c4sm6982593wrp.63.2022.11.26.04.25.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Nov 2022 04:25:54 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 26 Nov 2022 13:25:45 +0100
Message-Id: <20221126122545.15206-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4MqberK27NcelwXu45u5ZUlfp4/N9DDQ7Z11Gb8oH0U=;
 b=C+/8cys4RRozhpK2TBZVSN1QhDFaaFR1yuIAH/yJiN2wRLDvj1UN9W44dV+CEqyocy
 3L7DW++RgM4VW2JUbl2Ldlk9jqEnVVRX8tleiPNp0//N7DJ3el0ieh8dWehlhxa+6Ke6
 Y4Vx7pzFu8PH55XJgtqAv5DjhEmWrCZkUsk1pNVztEWgtB+wgjXEId2uCrjL0rnjnCJ0
 GyvClvK9aNcwfu4EmFwk2h6AoCUxd7JMgLF0Chd2vWyOwG/ZL9gJjrGCcxNSOkXehmMm
 4IIiQjBsXu1g7RuZFJdIU+RipB5Nx9Ji/8CwZJ0Ef176xnv29tW+bDEcROw/p1p1hbAM
 nTrQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=C+/8cys4
Subject: [Buildroot] [PATCH 1/1] package/vim: security bump to version
 9.0.0951
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

Fix CVE-2022-3705: A vulnerability was found in vim and classified as
problematic. Affected by this issue is the function qf_update_buffer of
the file quickfix.c of the component autocmd Handler. The manipulation
leads to use after free. The attack may be launched remotely. Upgrading
to version 9.0.0805 is able to address this issue. The name of the patch
is d0fab10ed2a86698937e3c3fed2f10bd9bb5e731. It is recommended to
upgrade the affected component. The identifier of this vulnerability is
VDB-212324.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/vim/vim.hash | 2 +-
 package/vim/vim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index ef3bc46cdc..03ee908db4 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  f50ab9c023e7c276a61a7076c840d36254ce83691dba28af9ac5c513b6ace3b4  vim-9.0.0709.tar.gz
+sha256  c95c9abcf024bd6293ad199e4efa1c09452a9c6456c9cbaf53d896cf7b9f4d08  vim-9.0.0951.tar.gz
 sha256  0bcab3b635dd39208c42b496568d1e8171dad247cf3da5bab3d750c9d5883499  LICENSE
 sha256  de04910387a62ad4f9b36b91457c8d5ef32733ac5d768a128071b93f4821fcd1  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 22c1eb91a8..d814c68630 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = 9.0.0709
+VIM_VERSION = 9.0.0951
 VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
