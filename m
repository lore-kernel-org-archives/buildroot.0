Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F830C47DB7
	for <buildroot@archiver.kernel.org>; Sun, 21 Jan 2024 20:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3ED760AFF;
	Sun, 21 Jan 2024 20:43:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3ED760AFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y2J790zkI_rK; Sun, 21 Jan 2024 20:43:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5350160AEE;
	Sun, 21 Jan 2024 20:43:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5350160AEE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2BC4F1BF37F
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 20:43:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 03832404BF
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 20:43:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03832404BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4vYmOR7uqGoV for <buildroot@lists.busybox.net>;
 Sun, 21 Jan 2024 20:42:58 +0000 (UTC)
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C7D0C40432
 for <buildroot@buildroot.org>; Sun, 21 Jan 2024 20:42:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7D0C40432
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-361a38dd171so9653065ab.0
 for <buildroot@buildroot.org>; Sun, 21 Jan 2024 12:42:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705869777; x=1706474577;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g1JdsJUW1QWEXH4ZKjojoUhdTmgWQAAYmScdxN+47Ds=;
 b=kOdLxtZbdpGgp1f88WShcFImkXgqzuBNDL+7Ye5V/lWIIMuTfDi0OOZ/wgyBYxvzsY
 jap1ioNT1wgQt2RZ8hOVL95dtO6FKa/wF+Pqq+1R24glXm6hGalfgT8AZ2G0SsrqPZmJ
 sZaAm6BHZiTBgDVUzZpECjVn/+Kh3/kf4JNJr9Zk59q6WhKbDon0uAcyu6Pid98ClUtW
 ELJFTyy4B5dKqTepSJs2O309eVcdXCLhFjCR1edLaa3z3kWPsBJPKDT7ltV/4pp5VzjA
 7RTtJLVU2zQ1HqbpRCLVjrUt8/uE53i0SiKqCUCH66Ek0mVgHvfOTLLQcEnE0sNgzGEt
 HAKA==
X-Gm-Message-State: AOJu0YzDOA8kS/oZLYZxlDJiULHJfqGLucsI3I0azgJ0MV2FEtMPde57
 iwb62SQ5OM26O/+U714OOXI4C5if312+w/KWBJoDy8DGBNEdumNSFiv9fQ1g7usQdbEjW6PgVPU
 s
X-Google-Smtp-Source: AGHT+IEZa8KSFNHDczdpxNFaqiocM6DAvavd3M6CsU0cwAVxTktJENR0eAQbABVXHwEhnqtr+zoprw==
X-Received: by 2002:a05:6e02:926:b0:361:aae3:4ecf with SMTP id
 o6-20020a056e02092600b00361aae34ecfmr4089376ilt.39.1705869777369; 
 Sun, 21 Jan 2024 12:42:57 -0800 (PST)
Received: from fedora.. ([75.174.148.104]) by smtp.gmail.com with ESMTPSA id
 u30-20020a63471e000000b0059b2316be86sm6927606pga.46.2024.01.21.12.42.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jan 2024 12:42:56 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 21 Jan 2024 13:42:52 -0700
Message-ID: <20240121204252.152952-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240121204252.152952-1-adam.duskett@amarulasolutions.com>
References: <20240121204252.152952-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1705869777; x=1706474577;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g1JdsJUW1QWEXH4ZKjojoUhdTmgWQAAYmScdxN+47Ds=;
 b=col1qFBH+pMo3LERn3Pux9/XI5+oPj+WIHKAExQDwLGHkUqUVOm9DzOvsoENi/5RAT
 0NE70SfWGTYCDMiw7dZg0zyr1Ok/H66MSH5NmRUEM7XvpmDKU9v4E4sPo0uDMM9hkvbo
 czpDV9pG+NbbVWe+x/lyF/PFqlnwLPg2vwhOs=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=col1qFBH
Subject: [Buildroot] [PATCH 2/2] package/wlroots: Update patch with upstream
 status
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

package/wlroots/0001-Add-feature-macros-to-more-C-files-.patch has been
rejected upstream, and the initial pull request was moved to the
freedesktop gitlab. Update the patch to reflect these changes.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 .checkpackageignore                                           | 1 -
 .../wlroots/0001-Add-feature-macros-to-more-C-files-.patch    | 4 +++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 914dd6fb63..1ada9fa261 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1407,7 +1407,6 @@ package/wilc-driver/0005-Fix-cast-warnings.patch Upstream
 package/wipe/0001-musl.patch Upstream
 package/wireless_tools/0001-remove-bzero.patch Upstream
 package/wireshark/0001-cmake-lemon-wipe-CMAKE_-EXE_LINKER_FLAGS-SYSROOT-if-.patch Upstream
-package/wlroots/0001-Add-feature-macros-to-more-C-files-.patch Upstream
 package/woff2/0001-CMake-Handle-multiple-libraries-being-returned-for-B.patch Upstream
 package/wpa_supplicant/0001-build-re-enable-options-for-libwpa_client.so-and-.patch Upstream
 package/wpa_supplicant/ifupdown.sh Shellcheck
diff --git a/package/wlroots/0001-Add-feature-macros-to-more-C-files-.patch b/package/wlroots/0001-Add-feature-macros-to-more-C-files-.patch
index 0ba078708a..0e1ae9d87a 100644
--- a/package/wlroots/0001-Add-feature-macros-to-more-C-files-.patch
+++ b/package/wlroots/0001-Add-feature-macros-to-more-C-files-.patch
@@ -5,8 +5,10 @@ Subject: [PATCH] Add feature macros to more C files
 
 These source files use "struct timespec", which is POSIX 1993.09.
 
-Signed-off-by: Paul Cercueil <paul@crapouillou.net>
+Upstream: Rejected (Upstream does not want these workarounds)
+see: https://gitlab.freedesktop.org/wlroots/wlroots/-/merge_requests/2493
 
+Signed-off-by: Paul Cercueil <paul@crapouillou.net>
 [Retrieved from: https://github.com/swaywm/wlroots/pull/2493]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
