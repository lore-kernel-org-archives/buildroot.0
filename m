Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B271C05027
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 16:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD0E581F93;
	Wed,  8 Feb 2023 16:20:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD0E581F93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3cmYCodVDq8H; Wed,  8 Feb 2023 16:20:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF2FD81F88;
	Wed,  8 Feb 2023 16:20:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF2FD81F88
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A4E9F1BF286
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 16:20:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8CBB940C2C
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 16:20:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CBB940C2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QigidCFSMzjw for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 16:20:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 309074014B
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 309074014B
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 16:20:17 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 f23-20020a05600c491700b003dff4480a17so2639841wmp.1
 for <buildroot@buildroot.org>; Wed, 08 Feb 2023 08:20:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7Sd+l32mPkkG+SIoMlA8NHcybKrAOyonwqvGVUf77ss=;
 b=T6R6IhgbOQ/MWHCjFVq10f59TiJkO3/lIvzxE5h8ADAcVVaCm0gqSc6P2WPJGZdXtU
 gdKxALerK+Thv6Jd/l4T0Orh2BzDzI2bXjqumfyZYDBu1jhPTeoaBg+wrByNdZGkJ0Xf
 3HeJSrFf3kFQtV3NjMUl9ulsf1+y3Trz5Wh9akLjVr86raqpSxYD+434OpxS6dTmReM5
 TsIt9QEdCYdLgR4KV22SthgdZOsiugwAgvXskZVbPtp3a44Lgm0Fjfvz6A3tVVvZpAcM
 9zcSbNCWgRiFr3cdcAl5Dwrcb17KOki1Qx71znzX9fXFMMrQBVT+VTn9b42tUi2ji0KB
 tJUQ==
X-Gm-Message-State: AO0yUKURFyu+kT98+Y3Iu2gsqZepY5+KpOBkqua7aSP1i/wfG4197S0o
 2fAsJTeNmpQUuU3TEV9dJH94WLYdzl60VQ==
X-Google-Smtp-Source: AK7set8GnVNiZ5qJPt2BeoacGv63WOH1xR0CiFnBWLZ4/t3MalxX34XYQjFrOTuaLhkPgnLMmops5g==
X-Received: by 2002:a05:600c:18a0:b0:3df:b5ae:529f with SMTP id
 x32-20020a05600c18a000b003dfb5ae529fmr7013856wmp.31.1675873215295; 
 Wed, 08 Feb 2023 08:20:15 -0800 (PST)
Received: from localhost.localdomain (cpe1150018.bra.be.verixi.net.
 [85.119.216.19]) by smtp.gmail.com with ESMTPSA id
 w23-20020a1cf617000000b003db1d9553e7sm2435534wmc.32.2023.02.08.08.20.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 08:20:14 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed,  8 Feb 2023 17:20:14 +0100
Message-Id: <cover.1675873210.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=7Sd+l32mPkkG+SIoMlA8NHcybKrAOyonwqvGVUf77ss=;
 b=H6UOqINoliMb+PcJj+lS1wwAgranaRq4i4cedqAi+6aDrbf2emDLqO/6NaMhBpiAdt
 Vcb/UIVEWmtHHjusOXEXKwmarwL7qTHY3u0eF9qkvfSfmqvuBwjR6JE5KhW8CAhWXl9U
 twOxH5t+6+J09NkNRdVk0OSO6CeJVdXNQCgxD2Zr1d2YcjxykL+2vxZqOUtfq/lmMKoA
 DO7RpmZB/BYa5xw6fM+Z6OOqaWtM/ZqW0suvwgLY9C/gc0yM9lCLT3mIxp6OsD5bKrrS
 jtyVFNO7up+Nos2JwWfHDcZtUqCEkjH5QHyRpm7TIoufIs1e178DdmGVKbsIrEmUQ6v6
 cAIA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=H6UOqINo
Subject: [Buildroot] [PATCH 0/3] package/dmalloc: cleanups and ssp
 workaround (branch yem/dmalloc)
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All!

This short series cleans up (a bit) our dmalloc package, and disables
SSP altogether to avoid build failures due to limitations in the dmalloc
build system.

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (3):
      package/dmalloc: convert existing patch to git format
      package/dmalloc: use actual patches rather than sed-ing
      package/dmalloc: don't use SSP

 .../dmalloc/0001-configure-fix-build-on-mips.patch | 87 ++++++++++++++++++++++
 package/dmalloc/0001-mips.patch                    | 45 -----------
 ...003-configure-allow-overriding-some-tests.patch | 80 ++++++++++++++++++++
 ...e-the-configure-detected-or-user-supplied.patch | 50 +++++++++++++
 ...onfigure-use-LD-instead-of-hard-coding-ld.patch | 67 +++++++++++++++++
 package/dmalloc/dmalloc.mk                         | 24 +++---
 6 files changed, 296 insertions(+), 57 deletions(-)
 create mode 100644 package/dmalloc/0001-configure-fix-build-on-mips.patch
 delete mode 100644 package/dmalloc/0001-mips.patch
 create mode 100644 package/dmalloc/0003-configure-allow-overriding-some-tests.patch
 create mode 100644 package/dmalloc/0004-Makefile-use-the-configure-detected-or-user-supplied.patch
 create mode 100644 package/dmalloc/0005-configure-use-LD-instead-of-hard-coding-ld.patch

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
