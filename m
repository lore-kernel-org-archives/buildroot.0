Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4598DD4337C
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:58:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DF86842C5;
	Fri, 12 Dec 2025 07:58:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PLRFB87s7ikx; Fri, 12 Dec 2025 07:58:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7761C8419A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526305;
	bh=NrCnZe6+QtyM1u4+faRGG3d/S1aOZnC5iUrHec81F8o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ngsSy1ag0AwzDaw/9Urt0eDwWQNPCI3T+0cqaRHtokyv0663UpNi5YqtnWajiJdlI
	 30CkC1eYZPjrxGaeHg2RNX64CXp1ZEoR5DH1dqxJUurH9EjTvCiJxDk0jAbGKfwT89
	 qW0rVhuVjaaBe5zx4P6WIEZ1xl/Pi69L9hhCnioTPkdOfoKsZSFSd5+2BygWpcewl+
	 uz9SFRHemTGbEAeU5FuiKAfwFF/covfgRC3vg/L3gb+QZQs6YCxh7zM+2B94i8zxUG
	 Q2F0t3RuvDx0JcfvTq0gOnaILPUshWeZNxoV868+rJney2xhhkKEUPg7aHMOhxfRFV
	 6D92M1zQtBjbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7761C8419A;
	Fri, 12 Dec 2025 07:58:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EB5DE7
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:57:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A70EA41171
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L7HQZ5-K0lrh for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A4A64117F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A4A64117F
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 497A6869E8; Fri, 12 Dec 2025 07:55:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 17:10:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d4bb95b86e593ab13bc67d376b2931f0ac498e10
X-Git-Newrev: 92fb5e03ce13dc5bd659c1ea099db7a991c5b98b
X-Patchwork-Hint: ignore
Message-Id: <20251212075538.497A6869E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/yaml-cpp: fix cmake 4 compatibility
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

commit: https://git.buildroot.net/buildroot/commit/?id=92fb5e03ce13dc5bd659c1ea099db7a991c5b98b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...policy-range-to-avoid-deprecation-warning.patch | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/package/yaml-cpp/0002-Specify-CMake-policy-range-to-avoid-deprecation-warning.patch b/package/yaml-cpp/0002-Specify-CMake-policy-range-to-avoid-deprecation-warning.patch
new file mode 100644
index 0000000000..6ab3df96cf
--- /dev/null
+++ b/package/yaml-cpp/0002-Specify-CMake-policy-range-to-avoid-deprecation-warning.patch
@@ -0,0 +1,26 @@
+From c2680200486572baf8221ba052ef50b58ecd816e Mon Sep 17 00:00:00 2001
+From: Craig Scott <craig.scott@crascit.com>
+Date: Thu, 17 Aug 2023 08:54:05 +1000
+Subject: [PATCH] Specify CMake policy range to avoid deprecation warning
+ (#1211)
+
+Upstream: https://github.com/jbeder/yaml-cpp/commit/c2680200486572baf8221ba052ef50b58ecd816e
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 46dc18059..1ae92e2b7 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,5 +1,6 @@
+-# 3.5 is actually available almost everywhere, but this a good minimum
+-cmake_minimum_required(VERSION 3.4)
++# 3.5 is actually available almost everywhere, but this a good minimum.
++# 3.14 as the upper policy limit avoids CMake deprecation warnings.
++cmake_minimum_required(VERSION 3.4...3.14)
+ 
+ # enable MSVC_RUNTIME_LIBRARY target property
+ # see https://cmake.org/cmake/help/latest/policy/CMP0091.html
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
