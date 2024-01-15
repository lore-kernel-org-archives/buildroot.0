Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23046C3DA79
	for <buildroot@archiver.kernel.org>; Mon, 15 Jan 2024 21:08:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC01A812DC;
	Mon, 15 Jan 2024 21:08:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC01A812DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gvbnpyCNJluZ; Mon, 15 Jan 2024 21:08:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC99A811E7;
	Mon, 15 Jan 2024 21:08:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC99A811E7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C06121BF383
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 21:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A60BE8119E
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 21:08:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A60BE8119E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x1yXDE1eMbbP for <buildroot@lists.busybox.net>;
 Mon, 15 Jan 2024 21:08:29 +0000 (UTC)
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A563F810AA
 for <buildroot@buildroot.org>; Mon, 15 Jan 2024 21:08:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A563F810AA
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-557a3ce9942so10087456a12.1
 for <buildroot@buildroot.org>; Mon, 15 Jan 2024 13:08:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705352908; x=1705957708;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BrCXc2BmSFbNWpyjYrOlJO9HO1U/yhfa7/A/2nOkL+4=;
 b=SAegAGAxTHaZpo29ORjHnNmYEbww7JwuxrkaHfedoGANMlkdWP3MO9Y2dMiADbxZwN
 hRNfZTA37ymbb/zCCqm2NoHO27jJJoNNr6UQNgJV3jocrVVdlzmzlr/Bm2Ham0vmL5Mk
 c50wY5cPevS6GuJRNQy2jartiR8EqkeNchcUGrk+I74pLjR/argW5+8vFvB7CDO9BOXx
 1YPsVletB+yc1TB2N+Je3H+F+i3rt75YpD0DTH86Bf4W1Bt5SGKJQNui0X2a9ncaOG4x
 ic0wkgnAtrSFBjTeLCApjoVaRqyaC4vR45bZlxCryBSiz+tU0/vbXfYzIEty0olrnbCm
 dOtg==
X-Gm-Message-State: AOJu0YyVBJXzK56q1CY14WuDU+98i2fecoptglP7qTjvaPvtG+nCiumA
 97PHy+dWs7BowLNu7t31q0Zm8nhwQSA=
X-Google-Smtp-Source: AGHT+IFyjI/u/0dIE5yNcjsCnJ/BiF3PGHYunj6agTBtCIuM4yByQORMXjoAF91xl13VPSHNXy/B1g==
X-Received: by 2002:aa7:d985:0:b0:559:481c:393c with SMTP id
 u5-20020aa7d985000000b00559481c393cmr748733eds.84.1705352907575; 
 Mon, 15 Jan 2024 13:08:27 -0800 (PST)
Received: from x230.suse.cz (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 q35-20020a05640224a300b00558a4d01783sm5662503eda.60.2024.01.15.13.08.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 13:08:26 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Jan 2024 22:08:21 +0100
Message-ID: <20240115210821.2175974-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705352908; x=1705957708; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BrCXc2BmSFbNWpyjYrOlJO9HO1U/yhfa7/A/2nOkL+4=;
 b=WvhWuFaBtW+UAVBN4jKEqP9rTsfoL1FL0VmMIlZ7k3yOFKPk/Xcs3VXXMbv0TosxBn
 WeGSoJuUSdS+6fpsLZPilZhGnllijXbW7CV8hiuYDKvpS8J7Gvey0uK1pmAxbLTQWf/I
 IlAk9/qVLEVfM5efde5ROJJdxTSeNWDyKdHYh50r4nl4IVsogKcOy1sPJUOczmlbmgkO
 K9xCv4n3kGl90M1M2MJTUOd7NVvxq/RByqaRjQilALt6mCCJWJMbJepdlcDO1C765Q6A
 xUc1S0NuzXmIvgURBbNZVDV9FBIvKmwJ5E5PMygsXd5eZqB0IJO9gHtBWhJ7N7b+OwCn
 ASBQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WvhWuFaB
Subject: [Buildroot] [PATCH 1/1] package/iproute2: bump version to 6.7.0
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
Cc: Petr Vorel <petr.vorel@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Francois Perrad <fperrad@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Backport fix of ss's output.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 ...t-Process-column-from-being-printed-.patch | 45 +++++++++++++++++++
 package/iproute2/iproute2.hash                |  2 +-
 package/iproute2/iproute2.mk                  |  2 +-
 3 files changed, 47 insertions(+), 2 deletions(-)
 create mode 100644 package/iproute2/0001-Revert-ss-prevent-Process-column-from-being-printed-.patch

diff --git a/package/iproute2/0001-Revert-ss-prevent-Process-column-from-being-printed-.patch b/package/iproute2/0001-Revert-ss-prevent-Process-column-from-being-printed-.patch
new file mode 100644
index 0000000000..10fa472d64
--- /dev/null
+++ b/package/iproute2/0001-Revert-ss-prevent-Process-column-from-being-printed-.patch
@@ -0,0 +1,45 @@
+From f22c49730c3691c25a1147081363eb35aa9d1048 Mon Sep 17 00:00:00 2001
+From: Stephen Hemminger <stephen@networkplumber.org>
+Date: Sat, 13 Jan 2024 08:51:55 -0800
+Subject: [PATCH] Revert "ss: prevent "Process" column from being printed
+ unless requested"
+
+This reverts commit 1607bf531fd2f984438d227ea97312df80e7cf56.
+
+This commit is being reverted because it breaks output of tcp info.
+The order of the columns enum is order sensistive.
+
+Bug: https://bugzilla.kernel.org/show_bug.cgi?id=218372
+Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
+Upstream: https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=f22c49730c3691c25a1147081363eb35aa9d1048
+---
+ misc/ss.c | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/misc/ss.c b/misc/ss.c
+index 09dc1f37..9438382b 100644
+--- a/misc/ss.c
++++ b/misc/ss.c
+@@ -100,8 +100,8 @@ enum col_id {
+ 	COL_SERV,
+ 	COL_RADDR,
+ 	COL_RSERV,
+-	COL_PROC,
+ 	COL_EXT,
++	COL_PROC,
+ 	COL_MAX
+ };
+
+@@ -5795,9 +5795,6 @@ int main(int argc, char *argv[])
+ 	if (ssfilter_parse(&current_filter.f, argc, argv, filter_fp))
+ 		usage();
+
+-	if (!show_processes)
+-		columns[COL_PROC].disabled = 1;
+-
+ 	if (!(current_filter.dbs & (current_filter.dbs - 1)))
+ 		columns[COL_NETID].disabled = 1;
+
+--
+2.43.0
+
diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index edd03b6459..0be058e64b 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,3 +1,3 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256  a70179085fa1b96d3c33b040c809b75e2b57563adc505a4ad05e2609df373463  iproute2-6.5.0.tar.xz
+sha256  ff942dd9828d7d1f867f61fe72ce433078c31e5d8e4a78e20f02cb5892e8841d  iproute2-6.7.0.tar.xz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index a2e90a66f3..7e70f62ff2 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 6.5.0
+IPROUTE2_VERSION = 6.7.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
