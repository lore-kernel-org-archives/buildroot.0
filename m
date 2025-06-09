Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18BE6C677C4
	for <buildroot@archiver.kernel.org>; Mon,  9 Jun 2025 14:25:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE55481E66;
	Mon,  9 Jun 2025 14:25:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Nzcd2iYs0iE; Mon,  9 Jun 2025 14:25:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 119A881E3F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 119A881E3F;
	Mon,  9 Jun 2025 14:25:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 158091F2
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 14:25:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5EBBF417AA
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 14:25:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BM_boB-bSQuL for <buildroot@buildroot.org>;
 Mon,  9 Jun 2025 14:25:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F1C3417D8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F1C3417D8
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 14:25:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 99D2D87AD6; Mon,  9 Jun 2025 14:25:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 9 Jun 2025 16:09:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 733fe053e12745fa6a48e16edf8063de7dd5132c
X-Git-Newrev: f933a165e2ee2ee775c7fa0824d2bfcfa9545f88
X-Patchwork-Hint: ignore
Message-Id: <20250609142501.99D2D87AD6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/podman: raise kernel header
 requirement to v4.14
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f933a165e2ee2ee775c7fa0824d2bfcfa9545f88
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since its introduction in commit [1], the podman package has a
dependency on a toolchain with headers >= 3.17, which was propagated
from libseccomp and slirp4netns. The podman package also selects
BR2_PACKAGE_SHADOW which has a requirement on toolchain with
headers >= 4.14. See [2]. This requirement should have been
propagated.

This commit fixes this issue.

Fixes:

    WARNING: unmet direct dependencies detected for BR2_PACKAGE_SHADOW
      Depends on [n]: !BR2_STATIC_LIBS [=n] && BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 [=n]
      Selected by [y]:
      - BR2_PACKAGE_PODMAN [=y] && BR2_USE_MMU [=y] && BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS [=y] && BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS [=y] && BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS [=y] && BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS [=y] && BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_USE_WCHAR [=y]

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/ebbaac08e3f462bf023c12077f739ed1c0543eb2
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/f78c5cb5cae93a9e63dad4361d78e1787759382f

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/podman/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/podman/Config.in b/package/podman/Config.in
index 4378d9918d..2bcb8e71d2 100644
--- a/package/podman/Config.in
+++ b/package/podman/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_PODMAN
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS  # netavark
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS  # libgpgme
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS  # libseccomp
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17  # libseccomp
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14  # shadow
 	depends on BR2_TOOLCHAIN_HAS_THREADS  # conmon
 	depends on BR2_USE_WCHAR  # conmon
 	select BR2_PACKAGE_HOST_GO
@@ -81,12 +81,12 @@ endchoice
 
 endif
 
-comment "podman needs a toolchain w/ headers >= 3.17, threads, wchar"
+comment "podman needs a toolchain w/ headers >= 4.14, threads, wchar"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 \
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 \
 		|| !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !BR2_USE_WCHAR
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
