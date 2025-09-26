Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B3C7CAC5AE
	for <buildroot@archiver.kernel.org>; Fri, 26 Sep 2025 10:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19DEC40D02;
	Fri, 26 Sep 2025 10:06:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i0ydr8CjGSCC; Fri, 26 Sep 2025 10:06:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3439E40CCD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3439E40CCD;
	Fri, 26 Sep 2025 10:06:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 235C8177
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 10:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A3E441D5F
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 10:06:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fl1iTBzfqnWZ for <buildroot@buildroot.org>;
 Fri, 26 Sep 2025 10:06:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2F394400A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F394400A4
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2F394400A4
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 10:06:15 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-46e2c3b6d4cso13158355e9.3
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 03:06:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758881174; x=1759485974;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vBOqFuz0jxZa1vBrq7f1YDBoGQSJL9EM1haGjjDNW0s=;
 b=b4n9ASFdqCPzbVcaNc9xBwbRTI51b13vzogH6ZXx/RGrTxGFfClqnbKepp8PT+ABpZ
 XQAi45pXBNVO8jQXEi2f8PrzrfphOR/ibz+HOpLsXcZDUcJQ8K+wc72IwZNKIg/K10IX
 A5r18zAwu8T9JTw27D6mHOiDQ37HUrX695M4D0Ow2ciKV/QG+oq/glfYShGADbSEmPV1
 zR2fDEBALdKmCj7FEEWGKqCGMt457w+zLaE/zbo/2DopN92RZKx0+SqSWyO+zVpfspkB
 iHUyFCyBWoSFl0Jm1N/vhU8P8shz1CM16XKehrR+X75bnhlwATv3R1C+SyFDxzDDigjE
 EvbA==
X-Gm-Message-State: AOJu0YzoHqpxsv0KVsRYsvvxRyO9ub8Eh9VUEseeAIiPzGyUtcJaH7Y9
 CrPna/PtqSG2I9uzjzCQsSA7MMU6mssYG6mdSGS+8UZlkeToHp6UXVq8nye6CKuLt2e6CyMQGmT
 rsy4G4UM=
X-Gm-Gg: ASbGncsCGAvKwTc5kRnR9oY8mBSBbr6waqfI+FQWVpsz4IbONnXQi2tSqlsjgOK+fs+
 JLupC39XgNIsYTNCpR/SqhdSvf4dEf23YpnlNg9/wqGYL6I+g5dsoGJDD18JZ1iDju1Jbf8y15S
 nUpOXn4pofpjJCe3GZ8MUGsnAueRSouuxDq/9B40zwJc3805D5kA/gprwV9WoLP8k64SgDMLREt
 1HMySB6KbB6QSK40N06AH2j5mOYJ2T2AxtiE/Yeq8eomJNaR7UO2GLr50Rba5U1XzVv7xxDLh4k
 2GqXvb3NHSe595so0/CKrBt7gnYRsLC3SQaX0//VUltLaLBIG/BKDAsajx4voALPq0dLQhB0gGT
 4ACnh5wiCTuRfn4rhprGBiYTPdILvdohb7u+B+fHvPgsqpbFx5asbI/+IdCi7ndE=
X-Google-Smtp-Source: AGHT+IGI526GV9vB193dp+TiLe1N8eB5W+v5I2TvNiW0sakI9NDjnjOuzBsTSBtCzOCJ4YE9lS0hAw==
X-Received: by 2002:a05:600c:1e85:b0:45d:d5df:ab2d with SMTP id
 5b1f17b1804b1-46e32a03456mr62763825e9.26.1758881173711; 
 Fri, 26 Sep 2025 03:06:13 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.179])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2ab62233sm112622825e9.21.2025.09.26.03.06.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 03:06:13 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Christian Stewart <christian@aperture.us>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 26 Sep 2025 12:06:05 +0200
Message-ID: <20250926100609.4158676-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250926100609.4158676-1-dario.binacchi@amarulasolutions.com>
References: <20250926100609.4158676-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1758881174; x=1759485974;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vBOqFuz0jxZa1vBrq7f1YDBoGQSJL9EM1haGjjDNW0s=;
 b=rzr3dfP3UMTSfrLD8k+UM0J8p6TfYpbReA/AolA9/EyLc+gCPqccW+sgwk7Z3phZa7
 VKs+MkyTX54IdQhEaUlmkuYkBhQsQzbSUWen6Y8aqzZcVrqKfyoEtwOvLpjNhkoZ8Xke
 XkeAUkE480tKkMnKJxlpbRmdeM9sg7XbC3+J8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=rzr3dfP3
Subject: [Buildroot] [PATCH 2/6] package/libcamera-apps: fix
 LIBCAMERA_APPS_VERSION
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Make LIBCAMERA_APPS_VERSION compliant with release-monitoring.org.

Fixes: c6252c2e50b7fe555f62cbf38fdde8ba540f00ea
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/libcamera-apps/libcamera-apps.hash | 2 +-
 package/libcamera-apps/libcamera-apps.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcamera-apps/libcamera-apps.hash b/package/libcamera-apps/libcamera-apps.hash
index b11ea7fe67ca..0be04e44fbdc 100644
--- a/package/libcamera-apps/libcamera-apps.hash
+++ b/package/libcamera-apps/libcamera-apps.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b5535933ebc398616fd1b261fa9e3755dfb419e10ee7866078a8a8d99f54a59a  libcamera-apps-v1.7.0-10-ge9645231008146fa0e75c2b3e0ff8c48ad70511a.tar.gz
+sha256  b5535933ebc398616fd1b261fa9e3755dfb419e10ee7866078a8a8d99f54a59a  libcamera-apps-1.7.0-10-ge9645231008146fa0e75c2b3e0ff8c48ad70511a.tar.gz
 sha256  36dfed86bdef661a0a14ec1a1cc84c771d5a06b6f9b92e9ebb610ba711bd528a  license.txt
diff --git a/package/libcamera-apps/libcamera-apps.mk b/package/libcamera-apps/libcamera-apps.mk
index 06efb9a960ca..700cc9947a84 100644
--- a/package/libcamera-apps/libcamera-apps.mk
+++ b/package/libcamera-apps/libcamera-apps.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBCAMERA_APPS_VERSION = v1.7.0-10-ge9645231008146fa0e75c2b3e0ff8c48ad70511a
-LIBCAMERA_APPS_SITE = $(call github,raspberrypi,rpicam-apps,$(LIBCAMERA_APPS_VERSION))
+LIBCAMERA_APPS_VERSION = 1.7.0-10-ge9645231008146fa0e75c2b3e0ff8c48ad70511a
+LIBCAMERA_APPS_SITE = $(call github,raspberrypi,rpicam-apps,v$(LIBCAMERA_APPS_VERSION))
 LIBCAMERA_APPS_LICENSE = BSD-2-Clause
 LIBCAMERA_APPS_LICENSE_FILES = license.txt
 LIBCAMERA_APPS_DEPENDENCIES = \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
