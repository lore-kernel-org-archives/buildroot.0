Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51FA8C2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 10:11:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CB718137C;
	Sat, 17 May 2025 10:11:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U3EfLbu1A_v2; Sat, 17 May 2025 10:11:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 345A381354
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 345A381354;
	Sat, 17 May 2025 10:11:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A1B401DE
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 92B7B407FC
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:11:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5rtV4XWz2o2H for <buildroot@buildroot.org>;
 Sat, 17 May 2025 10:11:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 834F2405CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 834F2405CA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 834F2405CA
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:11:00 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0433.dip0.t-ipconnect.de [91.58.4.51])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4DCAAA4C16C2
 for <buildroot@buildroot.org>; Sat, 17 May 2025 12:10:58 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34268)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uGEVO-000000004lC-1Lck
 for buildroot@buildroot.org; Sat, 17 May 2025 10:10:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 12:10:57 +0200
Message-Id: <20250517101057.3457853-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1747476658;
 bh=uj6UpjbeSxf8l+2levZHNSbVd37QeDX8yntTzN7Y0m4=;
 h=From:To:Subject:Date:From;
 b=mvTm93Beuqw+YdeOvdW6tWmDbwK7ESr8Z/Gerz2H1fBArRPb0oC44Ga+JAKBLpOB3
 k3qJFwaJfGXNWU8TYukmv+7GZhH1u1XSK4xn1Ny2yK3HymWeCl46SfA5cH7d3yb3Yg
 RvusNCUN6WuO51V9Erhegm4Hr6b1NVSiTbDSWwY5kkNZddS8CPIcg5yTmCTaPkPISf
 nwoPYWxWxyFYV42kim4hN7P9ZLS+Xz65wkUukbR6NvlvcoQ6/P4e/hsUbV45ua3/io
 Z2Ilu/gFx8TGWSUGl7cyGF4jUiNdWLZkFei5HkJmtNIkhO8t+5thIfSHxErevvaWMg
 3ncPKTMpJT1kA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=mvTm93Be
Subject: [Buildroot] [PATCH 1/1] package/kodi-pvr-hts: fix build with
 gcc-15.x
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-pvr-hts/0001-gcc15.patch | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/kodi-pvr-hts/0001-gcc15.patch

diff --git a/package/kodi-pvr-hts/0001-gcc15.patch b/package/kodi-pvr-hts/0001-gcc15.patch
new file mode 100644
index 0000000000..a62c5f836b
--- /dev/null
+++ b/package/kodi-pvr-hts/0001-gcc15.patch
@@ -0,0 +1,26 @@
+From b8fb7f6cbe9e3e9ea2737dc465a70fb4bb0951eb Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Mon, 9 Dec 2024 00:19:15 +1100
+Subject: [PATCH] Fix build with gcc-15
+
+Backport upstream commit to fix build error with gcc-15.
+
+Upstream: https://github.com/kodi-pvr/pvr.hts/commit/b8fb7f6cbe9e3e9ea2737dc465a70fb4bb0951eb
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/tvheadend/HTSPVFS.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/tvheadend/HTSPVFS.h b/src/tvheadend/HTSPVFS.h
+index 1fbf9d18..80f9fea3 100644
+--- a/src/tvheadend/HTSPVFS.h
++++ b/src/tvheadend/HTSPVFS.h
+@@ -9,6 +9,7 @@
+ 
+ #include <memory>
+ #include <string>
++#include <cstdint>
+ 
+ namespace kodi
+ {
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
