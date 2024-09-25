Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3877CF58ED
	for <buildroot@archiver.kernel.org>; Wed, 25 Sep 2024 13:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE2194013D;
	Wed, 25 Sep 2024 13:37:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3z46zp1KzZXE; Wed, 25 Sep 2024 13:37:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79FC04015A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79FC04015A;
	Wed, 25 Sep 2024 13:37:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 40B501BF3C0
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 13:37:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 30B458480E
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 13:37:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3WKzcIGijP0d for <buildroot@lists.busybox.net>;
 Wed, 25 Sep 2024 13:37:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 23570847AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23570847AA
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 23570847AA
 for <buildroot@busybox.net>; Wed, 25 Sep 2024 13:37:27 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-42cae102702so55532005e9.0
 for <buildroot@busybox.net>; Wed, 25 Sep 2024 06:37:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727271446; x=1727876246;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PBE8xrv8piZPaJYxtUklfE9BTgCvSetPVEJf95S+ibI=;
 b=A+tLxYcNYhoXWhJHplNdjfQ/Z25d6YG8N8w1LvPt600TFF/1/69/wkSWz7p0thrWtG
 lJGyGj2766rWPyHqHtgCnO0lrpXuAANrg11hUjMo4wbTkdcIHEJp2BEBeQbl4E3IBoI+
 wrRFX5ZsJm85xr7w+DscbiEYP+wqsE5LC9YEoBroQOSJG6va6rJDgOcMeebb0LtLGzaO
 JN/8pPLOd9Ixnw6o7+SdQpGrSGqTUTqAh9X6toTeIuLlWIB0RiSAEwQq66oIMPfZUOzT
 oxpvm181kgzpAiROJ2iEDKnNsVt6sQgv8lhUgfWz4L2sSMcQscDgUe1d0IclnOMIUpga
 es9g==
X-Gm-Message-State: AOJu0YzZy6Q5J5h/Jb2qF8nk2L+dvmmr+1exd7LFiMIwDGNmxtoPfcat
 tYqMXG9FTYa0wSoJ9iTllRQlzSu886wIE2Y3W/JdxOWaX/J7FVboJE0bTRw7EXB+TGbULCsCZAc
 Gaw==
X-Google-Smtp-Source: AGHT+IFf3eAKwTyVeZYgqH7WDqc9hzBYKBumjDGDvQSznfGAcbw5VmUpMeJsvkTAux0J6rGlIaCLWQ==
X-Received: by 2002:a05:600c:4f55:b0:42a:a6d2:3270 with SMTP id
 5b1f17b1804b1-42e96118adamr19307465e9.21.1727271445717; 
 Wed, 25 Sep 2024 06:37:25 -0700 (PDT)
Received: from vm-2404.. (55.6.65.37.rev.sfr.net. [37.65.6.55])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e96a36597sm18913075e9.31.2024.09.25.06.37.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 06:37:24 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 25 Sep 2024 15:37:21 +0200
Message-ID: <20240925133721.3899846-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1727271446; x=1727876246; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PBE8xrv8piZPaJYxtUklfE9BTgCvSetPVEJf95S+ibI=;
 b=JE7IviibDYv9LfBmHC59OFM5cUmJaUbLxDfYY4wxeN6ve7Z4BT/lElDfEasHTOm52V
 hhlYovjWdoUNC2B0Fa6bDxIkjYQYTwoIHTwYRt0G0IijgTioc2ABoKqStkRtq1ngnO6V
 T3GM4vob3knGuM1DNAfr+GcC+Actgy+uMpHQ+43ZPR1Ny6AdL2ki8/iCz90B9+S133gz
 DsolYk+qz0z2qYKSwSuj3rVSYD4Ebs29P9zDorMM0QZv7k2GolUlHKYLk1zRsAMik2Jb
 MogtUGb0Iu6f/i4JI1RhlWbW6Xf3epaATY9pc7IeY+WG/ZflHOZ4KC2jzEckRvr/DmzW
 9KoQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=JE7Iviib
Subject: [Buildroot] [PATCH] package/hicolor-icon-theme: bump to version 0.18
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

switch to meson build

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/hicolor-icon-theme/hicolor-icon-theme.hash | 2 +-
 package/hicolor-icon-theme/hicolor-icon-theme.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/hicolor-icon-theme/hicolor-icon-theme.hash b/package/hicolor-icon-theme/hicolor-icon-theme.hash
index ec9635f05..5bff03fe4 100644
--- a/package/hicolor-icon-theme/hicolor-icon-theme.hash
+++ b/package/hicolor-icon-theme/hicolor-icon-theme.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  317484352271d18cbbcfac3868eab798d67fff1b8402e740baa6ff41d588a9d8  hicolor-icon-theme-0.17.tar.xz
+sha256  db0e50a80aa3bf64bb45cbca5cf9f75efd9348cf2ac690b907435238c3cf81d7  hicolor-icon-theme-0.18.tar.xz
 sha256  b0a64377d4ee87b7dbcf418ce4fb33ec3b2d7081b6732890e4af06b8118c4526  COPYING
diff --git a/package/hicolor-icon-theme/hicolor-icon-theme.mk b/package/hicolor-icon-theme/hicolor-icon-theme.mk
index 088aecf31..f3368a292 100644
--- a/package/hicolor-icon-theme/hicolor-icon-theme.mk
+++ b/package/hicolor-icon-theme/hicolor-icon-theme.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-HICOLOR_ICON_THEME_VERSION = 0.17
+HICOLOR_ICON_THEME_VERSION = 0.18
 HICOLOR_ICON_THEME_SITE = http://icon-theme.freedesktop.org/releases
 HICOLOR_ICON_THEME_SOURCE = hicolor-icon-theme-$(HICOLOR_ICON_THEME_VERSION).tar.xz
 HICOLOR_ICON_THEME_LICENSE = GPL-2.0
 HICOLOR_ICON_THEME_LICENSE_FILES = COPYING
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
