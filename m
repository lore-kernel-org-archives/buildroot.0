Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B31DCC43334
	for <buildroot@archiver.kernel.org>; Wed, 20 Jul 2022 20:59:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A7C841A5B;
	Wed, 20 Jul 2022 20:59:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A7C841A5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A-4K31hZh1vE; Wed, 20 Jul 2022 20:59:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE18A419BA;
	Wed, 20 Jul 2022 20:59:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE18A419BA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9927A1BF228
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 20:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7297B419BA
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 20:59:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7297B419BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 61qURN0ZDCSs for <buildroot@lists.busybox.net>;
 Wed, 20 Jul 2022 20:59:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 125E5419B4
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 125E5419B4
 for <buildroot@buildroot.org>; Wed, 20 Jul 2022 20:59:18 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id bh13so17509748pgb.4
 for <buildroot@buildroot.org>; Wed, 20 Jul 2022 13:59:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/pzVJVksPJYdkXhRhMMtx65QsmbEYL4Tq93SqzRgWpc=;
 b=dMvYVvlfvAp1jbP3p1Wecse9X0PfqzF6PYue6yCIvVP8K9yLJy/WNsXcqWSCJ2uGcc
 RYJoczcWg34lr14C3FmsU+95VnYSPNRbIT2YeGMt6vZwNlH+XAyhJdbSslUBgYSfR0rD
 z7WdOjV1tND3Fk1h9HXRkITO0tgW5toSz7jagFb6TbMRgdZmFXAjIpUPObJD0jaGRdcf
 4Cv88UgpX+nFPK6XvHdCSANqS/jzjOxcAju8qm/OZalWH1xk7HemD1lmSksaGM0c7I9q
 cnta/9bS1cK5rMe36vPgGPjr4IkZQ4BhcgPsYkhihuiYPn+1AXE1btAWDuS1YhXZEQJ7
 HESQ==
X-Gm-Message-State: AJIora9MpChZMljtexTMRZgTqxrUO78fjZD94mveF8QE2TL4qZnm4Zw0
 zVfXYPMHIH7I6Om5gLWfmApz9TsS/lg=
X-Google-Smtp-Source: AGRyM1t369dyMBMBIF2w4lKznF2N9p3CC4fy9xZEyE3IAVMIUxRPnX2QvulpqrM6odUeMi5qGwujNQ==
X-Received: by 2002:a63:68c7:0:b0:405:1da9:ab69 with SMTP id
 d190-20020a6368c7000000b004051da9ab69mr36010244pgc.233.1658350758072; 
 Wed, 20 Jul 2022 13:59:18 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 b32-20020a631b60000000b0040d48cf046csm12184008pgm.55.2022.07.20.13.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 13:59:17 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 20 Jul 2022 13:59:15 -0700
Message-Id: <20220720205915.2346283-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/pzVJVksPJYdkXhRhMMtx65QsmbEYL4Tq93SqzRgWpc=;
 b=W1fZxw43R1RUycwdsr+u5Atu4pVm5V24eBVvc+QRDWVrGS7IhqBnci6gsWOWXz+M81
 TKdRC+YyLMgqAamfB31NXbLNu3Hn71lFnMCXvbV7Tx2izJjUINC9qQFMojppJAhUSCM1
 jSMUelC92DesyA75Kqvq32BQxzZGTVSt7SnjCcalEGEqDKunfkaMVaWyFRalCBUZMKBv
 CgBHZzAP68RPdbJf4GDReDxeF8HDXHB9sxw1RCOyk93JaWhMsnH/RRoMdD2csyJGEzLH
 jwdP0EVigolWs+8X0D9a2f4fYWQ0eMGhV+AbZ67gU/UgDtpr5AhL3dYsTMMcGOZU5hSg
 2iSQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=W1fZxw43
