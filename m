Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB3CC624DB
	for <buildroot@archiver.kernel.org>; Sun, 22 Feb 2026 17:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 569DE60EF4;
	Sun, 22 Feb 2026 17:54:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KgWGInlXwQ4O; Sun, 22 Feb 2026 17:54:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 308BB60DED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771782852;
	bh=4gKvIu4t2ZeqfCDn8p4dv4qvTIwRcRFj26dcWKQ4WYI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YOrSyC5dOvmfvdtzNvD8livzhlurSF2b8lqP6yeP6V7mfc9TDVwKFakGvg5mVVrik
	 nA+1F9La2+ZV2vcWv3SPrycjjpOPOVt5peIT8SpizkHd/XmPop2V9x27Yb332Qc9Tz
	 FhLOBS9TfpeEWoixDuYx/f+OHqsznoxxrfukfCG2TJP7f/4P0SDizBObTpNebIWWL+
	 oWArIzGSX2SP3+6cbauwtUHRxH79g/3mRg9jvkYo5KbOQKtHbjGR+PptqeGsyYTobS
	 VpECvelp/CtM6hYZAqr6dX/Q6Zu+vTcP7gKWtczIasYu2XsWkZrJF/fp+imKpYEefV
	 K2+zfrRNFb7jw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 308BB60DED;
	Sun, 22 Feb 2026 17:54:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 057AF2DF
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 17:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB88283E18
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 17:54:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j22YPbYKruy9 for <buildroot@buildroot.org>;
 Sun, 22 Feb 2026 17:54:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8BB6D83DFB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BB6D83DFB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8BB6D83DFB
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 17:54:07 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0c16.dip0.t-ipconnect.de [91.58.12.22])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EB739A4C1B9C;
 Sun, 22 Feb 2026 18:54:04 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41176)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vuDee-0000000040C-3cdX;
 Sun, 22 Feb 2026 17:54:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sun, 22 Feb 2026 18:54:04 +0100
Message-ID: <20260222175404.1945211-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1771782845;
 bh=I702MxKZoO4WlBGaLtCXRJfh7IYszufYudAZ98WZiuc=;
 h=From:To:Cc:Subject:Date:From;
 b=ILcDGAb1TPUKfPb2RKxb9sk9eHpTTlZxXy3J8HakAWJK+i8CgTB5ShrY1tIsiWdWQ
 y1ZKv5IdDhgTkaIB1TMz16BXMwlkywfek5WtX6WTAG95yY+ANe6oUJz/BYn4rzlnJY
 hSfGnwJZUyz35d4t9NcIhQxMhqnbRJVCtmOr6U26oiw9vogferr5lgb2BlkdTUu7KN
 k5npZmqQ8fl0/nm7Ri5rRb528RXoNI3ixBTiRLgsi+9auE2x+GMwVsEUCUgnLZkU9Z
 PAWkp1YdIplYPoTHFjeYiFzpk59adJnZcEVVwpilSNNwhSPpQSP89QBTR0WqO60Itp
 MOq25eB88Ds0A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=ILcDGAb1
Subject: [Buildroot] [PATCH 1/1] package/snort: Fix build with gcc-15.x
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
https://autobuild.buildroot.net/results/3b9/3b92d275a32721bd2cbb10e15c392054dfd42c63/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/snort/0009-gcc-15-fix.patch | 36 +++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/snort/0009-gcc-15-fix.patch

diff --git a/package/snort/0009-gcc-15-fix.patch b/package/snort/0009-gcc-15-fix.patch
new file mode 100644
index 0000000000..227ad5ffc5
--- /dev/null
+++ b/package/snort/0009-gcc-15-fix.patch
@@ -0,0 +1,36 @@
+Fix build with gcc-15.x
+
+Adapted from: https://lists.openembedded.org/g/openembedded-devel/topic/meta_oe_patch_2_8_snort/112466576
+
+Upstream-Status: Backport [resolved in snort3 https://github.com/snort3/snort3/commit/c3cc27355ac302bd24ee3e9d613166898ec2be64]
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+
+Downloaded from
+https://gitweb.gentoo.org/repo/gentoo.git/tree/net-analyzer/snort/files/snort-2.9.20-gcc-15-fix.patch?id=410cb3ac09ab3d55e96876634c4d58005d9ead89
+
+Upstream: https://github.com/snort3/snort3/commit/c3cc27355ac302bd24ee3e9d613166898ec2be64
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+--- a/src/dynamic-preprocessors/dcerpc2/spp_dce2.c
++++ b/src/dynamic-preprocessors/dcerpc2/spp_dce2.c
+@@ -160,7 +160,7 @@ static void DCE2_ReloadSwapFree(void *);
+ static void DCE2_AddPortsToPaf(struct _SnortConfig *, DCE2_Config *, tSfPolicyId);
+ static void DCE2_ScAddPortsToPaf(struct _SnortConfig *, void *);
+ static uint32_t max(uint32_t a, uint32_t b);
+-static uint32_t DCE2_GetReloadSafeMemcap();
++static uint32_t DCE2_GetReloadSafeMemcap(tSfPolicyUserContextId pConfig);
+ 
+ static bool dce2_file_cache_is_enabled = false;
+ static bool dce2_file_cache_was_enabled = false;
+--- a/src/preprocessors/HttpInspect/include/file_decomp_PDF.h
++++ b/src/preprocessors/HttpInspect/include/file_decomp_PDF.h
+@@ -80,6 +80,6 @@ fd_status_t File_Decomp_Init_PDF( fd_session_p_t SessionPtr );
+ 
+ fd_status_t File_Decomp_End_PDF( fd_session_p_t SessionPtr );
+ 
+-fd_status_t File_Decomp_PDF();
++fd_status_t File_Decomp_PDF( fd_session_p_t SessionPtr );
+ 
+ #endif /* FILE_DECOMP_PDF_H */
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
