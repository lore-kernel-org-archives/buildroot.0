Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF973C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 13:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 564A340223;
	Thu,  8 Dec 2022 13:39:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 564A340223
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6NzJ3mDVSe67; Thu,  8 Dec 2022 13:39:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38E2D401E7;
	Thu,  8 Dec 2022 13:39:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38E2D401E7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 67BA21BF3EB
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 13:39:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 507F480C97
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 13:39:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 507F480C97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JQ7W_sXd1BpU for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 13:39:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F8F780C93
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3F8F780C93
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 13:39:39 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 f13-20020a1cc90d000000b003d08c4cf679so1019768wmb.5
 for <buildroot@buildroot.org>; Thu, 08 Dec 2022 05:39:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1KhR1D+nVbmGNh2TsMMDDaqn+qu5Xc0Oyz5GsPLtf1E=;
 b=U++BAk1Kv43dx8IY1wRE0I/Qqi7PPmMM+khTi9/duhJaPJdLYv/eQgC1XWw4aNdJ36
 2IfBEUHabe9omqwvdCBPemO+8pxhd00YvgN6UsdkcgspzGLOwNlskMXaBcIjTSApyEDR
 5pe3x/EPzBJvZLk4LXPe+nU+glfc5xQsqVyNrvsdzLNd+q3Jtlg/8Hr/3agfwewyh1bH
 YQpieRGdeN0vRV1fTPKcIFWUHFpY+oXYIHg3lJV0hwAyee4lYzQEoFcU/kD0XTlO+5kc
 BKdUpsrNrirLCDrfmD4s9w/hQ24nCgD57fXFK6pGsvLH2qYqRIlKWgZzGDt21ykWxcJo
 5Z9g==
X-Gm-Message-State: ANoB5plehQsMoS9LWYgHGTPu+9p7iFPTwDLN/X63pqFq8GSwdgx0ubb5
 7DfjGhFpHcCsNyLAh2lhuMCDrTqiMIEwww==
X-Google-Smtp-Source: AA0mqf7vJjskGTjhiAfMlCdGxF8l5x+OeHBUMmUZaqHQ5Nav/94X2z6ae5Srqk0kC9g9uC5kujWkKA==
X-Received: by 2002:a05:600c:3c9c:b0:3cf:497c:c4f5 with SMTP id
 bg28-20020a05600c3c9c00b003cf497cc4f5mr2158564wmb.13.1670506776831; 
 Thu, 08 Dec 2022 05:39:36 -0800 (PST)
Received: from hthiery.kontron.local
 ([2a02:810b:5a40:2a43:7200:ad55:a3ad:7bab])
 by smtp.gmail.com with ESMTPSA id
 f20-20020a05600c155400b003b4fe03c881sm5695682wmg.48.2022.12.08.05.39.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 05:39:35 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 14:39:27 +0100
Message-Id: <20221208133928.303101-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1KhR1D+nVbmGNh2TsMMDDaqn+qu5Xc0Oyz5GsPLtf1E=;
 b=V2A42bKYSf3Pm7myoENcB7f4krippzFBso9sJj8bUgfgY+rZo31E1wlGXeOHzc477H
 VvQwatcwb4EqJnQQDuCTqV7uTI2n9bnFOEvx7KcyxXmILavwH86gNccrx0gHzbUYzM5Y
 LzHuwVHxw5F63YCbUN9X+MlzjdZ4au8fTHZJtSgcuPjgD9cMC9BcmZfjixlmx5ax/nVq
 XlyRtmvEFgRl+EUtJYUW0XYsVA+7JZA3KNMS7r0IKbnnlKJX3kvBfyg6AiL/N+LEPPC1
 78kxaSUM7MpukpTEL2TlNTNLizNsa0kN41l+OtEpr9JxA5hmSw12SsEP019WIE6Uutbk
 MCmw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=V2A42bKY
Subject: [Buildroot] [PATCH v2 1/3] package/libmbim: bump version to 1.28.2
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Heiko Thiery <heiko.thiery@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Aleksander Morgado <aleksander@aleksander.es>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/libmbim/libmbim.hash | 2 +-
 package/libmbim/libmbim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmbim/libmbim.hash b/package/libmbim/libmbim.hash
index e98c53b1c9..2e2b46fcdb 100644
--- a/package/libmbim/libmbim.hash
+++ b/package/libmbim/libmbim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  58cd9ab1a2af9bbf40f9c02d3152a96baaa34a5f66a4289e928c7cf1c9584abb  libmbim-1.26.4.tar.gz
+sha256  cf74682c56f4c34ca4aee86de3b8c425a89fc2c0782052815295faf6a8e0a9fb  libmbim-1.28.2.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/libmbim/libmbim.mk b/package/libmbim/libmbim.mk
index 1e2b1771eb..1c12b82298 100644
--- a/package/libmbim/libmbim.mk
+++ b/package/libmbim/libmbim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMBIM_VERSION = 1.26.4
+LIBMBIM_VERSION = 1.28.2
 LIBMBIM_SITE = https://gitlab.freedesktop.org/mobile-broadband/libmbim/-/archive/$(LIBMBIM_VERSION)
 LIBMBIM_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
 LIBMBIM_LICENSE_FILES = COPYING COPYING.LIB
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
