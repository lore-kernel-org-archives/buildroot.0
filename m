Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 236DAC3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 13:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81E6881E57;
	Sun, 18 May 2025 13:56:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lvsA4FnwGk0t; Sun, 18 May 2025 13:56:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D41D81E5E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D41D81E5E;
	Sun, 18 May 2025 13:56:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 84D14204
 for <buildroot@buildroot.org>; Sun, 18 May 2025 13:56:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 81339407FB
 for <buildroot@buildroot.org>; Sun, 18 May 2025 13:56:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S4KonUGFA0eq for <buildroot@buildroot.org>;
 Sun, 18 May 2025 13:56:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A1A3407F6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A1A3407F6
 for <buildroot@buildroot.org>; Sun, 18 May 2025 13:56:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 648D4870A3; Sun, 18 May 2025 13:56:01 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 15:54:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 11dcd7bd5329608f85036dd65fe9c706c54ea8cb
X-Git-Newrev: 3615c268997e7c86e7f3499c66949ffe4d61db17
X-Patchwork-Hint: ignore
Message-Id: <20250518135601.648D4870A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openvmtools: needs libxcrypt with
 glibc
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3615c268997e7c86e7f3499c66949ffe4d61db17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/b3b66d7dff38ca6fb0be9a98d98db721ee98ef1b

Fix the following build failure raised since bump of glibc to version
2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:

checking for crypt in -lcrypt... no
configure: error: libcrypt not found. Please install the libc/libcrypt devel package(s).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/openvmtools/Config.in      | 1 +
 package/openvmtools/openvmtools.mk | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/openvmtools/Config.in b/package/openvmtools/Config.in
index b62e5d0361..e6a2cd4a54 100644
--- a/package/openvmtools/Config.in
+++ b/package/openvmtools/Config.in
@@ -16,6 +16,7 @@ config BR2_PACKAGE_OPENVMTOOLS
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBDNET
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Open Virtual Machine Tools for VMware guest OS
 
diff --git a/package/openvmtools/openvmtools.mk b/package/openvmtools/openvmtools.mk
index 3106b9ecd6..a4ff1fd71a 100644
--- a/package/openvmtools/openvmtools.mk
+++ b/package/openvmtools/openvmtools.mk
@@ -35,6 +35,10 @@ ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
 OPENVMTOOLS_DEPENDENCIES += libtirpc
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+OPENVMTOOLS_DEPENDENCIES += libxcrypt
+endif
+
 # When libfuse is available, openvmtools can build vmblock-fuse, so
 # make sure that libfuse gets built first
 ifeq ($(BR2_PACKAGE_LIBFUSE),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
