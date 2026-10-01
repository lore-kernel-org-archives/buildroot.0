Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABFF8CA5FD2
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 14:18:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4572C60873;
	Thu,  1 Oct 2026 14:18:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xPO5oZIzLUmp; Thu,  1 Oct 2026 14:18:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 45A70607F0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790864303;
	b=pgtiPmiAKYrTuTJeo7ab+xp8YC6/e2CVBILFiIE+ll1ykDHVI8+grbp4DGONQMTAydng
	 Jmk8mhYfl9Lb49UaKKjiAaCf0vlsnN4ERKXXDqRgW14d+b7wvPvzzK9KtVL6UqnVTFTLx
	 P+6K2V7phciP+fn8zb9LTrR7FSjYaYwJK+nhb1SO7S134uTwmYpzT+pLuKbYU50+8yVLf
	 rkXRXc4Q8e3/u8BvEtOrIHkw4qIlo9XH9ola5irUM3dR+CTrwTzlSE/fzxSBcpFC1eHQF
	 n2wCXL1Cwcokke2N1zZG1xYrNCyNSMOqON8BCfH9fqTnR2l23ZITqkW2/s7y/kjRSow==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790864303;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Google-Original-From:To:Date:Message-Id:X-Mailer:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=zCvSwVztAoHlbJhw4dqzUhJa8s1udjx7869P+1K8dW0=;
	b=pi7amG3YiT6ha9eAZrRHyOSr4Va1ut6hRTLMFml+BdO5wQAu6Yek98cu2fqzFGiB9DKJ
	 gW34X4avRJmTg/MnE0udkm5y6zPyRJYNYlKgCl3PNWNwqacBYi004T3gZe/R2PE8uLlfC
	 4zjA0TdWOWfCrCDRrQxUQ+09A6X5e+GSU6ILzI4BIue9tz5rR6JzFfUm2yVho96u9qVY2
	 vtaPIVO7DNW+HJNAqFFeFccS0HsMXkRBzkzUhqP4wQLJRAzYO/BVvWrFvzGBizpc41kr1
	 TFm5R4HB5B3kfrdT/Uty4edzV/jxWOsCeVrnWbN4YX8onTEmyH5jkr5e6GxRQYXaGgw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790864303;
	bh=zCvSwVztAoHlbJhw4dqzUhJa8s1udjx7869P+1K8dW0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=F8XBVd/K7UdsuwChPtzfYTgoDWKh5TwCit97tV+FsW8JalC1+AIoOOFDdz9hilxQu
	 +uLojfKBZGugwvyJ5i+KOsBJWDPcqS7F3YDw7RJUc/Ld8e3TpEuwMsR+DFN6KrbUec
	 Hvx52ABdp/vnN07HxSqnt9qZP8On0OdY5ZykxjODGCNVqMxQPGF3BJjAHGJwYryrKq
	 mr80SMlocZAnnvuHKqs0Yo+BPLpIvwPSQVDD88mb9PLUlM20xW+HIigl5T17XN6QdX
	 1HwZ8loNCDs8jJxmW6kOr1qiOFGqO0pHX2RsR9KCfM1C6SXwHAQJTln2kGUwv1d8Ml
	 pWQLjFMvHqi6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45A70607F0;
	Thu,  1 Oct 2026 14:18:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7309832A
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:18:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B90F440512
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:18:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qWNXwOdYBlQW for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 14:18:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 59A7240098
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790864299;
 b=VwZcL/uHGq/F7JzoLb6j/EpHmoo5vFQoi9hRNEySEOdL4tN73ff9PZf3AlUp5McACeut
 ECKHPg6t8Ksz5TrDGkp7l2fccGxmjKwzYPa4YE+ZrcrRNBqb5ywNafXkzxh2rEUZELZMB
 C8AymcaLSk41KMSICjeVp6KJcfIB01e0iDhI/J1sBDiGXSQLHV0msqmWPbbVtWcJBK76W
 uFCd/PqdXoLi0HSW928mxVIM0LniR6kLAO8s/7XPYK2nzyylc0zzUGmWCvolTASEhBPoJ
 VHlFf67gOcbYlOshkKu2DdIH7eipcAaYOXHSMEkTV1t758jTvdFx8CgzaS5dg4LWriQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790864299;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
 MIME-Version:Content-Transfer-Encoding;
 bh=6bxDEWXwWJP0t9ITnEMD6bVogPHbklLqqWzW2V4WesE=;
 b=PDUx3PsODd9L/WNYifbhTOC8i4pELcpYH1rB7sEH5TxREFv6em0FQtT/2GKFAAu0xwoU
 WUIrukTNJnJD71LbbIWWIGSaRa7gte0+MGDaiczvfawYF2pxkUHtPIDzTJKXgzdPVCaw2
 M/qiCsCPnfvzCom4XdrJuvpujYI9Nsc1tJu76WYdt/edwwNzjh3yY9koMlkr4sufL65f6
 hYJysytPVLsL44QSmVQMNhXNtGXsICC6mNBudtL23KHJkBHubY3wpxV+QuPH9L8ndoS9G
 aDg5H7qtp+k90FMpSSSawihxH+4/79nVS6DTgORBtHrELM0rE5DhRJJEVRF3DUhUyqw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=googlemail.com; 
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=Ox7quIFy; 
 arc=none smtp.remote-ip="2a00:1450:4864:34::f"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:34::f;
 helo=mail-ej2-x0f.google.com; envelope-from=yegorslists@googlemail.com;
 receiver=<UNKNOWN> 
