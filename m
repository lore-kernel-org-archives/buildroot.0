Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B3AC021AD
	for <buildroot@archiver.kernel.org>; Tue, 18 Feb 2025 21:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBFC982F19;
	Tue, 18 Feb 2025 21:22:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PUfkqmaW6y_F; Tue, 18 Feb 2025 21:22:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC43683027
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC43683027;
	Tue, 18 Feb 2025 21:22:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6992A1D76
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 21:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D9E840A06
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 21:22:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VBWa4e75WHlM for <buildroot@buildroot.org>;
 Tue, 18 Feb 2025 21:22:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D83EF409F1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D83EF409F1
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 21:22:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C196887868; Tue, 18 Feb 2025 21:22:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 18 Feb 2025 21:48:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9254824faca99b40fe820b6b0e61c8d76f7d0c2f
X-Git-Newrev: 01b45ef87db4e9af5ee912052fe8276bff4a9745
X-Patchwork-Hint: ignore
Message-Id: <20250218212227.C196887868@busybox.osuosl.org>
Subject: [Buildroot] [git commit] fs/erofs: add LZMA compression,
 allow configurable compression level
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
Content-Type: multipart/mixed; boundary="===============7677770547051021196=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7677770547051021196==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=01b45ef87db4e9af5ee912052fe8276bff4a9745
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of having a bool option for enabling the LZ4HC compression, change the
Kconfig definition to a choice, which also adds more flexibility in the future
(e.g. for enabling ZSTD compression). The name of the old option was preserved
so defconfigs using it won't be affected.

Also both for LZMA and LZ4HC, it's now possible to define compression level.
Previously it defaulted to 9, which generates images larger than squashfs with
comparable settings (which uses level 12 by default). For LZ4HC the default if
unset would be still 9.

Use a separate config option for LZMA and LZ4HC compression level,
because their ranges and meaning are different.

Signed-off-by: Jan Čermák <sairon@sairon.cz>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 fs/erofs/Config.in | 51 +++++++++++++++++++++++++++++++++++++++++++++++++--
 fs/erofs/erofs.mk  |  4 +++-
 2 files changed, 52 insertions(+), 3 deletions(-)

diff --git a/fs/erofs/Config.in b/fs/erofs/Config.in
index e112572688..2041a0034e 100644
--- a/fs/erofs/Config.in
+++ b/fs/erofs/Config.in
@@ -6,10 +6,57 @@ config BR2_TARGET_ROOTFS_EROFS
 
 if BR2_TARGET_ROOTFS_EROFS
 
+choice
+	prompt "Compression algorithm"
+	default BR2_TARGET_ROOTFS_EROFS_LZ4HC
+	help
+	  Select the EROFS compression algorithm to use.
+
+	  LZ4HC (LZ4 High Compression) is the default algorithm and
+	  provides a good balance between compression ratio and speed,
+	  with increasing levels the compression ratio increases at the
+	  penalty of higher compression times, without significant
+	  decompression penalty.
+
+	  LZMA provides the best compression ratio but is significantly
+	  slower both in compression and decompression, and higher
+	  compression levels can have noticeable memory requirements.
+
+config BR2_TARGET_ROOTFS_EROFS_NONE
+	bool "no compression"
+
 config BR2_TARGET_ROOTFS_EROFS_LZ4HC
-	bool "lz4hc compression"
+	bool "lz4hc"
+
+config BR2_TARGET_ROOTFS_EROFS_LZMA
+	bool "lzma"
+
+endchoice
+
+if BR2_TARGET_ROOTFS_EROFS_LZ4HC
+
+config BR2_TARGET_ROOTFS_EROFS_LZ4HC_LEVEL
+	int "lz4hc compression level"
+	default 9
+	range 1 12
 	help
-	  Use lz4 high-compression to compress data in the filesystem.
+	  Specify the compression level for LZ4HC compression.
+
+endif # BR2_TARGET_ROOTFS_EROFS_LZ4HC
+
+if BR2_TARGET_ROOTFS_EROFS_LZMA
+
+config BR2_TARGET_ROOTFS_EROFS_LZMA_LEVEL
+	int "lzma compression level"
+	default 6
+	range 0 109
+	help
+	  Specify the compression level for LZMA compression.
+
+	  Values from 0 to 9 are used for the standard compression,
+	  values from 100 to 109 are used for the extreme compression.
+
+endif # BR2_TARGET_ROOTFS_EROFS_LZMA
 
 config BR2_TARGET_ROOTFS_EROFS_PCLUSTERSIZE
 	int "pcluster size"
diff --git a/fs/erofs/erofs.mk b/fs/erofs/erofs.mk
index e43d74927b..e8d30bace8 100644
--- a/fs/erofs/erofs.mk
+++ b/fs/erofs/erofs.mk
@@ -7,7 +7,9 @@
 ROOTFS_EROFS_DEPENDENCIES = host-erofs-utils
 
 ifeq ($(BR2_TARGET_ROOTFS_EROFS_LZ4HC),y)
-ROOTFS_EROFS_ARGS += -zlz4hc
+ROOTFS_EROFS_ARGS += -zlz4hc,$(BR2_TARGET_ROOTFS_EROFS_LZ4HC_LEVEL)
+else ifeq ($(BR2_TARGET_ROOTFS_EROFS_LZMA),y)
+ROOTFS_EROFS_ARGS += -zlzma,$(BR2_TARGET_ROOTFS_EROFS_LZMA_LEVEL)
 endif
 
 ifeq ($(BR2_REPRODUCIBLE),y)

--===============7677770547051021196==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7677770547051021196==--
