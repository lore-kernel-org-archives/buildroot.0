Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C3CCD128A
	for <buildroot@archiver.kernel.org>; Sat,  6 Apr 2024 07:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6AFEF40444;
	Sat,  6 Apr 2024 07:43:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e7yL7L4QvOIh; Sat,  6 Apr 2024 07:43:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 834DE40484
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 834DE40484;
	Sat,  6 Apr 2024 07:43:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 56DAE1BF870
 for <buildroot@lists.busybox.net>; Sat,  6 Apr 2024 07:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 42E0760817
 for <buildroot@lists.busybox.net>; Sat,  6 Apr 2024 07:43:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LPiTb4HjD2za for <buildroot@lists.busybox.net>;
 Sat,  6 Apr 2024 07:43:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FE87607D8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7FE87607D8
 for <buildroot@buildroot.org>; Sat,  6 Apr 2024 07:43:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7972384599; Sat,  6 Apr 2024 07:43:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 6 Apr 2024 09:42:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a4011ec1e13baa1190a41d949ad2cd945a9ecbe2
X-Git-Newrev: a7d491b0ffc5c0876053cc94c4112e73096aa5c2
X-Patchwork-Hint: ignore
Message-Id: <20240406074344.7972384599@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tiff: explicitly disable jbig
 support for host and target
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a7d491b0ffc5c0876053cc94c4112e73096aa5c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_PACKAGE_TIFF_JBIG did actually not do anything, as no explicit
--enable-jbig was passed to configure and there is no libjbig in Buildroot,
so drop it and instead explicitly disable jbig support.

Also add --disable-jbig for the host build, which was missed when host
support was added in commit 91b16fbbf9db (tiff: add host variant).

As the TIFF_JBIG option was a noop, do not add legacy handling for it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tiff/Config.in | 4 ----
 package/tiff/tiff.mk   | 6 ++----
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/package/tiff/Config.in b/package/tiff/Config.in
index d1004d6668..d357d08406 100644
--- a/package/tiff/Config.in
+++ b/package/tiff/Config.in
@@ -63,10 +63,6 @@ config BR2_PACKAGE_TIFF_OLD_JPEG
 	bool "Old JPEG decompression"
 	default y
 
-config BR2_PACKAGE_TIFF_JBIG
-	bool "JBIG compression"
-	default y
-
 config BR2_PACKAGE_TIFF_UTILITIES
 	bool "tiff utilities"
 	help
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index 8ec53d4fe1..0e5e0dd48a 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -17,6 +17,7 @@ TIFF_INSTALL_STAGING = YES
 TIFF_CONF_OPTS = \
 	--disable-contrib \
 	--disable-lerc \
+	--disable-jbig \
 	--disable-tests \
 	--disable-webp
 
@@ -28,6 +29,7 @@ HOST_TIFF_CONF_OPTS = \
 	--disable-lerc \
 	--disable-libdeflate \
 	--disable-lzma \
+	--disable-jbig \
 	--disable-jpeg \
 	--disable-tests \
 	--disable-webp \
@@ -101,10 +103,6 @@ ifneq ($(BR2_PACKAGE_TIFF_OLD_JPEG),y)
 TIFF_CONF_OPTS += --disable-old-jpeg
 endif
 
-ifneq ($(BR2_PACKAGE_TIFF_JBIG),y)
-TIFF_CONF_OPTS += --disable-jbig
-endif
-
 ifeq ($(BR2_PACKAGE_TIFF_UTILITIES),y)
 TIFF_CONF_OPTS += --enable-tools
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
