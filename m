Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A40CBC4345F
	for <buildroot@archiver.kernel.org>; Mon, 22 Apr 2024 17:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38B8260863;
	Mon, 22 Apr 2024 17:15:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TXHWaQd54Uhw; Mon, 22 Apr 2024 17:15:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 280FC60840
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 280FC60840;
	Mon, 22 Apr 2024 17:15:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D745D1BF333
 for <buildroot@lists.busybox.net>; Mon, 22 Apr 2024 17:15:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD9CD81754
 for <buildroot@lists.busybox.net>; Mon, 22 Apr 2024 17:15:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UlubR6Jsvebk for <buildroot@lists.busybox.net>;
 Mon, 22 Apr 2024 17:15:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3D0BE81751
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D0BE81751
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3D0BE81751
 for <buildroot@busybox.net>; Mon, 22 Apr 2024 17:15:31 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-41a5b68ed4fso9442185e9.0
 for <buildroot@busybox.net>; Mon, 22 Apr 2024 10:15:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713806130; x=1714410930;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XaW9is2D45Z8Cj/W1ghtj6ej8Iv0tLnwIi2NHKl2gKo=;
 b=UI+IVVvX7WLbqv/dtZ9iwBkx0VNDPApWIIDj47YN4EHiAk04PPWOWcwFb2YL7Visb1
 0wmHqLKCIWO9t55xO0vq5puoQIm9o2LgzYD3JnPm6Lwm7rt8E7uAn6gKifgn0PhVUdAZ
 oV4A4m5u9da2sG6Y5mXz+Rth/hAFLwrpDTsJP2yr0keXewZlVBrJCQhh8U4L8DvkBrG4
 hbL1CuvrLdyTQE3nZ6FI8SqX9qSKRDrEa+uihABKRjSxqBrb6OX3VSksQ6+diag1i7pz
 O/bluAGHQNzMUIMn8pGPMAHHOV+nD7ZTlXYwRJAr6rxzqxRk7eiFnPtGkjmtVjhWoGeC
 zzMg==
X-Gm-Message-State: AOJu0YwTUYH2Fy6NXPUxI0IDLKJ6dd2yDJtNutuoE88I5iwLFfdD7Eks
 8HBZjdS3EefSXbdjzWLvpAhNC/LwHd4yWuITiLsFot0bsUs8i4qhe6Oyjae1N2PxnFu609OetJd
 hzw==
X-Google-Smtp-Source: AGHT+IG05xjIloKMFjjCyrCcTZuXwo/7hTEUQVIxGyrNNIGBv5L+Fpkehp+HdAzOL2y9Yy8wbeDcyQ==
X-Received: by 2002:a05:600c:3b94:b0:416:9f45:e639 with SMTP id
 n20-20020a05600c3b9400b004169f45e639mr7416728wms.20.1713806129942; 
 Mon, 22 Apr 2024 10:15:29 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.74]) by smtp.gmail.com with ESMTPSA id
 t18-20020a05600c199200b00417ee784fcasm17318328wmq.45.2024.04.22.10.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 10:15:29 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 22 Apr 2024 19:15:03 +0200
Message-Id: <20240422171503.40740-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1713806130; x=1714410930; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XaW9is2D45Z8Cj/W1ghtj6ej8Iv0tLnwIi2NHKl2gKo=;
 b=qHd1seiT8b5XhqPqVfWlhh1LHQePTJ9KCFc3DjdSVpMbTC1+c5rcEcx2fT4WESLmv6
 nT2S5Y0Db01ptF3JLoPBTZrbWqnLbxsOfchI7ISfSsAgJL3Lr8UIC7+cqKMkkvDw1v9a
 s2ZNqZNOhICSWfSZhijNmLoGrFfTc7JN6IwrUMpwHItkKEcfOTgdBFH+vs4/AiGHDOvd
 sII7tUIJz9z+Iu529231vpgnGjC8IrQjr2/kd3J7e1Zyk09JJAHjdV+VFkfTnOP7p4A3
 3hngD68fWgaZzjounw/ZdWeH9yWCqY14F4794a5KtyTjGknjB0GSzBIHifei8BwcsK64
 yRRw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=qHd1seiT
Subject: [Buildroot] [PATCH] package/open62541: bump to version 1.3.10
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/open62541/open62541.hash | 2 +-
 package/open62541/open62541.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/open62541/open62541.hash b/package/open62541/open62541.hash
index 2946b991a..7f6bf8098 100644
--- a/package/open62541/open62541.hash
+++ b/package/open62541/open62541.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8ca1f20dba4fc103893d74d29e41c336ab67a1725512b03eaaf6060658525b43  open62541-v1.3.9-br1.tar.gz
+sha256  e49f30c621784d490c8f8e4da808e3cab03ffca41d1aee9eb73ce01a65bcfd6d  open62541-v1.3.10-br1.tar.gz
 sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE
diff --git a/package/open62541/open62541.mk b/package/open62541/open62541.mk
index 17abd4a37..1be44eb0b 100644
--- a/package/open62541/open62541.mk
+++ b/package/open62541/open62541.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPEN62541_VERSION = v1.3.9
+OPEN62541_VERSION = v1.3.10
 OPEN62541_SITE_METHOD = git
 OPEN62541_SITE = https://github.com/open62541/open62541.git
 OPEN62541_GIT_SUBMODULES = YES
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
