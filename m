Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9941C47422
	for <buildroot@archiver.kernel.org>; Sun, 21 Jan 2024 21:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4871F8246F;
	Sun, 21 Jan 2024 21:35:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4871F8246F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kn9sM_1RE2pz; Sun, 21 Jan 2024 21:35:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D2DE821DF;
	Sun, 21 Jan 2024 21:35:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D2DE821DF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4FC521BF352
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 21:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 27C2F4150E
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 21:35:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27C2F4150E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UwJiANEWFH2s for <buildroot@lists.busybox.net>;
 Sun, 21 Jan 2024 21:35:19 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B76D44146F
 for <buildroot@buildroot.org>; Sun, 21 Jan 2024 21:35:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B76D44146F
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40e913e3f03so33220625e9.3
 for <buildroot@buildroot.org>; Sun, 21 Jan 2024 13:35:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705872916; x=1706477716;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9HflkQ1CrkMg+fOYi2YfuZtdyUgNaXi9N0xhAny2e1Y=;
 b=JMuPvloLVFjGTABGV9QbGZ97vwxZWP/z2sCYK6tM50J+ff2cdlvO/kSB5doyVi7UhX
 fJr+wqQqcqGrnLGN0yZX0pPK8sRHXhPa/M5/3X474ngftPcZDjT0EHNCsRhgmHRjmsm2
 LUqKMWK9JNBltsQfxr/405HLTAQ8WPrwRVeaWzSz/pbkTRk1vTCT8yz4QIJLeO3oVSJN
 30MFbV9mQ+kLx3AKLIi40cjHZa3IP/IsUjvwhaCgpiQAQYRRwfgJF7+wGVtIIJ1+aQUV
 nC+1Qo1qDXTSG82ZB5S9gAIlOFbCkqdfa47OGh0ZJdhI5KQimEig6gI6hxBKQwPT9LPH
 3Aqw==
X-Gm-Message-State: AOJu0YwtGld4OiIkk/7QSlfAppraHuDQMRCKMpLv82LwteU63EUq1X9r
 5FbEVF6XqWnjbZZK/CIzR8Sogscc539mdwpqfj7WU9Z+hp2l30ivGiJOucKB
X-Google-Smtp-Source: AGHT+IFRqjZZtfAWBSm4xAFbtxoYLSdnyWyL0liLwBaoBFRPdm0hm41hXpAHwFTMCcaWZKJgojlqWw==
X-Received: by 2002:a05:600c:3d8f:b0:40e:46ca:8c5c with SMTP id
 bi15-20020a05600c3d8f00b0040e46ca8c5cmr1959254wmb.109.1705872916038; 
 Sun, 21 Jan 2024 13:35:16 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 bi13-20020a05600c3d8d00b0040e8800fcf3sm16875399wmb.5.2024.01.21.13.35.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jan 2024 13:35:15 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 21 Jan 2024 22:35:13 +0100
Message-ID: <20240121213513.2636195-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705872916; x=1706477716; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9HflkQ1CrkMg+fOYi2YfuZtdyUgNaXi9N0xhAny2e1Y=;
 b=QPG6VD4dig+1tA96pWuTa1rUK+4Xnesxuue66AIMIgDJfJyjppTgbvZzKF6wyyLRun
 mEwHmnG+NUIMEoGc/fsN7j6T1RGTauxiM9Ed4yY/MjTw6VA/a7DP8A/vci61S9rNfwAf
 EAT6/4dfhuzSO0ipQGjWvU3+JEXbzcCpkxSOBp7nJ6RKYf3LqgD5zFMtmbabnVUOGWL8
 gpCw2DjBv/lnEGZNJi8He9270qzw6mUuIarTpBYAk/hf+LbNU+GLEIXzLphtIs1D53he
 MD3+5tXPiFLhp3gCAPxeHHovNPgCT78YXTJvSlRapJt6/Yeaq8Zr2ed0OUU50dKojnfp
 py8w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QPG6VD4d
Subject: [Buildroot] [PATCH 1/1] package/python-wheel: add CPE variables
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:wheel_project:wheel is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/detail/402C4B59-237A-4399-8189-CC9FC1B4BF39

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-wheel/python-wheel.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-wheel/python-wheel.mk b/package/python-wheel/python-wheel.mk
index 159598fd1e..320995521e 100644
--- a/package/python-wheel/python-wheel.mk
+++ b/package/python-wheel/python-wheel.mk
@@ -10,5 +10,7 @@ PYTHON_WHEEL_SITE = https://files.pythonhosted.org/packages/fc/ef/0335f7217dd1e8
 PYTHON_WHEEL_SETUP_TYPE = flit
 PYTHON_WHEEL_LICENSE = MIT
 PYTHON_WHEEL_LICENSE_FILES = LICENSE.txt
+PYTHON_WHEEL_CPE_ID_VENDOR = wheel_project
+PYTHON_WHEEL_CPE_ID_PRODUCT = wheel
 
 $(eval $(host-python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
