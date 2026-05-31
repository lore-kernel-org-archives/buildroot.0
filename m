Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72361CD5BD1
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 06:21:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 486EA84BB1;
	Sun, 31 May 2026 06:21:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JZjuPBPle_eW; Sun, 31 May 2026 06:21:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 729E884BB8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780208468;
	bh=wCez3NOKENQIoNPE5rLw6dx1siQ2be/etXP1Bxmxty8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LIeYdcYfdqqawX8ZSLU+/zpwtyCaBZQJShGijshBtaN9IvJ+VkxTiRjNmnFT7SmHf
	 zbwIWx5idgNsqI487PUEG0FLqHksV5cTUakRt4BPkgxkgA50q8aPDTXaD6qwt71dfS
	 i3/f1sZNXJcnQnFGjBJ1yqxNiSo/UOvacjbjR6alagc5LnG8etCeIrYP0VohTOHk9/
	 jFdEUk/6GhCEuZlLV8k/LrZS4mWrHOUZ62RS4IelXsvQanF1s2Ev+Co2xgFkdJgBT1
	 pQpgQvke/MMiYcUP9ieUSJLo/lI/V3aIuytt1aft074T/wyNcTmWxytJPrPtzvFjwe
	 3YNYIZH1Cuchw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 729E884BB8;
	Sun, 31 May 2026 06:21:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C98E257
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:21:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 851CB401EF
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:21:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gl8ppxE-PDEb for <buildroot@buildroot.org>;
 Sun, 31 May 2026 06:21:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 63ACD405A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63ACD405A3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 63ACD405A3
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:21:05 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0bc7.dip0.t-ipconnect.de [91.58.11.199])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8597BA4C115A;
 Sun, 31 May 2026 08:21:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38400)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wTZXj-000000007s4-2LJp;
 Sun, 31 May 2026 06:21:03 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
Date: Sun, 31 May 2026 08:21:03 +0200
Message-ID: <20260531062103.7093-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780208463;
 bh=HMi4RaASpavIB22IXJYYTpLADTu2aB8s/Ed6Su1xT/8=;
 h=From:To:Cc:Subject:Date:From;
 b=EnzQdHT92saUp3O6Bx+QDGitOmbw3eN7yP5VNKfJBmEsIygGwyJC+H5SSE2OtL5hD
 VN5H8sgU0mrLde9kym9qSxr8b4t0lELZC0j70aKEmdehvS+pK2uFUd/o4Arys/Y8Ie
 lxI699QR3cemL76VMFVz4qy/P177XBkCiQYaNS13F7IjxCk4/lniwWXGRLOKhCMjLa
 Qc2sXSToD0JwdBB0C7ixXQ7+FSniubaEHGLwejt3HDx4+1/UfUr+uqmVSqLUpCNpvs
 aQP2ZWyPK7pHsg+24IRxJ1E37yPKXz2wUlSO2Y5RoHgnyBIlCMRhr1OtNSBKE0p9z5
 ppJSZX2XdXT6w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=EnzQdHT9
Subject: [Buildroot] [PATCH/next v2 1/1] package/lensfun: bump version
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

Last release dates back to Jul 2023 with >3000 commits since then:
https://github.com/lensfun/lensfun/issues/2634

Removed patch which is included in this version.

Renamed CMake option PYTHON to INSTALL_PYTHON_MODULE:
Upstream renamed PYTHON to PYTHONINTERP_FOUND with commit
https://github.com/lensfun/lensfun/commit/824b9d36c13f97b415a94d271e35c815ea576b21
and later guarded the python code with a new CMake option
INSTALL_PYTHON_MODULE which we now use.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/3a36bc303f757b5941ae0a859f56b2626c832965

 package/lensfun/0001-cmake4.patch | 29 -----------------------------
 package/lensfun/lensfun.hash      |  2 +-
 package/lensfun/lensfun.mk        |  8 +++++---
 3 files changed, 6 insertions(+), 33 deletions(-)
 delete mode 100644 package/lensfun/0001-cmake4.patch

diff --git a/package/lensfun/0001-cmake4.patch b/package/lensfun/0001-cmake4.patch
deleted file mode 100644
index d7973f4cb7..0000000000
--- a/package/lensfun/0001-cmake4.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 011de2e85813ff496a85404b30891352555de077 Mon Sep 17 00:00:00 2001
-From: Jonas <git@jonas-ott.de>
-Date: Fri, 17 Feb 2023 18:26:01 +0100
-Subject: [PATCH] cmake: use FindPython3 (#1983)
-
-@jonas-ott Thank you for contributing!
-
-Upstream: https://github.com/lensfun/lensfun/commit/011de2e85813ff496a85404b30891352555de077
-
-[Bernd: partial backport to version 0.3.4]
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- CMakeLists.txt       |  4 ++--
- apps/CMakeLists.txt  | 55 +++++++++++++++++++++-----------------------
- tests/CMakeLists.txt |  4 ++--
- 3 files changed, 30 insertions(+), 33 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 5ccb9976d..7bb7a6878 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,5 +1,5 @@
--# require at least cmake 2.8.12
--CMAKE_MINIMUM_REQUIRED(VERSION 2.8.12 FATAL_ERROR )
-+# require at least cmake 3.12
-+CMAKE_MINIMUM_REQUIRED(VERSION 3.12 FATAL_ERROR)
- 
- # path for helper modules
- set(CMAKE_MODULE_PATH "${CMAKE_MODULE_PATH}" "${CMAKE_SOURCE_DIR}/cmake/modules")
diff --git a/package/lensfun/lensfun.hash b/package/lensfun/lensfun.hash
index 5cb4fe37cd..f73ea46e17 100644
--- a/package/lensfun/lensfun.hash
+++ b/package/lensfun/lensfun.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  dafb39c08ef24a0e2abd00d05d7341b1bf1f0c38bfcd5a4c69cf5f0ecb6db112  lensfun-0.3.4.tar.gz
+sha256  656fb82a0501616b4024854fc716f004cf07d28443ee09fcf436afb6722da561  lensfun-268821c02495c0ffff8332417f0d59bdbefa545d.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  docs/gpl-3.0.txt
 sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  docs/lgpl-3.0.txt
diff --git a/package/lensfun/lensfun.mk b/package/lensfun/lensfun.mk
index 59f008ce6d..d9b4faa8d5 100644
--- a/package/lensfun/lensfun.mk
+++ b/package/lensfun/lensfun.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LENSFUN_VERSION = 0.3.4
-LENSFUN_SITE = $(call github,lensfun,lensfun,v$(LENSFUN_VERSION))
+LENSFUN_VERSION = 268821c02495c0ffff8332417f0d59bdbefa545d
+LENSFUN_SITE = $(call github,lensfun,lensfun,$(LENSFUN_VERSION))
 LENSFUN_LICENSE = LGPL-3.0+ (libraries), GPL-3.0+ (programs)
 LENSFUN_LICENSE_FILES = docs/gpl-3.0.txt docs/lgpl-3.0.txt
 LENSFUN_INSTALL_STAGING = YES
@@ -42,6 +42,8 @@ endif
 
 # Don't install helper scripts (which require python3 and gksudo).
 # Don't run setup.py on the host.
-LENSFUN_CONF_OPTS += -DINSTALL_HELPER_SCRIPTS=OFF -DPYTHON=OFF
+LENSFUN_CONF_OPTS += \
+	-DINSTALL_HELPER_SCRIPTS=OFF \
+	-DINSTALL_PYTHON_MODULE=OFF
 
 $(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
