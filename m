Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3BA3C4829E
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 14:32:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ABE5E40B5B;
	Mon, 12 Feb 2024 14:32:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EPF22d51zcPw; Mon, 12 Feb 2024 14:32:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE0E540B5C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE0E540B5C;
	Mon, 12 Feb 2024 14:32:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 11D731BF28F
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 14:32:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F311E82B61
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 14:32:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rw8pYAazcR3h for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 14:32:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 56BDD82B84
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56BDD82B84
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 56BDD82B84
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 14:32:29 +0000 (UTC)
Received: from 91-153-34-210.elisa-laajakaista.fi ([91.153.34.210] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rZXM8-00GWZJ-IB; Mon, 12 Feb 2024 15:32:24 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id c3fca7a7;
 Mon, 12 Feb 2024 14:32:22 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Mon, 12 Feb 2024 16:32:18 +0200
Message-ID: <20240212143222.1555220-2-aperez@igalia.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240212143222.1555220-1-aperez@igalia.com>
References: <20240212143222.1555220-1-aperez@igalia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dYEBSISmi3ueFkPGzo+uFNmzf/8wDgiL/1kHh/5hZFg=; b=r5KMbMU4p4PELevkFlI36lWHgJ
 5eK0pZE7+qW1KsDm1yUJlSU9S7QsrmB6d5ISCuoDvOOeU6aVaBNPH04XuzSy4QerWeK+eS5pyerK1
 iBp+J5k81Fsc9ENJL/Q2lxodcmaOyplEeLV934tpDRpv5riEjwKn87p+GNif5Tt5rC6FyCYJ/Yat/
 PWeA1jhr+7piYEv51XY1Bl18RUUH3DC9WdgqjZEcQJpnME5m9PIDf80DRLwc+JdtcoWLN8w64jKGH
 PCt1F6TrM4HOPsG1YOfeZJMnbUyjCeUQTf/ybYfi6Y44QWu7Hcj0QotqnVR8ZOyCyAxOa1oxJt8Cz
 f3RDPw9w==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=r5KMbMU4
Subject: [Buildroot] [PATCH 1/2] package/wpewebkit: security bump to version
 2.42.5
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security issues:

https://wpewebkit.org/security/WSA-2024-0001.html

- CVE-2024-23222: Processing maliciously crafted web content may lead to
  arbitrary code execution. Apple is aware of a report that this issue
  may have been exploited. Description: A type confusion issue was
  addressed with improved checks.

- CVE-2024-23206: A maliciously crafted webpage may be able to
  fingerprint the user. Description: An access issue was addressed with
  improved access restrictions.

- CVE-2024-23213: Processing web content may lead to arbitrary code
  execution. Description: The issue was addressed with improved memory
  handling.

Add an upstream post-2.42.5 patch to fix an issue with an invalid
backport causing a build issue.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 ...velInterpreter.cpp-339-21-error-t6-w.patch | 39 +++++++++++++++++++
 package/wpewebkit/wpewebkit.hash              |  6 +--
 package/wpewebkit/wpewebkit.mk                |  3 +-
 3 files changed, 44 insertions(+), 4 deletions(-)
 create mode 100644 package/wpewebkit/0002-GTK-2.42.5-LowLevelInterpreter.cpp-339-21-error-t6-w.patch

diff --git a/package/wpewebkit/0002-GTK-2.42.5-LowLevelInterpreter.cpp-339-21-error-t6-w.patch b/package/wpewebkit/0002-GTK-2.42.5-LowLevelInterpreter.cpp-339-21-error-t6-w.patch
new file mode 100644
index 0000000000..a15d9e647f
--- /dev/null
+++ b/package/wpewebkit/0002-GTK-2.42.5-LowLevelInterpreter.cpp-339-21-error-t6-w.patch
@@ -0,0 +1,39 @@
+From 3d5373575695b293b8559155431d0079a6153aff Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@redhat.com>
+Date: Mon, 5 Feb 2024 11:00:49 -0600
+Subject: [PATCH] =?UTF-8?q?[GTK]=20[2.42.5]=20LowLevelInterpreter.cpp:339:?=
+ =?UTF-8?q?21:=20error:=20=E2=80=98t6=E2=80=99=20was=20not=20declared=20in?=
+ =?UTF-8?q?=20this=20scope=20https://bugs.webkit.org/show=5Fbug.cgi=3Fid?=
+ =?UTF-8?q?=3D268739?=
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Unreviewed build fix. Seems a backport went badly, and we didn't notice
+because the code is architecture-specific.
+
+* Source/JavaScriptCore/llint/LowLevelInterpreter.cpp:
+(JSC::CLoop::execute):
+
+Upstream: https://github.com/WebKit/WebKit/commit/3d5373575695b293b8559155431d0079a6153aff
+Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
+---
+ Source/JavaScriptCore/llint/LowLevelInterpreter.cpp | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp b/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
+index 5064ead6cd2e..9a2e2653b121 100644
+--- a/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
++++ b/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
+@@ -336,8 +336,6 @@ JSValue CLoop::execute(OpcodeID entryOpcodeID, void* executableAddress, VM* vm,
+     UNUSED_VARIABLE(t2);
+     UNUSED_VARIABLE(t3);
+     UNUSED_VARIABLE(t5);
+-    UNUSED_VARIABLE(t6);
+-    UNUSED_VARIABLE(t7);
+
+     struct StackPointerScope {
+         StackPointerScope(CLoopStack& stack)
+--
+2.43.1
+
diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index 322e494c36..71e41bb1dd 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,6 +1,6 @@
-# From https://wpewebkit.org/releases/wpewebkit-2.42.4.tar.xz.sums
-sha1  34da38e9554586154c83fdbb5c20e353b6d97277  wpewebkit-2.42.4.tar.xz
-sha256  8836040a3687581970b47a232b713e7023c080d5613427f52db619c29fb253a4  wpewebkit-2.42.4.tar.xz
+# From https://wpewebkit.org/releases/wpewebkit-2.42.5.tar.xz.sums
+sha1  50a18f43452520e9f34f84c04bc0166af655ffff  wpewebkit-2.42.5.tar.xz
+sha256  4dbab6c5e6dc0c65a3d7dffc1c2390be5f9abd423faf983fe3a55fe081df0532  wpewebkit-2.42.5.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index e54ec2952f..60a45b13b1 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-WPEWEBKIT_VERSION = 2.42.4
+# The middle number is even for stable releases, odd for development ones.
+WPEWEBKIT_VERSION = 2.42.5
 WPEWEBKIT_SITE = https://wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
-- 
2.43.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
