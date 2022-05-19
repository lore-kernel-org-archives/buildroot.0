Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18EFBC433F5
	for <buildroot@archiver.kernel.org>; Thu, 19 May 2022 14:09:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C778340BFB;
	Thu, 19 May 2022 14:09:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DGeVG8uX68ym; Thu, 19 May 2022 14:09:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC004405C2;
	Thu, 19 May 2022 14:09:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 14F3A1BF3CE
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 14:08:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 049C660EAC
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 14:08:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oUZt0HJGBU4D for <buildroot@lists.busybox.net>;
 Thu, 19 May 2022 14:08:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4CE9C60C0A
 for <buildroot@buildroot.org>; Thu, 19 May 2022 14:08:35 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id k126so2953088wme.2
 for <buildroot@buildroot.org>; Thu, 19 May 2022 07:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WZaH2E9Nca2CNwqixOH5cHpOxAJS48vCjaS7Tyn1l2c=;
 b=qGp+E+FSNF7sTezAbkBtX0aQ+pHMF+uNojCC1L90ta/EhsY/S0S7rDGT6xzQQVjGSG
 /qyk+A/irBltAJfV40MCj5d9uamI6oIKYQEngDz4t2/jgrx6SpcS+LS6n2OqQNecXpk6
 /fMm3k+hnH/XvA6+xgi2LwDpy8Bd1XeGcBr+NH+QV2Xst4rJz/SIHVm8e6AsirgseUjh
 XN5/ClXxhW7pBN3MuqXx58fez49RbAVq3fH2OkqkJxX9JHLb0srYuM9ILXEr76KHWXvy
 4475DvJGySX2i91NTk0SEDDOBGsfwCgqJPrjMl2zUDL4+KnkAhV9lOyd7ybEUL+8nY3b
 M5SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WZaH2E9Nca2CNwqixOH5cHpOxAJS48vCjaS7Tyn1l2c=;
 b=w7sCdnl3qIDFhioYQ5KyQdP14+nKLx9+P52le8UMc/rwqD5CoEC4/AzeojiRww3bzP
 yVgvS2y9mgJF7+k9g96qsaEpp9Kop942ZsDlglki39fgms2ev6hE3REtGMIHDA9ul9L7
 Y7wWZ7dQz40/8BTZThtQzvXCVVNbArE0ut5LZC+g/BTTU0OjPW2liRJdRFpl+CmGwxEP
 Lbdm1UiYRes/VnNBnHvZIzQx/TqBrVATdOrYFiQrxJ1ZvdOCjJz8OMRIRd8bSwyLYFY0
 bRCBylyasWuSxLuG6yjCAvwzciXe53AYeIN4C755BZwzZbdWzTy26NXzKH7IEBj7yekZ
 JZnw==
X-Gm-Message-State: AOAM533kxmCgGZG8zT8itz93v3flOQQO7ZHcdsJBzY9JdYezAK870cmr
 JcO51vmbNZtuEYFJ8j10Qt+zwTMA3ZE=
X-Google-Smtp-Source: ABdhPJwTMspDQYNMFW6+7XQ0e6WAhL0CEpQcQj7RWOXOj0zf/ffWB1Mo4MJNuXElnaL375pKvV5b1A==
X-Received: by 2002:a05:600c:382:b0:394:6172:59dc with SMTP id
 w2-20020a05600c038200b00394617259dcmr4577354wmd.120.1652969313275; 
 Thu, 19 May 2022 07:08:33 -0700 (PDT)
Received: from shrek2.. (lmontsouris-659-1-42-116.w92-154.abo.wanadoo.fr.
 [92.154.77.116]) by smtp.gmail.com with ESMTPSA id
 f18-20020adfb612000000b0020d00174eabsm4790214wre.94.2022.05.19.07.08.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 07:08:33 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 19 May 2022 16:07:54 +0200
Message-Id: <20220519140810.1953601-5-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220519140810.1953601-1-johan.oudinet@gmail.com>
References: <20220519140810.1953601-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 04/20] package/erlang-p1-cache-tab: bump
 version to 1.0.29
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
 package/erlang-p1-cache-tab/erlang-p1-cache-tab.hash | 2 +-
 package/erlang-p1-cache-tab/erlang-p1-cache-tab.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-cache-tab/erlang-p1-cache-tab.hash b/package/erlang-p1-cache-tab/erlang-p1-cache-tab.hash
index 85a92cf0b2..9f03bdbfae 100644
--- a/package/erlang-p1-cache-tab/erlang-p1-cache-tab.hash
+++ b/package/erlang-p1-cache-tab/erlang-p1-cache-tab.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  32cb3a3017f53e66bd1c2b75f60a2c4a14f00f375582a3c511ea39266b2385b9  erlang-p1-cache-tab-1.0.25.tar.gz
+sha256  b11299eebafab6f1f5670650c48b10d9fa607ab092b4be8a976982e3f2b37526  erlang-p1-cache-tab-1.0.29.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-p1-cache-tab/erlang-p1-cache-tab.mk b/package/erlang-p1-cache-tab/erlang-p1-cache-tab.mk
index f3253d1cd7..046235f24c 100644
--- a/package/erlang-p1-cache-tab/erlang-p1-cache-tab.mk
+++ b/package/erlang-p1-cache-tab/erlang-p1-cache-tab.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_CACHE_TAB_VERSION = 1.0.25
+ERLANG_P1_CACHE_TAB_VERSION = 1.0.29
 ERLANG_P1_CACHE_TAB_SITE = $(call github,processone,cache_tab,$(ERLANG_P1_CACHE_TAB_VERSION))
 ERLANG_P1_CACHE_TAB_LICENSE = Apache-2.0
 ERLANG_P1_CACHE_TAB_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
