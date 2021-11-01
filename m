Return-Path: <SRS0=b2+E=PU=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76FADC433F5
	for <buildroot@archiver.kernel.org>; Mon,  1 Nov 2021 07:41:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0A0660E90
	for <buildroot@archiver.kernel.org>; Mon,  1 Nov 2021 07:41:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D0A0660E90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6EDCA400CF;
	Mon,  1 Nov 2021 07:41:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id awl7_bWvp9Fk; Mon,  1 Nov 2021 07:41:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A7EA4014A;
	Mon,  1 Nov 2021 07:41:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8B88E1BF3DF
 for <buildroot@lists.busybox.net>; Mon,  1 Nov 2021 07:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8648C4014A
 for <buildroot@lists.busybox.net>; Mon,  1 Nov 2021 07:41:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0cL6DIAV12n4 for <buildroot@lists.busybox.net>;
 Mon,  1 Nov 2021 07:41:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 517BA400CF
 for <buildroot@buildroot.org>; Mon,  1 Nov 2021 07:41:27 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id h23so4016909ila.4
 for <buildroot@buildroot.org>; Mon, 01 Nov 2021 00:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=htX1SxgCzju6LZYTRkrlf3rapO0m07ISoPqmOSH6z1w=;
 b=ZjPbhTAqyHs1pAuv1jDddufO302ABGejhnDoDfY4kQWhtrct5GLILoWx6yeboZOiB3
 SCE+QYb9iZ6Wt6GL3cuyHmvEOlhTLK756E+ZnHA9+PJ95Q8s8P9DKIv21517GppZSyHc
 LLlOx2KcyXF2FG5ixNwOdeJEypicttDIFK4furi0FFQPtbivnBzRh4SE3l8QNMkqR3oA
 PtXcSbCxS76p39qIhzWIZpQ02nDuKaMrBDiaqThyqGh9Ef/El4jEOXhCM1ZcBe4Spe6+
 srpdR5Ei6W0PQxi5QblgeJK20cBFdTty4/w6YbaCW/AxeG/wPvwDpN48dwrrnqhBca7F
 NI5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=htX1SxgCzju6LZYTRkrlf3rapO0m07ISoPqmOSH6z1w=;
 b=Ijul0W+PtxZnUKnhjdlXw0pfsqxVxJdPeZWLvdhruVEEP3dCeVVhlz8AdqKVZaAC4l
 pYbBZa39ynEKRYTCy7HvNROxql0kCQJLOF76roAKSpPqAJQfZIt1APZWCYnsC7wE8icQ
 zxBaEkyw348YpAkVBufMvwuMjbmf7GHn/TKDeONZDViml5UjZcoiylFqIV2Wt/l7dNhf
 o7RHyZfLBOM7ta9QQ2D00skU4dzOTkQyQkCtdAUJ27uS+ZpOooJ12EDRVULE9dBa50Ev
 8gMwz5jjdk/9kvI6WXcaFaD5yPTbe7aA7VgY7LA1s8lCtI4hVDuljrS5/JI96+Gdix7M
 3bwA==
X-Gm-Message-State: AOAM532Mh3F6P0qhz4L0bN5ClcGpz10TU8tsrcguJHydn/i/trj5vIGV
 KIpQB2XapOAi5qKTphsKZWHhkpg7TkM=
X-Google-Smtp-Source: ABdhPJxYrXBGYn+mtJ3K7r2vF1l5dxFAGGRx0dqnxA8kTgknnG3y6LxjWniszpE/FTdNRj8eBnM0eQ==
X-Received: by 2002:a05:6e02:1686:: with SMTP id
 f6mr18801077ila.123.1635752486201; 
 Mon, 01 Nov 2021 00:41:26 -0700 (PDT)
Received: from james-x399.localdomain (71-218-115-49.hlrn.qwest.net.
 [71.218.115.49])
 by smtp.gmail.com with ESMTPSA id p13sm5079553iom.23.2021.11.01.00.41.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 00:41:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Nov 2021 01:41:21 -0600
