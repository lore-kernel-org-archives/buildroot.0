Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C7CD4337C
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E585D842EB;
	Fri, 12 Dec 2025 07:58:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M9grZRPjx8qZ; Fri, 12 Dec 2025 07:58:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09761841B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526307;
	bh=t0ygnQcaw16gyhpxj8nrSe0Fm24Ns2pUYEpb8RUhASI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Qg6iDgsOMoLTp0HpOjguieHhPAqyoQnepu3Iij3tdVEhF2JmBznpNNE5c1jHgloDp
	 oYkFvRW0QpMUT6fOkefJj6RvfQE1E874xt/o/oVeHWyTAPFsgA/2Pd2epMG06snXvn
	 oLh6CC1I6rCrgB2Oq4gegvjCdMzKmxJZrmJZjHVef9ztg8d9fRtjwEjovImOLgkT2S
	 IwR5C0rLwgwIIzdIpfHXx9gzJuyVtYs7xYYBaYo/wz0l611lQHPqq8kHl65EhFpZp1
	 HpB82139yiMKh6p1u1IZkiJG2bu4tqhjLAfSxmO7LYgrERQv/CfKqdyKtEO9lJ1WTW
	 cWDh3ruMX/KmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09761841B0;
	Fri, 12 Dec 2025 07:58:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 99F3FE7
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:57:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C98654117B
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UHlw_qzz3yzU for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 529194112D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 529194112D
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 51BEB85C4C; Fri, 12 Dec 2025 07:55:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 17:10:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 92fb5e03ce13dc5bd659c1ea099db7a991c5b98b
X-Git-Newrev: 3d26ce283bb6ce3f991344444eea11fac687afc0
X-Patchwork-Hint: ignore
Message-Id: <20251212075538.51BEB85C4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ympd: fix cmake 4 compatibility
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

commit: https://git.buildroot.net/buildroot/commit/?id=3d26ce283bb6ce3f991344444eea11fac687afc0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0003-bump-required-cmake-version-to-3.10.patch | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/package/ympd/0003-bump-required-cmake-version-to-3.10.patch b/package/ympd/0003-bump-required-cmake-version-to-3.10.patch
new file mode 100644
index 0000000000..72a1966d77
--- /dev/null
+++ b/package/ympd/0003-bump-required-cmake-version-to-3.10.patch
@@ -0,0 +1,22 @@
+From 5c5862071e7ae982de6f39c9d1679dc496f38a20 Mon Sep 17 00:00:00 2001
+From: "Felix J. Ogris" <fjo@core7.intra.ogris.net>
+Date: Fri, 20 Jun 2025 15:10:38 +0200
+Subject: [PATCH] bump required cmake version to 3.10
+
+Upstream: https://github.com/notandy/ympd/pull/199
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 02ee5141d..a8ee3730d 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 2.6)
++cmake_minimum_required(VERSION 3.10)
+ 
+ project (ympd C)
+ set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${PROJECT_SOURCE_DIR}/cmake/")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
