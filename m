Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40244C04FFE
	for <buildroot@archiver.kernel.org>; Fri, 17 May 2024 20:53:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC1ED4018B;
	Fri, 17 May 2024 20:53:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RGIphIaf6BbG; Fri, 17 May 2024 20:53:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C56E4019C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C56E4019C;
	Fri, 17 May 2024 20:53:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A26581BF330
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 20:53:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A20C400FB
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 20:53:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wZfFCTuWZoDZ for <buildroot@lists.busybox.net>;
 Fri, 17 May 2024 20:53:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7B4E4405B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B4E4405B0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7B4E4405B0
 for <buildroot@buildroot.org>; Fri, 17 May 2024 20:53:27 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-34dc8d3fbf1so436843f8f.1
 for <buildroot@buildroot.org>; Fri, 17 May 2024 13:53:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715979205; x=1716584005;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ws3xyeIuYalZ1rIKeprUULpnwukBOfIvbLrSFy7sTjY=;
 b=rv7+6fgEGmkbxG6lhP01bU1IPv3LByWXQQyRvolnblCouxUIojuzm9P9RyxxPUxcKf
 c5OHkOZ6zjB8H0uIuTgKgCDtzT/XF+xmLt3J1ERCiwtJ6Avd+HEp4gS247FhQPDqn3yo
 HT5aRbstRC4+aOWSxnMLlQv7vKCbYYzvO71jH8asiNAbBKDrXWBgGTkmPWJscFih11ny
 tMf3f595auaqGjWHnM9SV2dLN3yrmw0FlBI7b5W9xYa/jGpB29loHWXOiVCwdrMk28o8
 A3rRo6It7b2Smc/nwaEG/E8B2OAfOQDylJoV8AUeuZbG9jHYJZzXH5NyXJdE0fy7CNpI
 V2tg==
X-Gm-Message-State: AOJu0YxvAYT8h4yZs/Chx96MqiU4GToN2O6JNFTpZFHDMB+P5noaC814
 Fz13JNQQd/agpGk9ItitxT/7vAjwyeAsNKQJbwMjbCEuRgkrrbXYM43WVw==
X-Google-Smtp-Source: AGHT+IHu0aFypxH0feHQOe7Y17y1MtlRIPMggLY5CNnyiFeLg/YEpqXhLugGUFVkqXQC5NspTWIoyw==
X-Received: by 2002:adf:cd85:0:b0:34a:5663:40e with SMTP id
 ffacd0b85a97d-3504a61c8d3mr13425953f8f.9.1715979204947; 
 Fri, 17 May 2024 13:53:24 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-351dea787efsm4070467f8f.30.2024.05.17.13.53.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 May 2024 13:53:24 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 17 May 2024 22:53:15 +0200
Message-ID: <20240517205315.850877-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715979205; x=1716584005; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ws3xyeIuYalZ1rIKeprUULpnwukBOfIvbLrSFy7sTjY=;
 b=SuVE7frz5YgUzOetLs7rww4WVhPXeobFH22r9RfbJARncp6htg3c0jUg8X6fZT0iXV
 i+d81UPYMphqPPb65Wj0ngB3j487Go25SJWC9IIR0wlQdMPQUQDcFs56fJDTZ9wfOx9r
 ptvfte+yJ490y1AGvXeKyf95e68wIvVYFGAq0IJHXqTrjn/N+EbGYkgdUH+3ugbip20P
 AUNX1MK63h0eYUdpQxcuGXpQaoXN7ic4H4Fbz6oqVYKuYu33NVuntEdFqyj0G8bqPL+p
 ZNQmak0lD+9kw4tlbfgNAJ9suJZTE1bEPRnSW23ajv//y2LmpApk+2eGSn8MZ1eNwCJE
 VXCw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=SuVE7frz
Subject: [Buildroot] [PATCH 1/1] package/mokutil: select libxcrypt if needed
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
Cc: Julien Olivain <ju.o@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since the addition of the package
in commit 2e6e121496bfcbe09c018558be13733077b6df9b:

mokutil.c:45:10: fatal error: crypt.h: No such file or directory
   45 | #include <crypt.h>
      |          ^~~~~~~~~

Fixes: 2e6e121496bfcbe09c018558be13733077b6df9b
 - http://autobuild.buildroot.org/results/59e470ad6bf7f48314cd26ed4163c095e4c803ab

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mokutil/Config.in  | 1 +
 package/mokutil/mokutil.mk | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/mokutil/Config.in b/package/mokutil/Config.in
index 3f0c760f7d..dd02078b4e 100644
--- a/package/mokutil/Config.in
+++ b/package/mokutil/Config.in
@@ -12,6 +12,7 @@ config BR2_PACKAGE_MOKUTIL
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # efivar
 	select BR2_PACKAGE_EFIVAR
 	select BR2_PACKAGE_KEYUTILS
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_OPENSSL
 	help
 	  mokutil is a tool to import or delete the machines owner
diff --git a/package/mokutil/mokutil.mk b/package/mokutil/mokutil.mk
index 6e83d9f138..f176fa5bee 100644
--- a/package/mokutil/mokutil.mk
+++ b/package/mokutil/mokutil.mk
@@ -14,6 +14,7 @@ MOKUTIL_DEPENDENCIES = \
 	efivar \
 	host-pkgconf \
 	keyutils \
+	$(if $(BR2_PACKAGE_LIBXCRYPT),libxcrypt) \
 	openssl
 
 $(eval $(autotools-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
