Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B28E9C3DA7A
	for <buildroot@archiver.kernel.org>; Fri,  6 Jan 2023 15:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50BF840528;
	Fri,  6 Jan 2023 15:12:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50BF840528
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3DKIKZ7NWAjR; Fri,  6 Jan 2023 15:12:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8162D40522;
	Fri,  6 Jan 2023 15:12:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8162D40522
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A5DB61BF421
 for <buildroot@lists.busybox.net>; Fri,  6 Jan 2023 15:11:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8EE0480C2F
 for <buildroot@lists.busybox.net>; Fri,  6 Jan 2023 15:11:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8EE0480C2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J7jqCi99wgUx for <buildroot@lists.busybox.net>;
 Fri,  6 Jan 2023 15:11:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BBA3881C04
 for <buildroot@buildroot.org>; Fri,  6 Jan 2023 15:11:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBA3881C04
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AA8E3876BE; Fri,  6 Jan 2023 15:11:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 6 Jan 2023 16:11:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c943cb38e4174cd349b4bb80e5e16269b25079d2
X-Git-Newrev: a0a428f135e1b220f8fc6043a7a1b8067f3bb8e2
X-Patchwork-Hint: ignore
Message-Id: <20230106151157.AA8E3876BE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: pixman only used for system
 emulation
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

commit: https://git.buildroot.net/buildroot/commit/?id=a0a428f135e1b220f8fc6043a7a1b8067f3bb8e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When we initially introduced the target qemu in 98e1a6b9619c
(package/qemu: build for the target (i386 or x86_64 only)), we
unconditionally enabled all the system and user emulation without
distinction, so pixman was made a mandatory dependency.

However, soon afterwards, in 68ec49acc7be (package/qemu: add basic
target selection), we added an option to enable/disable the system
emulation, but the dependency on pixman was not moved to that new
option.

Fix that now, and only depend on pixman when system emulation is
enabled.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qemu/Config.in | 2 +-
 package/qemu/qemu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 2bbc6a14c0..154b98a541 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -25,7 +25,6 @@ menuconfig BR2_PACKAGE_QEMU
 	depends on BR2_USE_WCHAR # gettext
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_PIXMAN
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_QEMU_TOOLS if !BR2_PACKAGE_QEMU_SYSTEM && !BR2_PACKAGE_QEMU_LINUX_USER
 	help
@@ -53,6 +52,7 @@ comment "Emulators selection"
 config BR2_PACKAGE_QEMU_SYSTEM
 	bool "Enable systems emulation"
 	depends on !BR2_STATIC_LIBS # dtc
+	select BR2_PACKAGE_PIXMAN
 	help
 	  Say 'y' to build system emulators/virtualisers.
 
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 5c7a8d504c..58b4ff10a5 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -27,7 +27,6 @@ QEMU_DEPENDENCIES = \
 	host-pkgconf \
 	host-python3 \
 	libglib2 \
-	pixman \
 	zlib
 
 # Need the LIBS variable because librt and libm are
@@ -45,6 +44,7 @@ QEMU_VARS = LIBTOOL=$(HOST_DIR)/bin/libtool
 # checks if the specified sub-set is valid.
 
 ifeq ($(BR2_PACKAGE_QEMU_SYSTEM),y)
+QEMU_DEPENDENCIES += pixman
 QEMU_OPTS += --enable-system
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_AARCH64) += aarch64-softmmu
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_ALPHA) += alpha-softmmu
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
