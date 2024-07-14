Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC39AC3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 20:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45D93403B0;
	Sun, 14 Jul 2024 20:47:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9jddxHB3xeco; Sun, 14 Jul 2024 20:47:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3FD440394
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3FD440394;
	Sun, 14 Jul 2024 20:47:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 761B21BF592
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 20:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 626C981148
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 20:47:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pmJPNslj2DUD for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 20:47:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85ECD81146
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85ECD81146
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 20:47:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6DAE986A16; Sun, 14 Jul 2024 20:47:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Jul 2024 22:47:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2ca698051c50546a70e9f7b625f2ee9a2a6a2840
X-Git-Newrev: 7d0707cae478461440b328296132b97bb5665b6d
X-Patchwork-Hint: ignore
Message-Id: <20240714204752.6DAE986A16@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package: add support for extracting zstd
 archives
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7d0707cae478461440b328296132b97bb5665b6d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Teach the generic package handling code how to extract zstd (.tar.zst)
archives. When zstd is not installed on the host, host-zstd gets built
automatically.

Signed-off-by: Matt Staveley-Taylor <matt.stav.taylor@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in                               |  7 +++++++
 Makefile                                |  1 +
 package/pkg-utils.mk                    |  2 ++
 support/dependencies/check-host-zstd.mk |  4 ++++
 support/dependencies/check-host-zstd.sh | 14 ++++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/Config.in b/Config.in
index e0257ba3e8..df43db7eff 100644
--- a/Config.in
+++ b/Config.in
@@ -177,6 +177,13 @@ config BR2_LZCAT
 	  Command to be used to extract a lzip'ed file to stdout.
 	  Default is "lzip -d -c"
 
+config BR2_ZSTDCAT
+	string "zstdcat command"
+	default "zstdcat"
+	help
+	  Command to be used to extract a zstd'ed file to stdout.
+	  Default is "zstdcat"
+
 config BR2_TAR_OPTIONS
 	string "Tar options"
 	default ""
diff --git a/Makefile b/Makefile
index db5244baeb..a97ebe78e3 100644
--- a/Makefile
+++ b/Makefile
@@ -446,6 +446,7 @@ ZCAT := $(call qstrip,$(BR2_ZCAT))
 BZCAT := $(call qstrip,$(BR2_BZCAT))
 XZCAT := $(call qstrip,$(BR2_XZCAT))
 LZCAT := $(call qstrip,$(BR2_LZCAT))
+ZSTDCAT := $(call qstrip,$(BR2_ZSTDCAT))
 TAR_OPTIONS = $(call qstrip,$(BR2_TAR_OPTIONS)) -xf
 
 ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 3ab9e9fe52..e8e508e334 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -59,6 +59,7 @@ INFLATE.tbz  = $(BZCAT)
 INFLATE.tbz2 = $(BZCAT)
 INFLATE.tgz  = $(ZCAT)
 INFLATE.xz   = $(XZCAT)
+INFLATE.zst  = $(ZSTDCAT)
 INFLATE.tar  = cat
 # suitable-extractor(filename): returns extractor based on suffix
 suitable-extractor = $(INFLATE$(suffix $(1)))
@@ -66,6 +67,7 @@ suitable-extractor = $(INFLATE$(suffix $(1)))
 EXTRACTOR_PKG_DEPENDENCY.lzma = $(BR2_XZCAT_HOST_DEPENDENCY)
 EXTRACTOR_PKG_DEPENDENCY.xz   = $(BR2_XZCAT_HOST_DEPENDENCY)
 EXTRACTOR_PKG_DEPENDENCY.lz   = $(BR2_LZIP_HOST_DEPENDENCY)
+EXTRACTOR_PKG_DEPENDENCY.zst  = $(BR2_ZSTD_HOST_DEPENDENCY)
 
 # extractor-pkg-dependency(filename): returns a Buildroot package
 # dependency needed to extract file based on suffix
diff --git a/support/dependencies/check-host-zstd.mk b/support/dependencies/check-host-zstd.mk
new file mode 100644
index 0000000000..fa595ef201
--- /dev/null
+++ b/support/dependencies/check-host-zstd.mk
@@ -0,0 +1,4 @@
+ifeq (,$(call suitable-host-package,zstd,$(ZSTDCAT)))
+BR2_ZSTD_HOST_DEPENDENCY = host-zstd
+ZSTDCAT = $(HOST_DIR)/bin/zstdcat
+endif
diff --git a/support/dependencies/check-host-zstd.sh b/support/dependencies/check-host-zstd.sh
new file mode 100755
index 0000000000..2f469c46cb
--- /dev/null
+++ b/support/dependencies/check-host-zstd.sh
@@ -0,0 +1,14 @@
+#!/bin/sh
+
+candidate="$1"
+
+zstdcat=$(which "$candidate" 2>/dev/null)
+if [ ! -x "$zstdcat" ]; then
+	zstdcat=$(which zstdcat 2>/dev/null)
+	if [ ! -x "$zstdcat" ]; then
+		# echo nothing: no suitable zstdcat found
+		exit 1
+	fi
+fi
+
+echo "$zstdcat"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
