Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E59EA3C4E
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 13:17:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BDD04101F;
	Thu,  9 Apr 2026 13:17:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r28p9vsk1VRi; Thu,  9 Apr 2026 13:17:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7816741030
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775740653;
	bh=FG13OsG90LinSMjnZoRdS2QDcqODTCVf55ldhgidux0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=VO+Cb+s+sULJ0Ohenhz9k1HHTxkagzE7FxVSvfrIfmsbhhgglBuyvIgBhMAAG1mGq
	 OLkssoYDi2X3OGK8lz8kdzapZPU/JV3NXaDFRNoBMgIUXTC+J2arZNxYW+qvwd7QNO
	 66ebVNg16OxUHGLQpFwhPp3I2M6c8srXrIFT/b+unod4xHbOQ9cXo5yVMGTz5GeUrS
	 aQrbVxLuGuHY8CL83LsxHNNYIddcj0lyEb5HO9GdjkbEKWeJ3hu0Ax/2eCmM8MAf7M
	 uJTJWf+Uyn+jTKutbhtaMnRllTTb+GfZyH3GwLnrcqJEAkS5F3SFTWyh/VNEqk6Q+l
	 2cBOcLf79XHKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7816741030;
	Thu,  9 Apr 2026 13:17:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1401A1F6
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 13:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 061A841030
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 13:17:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XtKffm1BC17o for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 13:17:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C69094101F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C69094101F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C69094101F
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 13:17:30 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ca66.dip0.t-ipconnect.de [79.214.202.102])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6B1FCA4C0985;
 Thu,  9 Apr 2026 15:17:28 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51150)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wApGC-000000002MU-1GEW;
 Thu, 09 Apr 2026 13:17:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  9 Apr 2026 15:17:27 +0200
Message-ID: <20260409131728.278764-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775740648;
 bh=9+4ErCtMOkAp3mpnLZUj9DqJ80Vw/BTfA8C6f+yzS6U=;
 h=From:To:Cc:Subject:Date:From;
 b=RX2zOe4iMzmY54giBVtJAfbo3/rd2i/yagT2wQlVtelxLCHAqUUWqAiAIhZVvccvo
 rzYzto8H9coRv9k4BYXgt7i+ESQ2MT+26bzs43m56dTJRq068UsrzR5rS0Y9aJ1gle
 3x7J41+bBorW+M1vqAm+qDt7V8G6BuWzQtvjHF5KTVXjbDDYf7eDh8vHS0aKFcUVZh
 MGVqKe3SbfBeBICOSQtqIIiEOKOla9UVKretzyNbpMEnBlV3FoFTW/3A6b6h8Gt6pU
 J/NT6JVBLXDP0QY+oifXWM2YZLb+P4mk1Fi95+qee6i5wKB2V3W05+geNgfgdLjQ2p
 W75nWrvOkKl+Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=RX2zOe4i
Subject: [Buildroot] [PATCH 1/1] package/python3: security bump version to
 3.14.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://www.python.org/downloads/release/python-3144/
https://docs.python.org/release/3.14.4/whatsnew/changelog.html

Fixes
CVE 2026-4224: https://www.cve.org/CVERecord?id=CVE-2026-4224
CVE 2026-3644: https://www.cve.org/CVERecord?id=CVE-2026-3644
CVE 2026-2297: https://www.cve.org/CVERecord?id=CVE-2026-2297

Rebased patch 0010 due to upstream commit
https://github.com/python/cpython/commit/616e6118442832544fab0b93e9dd7d15411a2a58

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...-Fix-compilation-of-Modules-_remote_debuggi.patch | 12 ++++++------
 package/python3/python3.hash                         |  4 ++--
 package/python3/python3.mk                           |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/python3/0010-gh-139275-Fix-compilation-of-Modules-_remote_debuggi.patch b/package/python3/0010-gh-139275-Fix-compilation-of-Modules-_remote_debuggi.patch
index 716d9d3e8a..b000a68e9b 100644
--- a/package/python3/0010-gh-139275-Fix-compilation-of-Modules-_remote_debuggi.patch
+++ b/package/python3/0010-gh-139275-Fix-compilation-of-Modules-_remote_debuggi.patch
@@ -7,7 +7,7 @@ Subject: [PATCH] gh-139275: Fix compilation of
 
 Upstream: https://github.com/python/cpython/commit/1963e701001839389cfb1b11d803b0743f4705d7
 
-[ Bernd Kuhls: ported to Python 3.14.2]
+[ Bernd Kuhls: ported to Python 3.14.4]
 [ Vincent Fazio: update to apply cleanly to 3.14.3 ]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
@@ -29,28 +29,28 @@ diff --git a/Modules/_remote_debugging_module.c b/Modules/_remote_debugging_modu
 index b46538b76df..e86a27d5812 100644
 --- a/Modules/_remote_debugging_module.c
 +++ b/Modules/_remote_debugging_module.c
-@@ -812,7 +812,7 @@ _Py_RemoteDebug_GetAsyncioDebugAddress(proc_handle_t* handle)
+@@ -834,7 +834,7 @@ _Py_RemoteDebug_GetAsyncioDebugAddress(proc_handle_t* handle)
          PyErr_SetString(PyExc_RuntimeError, "Failed to find the AsyncioDebug section in the process.");
          _PyErr_ChainExceptions1(exc);
      }
 -#elif defined(__linux__)
 +#elif defined(__linux__) && HAVE_PROCESS_VM_READV
      // On Linux, search for asyncio debug in executable or DLL
-     address = search_linux_map_for_section(handle, "AsyncioDebug", "_asyncio.cpython");
+     address = search_linux_map_for_section(handle, "AsyncioDebug", "_asyncio.cpython", NULL);
      if (address == 0) {
 diff --git a/Python/remote_debug.h b/Python/remote_debug.h
 index 8f9b6cd4c49..b7d17a0f345 100644
 --- a/Python/remote_debug.h
 +++ b/Python/remote_debug.h
-@@ -886,7 +886,7 @@ _Py_RemoteDebug_GetPyRuntimeAddress(proc_handle_t* handle)
+@@ -923,7 +923,7 @@
              handle->pid);
          _PyErr_ChainExceptions1(exc);
      }
 -#elif defined(__linux__)
 +#elif defined(__linux__) && HAVE_PROCESS_VM_READV
      // On Linux, search for 'python' in executable or DLL
-     address = search_linux_map_for_section(handle, "PyRuntime", "python");
-     if (address == 0) {
+     address = search_linux_map_for_section(handle, "PyRuntime", "python",
+                                            _Py_RemoteDebug_ValidatePyRuntimeCookie);
 -- 
 2.47.3
 
diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index b674b589bd..13e2b94336 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,4 +1,4 @@
-# From https://www.python.org/downloads/release/python-3143/
-sha256  a97d5549e9ad81fe17159ed02c68774ad5d266c72f8d9a0b5a9c371fe85d902b  Python-3.14.3.tar.xz
+# From https://www.python.org/downloads/release/python-3144/
+sha256  d923c51303e38e249136fc1bdf3568d56ecb03214efdef48516176d3d7faaef8  Python-3.14.4.tar.xz
 # Locally computed
 sha256  b0e25a78cffb43f4d92de8b61ccfa1f1f98ecbc22330b54b5251e7b6ba010231  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 07cba7c02d..c71cb0b05b 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.14
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).3
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).4
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
