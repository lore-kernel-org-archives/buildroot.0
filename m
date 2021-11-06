Return-Path: <SRS0=GWv0=PZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD8CFC433EF
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 15:29:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 206DD60F9D
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 15:29:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 206DD60F9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E926640463;
	Sat,  6 Nov 2021 15:29:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nvdx3p9WXEfb; Sat,  6 Nov 2021 15:29:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E1384045A;
	Sat,  6 Nov 2021 15:29:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D342E1BF2A1
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 15:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C31DE6067F
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 15:29:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cBDHIDrvfdz1 for <buildroot@lists.busybox.net>;
 Sat,  6 Nov 2021 15:29:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E91DA60625
 for <buildroot@buildroot.org>; Sat,  6 Nov 2021 15:29:31 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id u18so18520437wrg.5
 for <buildroot@buildroot.org>; Sat, 06 Nov 2021 08:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BjLKRz0hKzy1mtbpmNBNyUCymgaqbKwKPpPBy3SOu4E=;
 b=d23m25cNmDcrGq8Y+DtKpDa6iGJjDmx6vV+9E1CAlhITMJuoCZOlYTIi6zvKRdi3Ab
 JQkxpBUWJCcr83GtPUFMwgus5vJ/aO3H78P2kZrI0FpheamBAKjU7soLLesjEndEqeJ6
 1Y56ZYZ/BpmUka4KC96VmRyKpQmv+1z7aYRL5tloJ5CHQWwgrgpz4KN3u03Stnuxa7Po
 J1Jryg6LJdqw6gBJo87iCq18v1JM11h8xc3nDRSk5ROZxGVxXabvPZJj1arIktgpHZRX
 v7OdZRbgecvVHQ/EHN3vS2I6ifavFqJgW/+Cm6ZJa+X0XEIkNMvJ1UxcgUqIYSSfq//B
 nYkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BjLKRz0hKzy1mtbpmNBNyUCymgaqbKwKPpPBy3SOu4E=;
 b=4RAlxDZBRfjJAWhXIiCfyYukfvxS76pDIkzK5C3zMakuD8QcztFk9U1JZxe4MiZofR
 u4mZkRhFzdpijTc3ZuZ4u5lAEdWsSLnn9dVmC6GVkHwOHyBJqH2q0Ca2nBKQGMcElU4o
 H4uDIUxtPSMSOgANSHG+i4lP1Aa0zgvetsduuV4dCC19B+CRFHVkBKRoVKJ1pwBR3sd/
 UEtHcW85SV8rclBUqpuVbp7ENZfMSTR4WIcjBmK7n9T9qM1TAq4Mwn+MTUnq8FIawTXp
 3/bSAcmx9TbPEDlLsV5Kxa9Bb7pbu94BHIiMJBysdBD34tPRYq+wLeNDCgY88IeNHQh/
 zBzQ==
X-Gm-Message-State: AOAM530qky+zZu2LaRtW52EY/+l74qv/BZ9IKbz+YYFuEF7KBanIK805
 f7WfLP3Hv9W9sY4V5u4S+5bakxdSMTg=
X-Google-Smtp-Source: ABdhPJwqE2UuRAqnc7n3OgJMj23S9Ed4osKHn3aj2dQPiIILxCPP8HLA3hCCGdScYw7wN46m9MJjzg==
X-Received: by 2002:adf:c986:: with SMTP id f6mr88219224wrh.216.1636212570120; 
 Sat, 06 Nov 2021 08:29:30 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id f19sm11784370wmq.34.2021.11.06.08.29.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Nov 2021 08:29:29 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  6 Nov 2021 16:27:41 +0100
Message-Id: <20211106152741.3187114-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/iucode-tool: don't override
 dependencies
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

Don't override IUCODE_TOOL_DEPENDENCIES in a conditional

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/iucode-tool/iucode-tool.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/iucode-tool/iucode-tool.mk b/package/iucode-tool/iucode-tool.mk
index 568692c46c..596ad268b7 100644
--- a/package/iucode-tool/iucode-tool.mk
+++ b/package/iucode-tool/iucode-tool.mk
@@ -7,9 +7,7 @@
 IUCODE_TOOL_VERSION = 2.3.1
 IUCODE_TOOL_SOURCE = iucode-tool_$(IUCODE_TOOL_VERSION).tar.xz
 IUCODE_TOOL_SITE = https://gitlab.com/iucode-tool/releases/raw/master
-ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
-IUCODE_TOOL_DEPENDENCIES = argp-standalone
-endif
+IUCODE_TOOL_DEPENDENCIES = $(if $(BR2_PACKAGE_ARGP_STANDALONE),argp-standalone)
 IUCODE_TOOL_LICENSE = GPL-2.0+
 IUCODE_TOOL_LICENSE_FILES = COPYING
 IUCODE_TOOL_CPE_ID_VENDOR = iucode-tool_project
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
