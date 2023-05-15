Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A63C77B75
	for <buildroot@archiver.kernel.org>; Mon, 15 May 2023 15:26:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C191F41D6A;
	Mon, 15 May 2023 15:26:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C191F41D6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lUEJh6Rwg8wK; Mon, 15 May 2023 15:26:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 03D3C41D63;
	Mon, 15 May 2023 15:26:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03D3C41D63
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 333081BF573
 for <buildroot@lists.busybox.net>; Mon, 15 May 2023 15:26:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08BB58409E
 for <buildroot@lists.busybox.net>; Mon, 15 May 2023 15:26:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08BB58409E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tC3WJrt5WEmW for <buildroot@lists.busybox.net>;
 Mon, 15 May 2023 15:26:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 546F583C31
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 546F583C31
 for <buildroot@buildroot.org>; Mon, 15 May 2023 15:26:32 +0000 (UTC)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
 by mailout06.t-online.de (Postfix) with SMTP id 35F04155D2
 for <buildroot@buildroot.org>; Mon, 15 May 2023 17:26:29 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd73.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pya5j-3LlY490; Mon, 15 May 2023 17:26:27 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:48970)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pya5j-00015D-0R
 for buildroot@buildroot.org; Mon, 15 May 2023 17:26:27 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Mon, 15 May 2023 17:26:26 +0200
Message-Id: <20230515152626.286921-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1684164387-D3FE82C5-0C8360AA/0/0 CLEAN NORMAL
X-TOI-MSGID: 106e9aea-023f-4182-a24c-2a63bd0d4168
Subject: [Buildroot] [PATCH 1/1] package/clamav: fix build on mips64el
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/b64/b640937f35b11ddb9f1e29f0e44040eda8850f26/
'Could not find specification for target "mips64el-unknown-linux-gnu".'

This patch changes
    -DRUST_COMPILER_TARGET=mips64el-unknown-linux-gnu
to
    -DRUST_COMPILER_TARGET=mips64el-unknown-linux-gnuabi64

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/clamav/clamav.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 977b6010b3..c3bede9ef3 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -54,7 +54,7 @@ CLAMAV_CONF_OPTS = \
 	-DENABLE_MILTER=OFF \
 	-DENABLE_TESTS=OFF \
 	-DHAVE_SYSTEM_LFS_FTS=ON \
-	-DRUST_COMPILER_TARGET=$(ARCH)-unknown-$(TARGET_OS)-$(LIBC)$(ABI) \
+	-DRUST_COMPILER_TARGET=$(ARCH)-unknown-$(TARGET_OS)-$(LIBC)$(RUSTC_ABI) \
 	-Dtest_run_result=ON \
 	-Dtest_run_result__TRYRUN_OUTPUT=ON
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
