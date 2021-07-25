Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F58BC4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 07:49:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 104AE60F23
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 07:49:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 104AE60F23
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC05540116;
	Sun, 25 Jul 2021 07:49:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qmrwwp-1_rx9; Sun, 25 Jul 2021 07:49:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 326AC40104;
	Sun, 25 Jul 2021 07:49:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 13D3F1BF97D
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 07:49:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0FC7A403B2
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 07:49:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dqb9jfRMFSwF for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 07:49:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 54545403B1
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 07:49:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 3ADA0868A3; Sun, 25 Jul 2021 07:14:32 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 09:42:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6e47347b1d83e8816366dd4588f11e95a0571382
X-Git-Newrev: d2453aa83d8f7d394b3dbe33472e5f1642268a63
X-Patchwork-Hint: ignore
Message-Id: <20210725071432.3ADA0868A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lapack: introduce
 BR2_PACKAGE_LAPACK_ARCH_SUPPORTS
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=d2453aa83d8f7d394b3dbe33472e5f1642268a63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This makes it easier for packages that depend on lapack to get
their dependencies correct.

The !uClibc dependency is also not sufficient: indeed, musl too does not
provide _fpu_control; only glibc does. This is the same situation as for
clapack. Add a comment about this, to mirror clapack.

Since the !glibc dependency only exists for PowerPC, treat it as
an architecture dependency.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[yann.morin.1998@free.fr:
  - fpu_control depends on glibc, not on !uclibc
  - add or update comments accordingly
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/lapack/Config.in | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/package/lapack/Config.in b/package/lapack/Config.in
index 6cd0810cb1..e84a19bb45 100644
--- a/package/lapack/Config.in
+++ b/package/lapack/Config.in
@@ -1,13 +1,23 @@
+config BR2_PACKAGE_LAPACK_ARCH_SUPPORTS
+	bool
+	default y
+	# _fpu_control is used on PowerPC, but not available with
+	# uClibc or musl
+	depends on !BR2_powerpc || BR2_TOOLCHAIN_USES_GLIBC
+
+comment "lapack/blas needs a glibc toolchain"
+	depends on BR2_powerpc
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
+
 comment "lapack/blas needs a toolchain w/ fortran"
-	depends on !(BR2_powerpc && BR2_TOOLCHAIN_USES_UCLIBC)
+	depends on BR2_PACKAGE_LAPACK_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_FORTRAN
 
 config BR2_PACKAGE_LAPACK
 	bool "lapack/blas"
+	depends on BR2_PACKAGE_LAPACK_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_FORTRAN
 	depends on !BR2_PACKAGE_CLAPACK
-	# _fpu_control is used on PowerPC, but not available with uClibc
-	depends on !(BR2_powerpc && BR2_TOOLCHAIN_USES_UCLIBC)
 	help
 	  LAPACK and BLAS FORTRAN implementation. This package
 	  installs two libraries: libblas and liblapack.
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
