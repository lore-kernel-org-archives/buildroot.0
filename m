Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53FDDC3DA7A
	for <buildroot@archiver.kernel.org>; Mon,  2 Jan 2023 12:22:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2D55415A3;
	Mon,  2 Jan 2023 12:22:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2D55415A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CLV-9nf9CaJb; Mon,  2 Jan 2023 12:22:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0404D4155E;
	Mon,  2 Jan 2023 12:22:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0404D4155E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 390D21BF33E
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 12:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 148A780D7B
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 12:22:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 148A780D7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bI8fDNpBwoyE for <buildroot@lists.busybox.net>;
 Mon,  2 Jan 2023 12:22:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09A6281349
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 09A6281349
 for <buildroot@busybox.net>; Mon,  2 Jan 2023 12:22:16 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id y8so26134352wrl.13
 for <buildroot@busybox.net>; Mon, 02 Jan 2023 04:22:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vf4zCKyU9Bmird34m3Z3qNUu8YMntngChzDoewbjzsg=;
 b=o3a8qiA6owtRFwPto89J+vOKUepvpQIoKjJHKy1pXIr7Oy1EW7jKVjJZ2MAINQpU0w
 +oox7bmvguuZdPSdPvuF5g2e9AHgonpMj2hrMgspGgm4IFc9OgfkHUI4fbRTdLTKPOEs
 zTKyhw2auAXRjjS28oTyPq9CybcvYu11gxcXuiA45q3tO/P2qmF9SYA2U8Eama+bdZU9
 q18gZXwiqyoGGcO19s5+FYUg0JmTpqUgrGPgZqKsT9oxWYg6rN0RCx+ekzvAcUQ9U/Cz
 C2X5cnRdoI4rQMFmx77XVqfhWGi03oalYjS3jmBe2KyBvCgyFg6BSLaYpk/zgMU/dl3Y
 Hvbw==
X-Gm-Message-State: AFqh2kqLscceqn6x2wPB0mIJfW7yAIcMtrYtPMvsZHzLxkvhB4lgC75R
 KRzV5B8qyu8kfWX+XPm2I7fzt+b35Ns=
X-Google-Smtp-Source: AMrXdXuoG1l54cE0CW551me1ZfescJUeG4XaCZlrN5iqSY09b9DPNgZm8vcYvq56dNdZfUMP9UYWIQ==
X-Received: by 2002:a05:6000:12ca:b0:273:10f7:5c43 with SMTP id
 l10-20020a05600012ca00b0027310f75c43mr22337691wrx.50.1672662135268; 
 Mon, 02 Jan 2023 04:22:15 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 o5-20020adfe805000000b0028cc9d2ec1csm13865759wrm.54.2023.01.02.04.22.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 04:22:14 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  2 Jan 2023 13:22:10 +0100
Message-Id: <20230102122210.1912367-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vf4zCKyU9Bmird34m3Z3qNUu8YMntngChzDoewbjzsg=;
 b=B/aqIVNk2puDpN3bHjY/elSj42VulxPe4wRbCyU1QClGxj4NQ2fbxSHbB56e2FzdBa
 UDD/x4+R3Ez5ptg/hwO0wSwfA9P5UCt85zLKmlx7KKNhLYiOMOa0Yo5M4jXWndqgnAAj
 QPEqfoCSNiIorFmy7/nnem3TlEI5TJyZhT3PxnLfn/tyKgNQ4MoOil1nIBwqc4CvNgUi
 czTpJq+iMXkbp95S75BcAZGXrzYNb+HMatRRNsBbwsH/JcbfM8WI8zGVhe0QS9GtHDsD
 Ucps5nL0UAtq09rpnRZLJ8i1ePsSP7P6zueuRrEIL0zCREM79UXRf0IA2eLnbZf6Sull
 32Fg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=B/aqIVNk
Subject: [Buildroot] [PATCH] package/readline: bump to version 8.2
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/readline/readline.hash | 4 ++--
 package/readline/readline.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/readline/readline.hash b/package/readline/readline.hash
index b0530a2d7..627746d82 100644
--- a/package/readline/readline.hash
+++ b/package/readline/readline.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature from
-# https://ftp.gnu.org/gnu/readline/readline-8.1.2.tar.gz.sig
-sha256  7589a2381a8419e68654a47623ce7dfcb756815c8fee726b98f90bf668af7bc6  readline-8.1.2.tar.gz
+# https://ftp.gnu.org/gnu/readline/readline-8.2.tar.gz.sig
+sha256  3feb7171f16a84ee82ca18a36d7b9be109a52c04f492a053331d7d1095007c35  readline-8.2.tar.gz
 
 # Hash for license file
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/readline/readline.mk b/package/readline/readline.mk
index b1fd181b7..66812dee7 100644
--- a/package/readline/readline.mk
+++ b/package/readline/readline.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-READLINE_VERSION = 8.1.2
+READLINE_VERSION = 8.2
 READLINE_SITE = $(BR2_GNU_MIRROR)/readline
 READLINE_INSTALL_STAGING = YES
 READLINE_DEPENDENCIES = ncurses host-autoconf
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
