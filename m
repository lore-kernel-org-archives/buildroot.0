Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 599DAC282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:21:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF5ED85EB2;
	Fri, 28 Feb 2025 17:21:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id olu_OkC0WQ9g; Fri, 28 Feb 2025 17:21:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5A8D85EB4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5A8D85EB4;
	Fri, 28 Feb 2025 17:21:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A4311DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:47:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7DB2B4A397
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iu68uqxyI8z6 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:32:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2804F42569
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2804F42569
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 243F186143; Fri, 28 Feb 2025 16:30:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 18 Feb 2025 21:48:43 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 39aec97630e63559af2b84832da91e074582445d
X-Git-Newrev: a02e437417193c467b3df67ea811523b8e0517e6
X-Patchwork-Hint: ignore
Message-Id: <20250228163044.243F186143@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] fs/erofs: add custom
 compression option with optional compress-hints file
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1990576097429902061=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1990576097429902061==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=a02e437417193c467b3df67ea811523b8e0517e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add another option for FS compression that allows fine-grained control using a
list of algorithms and optional compress-hints file. This way multiple
algorithms and pcluster sizes can be used for different files, fully exposing
EROFS compression abilities.

Signed-off-by: Jan Čermák <sairon@sairon.cz>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 fs/erofs/Config.in | 36 ++++++++++++++++++++++++++++++++++++
 fs/erofs/erofs.mk  |  5 +++++
 2 files changed, 41 insertions(+)

diff --git a/fs/erofs/Config.in b/fs/erofs/Config.in
index 91f51b76d7..00f27faeeb 100644
--- a/fs/erofs/Config.in
+++ b/fs/erofs/Config.in
@@ -22,6 +22,10 @@ choice
 	  slower both in compression and decompression, and higher
 	  compression levels can have noticeable memory requirements.
 
+	  Custom compression allows for advanced configuration of the
+	  compression algorithms, and adds the possibility of
+	  finegrained per-file compression using compression hints.
+
 config BR2_TARGET_ROOTFS_EROFS_NONE
 	bool "no compression"
 
@@ -31,6 +35,9 @@ config BR2_TARGET_ROOTFS_EROFS_LZ4HC
 config BR2_TARGET_ROOTFS_EROFS_LZMA
 	bool "lzma"
 
+config BR2_TARGET_ROOTFS_EROFS_CUSTOM_COMPRESSION
+	bool "custom"
+
 endchoice
 
 if BR2_TARGET_ROOTFS_EROFS_LZ4HC
@@ -58,6 +65,35 @@ config BR2_TARGET_ROOTFS_EROFS_LZMA_LEVEL
 
 endif # BR2_TARGET_ROOTFS_EROFS_LZMA
 
+if BR2_TARGET_ROOTFS_EROFS_CUSTOM_COMPRESSION
+
+config BR2_TARGET_ROOTFS_EROFS_COMPRESSION_ALGORITHMS
+	string "compression algorithms"
+	default "lz4hc,12"
+	help
+	  Specify arbitrary compression option, useful in combination
+	  with compression hints. Individual algorithms are separated
+	  by colon with optional level, e.g. "lz4hc,12:lzma".
+	  See erofs-utils documentaion for detailed information.
+
+config BR2_TARGET_ROOTFS_EROFS_COMPRESSION_HINTS
+	string "path to compression hints file"
+	default ""
+	help
+	  Path to file containing compression hints. Each line in the
+	  file is defined by tokens separated by spaces in the
+	  following form. Optionally, instead of the given primary
+	  algorithm, algorithms can be specified with zero-based
+	  algorithm-index explicitly:
+
+	  <pcluster-size-in-bytes> [algorithm-index] <match-pattern>
+
+	  match-patterns are extended regular expressions, matched
+	  against absolute paths within the output filesystem, with no
+	  leading /.
+
+endif # BR2_TARGET_ROOTFS_EROFS_LZMA
+
 config BR2_TARGET_ROOTFS_EROFS_DEDUPE
 	bool "enable data deduplication"
 	depends on !BR2_TARGET_ROOTFS_EROFS_NONE
diff --git a/fs/erofs/erofs.mk b/fs/erofs/erofs.mk
index 3b64cb1c6e..6543a364f1 100644
--- a/fs/erofs/erofs.mk
+++ b/fs/erofs/erofs.mk
@@ -10,6 +10,11 @@ ifeq ($(BR2_TARGET_ROOTFS_EROFS_LZ4HC),y)
 ROOTFS_EROFS_ARGS += -zlz4hc,$(BR2_TARGET_ROOTFS_EROFS_LZ4HC_LEVEL)
 else ifeq ($(BR2_TARGET_ROOTFS_EROFS_LZMA),y)
 ROOTFS_EROFS_ARGS += -zlzma,$(BR2_TARGET_ROOTFS_EROFS_LZMA_LEVEL)
+else ifeq ($(BR2_TARGET_ROOTFS_EROFS_CUSTOM_COMPRESSION),y)
+ROOTFS_EROFS_ARGS += -z$(strip $(BR2_TARGET_ROOTFS_EROFS_COMPRESSION_ALGORITHMS))
+ifneq ($(strip $(BR2_TARGET_ROOTFS_EROFS_COMPRESSION_HINTS)),)
+ROOTFS_EROFS_ARGS += --compress-hints $(strip $(BR2_TARGET_ROOTFS_EROFS_COMPRESSION_HINTS))
+endif
 endif
 
 ifeq ($(BR2_REPRODUCIBLE),y)

--===============1990576097429902061==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1990576097429902061==--
