Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD9DC636D6
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 20:42:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 929EA612E8;
	Wed, 22 Feb 2023 20:42:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 929EA612E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8kYYmie230lF; Wed, 22 Feb 2023 20:42:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE6F3612AB;
	Wed, 22 Feb 2023 20:42:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE6F3612AB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4B72B1BF59E
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 20:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2592D813F5
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 20:41:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2592D813F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lNyZoN85ZblI for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 20:41:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17275813D2
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 17275813D2
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 20:41:58 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.166.192.177])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 760FD19F591;
 Wed, 22 Feb 2023 21:41:51 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 21:41:34 +0100
Message-Id: <20230222204134.38884-2-ju.o@free.fr>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230222204134.38884-1-ju.o@free.fr>
References: <20230222204134.38884-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1677098516;
 bh=ckdTab0MXuejz93eKgxSQ0P/SuGgWc8AHflwUUNovZI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XJ4RCGmRdkf4ZRCWSnY4ENPNNYa8ApcgyZH65mS/MwCLe8OVc6Jml4vRUEUtZUgnN
 TBvB1FWM6Ns5BxDTg2mcmsYJsKNyfpxRcBlIDBU+PvrWQAqecA9TA2VdBkteQG1CUu
 ZoVsDXdej/66t4bvuZn3/SCWakFGpzmsMxWkGINcoee1z2KVmrEpbfuH/8BoZOPHAw
 fjLf5Ng9LQ/JdIXu8Gddxa33DmUXJzQJ53abTbfAqFAXz+XzCbSPllIvWKN/m3AK1q
 DEnc3Y9sLqNknmpzmOAPOVBw8KVGK6Mozid7g/O8m+s+u4C9V1Cl3lpj+PX+Z+Trtw
 k5RRWXO+6o20w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XJ4RCGmR
Subject: [Buildroot] [PATCH next 2/2] package/linux-tools: perf: add OpenCSD
 support
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
Cc: Julien Olivain <ju.o@free.fr>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit adds the Arm CoreSight trace data Decoder support to perf.
See: https://docs.kernel.org/trace/coresight/coresight-perf.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/linux-tools/linux-tool-perf.mk.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index dda63cccec..3a16705087 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -119,6 +119,13 @@ else
 PERF_MAKE_FLAGS += NO_LZMA=1
 endif
 
+ifeq ($(BR2_PACKAGE_OPENCSD),y)
+PERF_DEPENDENCIES += opencsd
+PERF_MAKE_FLAGS += CORESIGHT=1
+# There is no "else CORESIGHT=0" case, because "perf" Makefile uses
+# bare "ifdef CORESIGHT" constructs.
+endif
+
 # We really do not want to build the perf documentation, because it
 # has stringent requirement on the documentation generation tools,
 # like xmlto and asciidoc), which may be lagging behind on some
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
