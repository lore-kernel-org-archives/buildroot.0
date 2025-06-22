Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E352DC7115C
	for <buildroot@archiver.kernel.org>; Sun, 22 Jun 2025 10:29:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3D0E41C76;
	Sun, 22 Jun 2025 10:29:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dJJmhHQWfTpb; Sun, 22 Jun 2025 10:29:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02CF541C7E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02CF541C7E;
	Sun, 22 Jun 2025 10:29:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A413C8
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 10:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C89C60C18
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 10:29:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id spuL0Prh5nNz for <buildroot@buildroot.org>;
 Sun, 22 Jun 2025 10:29:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 480B260DF4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 480B260DF4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 480B260DF4
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 10:29:37 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0bd3.dip0.t-ipconnect.de [91.58.11.211])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3B431A4C2539
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 12:29:23 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52188)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uTHww-0000000013Z-1UAC
 for buildroot@buildroot.org; Sun, 22 Jun 2025 10:29:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 22 Jun 2025 12:29:21 +0200
Message-Id: <20250622102922.3847947-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250622102922.3847947-1-bernd@kuhls.net>
References: <20250622102922.3847947-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1750588163;
 bh=Unu5I6A1TyfxdnCmrel4Fw0JtH4w4bZsPyz2jCXztiY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=QHFYsKduOsL4Bpt3aA1EpkqnI/icLv7QtdA5s+p79DihlCtlwEYGLcjb6EeVBHC5w
 gw5D4pVCWLjRNlz3HRRfYCtuO29fNOad7BCnkmDKbjr695qxrse8iZSXVZ6JtG2cdZ
 yKQX+kZSD145tF9YT0XeVfPijOOMOOxSAd9N1hzmtKDes/fKt35l/vR4Y4YMJBfGX2
 Kfm7CKY2hasFCiUO2JUAXvwu6PSILFV5V3KnuyQDfVfS9QTA/0OQiryxPxqDY+oYbb
 GTY0S84O/jHRYaIWgz3J01Tw2EK3rdaU2nRrgCmRPOvuz5pgmRWWP6OwR+KUuPCxh9
 IJHWmfS/CWAjw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=QHFYsKdu
Subject: [Buildroot] [PATCH 2/3] package/ntp: fix build with gcc-14
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
https://autobuild.buildroot.org/results/114/114a81f216b44a00c5de830e21315df68a62987d/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ntp/0006-stime.patch | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 package/ntp/0006-stime.patch

diff --git a/package/ntp/0006-stime.patch b/package/ntp/0006-stime.patch
new file mode 100644
index 0000000000..7707231cf8
--- /dev/null
+++ b/package/ntp/0006-stime.patch
@@ -0,0 +1,21 @@
+Fix stime build error with gcc-14:
+
+machines.c: In function 'ntp_set_tod':
+machines.c:484:28: error: passing argument 1 of 'stime' from incompatible pointer type [-Wincompatible-pointer-types]
+  484 |                 rc = stime(&tp); /* lie as bad as SysVR4 */
+
+Upstream: https://bugs.ntp.org/show_bug.cgi?id=3981#c2
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+--- a/libntp/machines.c	2025-05-26 18:21:43 +0000
++++ a/libntp/machines.c	2025-05-26 18:21:43 +0000
+@@ -478,7 +478,7 @@ 
+ #endif /* HAVE_SETTIMEOFDAY */
+ #ifdef HAVE_STIME
+ 	if (rc && (SET_TOD_STIME == tod || !tod)) {
+-		long tp = tvp->tv_sec;
++		time_t tp = tvp->tv_sec;
+ 
+ 		errno = 0;
+ 		rc = stime(&tp); /* lie as bad as SysVR4 */
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
