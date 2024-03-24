Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E75C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 21:25:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B77DA81DE3;
	Sun, 24 Mar 2024 21:25:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2wMdvJCLTEKL; Sun, 24 Mar 2024 21:25:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9347081E0D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9347081E0D;
	Sun, 24 Mar 2024 21:25:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6D3761BF4E5
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 21:25:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5960140117
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 21:25:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GNuwsT2Wpru1 for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 21:25:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6150C4010B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6150C4010B
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6150C4010B
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 21:25:00 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-29ddfd859eeso3110814a91.1
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 14:25:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711315499; x=1711920299;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d8bI3P1VtuR0xLWIKSsX3xDlHcuXJAgYpTGLcUh0CCg=;
 b=spSVeZokD2/szgRjIn6JUc3RN2DHVPWWNlp8+zVF94MKUGDQQkVl2CZSsSL2zUPdTo
 2v45mguYmwlBsO37WaEFIMl/pnlEDmJZTpAD1BYHR0Ands75nimBkMcuywMI+WqcmgyC
 3qvmAveOoX1qebhk1bdnTv5NoJckMdmz94LfL8JXlzZ5n+kIFQwDuMSB45h5RvYulCiC
 evo4zsHNVGT8zFvbrjDzs+KxXlsX6O3AOWqM2rNLhL2vrTbpWE3Y/3u0YlWLXSD+8cGw
 xRvZvO9mxCFmNFNj/7o4YiSxLES9gmXO6QvXavEIC4LgHStGfqM0U7zJVS3vwdxuQIS4
 5OkA==
X-Gm-Message-State: AOJu0YzBaHvLOKm+iSheBwAKmQjwbBvt4m37wtyLNJ/F9AN95VG6jFfM
 iOToaeY1Y4K1zW9QAnzNhIjwplt2zIKjW6iUcoXTKXv2rzOSfuVxDnNxx00BYB3BVkQR7ZNg4pt
 r
X-Google-Smtp-Source: AGHT+IHW63zjFdfDTkZAguBBkQ437vNLyjhrmHFW0FYjBnANQUNkUrGl2Uo4cvsf+QY9iBzoZmI34Q==
X-Received: by 2002:a17:90a:f3cc:b0:29c:783b:d3cf with SMTP id
 ha12-20020a17090af3cc00b0029c783bd3cfmr4445102pjb.10.1711315498835; 
 Sun, 24 Mar 2024 14:24:58 -0700 (PDT)
Received: from localhost.localdomain ([204.229.2.167])
 by smtp.gmail.com with ESMTPSA id
 k7-20020a17090a658700b0029c3bac0aa8sm8979556pjj.4.2024.03.24.14.24.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Mar 2024 14:24:58 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 15:24:39 -0600
Message-ID: <20240324212441.526544-8-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240324212441.526544-1-adam.duskett@amarulasolutions.com>
References: <20240324212441.526544-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1711315499; x=1711920299;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d8bI3P1VtuR0xLWIKSsX3xDlHcuXJAgYpTGLcUh0CCg=;
 b=IbhsHzdG9SQjk+QfjfHPNzjNJHmSxUMqQDDUQ7CcNAgke4tfIqpiCkSvBtaTVL/hGM
 fgeiugUPRFVQHzMX+6A/kOeA6vkjC46BgGVcV9KFtszG+1gU/krFv3k2HbAPMcAE1dvN
 igQGn9LvwqrAEndN8Ovh7ewiX6FeG9FzMGjMM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=IbhsHzdG
Subject: [Buildroot] [PATCH v2 8/9] package/selinux-python: bump version to
 3.6
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/selinux-python/selinux-python.hash | 2 +-
 package/selinux-python/selinux-python.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/selinux-python/selinux-python.hash b/package/selinux-python/selinux-python.hash
index 3592540703..96be214fd3 100644
--- a/package/selinux-python/selinux-python.hash
+++ b/package/selinux-python/selinux-python.hash
@@ -1,5 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  8245bb4dae59333461f19ca0c79a829081f07972fa5e3ad4c2b2b917dd71d96b  selinux-python-3.5.tar.gz
+sha256  e2867d4cd26f9869c55216cc20ca7d10442491a0fbf256116ade99ec39426ec0  selinux-python-3.6.tar.gz
 
 # Hash for license file
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/selinux-python/selinux-python.mk b/package/selinux-python/selinux-python.mk
index 7505474aa4..84fc9cbc22 100644
--- a/package/selinux-python/selinux-python.mk
+++ b/package/selinux-python/selinux-python.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SELINUX_PYTHON_VERSION = 3.5
+SELINUX_PYTHON_VERSION = 3.6
 SELINUX_PYTHON_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(SELINUX_PYTHON_VERSION)
 SELINUX_PYTHON_LICENSE = GPL-2.0
 SELINUX_PYTHON_LICENSE_FILES = LICENSE
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
