Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B11CCFA04
	for <buildroot@archiver.kernel.org>; Tue,  4 Nov 2025 21:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 738F06113D;
	Tue,  4 Nov 2025 21:43:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id du22pAo3U4pN; Tue,  4 Nov 2025 21:42:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 118B861128
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 118B861128;
	Tue,  4 Nov 2025 21:42:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C56A462
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 21:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61E7D40E1E
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 21:42:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BbRcGwNL-2KW for <buildroot@buildroot.org>;
 Tue,  4 Nov 2025 21:42:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ADAD640E18
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADAD640E18
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ADAD640E18
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 21:42:53 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0d15.dip0.t-ipconnect.de [91.58.13.21])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 855A3A4C5F63;
 Tue,  4 Nov 2025 22:42:50 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42528)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vGOni-000000004PX-0cxs;
 Tue, 04 Nov 2025 21:42:50 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  4 Nov 2025 22:42:50 +0100
Message-ID: <20251104214250.3738188-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1762292570;
 bh=G8eaTgU3seKeJvc3qbnOpMMlFpLwbGtV6l5cIpvZig4=;
 h=From:To:Cc:Subject:Date:From;
 b=bg6wE21laZjq5YOyKQLnCRo4CDQ/tRbO2/ts9pHE9voQQVfpqaOzM9jsCYsXW3FXm
 29ZX9R/g39I0TpKh7Dbx+yqiB4cWbtmbw8fkW7rVccndcMahmNKRtgsqh5mUT6zglh
 R60sfE/prnP3ybJGacmObLZ1bCIXq3xoDG6ZThb9hjLvP/2it20/+b9h4POoXWT1lD
 gHNBGB9TT6DJRRIWwdKMtguQ8W8rWHz9UwVbJy1eY1Fneiqt69t4HuNyzbpT0nmnRi
 v5fNXx4AnuXv+PQuLLUlfiogBbQFBSm5Puo5RZuxGmN1kuLIZoH13rVM7WOhoNDf+m
 w3k1Nta22+ONA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=bg6wE21l
Subject: [Buildroot] [PATCH 1/1] package/sane-backends: fix build with gcc
 >= 15.x
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
https://autobuild.buildroot.net/results/296/2961e7aa23d66e7cf364c2caeafc1c226ccd48d9/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...sm3600.h-Fix-build-with-standard-C23.patch | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/sane-backends/0002-sm3600.h-Fix-build-with-standard-C23.patch

diff --git a/package/sane-backends/0002-sm3600.h-Fix-build-with-standard-C23.patch b/package/sane-backends/0002-sm3600.h-Fix-build-with-standard-C23.patch
new file mode 100644
index 0000000000..287de48285
--- /dev/null
+++ b/package/sane-backends/0002-sm3600.h-Fix-build-with-standard-C23.patch
@@ -0,0 +1,38 @@
+From 90815a9f2576c2428287a500cab6caeddb80f9a8 Mon Sep 17 00:00:00 2001
+From: Zdenek Dohnal <zdohnal@redhat.com>
+Date: Wed, 5 Feb 2025 13:19:11 +0100
+Subject: [PATCH] sm3600.h: Fix build with standard C23
+
+bool, true and false are keywords in the standard C23 - the sm3600
+backend defines them on its own, which is forbidden with the new
+standard.
+
+The patch adds ifdef guards for the affected typedef - the old code
+will be used for older standards, C23 will define TBool as bool.
+
+Upstream: https://gitlab.com/sane-project/backends/-/commit/90815a9f2576c2428287a500cab6caeddb80f9a8
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ backend/sm3600.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/backend/sm3600.h b/backend/sm3600.h
+index 2ecbeb236..5d8a8d809 100644
+--- a/backend/sm3600.h
++++ b/backend/sm3600.h
+@@ -77,7 +77,11 @@ Start: 2.4.2001
+ 
+ /* ====================================================================== */
+ 
++#if !defined(__STDC_VERSION__) || __STDC_VERSION__ < 202311L
+ typedef enum { false, true } TBool;
++#else
++typedef bool TBool;
++#endif /* GCC < 15 */
+ 
+ typedef SANE_Status TState;
+ 
+-- 
+GitLab
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
