Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ABBEECAAD8
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 21:22:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 326CE40A5D;
	Sun, 18 Sep 2022 21:22:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 326CE40A5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id algeu_jCKgI9; Sun, 18 Sep 2022 21:22:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42DE74023B;
	Sun, 18 Sep 2022 21:22:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42DE74023B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 850571BF3C4
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 21:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 607A983F20
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 21:22:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 607A983F20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tyDMQvPYiUvz for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 21:22:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D49CB82A83
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D49CB82A83
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 21:21:59 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.164.23.66])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id E88C413F87E;
 Sun, 18 Sep 2022 23:21:54 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 23:21:44 +0200
Message-Id: <20220918212144.427007-1-ju.o@free.fr>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1663536116;
 bh=aeYPqvUm+4vy3LXFxq6MFwyQcQswWN1EM/y4xyVs8cg=;
 h=From:To:Cc:Subject:Date:From;
 b=M9dKFXvrYaTzrCHN2ZZi+oRqcQ4G7uQJhS5u1grffM7HL3539XuTe7579/WUleLLQ
 VfZ1sTFIKrPN5V8CebFudK0Lkj1uyNAHKuYcyLBKwSHj5tfnOuYPd9O6B5LHnuVzlu
 FD3UhViabOx4BwEnoKzo1iDrII6NQOyJCa1GDoHUxy9FJ5xUU+tgtKsKLijA8zfxcw
 +qNhBXl88HIF3TLeKw/jG191ogkC/Z5g0gquht8+wmd+bd60dtYr+ohDJWOrzhl4i5
 nE+A0AMahJERcsWLXdYqZxVrs9Hi0vIP4YdcCzE2Jn7jrlNTCu/1ZcYDDFUfbMs4UN
 wD36MiHTMajFg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=M9dKFXvr
Subject: [Buildroot] [PATCH 1/1] security hardening: add support for glibc
 _FORTIFY_SOURCE=3
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

A new _FORTIFY_SOURCE=3 level was introduced in glibc, in commit:
https://sourceware.org/git/?p=glibc.git;a=commit;h=c43c5796121bc5bcc0867f02e5536874aa8196c1

This commit was first included glibc 2.33. At that time, it was only
supported by llvm/clang 9, and not by any released gcc version.

To support _FORTIFY_SOURCE=3, the needed gcc features were introduced
in version 12. The gcc 12 support was added in glibc commit:
https://sourceware.org/git/?p=glibc.git;a=commit;h=86bf0feb0e3ec8e37872f72499d6ae33406561d7
This commit was first included in glibc 2.35.

Buildroot updated to glibc 2.35 in commit:
https://git.buildroot.org/buildroot/commit/?id=68d0aede597d32816c5b2ff32de0ce33cc14eb93

Buildroot introduced gcc 12 support in commit:
https://git.buildroot.org/buildroot/commit/?id=0f1ad4fc93286adaba852c99d6e1c2565b5c4258

Support for _FORTIFY_SOURCE=3 can now be added.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Config.in           | 9 +++++++++
 package/Makefile.in | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/Config.in b/Config.in
index 3c57c591a8..cd26c9f102 100644
--- a/Config.in
+++ b/Config.in
@@ -929,6 +929,15 @@ config BR2_FORTIFY_SOURCE_2
 	  Also adds checks at run-time (detected buffer overflow
 	  terminates the program)
 
+config BR2_FORTIFY_SOURCE_3
+	bool "Extended"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	help
+	  This option sets _FORTIFY_SOURCES to 3 and even more
+	  checking is added compared to level 2. Extends checks at
+	  run-time that can introduce an additional performance
+	  overhead.
+
 endchoice
 
 comment "Fortify Source needs a glibc toolchain and optimization"
diff --git a/package/Makefile.in b/package/Makefile.in
index 43d214bcbe..7f1b00ba24 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -160,6 +160,8 @@ ifeq ($(BR2_FORTIFY_SOURCE_1),y)
 TARGET_HARDENED += -D_FORTIFY_SOURCE=1
 else ifeq ($(BR2_FORTIFY_SOURCE_2),y)
 TARGET_HARDENED += -D_FORTIFY_SOURCE=2
+else ifeq ($(BR2_FORTIFY_SOURCE_3),y)
+TARGET_HARDENED += -D_FORTIFY_SOURCE=3
 endif
 
 TARGET_CPPFLAGS += -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
