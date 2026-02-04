Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 109F5E9D3FB
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 15:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D33D3605A3;
	Wed,  4 Feb 2026 15:37:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ukB-ILOQbObj; Wed,  4 Feb 2026 15:37:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBD9E6060C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770219429;
	bh=vJYjmo8KxL0Mat+JGkPWPwgoxYv+5Li3j+X1+M9dm54=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=E2R07lHN8uWrPzQGRCSyvTklqWd9N8EFHsjWtzjiOpUQgeMdLCS8zjToRji9ADuin
	 iEtVC9LANAwxU/OOb60t2L8B0gt7az/cUKBa0cdIdwJjWuMCTG4CvpBT9itINuxBeC
	 0i+TkCionohwMs8+SxoPEKHXoIe58kFsU7LDCirgQAoEWjOMgFNVLyaJtUKFSisdZo
	 UpsaRwQUUJeOd8BXwn0osiP1VM9KZyazw9Xql3xyqYnvQN6uCyDQDxNEqq1uuLQJyo
	 T+KMWkNrjfTWKLqiViAYGDIu2CE3hGlr1zsa2R7wFUi+XOP4I31CLALwkCrYpoJq27
	 KWGzVNLHu0NAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBD9E6060C;
	Wed,  4 Feb 2026 15:37:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D8E2F4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:37:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04B1D4066E
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:37:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A40V9LbZsn-4 for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 15:37:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E0C9404F6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E0C9404F6
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:37:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1C85D86934; Wed,  4 Feb 2026 15:37:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 16:35:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 137d6e249d9625ed9b58d6c8fea011901b413438
X-Git-Newrev: 46ce2e7480b936cab36cddeac98efe96e9c2ff97
X-Patchwork-Hint: ignore
Message-Id: <20260204153707.1C85D86934@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: introduce kvm and tcg system
 options
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2946621055700127062=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2946621055700127062==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/46ce2e7480b936cab36cddeac98efe96e9c2ff97
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

When building system binaries you may not even want TCG support if you
are only intending to use KVM. Provide the options so the user can
select only what they need.

With only KVM selected the QEMU build will generally only build the
binary for your target system. We keep TCG support on by default so as
not to break existing defconfigs.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qemu/Config.in | 25 ++++++++++++++++++++-----
 package/qemu/qemu.mk   | 14 +++++++++++++-
 2 files changed, 33 insertions(+), 6 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index ff7423bc4c..e16eafe446 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -54,11 +54,27 @@ config BR2_PACKAGE_QEMU_SYSTEM
 	depends on !BR2_STATIC_LIBS # dtc
 	select BR2_PACKAGE_PIXMAN
 	select BR2_PACKAGE_QEMU_FDT if !BR2_PACKAGE_QEMU_CHOOSE_TARGETS
+	# Make sure at least one of tcg or kvm is enabled
+	select BR2_PACKAGE_QEMU_SYSTEM_TCG if !BR2_PACKAGE_QEMU_SYSTEM_KVM
 	help
 	  Say 'y' to build system emulators/virtualisers.
 
 if BR2_PACKAGE_QEMU_SYSTEM
 
+config BR2_PACKAGE_QEMU_SYSTEM_KVM
+	bool "Enable KVM system virtualisation"
+	default y
+	help
+	  Say 'y' here to enable a QEMU with KVM support.
+	  If unsure, say 'y'
+
+config BR2_PACKAGE_QEMU_SYSTEM_TCG
+	bool "Enable TCG system emulation"
+	default y
+	help
+	  Say 'y' here to enable QEMU binaries which can emulate foreign
+	  architectures using the TCG JIT.
+
 config BR2_PACKAGE_QEMU_BLOBS
 	bool "Install binary blobs"
 	default y
@@ -130,12 +146,11 @@ config BR2_PACKAGE_QEMU_LINUX_USER
 
 config BR2_PACKAGE_QEMU_CHOOSE_TARGETS
 	bool "Select individual emulator targets"
-	depends on BR2_PACKAGE_QEMU_SYSTEM || BR2_PACKAGE_QEMU_LINUX_USER
+	depends on BR2_PACKAGE_QEMU_SYSTEM_TCG || BR2_PACKAGE_QEMU_LINUX_USER
 	help
-	  By default, all targets (system and/or user, subject to the
-	  corresponding options, above) are built. If you only need a
-	  subset of the emulated targets, say 'y' here and enable at
-	  least one target, below.
+	  By default, all targets system targets are built. If you
+	  only need a subset of the emulated targets, say 'y' here and
+	  enable at least one target, below.
 
 if BR2_PACKAGE_QEMU_CHOOSE_TARGETS
 
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 1672ac8f19..97f8e22091 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -48,6 +48,19 @@ QEMU_VARS = LIBTOOL=$(HOST_DIR)/bin/libtool
 ifeq ($(BR2_PACKAGE_QEMU_SYSTEM),y)
 QEMU_DEPENDENCIES += pixman
 QEMU_OPTS += --enable-system
+
+ifeq ($(BR2_PACKAGE_QEMU_SYSTEM_KVM), y)
+QEMU_OPTS += --enable-kvm
+else
+QEMU_OPTS += --disable-kvm
+endif
+
+ifeq ($(BR2_PACKAGE_QEMU_SYSTEM_TCG), y)
+QEMU_OPTS += --enable-tcg
+else
+QEMU_OPTS += --disable-tcg
+endif
+
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_AARCH64) += aarch64-softmmu
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_ALPHA) += alpha-softmmu
 QEMU_TARGET_LIST_$(BR2_PACKAGE_QEMU_TARGET_ARM) += arm-softmmu
@@ -333,7 +346,6 @@ define QEMU_CONFIGURE_CMDS
 			--disable-whpx \
 			--disable-xen \
 			--enable-attr \
-			--enable-kvm \
 			--enable-vhost-net \
 			--disable-download \
 			--disable-hexagon-idef-parser \

--===============2946621055700127062==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2946621055700127062==--
