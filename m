Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C64ADC25B4E
	for <buildroot@archiver.kernel.org>; Sun, 22 Jan 2023 09:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 465C0410E3;
	Sun, 22 Jan 2023 09:45:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 465C0410E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yDcTucbR-EtM; Sun, 22 Jan 2023 09:45:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1B37410DB;
	Sun, 22 Jan 2023 09:44:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1B37410DB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A1F0A1BF36C
 for <buildroot@lists.busybox.net>; Sun, 22 Jan 2023 09:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D23760B5C
 for <buildroot@lists.busybox.net>; Sun, 22 Jan 2023 09:44:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D23760B5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S70P5wMnm8Ti for <buildroot@lists.busybox.net>;
 Sun, 22 Jan 2023 09:44:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3495C60B43
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3495C60B43
 for <buildroot@buildroot.org>; Sun, 22 Jan 2023 09:44:56 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id r9so8327098wrw.4
 for <buildroot@buildroot.org>; Sun, 22 Jan 2023 01:44:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4iPG1fc4GQhMqYoIwIMsKZJ+N951MmuynuRnZLpYMKY=;
 b=vrTej3FlAOxBWE4SBBBXzGBR4W5pB89KOygzqTHyI+BgXFlB4T+PKFYYUQ8KcYGXG8
 SqubA9uLZgBBtsdz9Exxa3HtjWEPiok3BaivDGRrK5fmXmobuZ7NykMz9G0LHuAJtCr/
 3o1lECQXcSaTtbgXhgNQlKEPdgJeo5R7FfCQMheOoakWnTnZFqwwVSNUD2qCYjLiyryx
 mPBvr60Cw4FX6WFN2c99jWxklHu2pIcutG7+gkGIuREyZSyqzYvGD/GF1Dta2C+26jm3
 RtRfclJARjYdpltg8kp53fen3WrjVrFUOOo2OFk+4vp4IivT69XpnWiUUsTPXQd5KlXA
 DJNQ==
X-Gm-Message-State: AFqh2kpwwW8iRNrfcRXaJ4BMTLRT8xZ6ak2Rm8PanLcPPzTE+1OmhMRb
 MO8+QOebRXT76FG3eDJ14B8GDON0Ey4=
X-Google-Smtp-Source: AMrXdXshF5PKWYCj+kr+aTKqY7Ns8Toe+81noNXCzWMYzvI8yBTHXkAKwkke8UEHTReYmsC0CvMzhA==
X-Received: by 2002:a05:6000:386:b0:2be:c41:4758 with SMTP id
 u6-20020a056000038600b002be0c414758mr22406471wrf.38.1674380694279; 
 Sun, 22 Jan 2023 01:44:54 -0800 (PST)
Received: from localhost.localdomain (1-1-22-171.ftth.cust.kwaoo.net.
 [171.22.1.1]) by smtp.gmail.com with ESMTPSA id
 ba9-20020a0560001c0900b002b57bae7174sm1964219wrb.5.2023.01.22.01.44.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Jan 2023 01:44:53 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Jan 2023 10:44:53 +0100
Message-Id: <20230122094453.1381079-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=4iPG1fc4GQhMqYoIwIMsKZJ+N951MmuynuRnZLpYMKY=;
 b=pKQ59i0NOQeYdGmfzrLNxGjFlpy2erk/3A1QnoKjPxgzzJhkh+fGbKT+Wjf8zbsybw
 VDS0nB4XcbmF6oZfsWCz0u/DbrrI8hh4hTlsj1wG5SWXo5jCKqwFBEQd8apGUregOmj4
 V76Jedb1WcgbDQ3lKs/zkZr/TVYH82Rbrlmb7MJgJiZKSqVVmmwaifCd2KqwMZ85Bk8k
 nsep/8yY044ZdM4A3c4CsrnawLaQ//BtvmhlVz8qixx6U16xrL9HLOJUBGkhR7EjS2eg
 3SySku1u0GgMu9+uEVLX81fYF/yFyinUR6ZbNLJiG/3rY/Ypj09d1QP7KtAU9mIhiXp3
 HT+Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pKQ59i0N
Subject: [Buildroot] [PATCH] system: add option for packages to require
 /bin/sh
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
Cc: Norbert Lange <nolange79@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Some packages will require that /bin/sh exists and is a valid shell.

For example, system needs a shell, but does not care much what it is. We
could provide it with whatever the user configures as BR2_SYSTEM_BIN_SH,
but that can be empty because of BR2_SYSTEM_BIN_SH_NONE.

So, we add an option to restrict the choice and forbid BR2_SYSTEM_BIN_SH_NONE
from being a selectable option, this ensuring that there is a shell on
the system. As a side effect, it also ensures that /bin/sh exists.

For systmd, we can then just tell it to unconditionally use /bin/sh as
the default user shell, and that will also match whatever the user
selected as the system-wide default shell.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Norbert Lange <nolange79@gmail.com>
---
Note: this is a prerequisite for the bump to systemd 252.4:
    http://patchwork.ozlabs.org/project/buildroot/patch/20230115114840.9027-1-nolange79@gmail.com/
---
 system/Config.in | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/system/Config.in b/system/Config.in
index 806a747315..963192cb3f 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -320,6 +320,17 @@ config BR2_TARGET_GENERIC_ROOT_PASSWD
 	  the very least use a strong cryptographic hash for your
 	  password!
 
+config BR2_SYSTEM_NEEDS_BIN_SH
+	bool
+	# Busybox has a shell that does not need an MMU, but all the
+	# standalone shells need one. If BR2_PACKAGE_BUSYBOX is not
+	# set, BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is set, so we just need
+	# an MMU.
+	depends on BR2_USE_MMU || BR2_PACKAGE_BUSYBOX
+	help
+	  Have your package select this (and proapgate the dependencies)
+	  if it absolutely needs /bin/sh to exist and be a valid shell.
+
 choice
 	bool "/bin/sh"
 	default BR2_SYSTEM_BIN_SH_DASH if !BR2_PACKAGE_BUSYBOX
@@ -360,6 +371,7 @@ comment "bash, dash, mksh, zsh need BR2_PACKAGE_BUSYBOX_SHOW_OTHERS"
 
 config BR2_SYSTEM_BIN_SH_NONE
 	bool "none"
+	depends on !BR2_SYSTEM_NEEDS_BIN_SH
 
 endchoice # /bin/sh
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
