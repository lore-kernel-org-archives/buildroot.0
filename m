Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC1FE8FDD8
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 11:25:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B35360781;
	Sat, 27 Dec 2025 11:25:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YftSyVolM3Uy; Sat, 27 Dec 2025 11:25:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F3B060741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766834728;
	bh=K6buiIzaqbWJjg+iLukV4JQl8Sl2B/pfAMtiZwzFt20=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=r+yaN3Wi8ZcM5ETgY7/6Eqz1CDsOf7xaJBlDH2FTeNRVM1DAoWYLUxkUfnBbxcIbc
	 VB8XEu+MY0gZDsVi7i5XfAODkNRJG8efotCQMkT1vaQxrCEbqFmYxZn/7lrdhZIi4E
	 XyfHQUb4TYx+NPIJelvoy5pqvPXtygnfmRV6OW+ZTyWNj7QITrHmUMFAejiHjzxI2z
	 Han22QXnlI875cl0Piwdq0pNGEz8wTvRl4IIklDx/QqqKejKAJXD9jfZRDCuhM3bqZ
	 223yAiRDTFtgBN0rmLCgnLnmqGGAYWJvRVoDFugxv1D6YGnhvFD4wLY+Ful9NyduWL
	 udtmxyukjT4MA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F3B060741;
	Sat, 27 Dec 2025 11:25:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 35169119
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 11:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 277F6405AC
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 11:25:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DPpQXcU78pq9 for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 11:25:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C036405A9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C036405A9
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 11:25:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 466C6876AF; Sat, 27 Dec 2025 11:25:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 27 Dec 2025 12:23:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5eb9f8aee52c8dc9355f0ab096df9e56e9459f46
X-Git-Newrev: 05b8a09e62d4377ed4ecb89409194ad951469f86
X-Patchwork-Hint: ignore
Message-Id: <20251227112526.466C6876AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gli: add patch to fix CMake 4 build
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=05b8a09e62d4377ed4ecb89409194ad951469f86
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
  Compatibility with CMake < 3.5 has been removed from CMake.

  Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
  to tell CMake that the project requires at least <min> but has been updated
  to work with policies introduced by <max> or earlier.

  Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.

Fixes:

  https://autobuild.buildroot.net/results/30c1645d04b9d2b581aa7a866aa19c4001538e17/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...txt-bump-CMake-minimum-required-version-f.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/gli/0001-CMakeLists.txt-bump-CMake-minimum-required-version-f.patch b/package/gli/0001-CMakeLists.txt-bump-CMake-minimum-required-version-f.patch
new file mode 100644
index 0000000000..962beb465a
--- /dev/null
+++ b/package/gli/0001-CMakeLists.txt-bump-CMake-minimum-required-version-f.patch
@@ -0,0 +1,39 @@
+From 69a4897efca9c1c8546872d021b57d9e12764441 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Fri, 26 Dec 2025 18:08:35 +0100
+Subject: [PATCH] CMakeLists.txt: bump CMake minimum required version for CMake
+ 4 compliance
+
+CMake 4 will refuse to build if the cmake_minimum_required() version
+is not at least 3.5:
+
+CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
+  Compatibility with CMake < 3.5 has been removed from CMake.
+
+  Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
+  to tell CMake that the project requires at least <min> but has been updated
+  to work with policies introduced by <max> or earlier.
+
+  Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
+
+So bump the required CMake version accordingly.
+
+Upstream: https://github.com/g-truc/gli/pull/196
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 6f70f493..b705dbaf 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.1 FATAL_ERROR)
++cmake_minimum_required(VERSION 3.5 FATAL_ERROR)
+ cmake_policy(SET CMP0054 NEW)
+ 
+ project(gli)
+-- 
+2.52.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