Subject: [Buildroot] [PATCH] package/xfsprogs: Fix builds for architectures
 without MAP_SYNC
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
Cc: bernd.kuhls@t-online.de, chrismcc@gmail.com,
 Florian Fainelli <f.fainelli@gmail.com>, yann.morin.1998@free.fr,
 thomas.petazzoni@bootlin.com, fontaine.fabrice@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Include a patch that was submitted to the linux-xfs mailing list to
address build failures for io/mmap.c:

https://lore.kernel.org/linux-xfs/20220720205307.2345230-1-f.fainelli@gmail.com/

Fixes:
autobuild.buildroot.net/results/407131b767fc8241e8f5f5001c0b5d4e2c488dea

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 ...fs.h-for-proper-HAVE_MAP_SYNC-defini.patch | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 package/xfsprogs/0004-xfs_io-Include-xfs.h-for-proper-HAVE_MAP_SYNC-defini.patch

diff --git a/package/xfsprogs/0004-xfs_io-Include-xfs.h-for-proper-HAVE_MAP_SYNC-defini.patch b/package/xfsprogs/0004-xfs_io-Include-xfs.h-for-proper-HAVE_MAP_SYNC-defini.patch
new file mode 100644
index 000000000000..27b10b698424
--- /dev/null
+++ b/package/xfsprogs/0004-xfs_io-Include-xfs.h-for-proper-HAVE_MAP_SYNC-defini.patch
@@ -0,0 +1,61 @@
+From ffdcb87460db644c952d9b50486a86975b188fdb Mon Sep 17 00:00:00 2001
+From: Florian Fainelli <f.fainelli@gmail.com>
+Date: Wed, 20 Jul 2022 11:58:06 -0700
+Subject: [PATCH] xfs_io: Make HAVE_MAP_SYNC more robust
+
+MIPS platforms building with recent kernel headers and the musl-libc toolchain
+will expose the following build failure:
+
+mmap.c: In function 'mmap_f':
+mmap.c:196:12: error: 'MAP_SYNC' undeclared (first use in this function); did you mean 'MS_SYNC'?
+  196 |    flags = MAP_SYNC | MAP_SHARED_VALIDATE;
+      |            ^~~~~~~~
+      |            MS_SYNC
+mmap.c:196:12: note: each undeclared identifier is reported only once for each function it appears in
+make[4]: *** [../include/buildrules:81: mmap.o] Error 1
+
+The reason for that is that the linux.h header file which intends to provide a fallback definition for MAP_SYNC and MAP_SHARED_VALIDATE is included too early through:
+
+input.h -> libfrog/projects.h -> xfs.h -> linux.h and this happens
+*before* sys/mman.h is included.
+
+sys/mman.h -> bits/mman.h which has a:
+  #undef MAP_SYNC
+
+see: https://git.musl-libc.org/cgit/musl/tree/arch/mips/bits/mman.h#n21
+
+The end result is that sys/mman.h being included for the first time
+ends-up overriding the HAVE_MAP_SYNC fallbacks.
+
+To remedy that, make sure that linux.h is updated to include sys/mman.h
+such that its fallbacks are independent of the inclusion order. As a
+consequence this forces us to ensure that we do not re-define
+accidentally MAP_SYNC or MAP_SHARED_VALIDATE so we protect against that.
+
+Fixes: dad796834cb9 ("xfs_io: add MAP_SYNC support to mmap()")
+Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
+---
+ include/linux.h | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/include/linux.h b/include/linux.h
+index 3d9f4e3dca80..c3cc8e30c677 100644
+--- a/include/linux.h
++++ b/include/linux.h
+@@ -252,8 +252,13 @@ struct fsxattr {
+ #endif
+ 
+ #ifndef HAVE_MAP_SYNC
++#include <sys/mman.h>
++#ifndef MAP_SYNC
+ #define MAP_SYNC 0
++#endif
++#ifndef MAP_SHARED_VALIDATE
+ #define MAP_SHARED_VALIDATE 0
++#endif
+ #else
+ #include <asm-generic/mman.h>
+ #include <asm-generic/mman-common.h>
+-- 
+2.25.1
+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
