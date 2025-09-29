Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB21CAC5B0
	for <buildroot@archiver.kernel.org>; Mon, 29 Sep 2025 20:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F3CE812D8;
	Mon, 29 Sep 2025 20:11:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zmYtbHjA8B_F; Mon, 29 Sep 2025 20:11:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23186812DE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23186812DE;
	Mon, 29 Sep 2025 20:11:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EE17F12D
 for <buildroot@buildroot.org>; Mon, 29 Sep 2025 20:10:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D40DB40578
 for <buildroot@buildroot.org>; Mon, 29 Sep 2025 20:10:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KzNo8D6HUOW9 for <buildroot@buildroot.org>;
 Mon, 29 Sep 2025 20:10:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 322AA40554
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 322AA40554
 for <buildroot@buildroot.org>; Mon, 29 Sep 2025 20:10:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 205308652C; Mon, 29 Sep 2025 20:10:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Sep 2025 21:38:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4a51495d69da56eff157e4b51b2326ac320aabf4
X-Git-Newrev: 5acd66ed0b91f3766ad8e43bdbb1635b39c9ad7c
X-Patchwork-Hint: ignore
Message-Id: <20250929201058.205308652C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: add zstd support
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

commit: https://git.buildroot.net/buildroot/commit/?id=5acd66ed0b91f3766ad8e43bdbb1635b39c9ad7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add optional zstd compression type support for QEMU.

In order to a file compressed with zstd on host to be applied to
target QEMU, zstd on both host and target should be enabled.

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/qemu/qemu.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 0d1d154371..df81ea6486 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -271,6 +271,13 @@ else
 QEMU_OPTS += --disable-install-blobs
 endif
 
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+QEMU_OPTS += --enable-zstd
+QEMU_DEPENDENCIES += zstd
+else
+QEMU_OPTS += --disable-zstd
+endif
+
 # Override CPP, as it expects to be able to call it like it'd
 # call the compiler.
 define QEMU_CONFIGURE_CMDS
@@ -460,6 +467,13 @@ else
 HOST_QEMU_OPTS += --disable-libusb
 endif
 
+ifeq ($(BR2_PACKAGE_HOST_ZSTD),y)
+HOST_QEMU_OPTS += --enable-zstd
+HOST_QEMU_DEPENDENCIES += host-zstd
+else
+HOST_QEMU_OPTS += --disable-zstd
+endif
+
 # Override CPP, as it expects to be able to call it like it'd
 # call the compiler.
 define HOST_QEMU_CONFIGURE_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
