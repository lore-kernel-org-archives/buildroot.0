Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29968C3DA7F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 14:35:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D42A60A4D;
	Wed,  7 Aug 2024 14:35:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UACfR4m00JZk; Wed,  7 Aug 2024 14:35:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F03E360A56
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F03E360A56;
	Wed,  7 Aug 2024 14:34:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7A05F1BF2BC
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 14:34:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 62EB980B7D
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 14:34:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UJYpUhcgd2Tg for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 14:34:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=johan.oudinet@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 79EE880B80
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79EE880B80
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 79EE880B80
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 14:34:42 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-42809d6e719so14083955e9.3
 for <buildroot@buildroot.org>; Wed, 07 Aug 2024 07:34:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723041280; x=1723646080;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LgTW0Yi1uY0QDCnaOeLb269i/CW7nPyFHnwLPteuyXI=;
 b=pSXzuQz1jvd6qWLysfO3nbxqH6j+8ZScwaYCXYbrBqX0APzS1+L3uoljEZEMp4yP0j
 ClYYqwyjg9Mecr89O/EVJ6j4WxpK+1xDpBNVxf6OuENFmZYAE7Gffrlx0qQRr6I6xyJi
 zMCmRbiyPfl209du1I/MaxFsX04UdqsHw2YfAf4XxvkDWHuF/hNy2VwajyAbE7Gs3ICM
 KBtE4AMvw27mfk3j2wLUsdN1hKdqI4KmHfPbqUx0CCzFQ91LCowa5OlvmK7Z09ErKUSU
 5T+7SprVRahytfoGIai9+zoWN1RJrkHqkXRizRf49ft4knIBlfQqe2zlvPvhISSsrvZJ
 qd3g==
X-Gm-Message-State: AOJu0YzEcOxRwnDQlcdC82hoOgGaWfLzKfAftEeJ/ANYRqUGWhayEAv+
 wgpl5OvXGPsBhoT0H55vLIvESguhACNcidZ27pjy0Xb0Z+qAUdsgFT0Xjg==
X-Google-Smtp-Source: AGHT+IGUc8UDieLk90dnl6UvQmrBmQTYFaybp2jTK/9l7C3aG/RFFp7k6osVnX5tE5wsrAWfzLf3RQ==
X-Received: by 2002:a05:600c:3550:b0:426:4978:65f0 with SMTP id
 5b1f17b1804b1-428e6b07aa1mr140511945e9.18.1723041279807; 
 Wed, 07 Aug 2024 07:34:39 -0700 (PDT)
Received: from shrek.. ([2a01:e0a:acf:1a32:b409:e7b0:306e:2d45])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42905796a29sm33289995e9.10.2024.08.07.07.34.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Aug 2024 07:34:39 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  7 Aug 2024 16:33:11 +0200
Message-Id: <20240807143318.439619-12-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240807143318.439619-1-johan.oudinet@gmail.com>
References: <20240807143318.439619-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723041280; x=1723646080; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LgTW0Yi1uY0QDCnaOeLb269i/CW7nPyFHnwLPteuyXI=;
 b=AmgTCcRNECPO7n5smPQMZeuto2dLLutK1uBp9Y4Z/XyQSxnySyTaszMAkv2hRx9jTt
 FMfkb4it7nOh9USAFwRA1wpaGwK8+Ifhc+/SSwKRjgGpil10FAlkyHVxnTAVRoLiwOqS
 1TIMJVFwxQM2o4OahIiz8QW9kNKzbtAq/lwMSP8h5ID4A8o8Rm/cth2BXi+VtIyI7SJ/
 lpF/0BjN8FhvmoRM5Q8t3ABI72eFRQZjYBmvwrueJ0k7BG3NxpGuZi95/yUxmrPRJzto
 6QkMggIR3PGvRiqOrQ21JsUGZsqc6/07qZdWcyhpHDP0K45GXB17srLeING7/Sog1fTJ
 XdPw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AmgTCcRN
Subject: [Buildroot] [PATCH 11/18] package/erlang-p1-pkix: bump version to
 1.0.10
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
 package/erlang-p1-pkix/erlang-p1-pkix.hash | 2 +-
 package/erlang-p1-pkix/erlang-p1-pkix.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-pkix/erlang-p1-pkix.hash b/package/erlang-p1-pkix/erlang-p1-pkix.hash
index 2b9c4cc93f..a1fdad63e0 100644
--- a/package/erlang-p1-pkix/erlang-p1-pkix.hash
+++ b/package/erlang-p1-pkix/erlang-p1-pkix.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a9adf7d16494c1a1b572b46fc9ee1d28996b3d4bcb7a433395dfe120cee0c0ae  erlang-p1-pkix-1.0.9.tar.gz
+sha256  da6279d3f8ee31ef04de2b82fb0d42ce8dcd72cedb9a8e6ae7b18e42590cb108  erlang-p1-pkix-1.0.10.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/erlang-p1-pkix/erlang-p1-pkix.mk b/package/erlang-p1-pkix/erlang-p1-pkix.mk
index 90c4122184..ba3d88a30a 100644
--- a/package/erlang-p1-pkix/erlang-p1-pkix.mk
+++ b/package/erlang-p1-pkix/erlang-p1-pkix.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_PKIX_VERSION = 1.0.9
+ERLANG_P1_PKIX_VERSION = 1.0.10
 ERLANG_P1_PKIX_SITE = $(call github,processone,pkix,$(ERLANG_P1_PKIX_VERSION))
 ERLANG_P1_PKIX_LICENSE = Apache-2.0
 ERLANG_P1_PKIX_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
