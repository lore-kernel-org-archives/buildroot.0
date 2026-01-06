Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB1F4CEFCF2
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 19:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05124606C9;
	Tue,  6 Jan 2026 19:05:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ovsuzz9z24kt; Tue,  6 Jan 2026 19:05:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD3D360627
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767726350;
	bh=elJ060oIwRg/U89CYLq92TykLiob2YkGZF0YM9ii6TU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rkxxJqadD34pJyzu+Lf61LYUL6iPhdxqz1HMXG2UdF8EWx4+f5bwJz+P8zBrssnsM
	 dj00tVN8ECqGB5e7IERJrhWABSs6LyD0XdrvJcgajI8AcFTfaEQAnFK9OqiaG/HtV+
	 RsgpruzgA19lQA+fD4k1UYkKRBmMJCxNCeB9CDPZrT/fga/DsxT9M5uWcJoES6QQyw
	 t2CQlidn8QKBI+PFP+5SyI+Y5iiwLUq5AjAzv17hePWQ/0f6Yg1CvIoilewxfNvmsj
	 eZi+J+UgqUI99ump3k1EncfVXEDM3aEGTP9TmKKGh5h0XtncnToB4gII225BoDL+nP
	 Uzh209qfxCR6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD3D360627;
	Tue,  6 Jan 2026 19:05:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BA8A170B
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 19:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ABEBC6064A
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 19:05:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vs7kP7P0HF6B for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 19:05:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2A128600C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A128600C7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2A128600C7
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 19:05:47 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E0C61A4C3325
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 20:05:43 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50056)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vdCND-0000000017V-0aHm
 for buildroot@buildroot.org; Tue, 06 Jan 2026 19:05:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Jan 2026 20:05:43 +0100
Message-ID: <20260106190543.1318334-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767726343;
 bh=dfqWK6lhwtDTI2dOWNtRq/fxaGlMD7A4zijf9lNvU+I=;
 h=From:To:Subject:Date:From;
 b=VAyO6k2bHj/ckrCt8vnM7L8ZImI80lzLWA+7hz6n0Zu7BUfxc+lJnD8FvfdwFFAg6
 oBkmSY1oiBhG9uHCtSvi/wVfGcAVjs7/5bchR/F2TBZoqy2eArqOTp7U6BWRmPy/G5
 0yp8ZJF0g/WdFwariCgZZlVw73U8EpuPPeXP5s4G/1lsPiCD44PpcOn/goCviiCPBo
 fsvKgZSKtspQLMdmXt+42iJmZQBFh042yqAbuF/x1dMwyDR7tlY5Xxob+2iEJKpIAx
 RN9eBpMyO0f627815y8kySiQFGJKoydT8m+bKsLsVaTr10HmDG3nn+BM7HONMH33m0
 KoykUbPqe4ZnQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=VAyO6k2b
Subject: [Buildroot] [PATCH 1/1] package/luv: bump version to 1.51.0-1
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

https://github.com/luvit/luv/releases

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/luv/luv.hash | 2 +-
 package/luv/luv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luv/luv.hash b/package/luv/luv.hash
index 4cdb91729f..f47257f37e 100644
--- a/package/luv/luv.hash
+++ b/package/luv/luv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  567a6f3dcdcf8a9b54ddc57ffef89d1e950d72832b85ee81c8c83a9d4e0e9de2  luv-1.43.0-0.tar.gz
+sha256  dc706d9141c185bdce08b6fc8a9d4df05c3ac3676809ee4e9e37e1553d821237  luv-1.51.0-1.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/luv/luv.mk b/package/luv/luv.mk
index 36fcdc742e..0349f7afba 100644
--- a/package/luv/luv.mk
+++ b/package/luv/luv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUV_VERSION = 1.43.0-0
+LUV_VERSION = 1.51.0-1
 LUV_SITE = https://github.com/luvit/luv/releases/download/$(LUV_VERSION)
 LUV_LICENSE = Apache-2.0
 LUV_LICENSE_FILES = LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
