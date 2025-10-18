Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C41B2CCD195
	for <buildroot@archiver.kernel.org>; Sat, 18 Oct 2025 16:59:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CE8140EBB;
	Sat, 18 Oct 2025 16:59:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jzDmt2ZVaonf; Sat, 18 Oct 2025 16:59:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB44440B53
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB44440B53;
	Sat, 18 Oct 2025 16:59:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E80E1CD
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 16:59:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1473A80C86
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 16:59:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7KyUEgBEOKrN for <buildroot@buildroot.org>;
 Sat, 18 Oct 2025 16:59:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BAB0380CF6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BAB0380CF6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BAB0380CF6
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 16:59:38 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a021f.dip0.t-ipconnect.de [91.58.2.31])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 241F0A4C0CD9
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 18:59:36 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52658)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1vAAHI-000000003HU-0m3v
 for buildroot@buildroot.org; Sat, 18 Oct 2025 16:59:35 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 18 Oct 2025 18:59:35 +0200
Message-ID: <20251018165935.1092067-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760806776;
 bh=1qElngBXGAfIve8WPCP7ydXXMdlQLb0bUjw40iggHC4=;
 h=From:To:Subject:Date:From;
 b=hYS9bixH0Ge/CZcvkWmUYjEAVLhwrN8OTac2VQzhE14RCznvfvO7izQdjYO/zvNbz
 ZIGmn+15azyvLEgvK9Sdb5Dd76+xd+NrCBgzNnScLSAQJMEmHBkH7DgFwHHnlFSgoP
 EvcmNP+02CCrgIUAc1funLcejK79x6MVcyZTqLaIU5KmCfZD9D+quMUQfTzsLARJcK
 DZV0Nsjj05o5zzwC/leTwFyrSf3Gk0DRYJ+wrioCiGcqU0XO5XaRMS48lD/RDkLEsy
 QB1a1x45d6U94ZqUQJ9vSZdYLzwNzqh34Zu4UAsirdErCOeX1zKe+WSKJcnS0YFz0n
 Cgm/3SLfFDkzQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=hYS9bixH
Subject: [Buildroot] [PATCH 1/1] package/mjpg-streamer: fix build with gcc
 >= 14
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
https://autobuild.buildroot.net/results/3a5/3a5674e4e7bb3f2894575191af24598e2a696912/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...-output_viewer-fix-build-with-gcc-14.patch | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/mjpg-streamer/0003-output_viewer-fix-build-with-gcc-14.patch

diff --git a/package/mjpg-streamer/0003-output_viewer-fix-build-with-gcc-14.patch b/package/mjpg-streamer/0003-output_viewer-fix-build-with-gcc-14.patch
new file mode 100644
index 0000000000..74c26ec3ea
--- /dev/null
+++ b/package/mjpg-streamer/0003-output_viewer-fix-build-with-gcc-14.patch
@@ -0,0 +1,34 @@
+From c0656c6a538739635441b165b4f1ba7c22c68b1d Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sat, 18 Oct 2025 18:54:36 +0200
+Subject: [PATCH] output_viewer: fix build with gcc >= 14
+
+Fixes build error found by buildroot autobuilders:
+
+output_viewer.c:125:32: error: assignment to 'boolean (*)(struct jpeg_decompress_struct *)'
+from incompatible pointer type 'int (*)(struct jpeg_decompress_struct *)'
+[-Wincompatible-pointer-types]
+
+Upstream: https://github.com/jacksonliam/mjpg-streamer/pull/420
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ .../plugins/output_viewer/output_viewer.c                       | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mjpg-streamer-experimental/plugins/output_viewer/output_viewer.c b/mjpg-streamer-experimental/plugins/output_viewer/output_viewer.c
+index dd6c55b..c50f701 100644
+--- a/mjpg-streamer-experimental/plugins/output_viewer/output_viewer.c
++++ b/mjpg-streamer-experimental/plugins/output_viewer/output_viewer.c
+@@ -86,7 +86,7 @@ static void init_source(j_decompress_ptr cinfo)
+     return;
+ }
+ 
+-static int fill_input_buffer(j_decompress_ptr cinfo)
++static boolean fill_input_buffer(j_decompress_ptr cinfo)
+ {
+     my_source_mgr * src = (my_source_mgr *) cinfo->src;
+ 
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
