Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E60C433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Dec 2021 13:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D04B760B9F;
	Tue, 21 Dec 2021 13:06:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fFqB8zl4yHCZ; Tue, 21 Dec 2021 13:06:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4E4F60ECB;
	Tue, 21 Dec 2021 13:06:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D05671BF5DC
 for <buildroot@lists.busybox.net>; Tue, 21 Dec 2021 13:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE45F4092E
 for <buildroot@lists.busybox.net>; Tue, 21 Dec 2021 13:06:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KJP0cbLe1dGA for <buildroot@lists.busybox.net>;
 Tue, 21 Dec 2021 13:06:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F1F4F40921
 for <buildroot@buildroot.org>; Tue, 21 Dec 2021 13:06:17 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id s1so21426962wra.6
 for <buildroot@buildroot.org>; Tue, 21 Dec 2021 05:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I8rw0iSeBbhcHrSCf59G+cThvOJOU2nt0EC3zVLgxj8=;
 b=fbEbmAzizfZwJLHD618dBhKiykIane7KcWC0HcZ8Z9BNSv2FJZ1mAV8MNXZu+xLbOQ
 9g47wCPt0Y2t+CTz54AZQqrgfyyH6yhKVPXnlmdmVw8VW52cM3ZEDUg3XtlgSkYsHEGi
 0lT3crV9jdsJ+XpwHZd8vAieUF6Hk3/xUZJOXScldOVhp7rDq2f/F9bOiXgLC/OmKsGf
 tuyfo0Aa8NOJ6uNaFQ9+Wg0bdtaS/fgUC9VwxlzLo9sTrpkbGWEc8u7bed4a+r8lb2in
 9Xq5NsRKbBGRcSLUtisheG9tykTjmLrZIsCTGogZt1p9b483zJlrlEgkRXVJUXIqIzEN
 vTHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I8rw0iSeBbhcHrSCf59G+cThvOJOU2nt0EC3zVLgxj8=;
 b=YionEbCWE72v+xJKnWZ6ajlbdzXrxlJ8fIMu1r+U3b9ym7E5hftct/CzSleJbMdKOZ
 mFbqqL/xvQUesU/3SRHuTTdCpzgqaAgA3OpRdedEubBpw3Js6SGyDr1b+BrdFYTOUAiE
 +R1qf2yU+BVmDXZaEEmafzcDf+yoeTkuW3A0iCYvDoZ7zXFZINe+zOe4BRNBtfJKEF9i
 wFjH5RPqNQSg6ljKmKPV8kmr8H0tDgEkBZlLvsh58e4IU5HXauE/U7563Pq7nQe4vu3S
 984WBhuF457m0vNWv8bmfI22pe6spjBODHxDAwLqQM0BE0QioBEecQIxVQty5FBLPpMb
 gLnQ==
X-Gm-Message-State: AOAM533t4oGgKUbGTHJeLpxEtQKal5S4k1gpCkY6m3NEopkiPx3Ms4hf
 zPg2GMgc5q8mHhu/Tqc50/t+rF95fRJkPQ==
X-Google-Smtp-Source: ABdhPJwBxauQxU3+ib4EuIx5PuPmjSmyQRPAaWoz5BbnhLio/wFuEG8gIVMpbmQqp9y+orO9kXqJBA==
X-Received: by 2002:a5d:6e85:: with SMTP id k5mr2699021wrz.545.1640091976142; 
 Tue, 21 Dec 2021 05:06:16 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id 1sm8295774wry.33.2021.12.21.05.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 05:06:15 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Dec 2021 14:05:44 +0100
Message-Id: <20211221130544.103759-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/minizip: bump to version 3.0.4
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

https://github.com/zlib-ng/minizip-ng/releases/tag/3.0.4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/minizip/minizip.hash | 2 +-
 package/minizip/minizip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/minizip/minizip.hash b/package/minizip/minizip.hash
index 6043f96f3a..3e87e64dae 100644
--- a/package/minizip/minizip.hash
+++ b/package/minizip/minizip.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5f1dd0d38adbe9785cb9c4e6e47738c109d73a0afa86e58c4025ce3e2cc504ed  minizip-3.0.3.tar.gz
+sha256  2ab219f651901a337a7d3c268128711b80330a99ea36bdc528c76b591a624c3c  minizip-3.0.4.tar.gz
 sha256  675181c03fc1302a1c8554c00f7be9bb420c5dbc9dcc2013433cec144413de03  LICENSE
diff --git a/package/minizip/minizip.mk b/package/minizip/minizip.mk
index 2d0f63959e..07f67c1354 100644
--- a/package/minizip/minizip.mk
+++ b/package/minizip/minizip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINIZIP_VERSION = 3.0.3
+MINIZIP_VERSION = 3.0.4
 MINIZIP_SITE = $(call github,nmoinvaz,minizip,$(MINIZIP_VERSION))
 MINIZIP_DEPENDENCIES = host-pkgconf
 MINIZIP_INSTALL_STAGING = YES
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
