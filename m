Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 677B6C4332F
	for <buildroot@archiver.kernel.org>; Sun,  6 Nov 2022 23:05:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C515940227;
	Sun,  6 Nov 2022 23:04:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C515940227
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FbjF7yItjyx5; Sun,  6 Nov 2022 23:04:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 910734018B;
	Sun,  6 Nov 2022 23:04:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 910734018B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3F6111BF3C2
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 23:04:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 17E8960608
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 23:04:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17E8960608
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vfSw2UZJfKj3 for <buildroot@lists.busybox.net>;
 Sun,  6 Nov 2022 23:04:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD954605EC
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DD954605EC
 for <buildroot@buildroot.org>; Sun,  6 Nov 2022 23:04:54 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id v7so5936862wmn.0
 for <buildroot@buildroot.org>; Sun, 06 Nov 2022 15:04:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YQTPSkrjaSqPyj8J+mjPzEKRCq7iDM/eynjxc2SYUxA=;
 b=A7Uam0qsCodVEutKao6gFJcybKnbBdz/BP5ky+OHGVm1uKJ4twkNquaLzAI7X6aN0F
 K1h+R0vTx0x+p+ZGOkdYgcWWMCzkJJpcw1j5nhfki/P+JFzO1zt9e0XWsfzr0bbhW5pt
 O3xxG+4+RtHf2VeCt1jHAwf+mTXt47+mDlJv5DZh6FMCOr8et2NbcdY+SmaZbnRRouzk
 QDKK6eZSa5hWR1bXO1pV66xTYPN9EkaceKyFvaf40SLG3V4nZHjwJ6s3wuDgYX81WGwV
 3DKkiBpF/WOjc2fCYZ07xxdQtdGGddyCheffhvlpm420M6zkcY+qBc12fpu7u8oru+7y
 +O7w==
X-Gm-Message-State: ACrzQf0Id6mYek8v0A1gj+H6Mm9qsRzw3Fn8mTsmOPqea/ivrXfygHlS
 D3Q9M14jYTqiQA4grRISZwqGSI6H4j8=
X-Google-Smtp-Source: AMsMyM7NKQfS4YDlvgneQcHlKvagJUWcP/CLNHOBFV9P4Zjq+V1S4dLLCGS1fUFNq47ZMhQ55TmuWw==
X-Received: by 2002:a05:600c:538b:b0:3c6:b66d:4027 with SMTP id
 hg11-20020a05600c538b00b003c6b66d4027mr39682532wmb.146.1667775892471; 
 Sun, 06 Nov 2022 15:04:52 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 j13-20020adfea4d000000b0023bb7e4b8b1sm5653438wrn.82.2022.11.06.15.04.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 15:04:51 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  7 Nov 2022 00:04:50 +0100
Message-Id: <20221106230450.970235-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YQTPSkrjaSqPyj8J+mjPzEKRCq7iDM/eynjxc2SYUxA=;
 b=mTyrwGHxAqqBMQxXH4/zFaHyvLlAtbRAzhMAdDvwYfKyFxkry19+LAbO+Z+ljNAN3X
 lT1tZ+qqvKlkw4e8CS80pUYB0E0eulYZQg7rwICUkFFpm9bpm5X7gk6Cbp27VNPl6vkF
 EMQkzYROBpu6XP/GLI88PbeRVwISNZ4FTzJij9+YboiNryr9/WIPs13xSkutXnJX+nhU
 7z0YNOUC78QMqp3leb1wlMx0Mj/GhELoGqzf2bdwvTdYTc9kGsdTiP7TUatCAXvCkIYD
 dUUPzqC3k5m7CWnmZB67fwhVE5CIpmChGymxX8enRVWjj2okezrqNq3KIoyDIQqMyTwY
 /Pgw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=mTyrwGHx
Subject: [Buildroot] [PATCH 1/1] package/gptfdisk: fix popt static build
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following static build failure with popt and iconv raised since
bump to version 1.0.9 in commit 69015ce94ac3ffe7f349ec37868eea0d0ffec90e
and
https://sourceforge.net/p/gptfdisk/code/ci/122b58ad82f1a144226d262c87241ee035ed1aff
(which added an unified Makefile):

/home/autobuild/autobuild/instance-0/output-1/host/bin/mips64el-buildroot-linux-uclibc-g++ crc32.o support.o guid.o gptpart.o mbrpart.o basicmbr.o mbr.o gpt.o bsd.o parttypes.o attributes.o diskio.o diskio-unix.o sgdisk.o gptcl.o -static -liconv -lpopt  -o sgdisk
/home/autobuild/autobuild/instance-0/output-1/host/lib/gcc/mips64el-buildroot-linux-uclibc/11.3.0/../../../../mips64el-buildroot-linux-uclibc/bin/ld: /home/autobuild/autobuild/instance-0/output-1/host/mips64el-buildroot-linux-uclibc/sysroot/usr/lib64/../lib64/libpopt.a(poptint.o): in function `strdup_locale_from_utf8':
poptint.c:(.text+0x113c): undefined reference to `libiconv_open'

As can be seen above, this build failure is raised because -liconv is
added before -lpopt so use pkgconfig and SGDISK_LDLIBS

The addition of -liconv in LDLIBS could probably be removed in a
follow-up patch for next branch

Fixes:
 - http://autobuild.buildroot.org/results/c9f2c9e737c2dd1cd4c1a08a5e8a48165179282d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gptfdisk/gptfdisk.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/gptfdisk/gptfdisk.mk b/package/gptfdisk/gptfdisk.mk
index 0df9cda08f..f3fc930202 100644
--- a/package/gptfdisk/gptfdisk.mk
+++ b/package/gptfdisk/gptfdisk.mk
@@ -15,7 +15,8 @@ GPTFDISK_TARGETS_$(BR2_PACKAGE_GPTFDISK_CGDISK) += cgdisk
 
 GPTFDISK_DEPENDENCIES += util-linux
 ifeq ($(BR2_PACKAGE_GPTFDISK_SGDISK),y)
-GPTFDISK_DEPENDENCIES += popt
+GPTFDISK_DEPENDENCIES += host-pkgconf popt
+GPTFDISK_SGDISK_LDLIBS += `$(PKG_CONFIG_HOST_BINARY) --libs popt`
 endif
 ifeq ($(BR2_PACKAGE_GPTFDISK_CGDISK),y)
 GPTFDISK_DEPENDENCIES += ncurses
@@ -32,7 +33,8 @@ endif
 
 define GPTFDISK_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
-		LDLIBS='$(GPTFDISK_LDLIBS)' $(GPTFDISK_TARGETS_y)
+		LDLIBS='$(GPTFDISK_LDLIBS)' \
+		SGDISK_LDLIBS='$(GPTFDISK_SGDISK_LDLIBS)' $(GPTFDISK_TARGETS_y)
 endef
 
 define GPTFDISK_INSTALL_TARGET_CMDS
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
