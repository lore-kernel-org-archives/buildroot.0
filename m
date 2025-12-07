Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC843D4337C
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:58:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 975708421F;
	Fri, 12 Dec 2025 07:58:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pAuTLuoeOR6c; Fri, 12 Dec 2025 07:58:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88E5884087
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526290;
	bh=N47LoI8r8rR7q00cIQjAaenk/5euu6iRnNYnXWfELvo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HMRsd2iI5qNSzaBPGwb3JAs5hFIdgeHP6CP6u+tY3ya1wJCI6lxkmowUdYMQYtY8C
	 z0OJOOaV0Y3kFhsZQjzrYPqtrzSIDQoq1DOJQI8ubiqXoy6WyN5s/UaOcGZwwErS7S
	 GUqmd3vNthvBqQafunLoX8PfXrWcS9zuQh0iz8rHEhVs1SbjvxMgYqh47sLl5vqxUN
	 l1yNLubv16OPLWbYToZ3dCLpEGC4xDPfxVcGBAhcZ2dgl0eycDtmqtWeUY76/KA+NV
	 pT3Moe8riYZjnXFCnacQGZcnw83DAZNqG9XD7waQW/Rj76vtVR6OwU81JYa6P3wA3J
	 rymgqxgtiLK9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88E5884087;
	Fri, 12 Dec 2025 07:58:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D90DFE7
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF7F341176
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uCMzt2GKZf19 for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2B7D4116C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2B7D4116C
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B1F9B85C4C; Fri, 12 Dec 2025 07:55:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 16:05:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 48cf8ab8b101e87ffe20b51e8a82757ea9ccb356
X-Git-Newrev: cac00e41b7e802fb4c9163bc50aa8036b85c16cf
X-Patchwork-Hint: ignore
Message-Id: <20251212075537.B1F9B85C4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsoxr: fix cmake 4 compatibility
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

commit: https://git.buildroot.net/buildroot/commit/?id=cac00e41b7e802fb4c9163bc50aa8036b85c16cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0002-allow-compile-with-cmake-4.0.0.patch      | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/package/libsoxr/0002-allow-compile-with-cmake-4.0.0.patch b/package/libsoxr/0002-allow-compile-with-cmake-4.0.0.patch
new file mode 100644
index 0000000000..34ec44b671
--- /dev/null
+++ b/package/libsoxr/0002-allow-compile-with-cmake-4.0.0.patch
@@ -0,0 +1,28 @@
+From c157f862ecca9a0613e25c2058aceb127ee4ea4f Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Fri, 28 Mar 2025 13:47:55 +0000
+Subject: [PATCH] allow compile with cmake 4.0.0
+
+Upstream: https://sourceforge.net/p/soxr/code/merge-requests/6/
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index ee48f6c..2eea1e9 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,7 +1,7 @@
+ # SoX Resampler Library       Copyright (c) 2007-18 robs@users.sourceforge.net
+ # Licence for this file: LGPL v2.1                  See LICENCE for details.
+ 
+-cmake_minimum_required (VERSION 3.1 FATAL_ERROR)
++cmake_minimum_required (VERSION 3.1...3.10 FATAL_ERROR)
+ 
+ project (soxr C)
+ set (DESCRIPTION_SUMMARY
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