Message-Id: <20211101074121.839641-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/valgrind: bump to version 3.18.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop Suppression file for musl libc patch which is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...Patch-Suppression-file-for-musl-libc.patch | 69 -------------------
 package/valgrind/valgrind.hash                |  4 +-
 package/valgrind/valgrind.mk                  |  2 +-
 3 files changed, 3 insertions(+), 72 deletions(-)
 delete mode 100644 package/valgrind/0003-Bug-408663-Patch-Suppression-file-for-musl-libc.patch

diff --git a/package/valgrind/0003-Bug-408663-Patch-Suppression-file-for-musl-libc.patch b/package/valgrind/0003-Bug-408663-Patch-Suppression-file-for-musl-libc.patch
deleted file mode 100644
index b7e075e9fd..0000000000
--- a/package/valgrind/0003-Bug-408663-Patch-Suppression-file-for-musl-libc.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From c5a5190ec7936e53bcd2082fb0151bc48a804b8b Mon Sep 17 00:00:00 2001
-From: Paul Floyd <pjfloyd@wanadoo.fr>
-Date: Tue, 8 Dec 2020 15:07:29 +0100
-Subject: [PATCH] Bug 408663 - Patch: Suppression file for musl libc
-
-[Upstream https://sourceware.org/git/?p=valgrind.git;a=patch;h=f4d98ff79d5a79102b777ea7e23002d9f7326489
- reduced to the missing musl.supp file download source file
- Reported https://bugs.kde.org/show_bug.cgi?id=435438]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- musl.supp | 46 ++++++++++++++++++++++++++++++++++++++++++++++
- 1 file changed, 46 insertions(+)
- create mode 100644 musl.supp
-
-diff --git a/musl.supp b/musl.supp
-new file mode 100644
-index 0000000..864172a
---- /dev/null
-+++ b/musl.supp
-@@ -0,0 +1,46 @@
-+# Suppressions for musl libc
-+# See: https://www.openwall.com/lists/musl/2017/06/15/4
-+
-+{
-+   musl-dynlink-false-positive1
-+   Memcheck:Leak
-+   fun:calloc
-+   fun:load_direct_deps
-+   fun:load_deps
-+   fun:load_deps
-+   fun:__dls3
-+   fun:__dls2b
-+   fun:__dls2
-+}
-+
-+{
-+   musl-dynlink-false-positive2
-+   Memcheck:Leak
-+   fun:calloc
-+   fun:load_direct_deps
-+   fun:load_deps
-+   fun:load_deps
-+   fun:__dls3
-+   fun:__dls2
-+}
-+
-+{
-+   musl-dynlink-false-positive3
-+   Memcheck:Leak
-+   fun:calloc
-+   fun:load_library
-+   fun:load_preload
-+   fun:__dls3
-+   fun:__dls2b
-+   fun:__dls2
-+}
-+
-+{
-+   musl-dynlink-false-positive4
-+   Memcheck:Leak
-+   fun:calloc
-+   fun:load_library
-+   fun:load_preload
-+   fun:__dls3
-+   fun:__dls2
-+}
--- 
-2.30.2
-
diff --git a/package/valgrind/valgrind.hash b/package/valgrind/valgrind.hash
index 648a590ca3..748fc3eb82 100644
--- a/package/valgrind/valgrind.hash
+++ b/package/valgrind/valgrind.hash
@@ -1,7 +1,7 @@
 # From https://valgrind.org/downloads/current.html
-md5  afe11b5572c3121a781433b7c0ab741b  valgrind-3.17.0.tar.bz2
+md5  de56a5532b0c81781db677ca712c585a  valgrind-3.18.1.tar.bz2
 # locally computed
-sha256  ad3aec668e813e40f238995f60796d9590eee64a16dff88421430630e69285a2  valgrind-3.17.0.tar.bz2
+sha256  00859aa13a772eddf7822225f4b46ee0d39afbe071d32778da4d99984081f7f5  valgrind-3.18.1.tar.bz2
 
 # License files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index b87e1e518f..52f2a04ffa 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VALGRIND_VERSION = 3.17.0
+VALGRIND_VERSION = 3.18.1
 VALGRIND_SITE = https://sourceware.org/pub/valgrind
 VALGRIND_SOURCE = valgrind-$(VALGRIND_VERSION).tar.bz2
 VALGRIND_LICENSE = GPL-2.0, GFDL-1.2
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
