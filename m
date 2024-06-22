Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8838C2BB85
	for <buildroot@archiver.kernel.org>; Sat, 22 Jun 2024 08:43:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6584D40567;
	Sat, 22 Jun 2024 08:43:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8cQZMwfbzRk9; Sat, 22 Jun 2024 08:43:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 114FD405D9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 114FD405D9;
	Sat, 22 Jun 2024 08:43:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 10FCB1BF27A
 for <buildroot@lists.busybox.net>; Sat, 22 Jun 2024 08:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0BE766063D
 for <buildroot@lists.busybox.net>; Sat, 22 Jun 2024 08:43:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 45f3EJpZJd1K for <buildroot@lists.busybox.net>;
 Sat, 22 Jun 2024 08:43:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 02C8760628
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02C8760628
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 02C8760628
 for <buildroot@buildroot.org>; Sat, 22 Jun 2024 08:43:24 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cf60.dip0.t-ipconnect.de [79.214.207.96])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2467FA4C0403
 for <buildroot@buildroot.org>; Sat, 22 Jun 2024 10:43:23 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42004)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1sKwLC-000000001kt-2ftS
 for buildroot@buildroot.org; Sat, 22 Jun 2024 08:43:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 22 Jun 2024 10:43:22 +0200
Message-Id: <20240622084322.10480-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1719045803;
 bh=f5UaEf3xFIhpCnMxGs7NbU++82/GkLTzyREC8XYrx/8=;
 h=From:To:Subject:Date:From;
 b=dcvMiEW47eMEq7tXe2Zolwm3wSzJRlCmL4Djt8lCIVRwoKmkWuHjqMnd0lyLg+Xlx
 34JggSPPFoYmhdLVyBIcT0OQNRwSK9THIDKpuAad86hUMK35X05fUcpegTduJz80Jf
 kDL1zzysuwl71lMiJdoj6qazFPcjWS08W+AEtuyCWKMbFUvpitZpFbmJV6Z0ysHRV7
 +wEZlYtZmWQ72NXYS54+oNemUKWf9hlGqBRIHM9DWJ2uT2V730CgXmQyuu7RhqPcIq
 /YJNIs7VqopB2plkbCL3l2S3ahZHcCDgF09rqKEOnzBzpMEbopxcKO0t5cwiXuYFnr
 qzLvqrAfhFykQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=dcvMiEW4
Subject: [Buildroot] [PATCH 1/1] package/ghostscript: security bump version
 to 10.03.1
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

Fixes CVE-2024-33869, CVE-2023-52722, CVE-2024-33870, CVE-2024-33871
and CVE-2024-29510.

Release notes:
https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/tag/gs10031

Remove patch which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0001-Fix-build-without-BUILD_PDF.patch    | 34 -------------------
 package/ghostscript/ghostscript.hash          |  4 +--
 package/ghostscript/ghostscript.mk            |  2 +-
 3 files changed, 3 insertions(+), 37 deletions(-)
 delete mode 100644 package/ghostscript/0001-Fix-build-without-BUILD_PDF.patch

diff --git a/package/ghostscript/0001-Fix-build-without-BUILD_PDF.patch b/package/ghostscript/0001-Fix-build-without-BUILD_PDF.patch
deleted file mode 100644
index af69cd3670..0000000000
--- a/package/ghostscript/0001-Fix-build-without-BUILD_PDF.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 088f3cd6e58cff5fa51e072d1829f7691a5f6681 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 20 Sep 2023 13:44:28 +0100
-Subject: [PATCH] Fix build without BUILD_PDF
-
-The PDFSetParams PostScript extension operator was missing a stub function definition
-when the PDF interpreter is not built in.
-
- Author:    Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://git.ghostscript.com/?p=ghostpdl.git;a=commit;h=088f3cd6e58cff5fa51e072d1829f7691a5f6681
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- psi/zpdfops.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/psi/zpdfops.c b/psi/zpdfops.c
-index e7e0a42ee..271687a18 100644
---- a/psi/zpdfops.c
-+++ b/psi/zpdfops.c
-@@ -1507,6 +1507,11 @@ static int zPDFdrawannots(i_ctx_t *i_ctx_p)
-     return_error(gs_error_undefined);
- }
- 
-+static int zPDFSetParams(i_ctx_t *i_ctx_p)
-+{
-+    return_error(gs_error_undefined);
-+}
-+
- static int zPDFInit(i_ctx_t *i_ctx_p)
- {
-     return_error(gs_error_undefined);
--- 
-2.34.1
-
diff --git a/package/ghostscript/ghostscript.hash b/package/ghostscript/ghostscript.hash
index 849f6c64ba..ed8e4cf7d9 100644
--- a/package/ghostscript/ghostscript.hash
+++ b/package/ghostscript/ghostscript.hash
@@ -1,5 +1,5 @@
-# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10021/SHA512SUMS
-sha512  ee0f754c1bd8a18428ad14eaa3ead80ff8b96275af5012e7a8384f1f10490da056eec9ae3cc791a7a13a24e16e54df5bccdd109c7d53a14534bbd7360a300b11  ghostscript-10.02.1.tar.xz
+# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10031/SHA512SUMS
+sha512  59e071cd23aed246b51317d3cccd9ccf8e1e84c4ecf9b22fb938e561eff42cec61915b0bdd96a313a3ea27750579c54ca0d0862b65edd306a621731c0063ffd3  ghostscript-10.03.1.tar.xz
 
 # Hash for license file:
 sha256  8ce064f423b7c24a011b6ebf9431b8bf9861a5255e47c84bfb23fc526d030a8b  LICENSE
diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index da23ebbadb..80e2543d1c 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GHOSTSCRIPT_VERSION = 10.02.1
+GHOSTSCRIPT_VERSION = 10.03.1
 GHOSTSCRIPT_SOURCE = ghostscript-$(GHOSTSCRIPT_VERSION).tar.xz
 GHOSTSCRIPT_SITE = https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs$(subst .,,$(GHOSTSCRIPT_VERSION))
 GHOSTSCRIPT_LICENSE = AGPL-3.0
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
