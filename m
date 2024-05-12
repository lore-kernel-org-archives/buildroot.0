Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE46C10F1A
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 10:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7464421B8;
	Sun, 12 May 2024 10:13:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sfOLs0o0ZFt8; Sun, 12 May 2024 10:13:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B786421BD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B786421BD;
	Sun, 12 May 2024 10:13:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 524181BF27A
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 10:13:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48C92421BD
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 10:13:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DByUSy8mbao1 for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 10:13:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2847B421B8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2847B421B8
 for <buildroot@buildroot.org>; Sun, 12 May 2024 10:13:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0C3698707E; Sun, 12 May 2024 10:13:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 May 2024 12:13:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4d7cf1c1e2bbf4dde178cadf88f94afd226d75f4
X-Git-Newrev: 8cb0f6e011d9975f7c4f8b2dc553b086bceef1dc
X-Patchwork-Hint: ignore
Message-Id: <20240512101316.0C3698707E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain/Config.in: update
 BR2_TOOLCHAIN_HAS_LIBATOMIC dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=8cb0f6e011d9975f7c4f8b2dc553b086bceef1dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update BR2_TOOLCHAIN_HAS_LIBATOMIC dependencies to avoid the following
build failure with libopenssl and
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_STABLE:

/home/buildroot/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real: ./libcrypto.a(libcrypto-lib-threads_pthread.o): in function `CRYPTO_atomic_or':
threads_pthread.c:(.text+0xfa): undefined reference to `__atomic_is_lock_free'

libatomic is available since gcc 4.8, when thread support is enabled.
However, the gcc logic in libatomic/configure.tgt does not recognize
"uclinux" as a valid OS part of the target tuple, and therefore it
does not build libatomic. The "uclinux" part of the tuple is used by
Buildroot when BR2_BINFMT_FLAT=y [1]. This broken logic has only been
fixed for arm since gcc 10.1.0 [2].

Indeed, bootlin armv7m is an uclibc toolchain compiled with atomic
support through libatomic.

[1] https://git.buildroot.net/buildroot/commit/?id=b3d1fb26dcadd8c570e2c415ce05398ecc810b32
[2] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=b1e21e5a5d19b436f948710e09157c5b3244f541

Fixes:
 - http://autobuild.buildroot.org/results/d25e898f9715bf6a21284807361a57735a7a2e1d
 - http://autobuild.buildroot.org/results/e37ed5ad6ba41d610bffe9c234f699e203ef5069

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/Config.in | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 655f1a53dc..baf69ce463 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -888,15 +888,19 @@ config BR2_TOOLCHAIN_HAS_SYNC_8
 	default y if BR2_TOOLCHAIN_ARM_HAS_SYNC_8
 	default y if BR2_TOOLCHAIN_X86_HAS_SYNC_8
 
-# libatomic is available since gcc 4.8, when thread support is
-# enabled. Also, libatomic doesn't recognize "uclinux" as a valid OS
-# part of the tuple, and is therefore not build on uclinux targets,
-# which is why BR2_BINFMT_FLAT configurations are excluded.
+# libatomic is available since gcc 4.8, when thread support is enabled.
+# However, the gcc logic in libatomic/configure.tgt does not recognize
+# "uclinux" as a valid OS part of the target tuple, and therefore it
+# does not build libatomic. The "uclinux" part of the tuple is used by
+# Buildroot when BR2_BINFMT_FLAT=y. This broken logic has only been
+# fixed for arm since gcc 10.1.0.
 config BR2_TOOLCHAIN_HAS_LIBATOMIC
 	bool
-	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 && \
-		BR2_TOOLCHAIN_HAS_THREADS && \
-		!BR2_BINFMT_FLAT
+	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_BINFMT_ELF || \
+		(BR2_BINFMT_FLAT && BR2_arm && \
+		BR2_TOOLCHAIN_GCC_AT_LEAST_10)
 
 # __atomic intrinsics are available:
 # - with gcc 4.8, either through built-ins or libatomic, on all
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
