Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F71C47073
	for <buildroot@archiver.kernel.org>; Thu,  4 Jan 2024 07:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7C7D60BBF;
	Thu,  4 Jan 2024 07:22:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7C7D60BBF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MaRrXH6m4gZS; Thu,  4 Jan 2024 07:22:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CCF960B46;
	Thu,  4 Jan 2024 07:22:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CCF960B46
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2E2111BF422
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 07:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B23E82BBA
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 07:22:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B23E82BBA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JlEXrWrXm8oi for <buildroot@lists.busybox.net>;
 Thu,  4 Jan 2024 07:22:54 +0000 (UTC)
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2D62082A4F
 for <buildroot@buildroot.org>; Thu,  4 Jan 2024 07:22:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D62082A4F
Received: by mail-qk1-x736.google.com with SMTP id
 af79cd13be357-78117e97becso14801285a.3
 for <buildroot@buildroot.org>; Wed, 03 Jan 2024 23:22:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704352972; x=1704957772;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=coOot82/wXxf8G71J6YTQaREhZuXGX2v7Bs05vwHIIk=;
 b=FMiMok9gd0k4H7Og1/f4cTKFfuk7oZ7pfJa/pwydloYS5wdzX3mNhS7Ze+PPfrKG4L
 dMyp4n3/qvLXEWFHYqF6jAMie7J922qvsB1OtyB9/nlcl5shJXTcKUWgPCVZ/6mjPfTC
 jVq/KUS5RV1Ik+LiucME5JqGnrOC3ocZyzPP91E2+KFiNKxn6ee1JMAav5kiDcu+ROSn
 MJtjQZZi7hDmwrA92rNfr19Ye2cDW8LWiroD8aMgRgs4b47UMByd6a9ffXGHwNpmnnl3
 aLeXQ68CK1/BrdzdO3eAnv2axpnSe0KgGZdBglkd56orcJUv5vejIoNZAfUmPDBMFmHz
 HBdQ==
X-Gm-Message-State: AOJu0YxhjzL/xgI//znK6bTkGtqR65q5isQd8VhLiwnXLDqIu/KYGewg
 CpQ+60+mOQkA6Mvhuxz3ha0uraVFlSfeZA==
X-Google-Smtp-Source: AGHT+IGlVlilJOszi4e2XOPYuqgmEfMCvLvokAfe/olo8HokdAJQpEYaKImqh6LVtGLfpkxANuMMZg==
X-Received: by 2002:a05:620a:284b:b0:77f:3f7d:b4a0 with SMTP id
 h11-20020a05620a284b00b0077f3f7db4a0mr202364qkp.62.1704352971923; 
 Wed, 03 Jan 2024 23:22:51 -0800 (PST)
Received: from hthiery.kontron.local
 ([2a02:810b:5a40:2a43:7200:ad55:a3ad:7bab])
 by smtp.gmail.com with ESMTPSA id
 x9-20020ae9e909000000b007815c99209csm6382648qkf.131.2024.01.03.23.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jan 2024 23:22:51 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  4 Jan 2024 08:22:39 +0100
Message-Id: <20240104072238.37701-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704352972; x=1704957772; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=coOot82/wXxf8G71J6YTQaREhZuXGX2v7Bs05vwHIIk=;
 b=IxvSOz2KV/ZvmpPcErETBBljkETNyXwrD8N763JpSrSW8HEU7c5/d/5bubi0qgt3/e
 U3iyj8y7RcOq8sUj+8yXYYOKFiWPsOiszJherYAoKaUAoh0ZOl2gccrJche4YfZ3j1hx
 gnZu/i//G5Om54fmrciR5GnHfJYU2GBgMlX8VzIi8+9xe1SmNXxnjjG87G9lJ//nacHp
 Wo/HYPTF4lgQRAia/ubius0PZjjxx9CYspoRT0ZGt5/5+g5qNyhqqJRwVdkUXHUL0p8y
 bGKrFYS8geN/eNk1bUJy+yQpeF4+FndRVj5Kv7VY0osawkEJ/AFNzsSJTwbbX8hh3Qns
 YM/A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IxvSOz2K
Subject: [Buildroot] [PATCH] package/linuxptp: bump version to 4.2
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>, Petr Kulhavy <brain@jikos.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/linuxptp/linuxptp.hash | 2 +-
 package/linuxptp/linuxptp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linuxptp/linuxptp.hash b/package/linuxptp/linuxptp.hash
index edbfb44553..1d5c590ea7 100644
--- a/package/linuxptp/linuxptp.hash
+++ b/package/linuxptp/linuxptp.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  d27d5ef296bb3d285e22e69f75ae023b4b42a2f4655130d6d390d8afcbc3d933  linuxptp-4.0.tgz
+sha256  70e38e5d2764e0217443da6f14e8846fe401a472293ac138d8419c07a665447a  linuxptp-4.2.tgz
 
 # Hash for license file:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/linuxptp/linuxptp.mk b/package/linuxptp/linuxptp.mk
index 054442d569..e0ab82a2c4 100644
--- a/package/linuxptp/linuxptp.mk
+++ b/package/linuxptp/linuxptp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUXPTP_VERSION = 4.0
+LINUXPTP_VERSION = 4.2
 LINUXPTP_SOURCE = linuxptp-$(LINUXPTP_VERSION).tgz
 LINUXPTP_SITE = http://downloads.sourceforge.net/linuxptp
 LINUXPTP_LICENSE = GPL-2.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
