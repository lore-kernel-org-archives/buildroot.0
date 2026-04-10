Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98383F36BAA
	for <buildroot@archiver.kernel.org>; Fri, 10 Apr 2026 05:19:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6298A60678;
	Fri, 10 Apr 2026 05:19:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QlIy5XYOBEMB; Fri, 10 Apr 2026 05:19:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A43E606F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775798353;
	bh=9g6RRjk21MG3OWDHTPVbh+R4rfMaOsvsqyfy2TT12tk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oZ/tUjZqGOozEacvijJRKHvau3MKcu5D93tdOmQ1QKL1YoV8/hArrMNlz7YHjzEgQ
	 5d1w2rRMaZxFf2+1DpDW8wCPcmXVjpIEQWbj18Lo+LB9+9wW6dbI3kFZ8m+6wnxOoT
	 0vmI84fqm3flv0YAjE3JZ2WdG208dzi5+l6stqki0FPJiRWrxR4RYOxB0GCaJcCsJW
	 WmKv4bWHN/Q94s3H1QtqiDQFY+ZivNcpk3xYac2ws3qp0cwceQd07lCQPmdgdTJ+lC
	 u7wHzRuyLDun9KVp/5sJDBGSocieb07MOEHvGBvSx0guLCQPn10kOB4+SjwGmTgW9I
	 Id4WaaZ2tK1Xw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A43E606F2;
	Fri, 10 Apr 2026 05:19:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 19156237
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 05:19:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F32654010A
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 05:19:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s_jB2AgRool9 for <buildroot@buildroot.org>;
 Fri, 10 Apr 2026 05:19:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C39C440070
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C39C440070
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C39C440070
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 05:19:10 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a090a.dip0.t-ipconnect.de [91.58.9.10])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 89D7EA4C063B;
 Fri, 10 Apr 2026 07:19:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56316)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wB4Gq-0000000070m-1gke;
 Fri, 10 Apr 2026 05:19:08 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Apr 2026 07:19:08 +0200
Message-ID: <20260410051908.25055-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775798348;
 bh=65qJyCPf/GvwPPZ1ce0pWTzJeIm0hXt6WaUkMsPKt2Y=;
 h=From:To:Cc:Subject:Date:From;
 b=vLRhtFESPwImO0vjnFPmdkxTEAay4vN1GiugYxChs2/4b9m+BfB3//g7gKXAO3xdZ
 SXweTuOStFgExYRjqNIq4jD5NXZLQj74hMKAziLCMfWyhjlELheYmO37OA+P3DgYjk
 ZGRebLt2YPM6JaCJpN6IQlBlWDrt7isVMktO+NfkK3k9ucNWtxcIdOnbH+1Jb0fsWf
 JS946oJ62DsKTEDoHjIwFKTpWY5F4cekOduDRjnJvYCtNKyc3qqAkBls2ch1L4LkUF
 j8KmsGG5jDOdvioX9WYZv5yoYBjQVsN5+8kJbGtGrC9t0jFN2LtaU/xvHlqH7abS16
 uS/+fremOveNQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=vLRhtFES
Subject: [Buildroot] [PATCH 1/1] package/libcap: security bump version to
 2.78
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

Release notes:
https://sites.google.com/site/fullycapable/release-notes-for-libcap#h.x4zn8j3lss6r

Removed patch which is included in this release.

Fixes CVE-2026-4878.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...Add-build-ldflags-to-_makenames-rule.patch | 34 -------------------
 package/libcap/libcap.hash                    |  2 +-
 package/libcap/libcap.mk                      |  2 +-
 3 files changed, 2 insertions(+), 36 deletions(-)
 delete mode 100644 package/libcap/0001-Revert-libcap-Add-build-ldflags-to-_makenames-rule.patch

diff --git a/package/libcap/0001-Revert-libcap-Add-build-ldflags-to-_makenames-rule.patch b/package/libcap/0001-Revert-libcap-Add-build-ldflags-to-_makenames-rule.patch
deleted file mode 100644
index ae9655fd57..0000000000
--- a/package/libcap/0001-Revert-libcap-Add-build-ldflags-to-_makenames-rule.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 542d7d86ecd2129dd5fe7e5b31ba307304f5b319 Mon Sep 17 00:00:00 2001
-From: "Andrew G. Morgan" <morgan@kernel.org>
-Date: Mon, 10 Nov 2025 18:26:34 -0800
-Subject: [PATCH] Revert "libcap: Add build ldflags to _makenames rule"
-
-This reverts commit c3ddf45d9afaab85d3b7db0dc7bfd1aafb8fde50.
-
-The details of what this broke are here:
-
-  https://bugzilla.kernel.org/show_bug.cgi?id=220691#c2
-
-Signed-off-by: Andrew G. Morgan <morgan@kernel.org>
-Upstream: 542d7d86ecd2129dd5fe7e5b31ba307304f5b319
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- libcap/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libcap/Makefile b/libcap/Makefile
-index f0eb87e..e90a950 100644
---- a/libcap/Makefile
-+++ b/libcap/Makefile
-@@ -80,7 +80,7 @@ $(PSXTITLE).pc: $(PSXTITLE).pc.in
- 		$< >$@
- 
- _makenames: _makenames.c cap_names.list.h
--	$(BUILD_CC) $(BUILD_CFLAGS) $(BUILD_CPPFLAGS) $< -o $@ $(BUILD_LDFLAGS)
-+	$(BUILD_CC) $(BUILD_CFLAGS) $(BUILD_CPPFLAGS) $< -o $@
- 
- cap_names.h: _makenames
- 	./_makenames > cap_names.h
--- 
-2.51.1
-
diff --git a/package/libcap/libcap.hash b/package/libcap/libcap.hash
index 1925060235..735481f33c 100644
--- a/package/libcap/libcap.hash
+++ b/package/libcap/libcap.hash
@@ -1,5 +1,5 @@
 # https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/sha256sums.asc
-sha256  897bc18b44afc26c70e78cead3dbb31e154acc24bee085a5a09079a88dbf6f52  libcap-2.77.tar.xz
+sha256  0d621e562fd932ccf67b9660fb018e468a683d7b827541df27813228c996bb11  libcap-2.78.tar.xz
 
 # Hash for license file:
 sha256  68467e731f4744bd6e0bb69e8df9c3a994e09cd6b203d0c41327ac6d079c581d  License
diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index 37ccdc22b4..f3cd49ff0f 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCAP_VERSION = 2.77
+LIBCAP_VERSION = 2.78
 LIBCAP_SITE = https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2
 LIBCAP_SOURCE = libcap-$(LIBCAP_VERSION).tar.xz
 LIBCAP_LICENSE = GPL-2.0 or BSD-3-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
