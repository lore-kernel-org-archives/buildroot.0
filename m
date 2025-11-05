Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C9BCCFA19
	for <buildroot@archiver.kernel.org>; Wed,  5 Nov 2025 22:30:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7295845CF;
	Wed,  5 Nov 2025 22:30:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s8OS8KOa8L6N; Wed,  5 Nov 2025 22:30:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F31E1845DA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F31E1845DA;
	Wed,  5 Nov 2025 22:30:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F20AB2A
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 22:29:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2192412B7
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 22:29:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dxAksivchPoj for <buildroot@buildroot.org>;
 Wed,  5 Nov 2025 22:29:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3A43412BE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3A43412BE
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 22:29:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F1F54828BC; Wed,  5 Nov 2025 22:29:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Nov 2025 23:10:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e38cd466c7ca9e29777eef6bee0c4d126c90d5ff
X-Git-Newrev: bb0fd62f30ffefb7baebdbd86f518b7cf241224c
X-Patchwork-Hint: ignore
Message-Id: <20251105222949.F1F54828BC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/coreutils: no need for chroot
 workaround with merged-bin
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bb0fd62f30ffefb7baebdbd86f518b7cf241224c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/coreutils/coreutils.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index a6d193b49e..60772c9e7b 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -125,6 +125,7 @@ define COREUTILS_CREATE_TEST_SYMLINK
 endef
 COREUTILS_POST_INSTALL_TARGET_HOOKS += COREUTILS_CREATE_TEST_SYMLINK
 
+ifeq ($(BR2_ROOTFS_MERGED_BIN),)
 # gnu thinks chroot is in bin, debian thinks it's in sbin
 ifeq ($(BR2_PACKAGE_COREUTILS_INDIVIDUAL_BINARIES),y)
 define COREUTILS_FIX_CHROOT_LOCATION
@@ -137,6 +138,7 @@ define COREUTILS_FIX_CHROOT_LOCATION
 endef
 endif
 COREUTILS_POST_INSTALL_TARGET_HOOKS += COREUTILS_FIX_CHROOT_LOCATION
+endif
 
 # Explicitly install ln and realpath, which we *are* insterested in.
 # A lot of other programs still get installed, however, but disabling
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
