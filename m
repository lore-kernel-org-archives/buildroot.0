Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F76C433F5
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 03:25:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD91A834AE;
	Tue, 17 May 2022 03:25:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oDu6TeWHJu21; Tue, 17 May 2022 03:25:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB02983490;
	Tue, 17 May 2022 03:25:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8E31E1BF322
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 03:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C82C41956
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 03:25:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=cosmos-ink.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 501uMlhB9oiO for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 03:25:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.cosmos-ink.net (mail.cosmos-ink.net
 [IPv6:2a01:4f9:4a:25aa::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7ADB64194D
 for <buildroot@buildroot.org>; Tue, 17 May 2022 03:25:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1A2681C666E9; Tue, 17 May 2022 05:25:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cosmos-ink.net;
 s=dkim; t=1652757932; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=w4E+rfy3EPAWgOcXQb580m5u10WfhO2uqq/QZ0M9VAE=;
 b=L8GtP3SSWvqw6tLxqdX0PH/SMWOpEm57K0KFkR0hZX98NuoxGR0R1d/EWvvE9k/0JV/6eK
 ssuw+bELGLp+YAHG5wy2uRWXYtd6cfewirJz8OmeyhTNinmsBmE2E0GZvi7+ndeQiCRaii
 wbLFhEsDtlX9amcw0VigSmug16lGAlAMDZyPDfZ+RQeq3kNVYyCWMGzHeuDvxr/yjmnP40
 cpPGvFuStUSLOE7jekzR/1UCzz+agZwkf/S9wX83lxzH0biYBkhRO6/KQ2U0dW3Hk7XEYd
 leyLv35m5kUKXOy2s6etuF2BvoyUs12vRYTfFhQrksdON9tjgtnSciKhY0VXzg==
To: buildroot@buildroot.org
Date: Tue, 17 May 2022 03:24:59 +0000
Message-Id: <20220517032459.3400-2-linus@cosmos-ink.net>
In-Reply-To: <20220517032459.3400-1-linus@cosmos-ink.net>
References: <20220517032459.3400-1-linus@cosmos-ink.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 2/2] fs/squashfs: Add option to compress with
 extreme options
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
From: Linus Kaschulla via buildroot <buildroot@buildroot.org>
Reply-To: Linus Kaschulla <linus@cosmos-ink.net>
Cc: Linus Kaschulla <linus@cosmos-ink.net>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

mksquashfs allows to tweak many compressions parameters. Currently they
can't be changed from kmenu. Leaving out potential space savings.

This adds the option to enable a set of predetermined compression
options. This option is enabled by default for lz4 since lz4 currently
implicitly added the extreme to it in the makefile. So this aids in
keeping backward compatibility.

Signed-off-by: Linus Kaschulla <linus@cosmos-ink.net>
---
 fs/squashfs/Config.in   | 26 ++++++++++++++++++++++++++
 fs/squashfs/squashfs.mk |  6 +++++-
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/fs/squashfs/Config.in b/fs/squashfs/Config.in
index 341e50a08c..41c782105d 100644
--- a/fs/squashfs/Config.in
+++ b/fs/squashfs/Config.in
@@ -89,4 +89,30 @@ config BR2_TARGET_ROOTFS_SQUASHFS4_ZSTD
 
 endchoice
 
+config BR2_TARGET_ROOTFS_SQUASHFS_EXTREME_COMP
+	bool "extreme compression if possible"
+	default BR2_TARGET_ROOTFS_SQUASHFS4_LZ4
+	help
+	  Use options to increase compression ration as much as
+	  possible, like using architecture-specific options, at
+	  the cost of time when assembling the filesystem image.
+
+	  For example:
+	   - with gzip and lzo, use -Xcompression-level 9
+	   - with xz use a architecture specific bjc (branch-call-jump) filter
+	   - with zstd use -Xcompression-level 22
+	   - and more
+
+config BR2_TARGET_ROOTFS_SQUASHFS_COMP_OPTS
+	string
+	depends on BR2_TARGET_ROOTFS_SQUASHFS_EXTREME_COMP
+	default "-Xcompression-level 9" if BR2_TARGET_ROOTFS_SQUASHFS4_GZIP
+	default "-Xcompression-level 9" if BR2_TARGET_ROOTFS_SQUASHFS4_LZO
+	default "-Xhc" if BR2_TARGET_ROOTFS_SQUASHFS4_LZ4
+	default "-Xbcj arm,armthumb" if BR2_TARGET_ROOTFS_SQUASHFS4_XZ && (BR2_arm || BR_aarch64)
+	default "-Xbcj powerpc" if BR2_TARGET_ROOTFS_SQUASHFS4_XZ && (BR2_powerpc || BR2_powerpc64)
+	default "-Xbcj sparc" if BR2_TARGET_ROOTFS_SQUASHFS4_XZ && (BR2_sparc || BR2_sparc64)
+	default "-Xbcj x86" if BR2_TARGET_ROOTFS_SQUASHFS4_XZ && (BR2_i386 || BR2_x86_64)
+	default "-Xcompression-level 22" if BR2_TARGET_ROOTFS_SQUASHFS4_ZSTD
+
 endif
diff --git a/fs/squashfs/squashfs.mk b/fs/squashfs/squashfs.mk
index 1790773f7e..51f8d0d7c9 100644
--- a/fs/squashfs/squashfs.mk
+++ b/fs/squashfs/squashfs.mk
@@ -25,7 +25,7 @@ ROOTFS_SQUASHFS_ARGS += -nopad
 endif
 
 ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_LZ4),y)
-ROOTFS_SQUASHFS_ARGS += -comp lz4 -Xhc
+ROOTFS_SQUASHFS_ARGS += -comp lz4
 else ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_LZO),y)
 ROOTFS_SQUASHFS_ARGS += -comp lzo
 else ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_LZMA),y)
@@ -38,6 +38,10 @@ else
 ROOTFS_SQUASHFS_ARGS += -comp gzip
 endif
 
+ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS_EXTREME_COMP),y)
+ROOTFS_SQUASHFS_ARGS += $(call qstrip,$(BR2_TARGET_ROOTFS_SQUASHFS_COMP_OPTS))
+endif
+
 define ROOTFS_SQUASHFS_CMD
 	$(HOST_DIR)/bin/mksquashfs $(TARGET_DIR) $@ $(ROOTFS_SQUASHFS_ARGS)
 endef
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
