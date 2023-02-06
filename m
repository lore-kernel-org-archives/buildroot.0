Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A5FC05027
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 16:47:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10BF940992;
	Mon,  6 Feb 2023 16:47:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10BF940992
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mfNtS7YMAdUH; Mon,  6 Feb 2023 16:47:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 155B4410D6;
	Mon,  6 Feb 2023 16:47:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 155B4410D6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3DB791BF33A
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 16:47:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17488410D6
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 16:47:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17488410D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wqeYSrwd86Q0 for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 16:47:39 +0000 (UTC)
X-Greylist: delayed 00:20:55 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E01F740992
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E01F740992
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 16:47:38 +0000 (UTC)
Received: from [81.174.171.191] (helo=donbot.metanate.com)
 by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.95) (envelope-from <john@metanate.com>) id 1pP4KF-0001bf-T8;
 Mon, 06 Feb 2023 16:26:39 +0000
From: John Keeping <john@metanate.com>
To: buildroot@buildroot.org
Date: Mon,  6 Feb 2023 16:26:17 +0000
Message-Id: <20230206162617.1907911-1-john@metanate.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Authenticated: YES
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=metanate.com; s=stronger; h=Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Content-Type:Reply-To:Content-ID:Content-Description:
 In-Reply-To:References; bh=RL+XEfg4N5LpM7nVXxcjCTrirQ2rBYPKkMMwMBznq34=; b=wN
 nrZT6dP2YNAx53pwKub7eb3DJ986k599RIemqoOgAFoKiRGOUiIsLNeRNqgi0o0LPLBk87cW54qAN
 956tm7V1KXKrf8Gspk5axLH9IKYQ/6GjWAaVtieQtEHqOqIcETWOgqcXYRrqneFu2E7E77jeiSfkm
 Oqe9m4J0Sz0+Y9IBk+L3EvKInvM49EoUt5bNyX40V3gpIpIRtJSrAYQsmASiYX0N1ve+gUye7hsNS
 83SxH0qblY07J9L8Gb6p8Y9VNHdU1OKbWO5mrVFqHySUYxjkpyQO/oa2jaZOL5nEpz3Zff037BEV0
 vhUEhyhxwXidNkI5JKaUBDAQPGSMx13w==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=metanate.com header.i=@metanate.com
 header.a=rsa-sha256 header.s=stronger header.b=wNnrZT6d
Subject: [Buildroot] [PATCH] package/gcc/gcc-final: map debug prefix when
 reproducible
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
Cc: Romain Naour <romain.naour@gmail.com>, John Keeping <john@metanate.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When building with BR2_REPRODUCIBLE the toolchain wrapper passes
-fdebug-prefix-map for all packages that are built.  But this doesn't
affect the target libraries (like libgcc) built by GCC's build system.

GCC 4.3 added a configure option to set the debug prefix map for these
libraries, which is used here to avoid encoding potentially
non-reproducible build paths into the debug data.

Signed-off-by: John Keeping <john@metanate.com>
---
 package/gcc/gcc-final/gcc-final.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index aa883beb7b..5f222a324c 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -108,6 +108,10 @@ else
 HOST_GCC_FINAL_CONF_OPTS += --disable-libgomp
 endif
 
+ifeq ($(BR2_REPRODUCIBLE),y)
+HOST_GCC_FINAL_CONF_OPTS += --with-debug-prefix-map=$(BASE_DIR)=buildroot
+endif
+
 # End with user-provided options, so that they can override previously
 # defined options.
 HOST_GCC_FINAL_CONF_OPTS += \
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
