Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86173C47073
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 11:41:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18F2441817;
	Sun,  7 Jan 2024 11:41:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18F2441817
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s-1Unak9yR5N; Sun,  7 Jan 2024 11:41:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BAC441B4F;
	Sun,  7 Jan 2024 11:41:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BAC441B4F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1B8CA1BF292
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 11:41:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E788182718
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 11:41:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E788182718
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FjiAAJWmasWB for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 11:41:07 +0000 (UTC)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2629B8271D
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 11:41:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2629B8271D
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3368d1c7b23so1010362f8f.0
 for <buildroot@buildroot.org>; Sun, 07 Jan 2024 03:41:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704627664; x=1705232464;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8zNK3PPUInJmWNXS5uTJ6n3dl1FXrqAPC1rkwUygoAo=;
 b=BLT1HzE+9PAxVGkKCcFZ72hNtuintimtNQpGWtd8cC0r8DsQq6EuWFKi9/AATLuEQk
 /BCYyXb0xpbrmMq0suw7KTqe3qy/6OoAWTqXtR4IooxczoUNTi+xHww3P3JEfnSG/Pet
 eEu8CULvTTL1EgciiPlFmUT+ygAX9l9xpBlQSoml3Z+Q0FK2vVyb+fmE6BMdO62/aHvb
 nmGQgdDdPEzZbAScrxACUy/DuPesaLelHsPDR54W0nLn7SViXHToxcMOWpG3kBZMqZpJ
 v4DNBJwuLavY8hGwIcECbLtPy8iBc4sSMzCjlr0l9gLQtByvE9DlM0KZA1ROsWoJ98ZQ
 aeGg==
X-Gm-Message-State: AOJu0YyscLFdI9ensZMFrvBvpjZrOzhhTc+dNJhI4hbH0Vqsw5ePLjV3
 ni0ffCf8sp0mp13h+FLabfwULNtSeaE=
X-Google-Smtp-Source: AGHT+IFeAhLEtmsu3BQ6sm5FqzDpoLP1TDBCBBxihnv5AxgP+Ed19J6BD1tTXXihU0WSlGk1/8illw==
X-Received: by 2002:a05:600c:518d:b0:40e:4556:5870 with SMTP id
 fa13-20020a05600c518d00b0040e45565870mr286338wmb.120.1704627663966; 
 Sun, 07 Jan 2024 03:41:03 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 g11-20020a05600c4ecb00b0040d2d33312csm7421331wmq.2.2024.01.07.03.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jan 2024 03:41:03 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Jan 2024 12:41:01 +0100
Message-ID: <20240107114101.2793416-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704627664; x=1705232464; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8zNK3PPUInJmWNXS5uTJ6n3dl1FXrqAPC1rkwUygoAo=;
 b=mz0QYrPB4OxOV36+D0nnhSamDs1LTUzQuzkE3Eljgv0TTi82fYHIXNoRfRLrGudoK5
 J+jdVQJDjuj8FUXqMOd6IkJpKwncUj43RvNm7ex/YrUmQMdoFkQzXdgjXNQyaCdLNu5p
 BpWMzmQKwb3uwxbRYUBwBOY9K/02g6I55FPanGEch+w7xWFLSy3YeyTIJflZb9SG+2IA
 zOFbqlSkv/6KJQkvABX7gZTEGIepgbUv9yMxhjfD/23MiCPLv5jgenu6qxXC6MJJuNY4
 pTay4Mklt9RhLHxKzLVFbAMcVLJZT2vUdWpTZoORbRd9I5lrcUsgLWCo+U8O/U92U6Am
 NzLA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mz0QYrPB
Subject: [Buildroot] [PATCH 1/1] package/libreplaygain: update
 LIBREPLAYGAIN_VERSION
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

Update LIBREPLAYGAIN_VERSION to match what is returned by
https://release-monitoring.org/project/370816

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libreplaygain/libreplaygain.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libreplaygain/libreplaygain.mk b/package/libreplaygain/libreplaygain.mk
index ff0950c43d..129eb90d5f 100644
--- a/package/libreplaygain/libreplaygain.mk
+++ b/package/libreplaygain/libreplaygain.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBREPLAYGAIN_VERSION = r475
+LIBREPLAYGAIN_VERSION = 475
 LIBREPLAYGAIN_SITE = http://files.musepack.net/source
-LIBREPLAYGAIN_SOURCE = libreplaygain_$(LIBREPLAYGAIN_VERSION).tar.gz
+LIBREPLAYGAIN_SOURCE = libreplaygain_r$(LIBREPLAYGAIN_VERSION).tar.gz
 # upstream doesn't ship configure
 LIBREPLAYGAIN_AUTORECONF = YES
 LIBREPLAYGAIN_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