Received: from mail-ej2-x0f.google.com (mail-ej2-x0f.google.com
 [IPv6:2a00:1450:4864:34::f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 59A7240098
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:18:18 +0000 (UTC)
Received: by mail-ej2-x0f.google.com with SMTP id
 a640c23a62f3a-c2e1d2d7dc9so125314066b.0
 for <buildroot@buildroot.org>; Thu, 01 Oct 2026 07:18:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790864296; x=1791469096;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6bxDEWXwWJP0t9ITnEMD6bVogPHbklLqqWzW2V4WesE=;
 b=WK56ixxI29vnJJfNT+qn50zJZFpOPgjaoJgIKGygpnnye15iRAvYfoj5TXZB/OMfmI
 hPriaNeQPx+ZCTdLv0eNHeQOpwNIGyyIhOhYiojOnmEsXi/t5bRnSYy0lJTTxEUqA+0L
 o5RtzEsYld/9Bdjuy35q8TBVpD6Z+vsMEvDORTNuFHvGgEe6M5UensKEKci/+JneFoQ2
 PzNL1OtcZuwgTvxk/DUtdANqGz64i8pSa00xr6e/7y9zD/G/3U5V+KaXZC+luGLkqfKO
 ROINNRT6RFE7ze0M61TO/ETkFd3o1nazbYX4Fm3PBdTM1tTEHme6gxOZED1y+g4F6plD
 OuHA==
X-Gm-Message-State: AFuF++mdorK1dOU1cOBKw1+8PT+cpu1RL1W9VGvzGZT2vcSsG6xEE6bS
 AhGHo1f4//8cpaV1sol69bgVK7sRZaI2gWKrnFHAj3MLKFgKSo0qVafKUxgRpQ==
X-Gm-Gg: AYBFou31PPn+vOiavpY0aLzklohrjb3kvoj7E32HJLvRNMJQfrfCpYAqGHQB15FMJxi
 QMFnwJ3fH2U5ti7yRuKRfPaQe2jc5wFADv98yndrNQtwuywLNBPSlkHi1l6eHmlXL67k4ayYhpI
 5EUkB7UzZfdtTOgMA0d5aSHtMpKgjqJdNwiMA4I2B8lV9Z3lUYogPYSvPBMO26qOCDjqk3DqvIk
 TO1cvJNzKTeeb0TIC8AmMmhz9yl4AK2ds3IIz1KJLaGHLhdz5/dnPoMXrg9Jgs00c+55w89zmQZ
 kU9zxY+sfsgNg9rGo7i0O+Vmgpp7OGVHp+GoFL2FYFE0ApIMr8Z6+IdI7h7T5SJqRzGW5t3Qb7J
 Y27SS1TKU7r+sd59A2s0dCJ3Iy7GEy6vT2QtqqQ2UnMOfh9mQN+MOOvQWqMaY8PNg5xH42zQcC5
 95JHvBcJR7kQvgDbBCeMfpwRoW1r0/9L0Jo54dWAbOqdnWNuPxa18TvEQJbfBjmFY/ev3xt3P/S
 Zqrzb/ZlfMxvN4NZCabMkz8Cr6WYrfEDnjIr0Yg3ifIVyE=
X-Received: by 2002:a17:907:8997:b0:c29:4b57:503e with SMTP id
 a640c23a62f3a-c2e33c75807mr291494466b.1.1790864296323; 
 Thu, 01 Oct 2026 07:18:16 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2e31d39b3dsm172288966b.42.2026.10.01.07.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2026 07:18:15 -0700 (PDT)
X-Google-Original-From: Yegor Yefremov <yegorslists@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  1 Oct 2026 16:18:04 +0200
Message-Id: <20261001141804.833216-1-yegorslists@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/erlang: fix build with BR2_TIME_BITS_64
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Will Newton <will.newton@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

erts/emulator/sys/unix/sys_time.c undefines _FILE_OFFSET_BITS before
including system headers. With BR2_TIME_BITS_64=y, Buildroot passes
-D_TIME_BITS=64, which glibc only accepts together with
_FILE_OFFSET_BITS=64, so the build fails with:

  error: #error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"

Backport the upstream commit that removes this ancient workaround.

Fixes:
https://autobuild.buildroot.org/results/72443d8e794451cbc4063e906d6b2405021cb52f

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 .../erlang/0002-otp-Fix-build-on-Yocto.patch  | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 package/erlang/0002-otp-Fix-build-on-Yocto.patch

diff --git a/package/erlang/0002-otp-Fix-build-on-Yocto.patch b/package/erlang/0002-otp-Fix-build-on-Yocto.patch
new file mode 100644
index 0000000000..9f4de3508e
--- /dev/null
+++ b/package/erlang/0002-otp-Fix-build-on-Yocto.patch
@@ -0,0 +1,80 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?John=20H=C3=B6gberg?= <john@erlang.org>
+Date: Wed, 13 Dec 2023 16:34:04 +0100
+Subject: [PATCH] otp: Fix build on Yocto
+
+A workaround to avoid breaking "micro level process accounting on
+/proc/self" broke the build on Yocto. As this is a really ancient
+workaround (pre-2009) and the comment is unclear about what
+actually breaks, we'll try removing it to see if this is still a
+problem.
+
+Upstream: https://github.com/erlang/otp/commit/c38fc7c62e818273870340f3faf83cc3905e1cf1
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ erts/configure                    |  9 ---------
+ erts/emulator/sys/unix/sys_time.c | 10 ----------
+ make/autoconf/otp.m4              |  9 ---------
+ 3 files changed, 28 deletions(-)
+
+diff --git a/erts/configure b/erts/configure
+index 1d573b4..0b046dd 100755
+--- a/erts/configure
++++ b/erts/configure
+@@ -24417,15 +24417,6 @@ else $as_nop
+ /* end confdefs.h.  */
+ 
+ /* gethrvtime procfs ioctl test */
+-/* These need to be undef:ed to not break activation of
+- * micro level process accounting on /proc/self
+- */
+-#ifdef _LARGEFILE_SOURCE
+-#  undef _LARGEFILE_SOURCE
+-#endif
+-#ifdef _FILE_OFFSET_BITS
+-#  undef _FILE_OFFSET_BITS
+-#endif
+ #include <stdlib.h>
+ #include <unistd.h>
+ #include <string.h>
+diff --git a/erts/emulator/sys/unix/sys_time.c b/erts/emulator/sys/unix/sys_time.c
+index eb2c47b..f60e345 100644
+--- a/erts/emulator/sys/unix/sys_time.c
++++ b/erts/emulator/sys/unix/sys_time.c
+@@ -22,16 +22,6 @@
+ #  include "config.h"
+ #endif
+ 
+-/* These need to be undef:ed to not break activation of
+- * micro level process accounting on /proc/self 
+- */
+-#ifdef _LARGEFILE_SOURCE
+-#  undef _LARGEFILE_SOURCE
+-#endif
+-#ifdef _FILE_OFFSET_BITS
+-#  undef _FILE_OFFSET_BITS
+-#endif
+-
+ #include <stdlib.h>
+ #include "sys.h"
+ #include "global.h"
+diff --git a/make/autoconf/otp.m4 b/make/autoconf/otp.m4
+index f543101..984ee1a 100644
+--- a/make/autoconf/otp.m4
++++ b/make/autoconf/otp.m4
+@@ -2705,15 +2705,6 @@ dnl
+ AC_MSG_CHECKING([if gethrvtime works and how to use it])
+ AC_RUN_IFELSE([AC_LANG_SOURCE([[
+ /* gethrvtime procfs ioctl test */
+-/* These need to be undef:ed to not break activation of
+- * micro level process accounting on /proc/self 
+- */
+-#ifdef _LARGEFILE_SOURCE
+-#  undef _LARGEFILE_SOURCE
+-#endif
+-#ifdef _FILE_OFFSET_BITS
+-#  undef _FILE_OFFSET_BITS
+-#endif
+ #include <stdlib.h>
+ #include <unistd.h>
+ #include <string.h>
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
