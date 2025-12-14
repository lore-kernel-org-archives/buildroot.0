Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8170ED59D99
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 17:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0F5A60D98;
	Sun, 14 Dec 2025 17:44:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ei5Szwp6yyUT; Sun, 14 Dec 2025 17:44:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BBEB60A8A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765734270;
	bh=6KFX2zt6L1OOqAiL7+cbwUFg4v/jf25tE/gZuAzio14=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=N/ByV29lY4OwwGLqgPcgoGc97uASP7vT3yKUEXRmCN7E+lZLZcqjytoUznXFcytLy
	 /KB/DBfoL2mY9z+IwMqr4aQAI5PHkbbJbf5QGMFzFEuR8rNlvgJdk4PRymOb+0xpfO
	 yvV1Ra5R5LGWMIkdFyIfK5vEVb8pAmSEyLpWqMZbqSiPhoO/Brivvl9QxCaDJH0atl
	 1lPKFM2qu6JVFBBdfJ8sLmnlka5LlHjAFynBuCJYg+Rtl/dJdfJ+b+AVp/NfCOSz7X
	 KQSeHYAuVcwCfpkV2IDkDFgr/xIURycSfZ66oMySzwXsnu1jTanaXOUFLqikT5wMvS
	 1SmB/SHTnJ3oA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BBEB60A8A;
	Sun, 14 Dec 2025 17:44:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A5AA42D0
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C39A807E9
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:44:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OSXosGwbsYkL for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 17:44:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D56F8807A2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D56F8807A2
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:44:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CF5C386E8F; Sun, 14 Dec 2025 17:44:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Dec 2025 18:29:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f11ac644ea21e5702ce8aa6e030c1a28e6670686
X-Git-Newrev: 3600d2fd4a45862eba0493a8637987b3655334a3
X-Patchwork-Hint: ignore
Message-Id: <20251214174428.CF5C386E8F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libvncserver: fix cmake 4
 compatibility
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3600d2fd4a45862eba0493a8637987b3655334a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-CMake-require-at-least-CMake-3.5.patch    | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/package/libvncserver/0001-CMake-require-at-least-CMake-3.5.patch b/package/libvncserver/0001-CMake-require-at-least-CMake-3.5.patch
new file mode 100644
index 0000000000..48921175fa
--- /dev/null
+++ b/package/libvncserver/0001-CMake-require-at-least-CMake-3.5.patch
@@ -0,0 +1,27 @@
+From e64fa928170f22a2e21b5bbd6d46c8f8e7dd7a96 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Matti=20Lehtim=C3=A4ki?= <matti.lehtimaki@jolla.com>
+Date: Tue, 13 May 2025 08:37:07 +0300
+Subject: [PATCH] CMake: require at least CMake 3.5
+
+CMake 4 dropped support for version requirements < 3.5.
+
+Fixes building with CMake >= 4.
+
+Upstream: https://github.com/LibVNC/libvncserver/commit/e64fa928170f22a2e21b5bbd6d46c8f8e7dd7a96
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 205f3928..9b8118c8 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,3 +1,3 @@
+-cmake_minimum_required(VERSION 3.4)
++cmake_minimum_required(VERSION 3.5)
+ 
+ project(LibVNCServer VERSION 0.9.14 LANGUAGES C)
+
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
