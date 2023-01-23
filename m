Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 157AAC05027
	for <buildroot@archiver.kernel.org>; Mon, 23 Jan 2023 13:34:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9386D415E6;
	Mon, 23 Jan 2023 13:34:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9386D415E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9-5nnNloGeT6; Mon, 23 Jan 2023 13:34:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3746415A6;
	Mon, 23 Jan 2023 13:34:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3746415A6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E0FF41BF359
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 13:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B8E8D60C14
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 13:34:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8E8D60C14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wQggCtm_2bwl for <buildroot@lists.busybox.net>;
 Mon, 23 Jan 2023 13:34:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7B0C60C11
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B7B0C60C11
 for <buildroot@buildroot.org>; Mon, 23 Jan 2023 13:34:39 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id g11so9088389eda.12
 for <buildroot@buildroot.org>; Mon, 23 Jan 2023 05:34:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=joXzexMAmzyTFHER+D/6gNFDHwAArJRjmvNShzcdXZo=;
 b=tyiCkRho/5tQeO0ZCDKrz19c6GAODPkoHrNeGOdDoux5aEc6MKOiP7TVia9XJuXa2p
 JX+FGWqvi8WkAc5qJUhgIYS1T/864oIKSyztTTd34cwH+kqPS2W00bk2ExwP85C1Pd6K
 qLGVq1HTqoYHPGC1pwOaasLfwhlZ1xqxvQX0QtqH2hPrFl1IlpUx9jsbLRLq24ZcJm4H
 SY+1rwV0Ymg4UABPVD9P+hqinPmgxRaHsVAuZwMuQeb1ivwSF2qpL3A0dlnQKVaN4kmn
 nGGcGwhXWkWZUlQHDTV3I4vT1E1FIw1dZnn2ZyKUIQQcFnKDNcG1D+V4Y88iyTl5wesV
 V8hQ==
X-Gm-Message-State: AFqh2kpANshntjmPMWeT1DnYZNNxRf5egNzNxVgJ+omqqtciR7uDQmye
 0l0J52Wyh0F25Wix9IZalxWtiB/T1xNydQ==
X-Google-Smtp-Source: AMrXdXtTdDKVcKZzRpmVxdPMGcogPBFNx9l/bpYQNsRjjb8RHNaus4KriIzyNKcHVwBGmK3p+QndjQ==
X-Received: by 2002:a05:6402:1ccc:b0:49c:fdd2:a47d with SMTP id
 ds12-20020a0564021ccc00b0049cfdd2a47dmr31422493edb.37.1674480877457; 
 Mon, 23 Jan 2023 05:34:37 -0800 (PST)
Received: from localhost.localdomain (82-209-154-112.cust.bredband2.com.
 [82.209.154.112]) by smtp.gmail.com with ESMTPSA id
 b2-20020a0564021f0200b0048c85c5ad30sm21372953edb.83.2023.01.23.05.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 05:34:36 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 23 Jan 2023 14:35:24 +0100
Message-Id: <20230123133526.3371864-1-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=joXzexMAmzyTFHER+D/6gNFDHwAArJRjmvNShzcdXZo=;
 b=SvWzGTIn6b/i0cBOqb5iFSJF/WPeLmNzXj3cq+nUzM61z+Ir4ZdrpNigmsf58/CcUh
 l1o41pDsu9ggElBfkD7YryQSesGlw2mmsveoFBOZosUGIDnUjYMwFlm3WlDOiu43S48z
 tm54q3yQbEUoNd/KQUhghBC8ND/qv6NV+eXGqylgykOQSjlMRGynzSWzlhQa56KyQImK
 gh+ZpfvHE8Sm2VeKBrshm6FxWxZ1vusB5XAk2WTUKcC9Q6t7IUpyvUfVO9HWvFtTIfTj
 nKxJMlFk8e2KmiiW+lflzUQ+xIyGr8bGMn93azXxwXbS0BHYJNrqo6Ktk7IvA5q9E/Ex
 c/3w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=SvWzGTIn
Subject: [Buildroot] [PATCH v2 1/3] package/libcamera: bump to version 0.0.3
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---

Notes:
    v2:
        go back to linuxtv mirror

 package/libcamera/libcamera.hash | 2 +-
 package/libcamera/libcamera.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
index 68c9c1f005..033e318910 100644
--- a/package/libcamera/libcamera.hash
+++ b/package/libcamera/libcamera.hash
@@ -1,4 +1,4 @@
-sha256  59318208a9c1b183cacaf5a7175568d8a9fa094f2dd8c9794269bb6e9636986e  libcamera-ba6435930f08e802cffc688d90f156a8959a0f86-br1.tar.gz
+sha256  d7100286616550aca487b46ae9de2a70bb471352a332b8214901b4148739990f  libcamera-v0.0.3-br1.tar.gz
 
 # license files
 sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 9c03d3a3b3..6ef0f8cd69 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -5,8 +5,9 @@
 ################################################################################
 
 LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
-LIBCAMERA_VERSION = ba6435930f08e802cffc688d90f156a8959a0f86
+LIBCAMERA_VERSION = v0.0.3
 LIBCAMERA_SITE_METHOD = git
+
 LIBCAMERA_DEPENDENCIES = \
 	host-openssl \
 	host-pkgconf \
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
