Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB6FC197BF
	for <buildroot@archiver.kernel.org>; Thu, 27 Feb 2025 18:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E218B83FBB;
	Thu, 27 Feb 2025 18:55:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NUqxqfr6G0FJ; Thu, 27 Feb 2025 18:55:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D56E083FB9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D56E083FB9;
	Thu, 27 Feb 2025 18:55:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 58F68711
 for <buildroot@buildroot.org>; Thu, 27 Feb 2025 18:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47A2E83A1C
 for <buildroot@buildroot.org>; Thu, 27 Feb 2025 18:55:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c3LOFATJ4Z3i for <buildroot@buildroot.org>;
 Thu, 27 Feb 2025 18:55:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A763683FC3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A763683FC3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A763683FC3
 for <buildroot@buildroot.org>; Thu, 27 Feb 2025 18:55:43 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0987.dip0.t-ipconnect.de [91.58.9.135])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D14EBA4C0140
 for <buildroot@buildroot.org>; Thu, 27 Feb 2025 19:55:39 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38016)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.1)
 (envelope-from <bernd@kuhls.net>) id 1tnj2o-000000008Pu-3Mx5
 for buildroot@buildroot.org; Thu, 27 Feb 2025 18:55:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 27 Feb 2025 19:55:38 +0100
Message-Id: <20250227185538.3305700-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1740682539;
 bh=eMMAyXCEJJwVWI4Dru4EzhkI726EZ75KjrEOWoBMg30=;
 h=From:To:Subject:Date:From;
 b=SuqbHUe4s3AO8xQoYt/+XKz2eVWcRjvsZ5sQZMUUdKWt5OcHt24Z501ifPGTOxwpb
 SmLzfyJWOIPIK3kGOOOBY4hS2x/E3HUOsVWUouWNdDbxsJqNJhEGPBHDxu9k2W/d3P
 DVfIAyY5ElbGxJHnFOFW9x+CF1EJ9s0catA/USLPFWW1jQLD3kcum4r3DbUKd2r8Et
 nWCbxu4zxIOLk7VlpskX/7XB1Us+ITQSxLm+LT6Dee50zS7DoDc2vNCz8QV4dQ543s
 HGAfBWrCo4m619j4CiHS5AvNccNiQoMPixueC/l/DY3VE+uBdABtMzBcXjXr55G/BX
 E62dFTVk9a1UQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=SuqbHUe4
Subject: [Buildroot] [PATCH 1/1] package/libcec: bump version to 7.0.0
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
https://github.com/Pulse-Eight/libcec/releases/tag/libcec-7.0.0

Removed patch which is included in this release.

License file was renamed upstream:
https://github.com/Pulse-Eight/libcec/commit/da640961528178e82a447038446db4afe31a899e

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0001-cecloader-h-fix-null-return.patch    | 37 -------------------
 package/libcec/libcec.hash                    |  4 +-
 package/libcec/libcec.mk                      |  4 +-
 3 files changed, 4 insertions(+), 41 deletions(-)
 delete mode 100644 package/libcec/0001-cecloader-h-fix-null-return.patch

diff --git a/package/libcec/0001-cecloader-h-fix-null-return.patch b/package/libcec/0001-cecloader-h-fix-null-return.patch
deleted file mode 100644
index 424e41c0ae..0000000000
--- a/package/libcec/0001-cecloader-h-fix-null-return.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 452b2049b2ee3e73968c603e5524b2d349ac0c3e Mon Sep 17 00:00:00 2001
-From: psykose <alice@ayaya.dev>
-Date: Sat, 9 Apr 2022 17:59:11 +0000
-Subject: [PATCH] cecloader.h: fix null return
-
-returning NULL is invalid for a return type of bool when NULL is defined
-as `nullptr` instead of 0L
-
-[Retrieved from:
-https://github.com/Pulse-Eight/libcec/pull/599/commits/452b2049b2ee3e73968c603e5524b2d349ac0c3e]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- include/cecloader.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/include/cecloader.h b/include/cecloader.h
-index be76468f..550f598e 100644
---- a/include/cecloader.h
-+++ b/include/cecloader.h
-@@ -172,7 +172,7 @@ bool LibCecBootloader(const char *strLib = NULL)
-     if (!g_libCEC)
-     {
-       std::cout << dlerror() << std::endl;
--      return NULL;
-+      return false;
-     }
-   }
- 
-@@ -181,7 +181,7 @@ bool LibCecBootloader(const char *strLib = NULL)
-   if (!LibCecBootloader)
-   {
-     std::cout << "cannot find CECStartBootloader" << std::endl;
--    return NULL;
-+    return false;
-   }
- 
-   bool bReturn = LibCecBootloader();
diff --git a/package/libcec/libcec.hash b/package/libcec/libcec.hash
index 3e5a443057..b019f53a5f 100644
--- a/package/libcec/libcec.hash
+++ b/package/libcec/libcec.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  090696d7a4fb772d7acebbb06f91ab92e025531c7c91824046b9e4e71ecb3377  libcec-6.0.2.tar.gz
-sha256  0137261d24ce001fc5237aacddd267533e0f150ac23cf21acffea599f7358f7a  COPYING
+sha256  7f9e57ae9fad37649adb6749b8f1310a71ccf3e92ae8b2d1cc9e8ae2d1da83f8  libcec-7.0.0.tar.gz
+sha256  0137261d24ce001fc5237aacddd267533e0f150ac23cf21acffea599f7358f7a  LICENSE.md
diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
index 33e0463eb8..a45f074c30 100644
--- a/package/libcec/libcec.mk
+++ b/package/libcec/libcec.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-LIBCEC_VERSION = 6.0.2
+LIBCEC_VERSION = 7.0.0
 LIBCEC_SITE = $(call github,Pulse-Eight,libcec,libcec-$(LIBCEC_VERSION))
 LIBCEC_LICENSE = GPL-2.0+
-LIBCEC_LICENSE_FILES = COPYING
+LIBCEC_LICENSE_FILES = LICENSE.md
 
 LIBCEC_INSTALL_STAGING = YES
 LIBCEC_DEPENDENCIES = host-pkgconf libplatform
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
