Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FBA5C5AD49
	for <buildroot@archiver.kernel.org>; Sun,  8 Jun 2025 11:06:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C426409FB;
	Sun,  8 Jun 2025 11:06:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YwO17fVA1c6T; Sun,  8 Jun 2025 11:06:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A0B440918
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A0B440918;
	Sun,  8 Jun 2025 11:06:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 51B40C8
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 11:06:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4350340287
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 11:06:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b_GLUzhzN1NJ for <buildroot@buildroot.org>;
 Sun,  8 Jun 2025 11:06:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 76F2F40210
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76F2F40210
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 76F2F40210
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 11:06:36 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:656e:cf44:475c:a8d2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 1C808B0059B;
 Sun,  8 Jun 2025 13:06:32 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
	"Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Sun,  8 Jun 2025 13:06:26 +0200
Message-ID: <20250608110626.17746-1-ju.o@free.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749380794;
 bh=nR/whPx5+zka8ebkssMUcRVTBlwdtfaZVb84mzG0n84=;
 h=From:To:Cc:Subject:Date:From;
 b=t/V9dOATK74sArY6kvCghCU5AKQNAWVJ1QyHuHoCUER/f77dt1Mw9pIjSJd/nxPXt
 J64cXpHmNgELYCv9aa5UdkTgfISIs3cUyOY0bW/EwILVd9sh7pvEHDAQJLPy2RY0YS
 apHVDvvZYpIbumxEv3vGK+YJLKItYFZyyWYUrzdPOCljOD4PcgZy1wzMnV8fAsjGY0
 oFBo6bT6hl8map6K8n13q2RGjLL3FHBKfwfAfgx+j2sVmWO2N+3ba27bqG2enDA5qK
 vugJidjsr6MKZHmj73OqL8I1seIiR8kjgdLtIoMOf6VpCgoHF3TswbZLDsgWiUgL2u
 8s5X1I3/DRqtg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=t/V9dOAT
Subject: [Buildroot] [PATCH 1/1] package/podman: raise kernel header
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
