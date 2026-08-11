Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD03C5AC67
	for <buildroot@archiver.kernel.org>; Tue, 11 Aug 2026 19:15:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1E5260899;
	Tue, 11 Aug 2026 19:15:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yrLpiQE2JnCy; Tue, 11 Aug 2026 19:15:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FB0D60898
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786475729;
	bh=ihP/BJz/o3NhymRDbBMxnlqn1ASB7/CFREQc07NM1L4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SsWIOfGrihN0skp3YaJFYuhuI9cSLTsAsVRY81XJl4808f+QD2uYj8ixiu88d3TKv
	 pNkGzBKn1NxWxS21b2Nk87RVRaV/Fak0n2xkLw7h0ol6Ug8l+2ZBW2ukLSx+wqlOPJ
	 5qRVBzNMJzCk7CLNHY52QYzTI1frtwy9a1uYmbyVWGt1f1GPLlOtNpz2EDb9BdPAMw
	 qB8mf8ZFbKhNKgaDSO0KaL0Cf33caNalHtNgbOx6xEDCxrtwuhrRA7ml45+Wk3mIRf
	 kcJ06psCfTdiLTfM7hqx6KdvEAogYEvVzcKg7H28qEKblpz20XVpzhPSHsXYx3vPPM
	 +2D29U8AkQOdg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FB0D60898;
	Tue, 11 Aug 2026 19:15:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BB9C028A
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 19:15:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A18594033D
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 19:15:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id irY41oD5uHJQ for <buildroot@buildroot.org>;
 Tue, 11 Aug 2026 19:15:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D29744021A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D29744021A
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 19:15:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2B9BE8D3B6; Tue, 11 Aug 2026 19:14:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 11 Aug 2026 21:13:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a3a53b05f8cf25a55306dd0301dd6b310752b09c
X-Git-Newrev: 19f9e2688f82e8c50d220cf5a221ce68d3d5c5ba
X-Patchwork-Hint: ignore
Message-Id: <20260811191438.2B9BE8D3B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/grub2: properly handle autoreconf for
 target package
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/19f9e2688f82e8c50d220cf5a221ce68d3d5c5ba
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

In commit e427f85e29f7027319a5cd1ce1024d80ef4a29ea ("boot/grub2: fix
build issue since 2.14 version bump") we added some patches that
require regenerating the configure script. Consequently, we added
GRUB2_AUTORECONF = YES and HOST_GRUB2_AUTORECONF = YES.

Except that grub2 is special. While the host package is indeed using
host-autotols-package, the target package is using generic-package,
making GRUB2_AUTORECONF = YES basically a no-op.

Except that since we're patching configure.ac, the build realize at
build time that configure is older than configure.ac, regenerates it
at that time, and re-runs the configure script without the right
environment variables causing build failures.

We fix that by doing the autoreconf step "manually" for the target
grub2 package.

Fixes:

  https://autobuild.buildroot.org/results/11802ca1762e046328df324d33a1ad813fcd92e8/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 boot/grub2/grub2.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index 85b3925c1e..de9f913e93 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -17,8 +17,8 @@ GRUB2_INSTALL_IMAGES = YES
 
 # 0001-Revert-configure-Check-linker-for-image-base-support.patch
 # 0002-Revert-configure-Print-a-more-helpful-error-if-autoc.patch
-GRUB2_AUTORECONF = YES
-GRUB2_DEPENDENCIES += host-pkgconf
+# Target grub2 package doesn't use autotools-package
+GRUB2_DEPENDENCIES += host-automake host-autoconf host-libtool host-pkgconf
 HOST_GRUB2_AUTORECONF = YES
 HOST_GRUB2_DEPENDENCIES += host-pkgconf
 
@@ -139,6 +139,7 @@ HOST_GRUB2_CONF_OPTS = \
 	--disable-werror
 
 define GRUB2_CONFIGURE_CMDS
+	cd $(@D); $(AUTORECONF)
 	$(foreach tuple, $(GRUB2_TUPLES-y), \
 		@$(call MESSAGE,Configuring $(tuple))
 		mkdir -p $(@D)/build-$(tuple)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
