Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E39EAC433EF
	for <buildroot@archiver.kernel.org>; Thu, 19 May 2022 14:08:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8709A40B81;
	Thu, 19 May 2022 14:08:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WeoT1CmQuflH; Thu, 19 May 2022 14:08:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88BE9405C2;
	Thu, 19 May 2022 14:08:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 918871BF3CE
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 14:08:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80F8F60E31
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 14:08:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vywWEsddn1RV for <buildroot@lists.busybox.net>;
 Thu, 19 May 2022 14:08:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AE62D60C0A
 for <buildroot@buildroot.org>; Thu, 19 May 2022 14:08:32 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 r9-20020a1c4409000000b00397345f2c6fso366348wma.4
 for <buildroot@buildroot.org>; Thu, 19 May 2022 07:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9V/0gtswYckWqA85KnnovJxN47E2AA4O8ddVZ8Pk28g=;
 b=NBNElRH027095b7OpuaLgFARQL7PlzUDJIXNvw+lh73Ho/kO/jje/Xgjsn2KgUQI22
 ftl0VtdpLq7d63zhXoEWKgn3PNGFL2e7ell/P7UxiukGBEaNA03Y492plaGr3Zne6gdk
 w4fku5mEHSAuiHuZb5rdBbF+WoRH5zI0hAisz7P7bGqhNf2JBjMlnvPOA7XqCjyKx3SB
 8YEToqP5HosPyUa81LQmM98UQg0o89bawu8rCgcBFwQ+5DYST+Ezlv8ipxyatHbE6Zoa
 c05yFI11ZJ1TcdSzWTy0PX2rR7X3mwx0+O18re42Rlm8Apt0Qikvi928X+o02gWVBpFy
 UMMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9V/0gtswYckWqA85KnnovJxN47E2AA4O8ddVZ8Pk28g=;
 b=inx7t/xuviBldqkGvyDpmv/um4n48nJ12b5QZeesHdlxhQ4dIZ3YXK6WT/aUxUAHJc
 vPT5X33n7lHsq2Eeixmo5TmwebM2BXAgXhHhvPPw5vmV/biBKQseRN0TIgBMwAiyp5TU
 8ACYsQvI4gZ1w0rT3Md+YFzyPNNz99p3bwjFd0tTa4JplZRBet3viivEGLmKGITo16as
 /pxtsV3Id5wn+DPIproUyY6Hz/Dlph5CjCmn6Vy+OxslYl98aX1HZzNLCq7+quAzZWNt
 BypOwz+mReE+RYhWNhKqAlh9q42qxtw1sytHX1nT8uhLWI/FuZ5afc74yXAfyIe7LzQC
 EEOA==
X-Gm-Message-State: AOAM530NCReJ/63GpkCUoxr/dsHBL+RzlYZyCsukpG+xx+OkrYQQeGWj
 KLrErmJYU9z07ZmFQsxXOtjl/25iyFs=
X-Google-Smtp-Source: ABdhPJwIkqU+hvZDvOEmsJtsZzP7ggrHjqrZnZt/Km5Tu4hyIw6s07xLlQ+40ppvs6kdfic927U2qA==
X-Received: by 2002:a05:600c:1993:b0:394:8ae3:e28d with SMTP id
 t19-20020a05600c199300b003948ae3e28dmr4109615wmq.49.1652969310492; 
 Thu, 19 May 2022 07:08:30 -0700 (PDT)
Received: from shrek2.. (lmontsouris-659-1-42-116.w92-154.abo.wanadoo.fr.
 [92.154.77.116]) by smtp.gmail.com with ESMTPSA id
 f18-20020adfb612000000b0020d00174eabsm4790214wre.94.2022.05.19.07.08.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 07:08:30 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 19 May 2022 16:07:52 +0200
Message-Id: <20220519140810.1953601-3-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220519140810.1953601-1-johan.oudinet@gmail.com>
References: <20220519140810.1953601-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 02/20] package/erlang-lager: bump version to
 3.9.1
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
Cc: Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-lager/erlang-lager.hash | 4 ++--
 package/erlang-lager/erlang-lager.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/erlang-lager/erlang-lager.hash b/package/erlang-lager/erlang-lager.hash
index 40291af392..282d112d3b 100644
--- a/package/erlang-lager/erlang-lager.hash
+++ b/package/erlang-lager/erlang-lager.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 c5bb4ba6f918e90d2e6671c3996d72c61f2a589b65c151b3df8011d046362981 erlang-lager-3.6.10.tar.gz
-sha256 809fa1ed21450f59827d1e9aec720bbc4b687434fa22283c6cb5dd82a47ab9c0 LICENSE
+sha256  13316ba3006b174cf6b085ad13ed19ec0f618f10b83fc3530a072cdf4b50668b  erlang-lager-3.9.1.tar.gz
+sha256  809fa1ed21450f59827d1e9aec720bbc4b687434fa22283c6cb5dd82a47ab9c0  LICENSE
diff --git a/package/erlang-lager/erlang-lager.mk b/package/erlang-lager/erlang-lager.mk
index a698bce8d5..7ff27ec0f2 100644
--- a/package/erlang-lager/erlang-lager.mk
+++ b/package/erlang-lager/erlang-lager.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_LAGER_VERSION = 3.6.10
+ERLANG_LAGER_VERSION = 3.9.1
 ERLANG_LAGER_SITE = $(call github,erlang-lager,lager,$(ERLANG_LAGER_VERSION))
 ERLANG_LAGER_LICENSE = Apache-2.0
 ERLANG_LAGER_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
