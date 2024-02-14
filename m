Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C1EC48BC3
	for <buildroot@archiver.kernel.org>; Wed, 14 Feb 2024 18:29:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DDE944010D;
	Wed, 14 Feb 2024 18:29:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b9B6vPg8gwjX; Wed, 14 Feb 2024 18:29:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3DA74052E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3DA74052E;
	Wed, 14 Feb 2024 18:29:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 85BA71BF57C
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 18:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 727F0402BD
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 18:29:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uOvA1w6xAPR8 for <buildroot@lists.busybox.net>;
 Wed, 14 Feb 2024 18:29:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.47;
 helo=mail-wm1-f47.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 89DEE4010B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89DEE4010B
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 89DEE4010B
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 18:29:37 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-411e71d8a2bso192965e9.1
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 10:29:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707935375; x=1708540175;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K0kCHSe/SfFE2ug/CXGaFp/wwZTv3v+y7eBzQT8Y2uE=;
 b=DUq5ilLYCXaI3XHrcT7TxkWYtFHSD3w3ne6vxuEbz7NtGPShWDIJ7lsMsTUPJAB7U2
 oKdWM2hDHDlk62g4WSvz+veUAa+/iV51ciurEFlDMS6rMvv9qrVuD7cKxIb6afGqZQ0c
 HI0btxpvmK1JB1pTh3DlUpG0YLPzOLLOfbNQFvDcKQHp3hJ+9Vo//FZgRPY3nDzcIakP
 RWLOrvDulQ733wAAZcLF7DrkOEq5o+cqrYE3R63nNbLPpZBfiFY9jwLxIieH4gjoqVMP
 +/r5fHe+WZZ9fQuF8e0SUwuwbxdaX6RzBASZtKIr6RwAACpQ0GU0pILoiHmKcK/qFNeR
 XDpQ==
X-Gm-Message-State: AOJu0YyYAiR5qaiOXyuf3dtdMs8tQtRBQvT3zA+P46ejR5oeIBtY1F1C
 4jVu0yEikBj6Zzt/7aNn6ZhM8xLTcyAItg8x0XiK6jjI2Svb0Z/Oxr2DSZvX
X-Google-Smtp-Source: AGHT+IF3r6xiPm5UBK/dDn24zbT1cGjgoFlaVFmEltdGdZRnx+6uSzt6LW2Oz3rmTXnoBlA7dY93qQ==
X-Received: by 2002:a05:600c:4ba2:b0:410:e41a:fc0d with SMTP id
 e34-20020a05600c4ba200b00410e41afc0dmr2710201wmp.24.1707935374960; 
 Wed, 14 Feb 2024 10:29:34 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXLfcvlEN/A6Ob/GNsEuHA4yytRAME4xCXkTolmTjbgS7m+vnFx6DSDaodb9LZHMFWkGxx1EZIsoDov9yDYYnn8hbNcOVwcihvm6ZQ2pzJK4fA3hwfnRDUkSRL+hKxP/anoGYLXkYbtv790T7GjU32Tgv2kNyPK8IcvUd6r
Received: from thomas-Precision-7670.barco.com
 ([2a02:a03f:eb68:2f00:f03a:52f2:4b05:fc4e])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a05600c0a4b00b004105528c61fsm2702876wmq.35.2024.02.14.10.29.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 10:29:34 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Wed, 14 Feb 2024 19:29:31 +0100
Message-Id: <20240214182931.116813-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1] package/weston: fix auto seatd daemon
 selection
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 9d6f966f9ad012879bb472896eb35eeda5baa9ab
  "package/weston: don't select seatd daemon if we have logind",

added a fix to only select BR2_PACKAGE_SEATD_DAEMON if
!BR2_PACKAGE_SYSTEMD_LOGIND, but that conflicts with
BR2_PACKAGE_SEATD_BUILTIN, which is selected by default in the seatd.

Add the same logic here, so that it is possible again to select
either the built-in or the daemon option.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/weston/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index db6a78ee8a..6bc43c73c2 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -19,7 +19,8 @@ config BR2_PACKAGE_WESTON
 	select BR2_PACKAGE_LIBINPUT
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_SEATD
-	select BR2_PACKAGE_SEATD_DAEMON if !BR2_PACKAGE_SYSTEMD_LOGIND
+	select BR2_PACKAGE_SEATD_BUILTIN \
+		if !BR2_PACKAGE_SYSTEMD_LOGIND && !BR2_PACKAGE_SEATD_DAEMON
 	# Runtime dependency
 	select BR2_PACKAGE_XKEYBOARD_CONFIG
 	select BR2_PACKAGE_WESTON_SHELL_DESKTOP if !BR2_PACKAGE_WESTON_HAS_SHELL
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
