Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDEF0C5CFC1
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 10:34:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 742A380FF2;
	Sat, 15 Aug 2026 10:34:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ylwe8RUZGEMj; Sat, 15 Aug 2026 10:34:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9514181102
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786790064;
	bh=qs/vK0l8u+k936RaK9TXxeH1UyMF9sacPpCEBTWBT+0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CgnFdS5H1kURbop/UVmCm+SKNDqpyFlkDr9zm53l+YA/DC33P+2SoLJD6uDkcDoqe
	 mBF/ErFaHC/VKoo+4/DyUx6E5KyoFYYtB6PyiQUzQCZaLVsx0IAML2QzIRxnXsV4Hm
	 +azFXjmFc8/QAOHj2K+klRNhqLp77sCp9fCZve1MPLM59y+aWZIymcZnPf7lLYd6HC
	 dZasrUleizwxFmKZ2Rv//l8ofgFst0htoV3+5jGDdHS0SfvZVpktBgcPwy2GFdtwrR
	 6aVsrXYrvcQ0cP0L0rqnJJVHApOCiHKCk83794xmAV8oVPGvSmVddn5TKwXcHGO5a6
	 qjAaowNGqA+1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9514181102;
	Sat, 15 Aug 2026 10:34:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 52E9D361
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 10:34:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3914F60677
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 10:34:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RuyIMEALn87p for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 10:34:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BEF16065E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8BEF16065E
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 10:34:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1C1988835C; Sat, 15 Aug 2026 10:33:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 15 Aug 2026 12:05:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dc500671dfa6e25e8ff3b4d82904f5e5806a9368
X-Git-Newrev: 97f027ce41ced23df556dea56f5d61db8c8b073a
X-Patchwork-Hint: ignore
Message-Id: <20260815103332.1C1988835C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc: fortran support now requires
 MMU
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/97f027ce41ced23df556dea56f5d61db8c8b073a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Since upstream commit
c66d1ba685b0d03b28967d2f7a48f6c64687efa2 ("Fortran: Add a shared
memory multi process coarray implementation [PR88076]"), libgfortran
now unconditionally uses fork(), which makes it impossible to build
Fortran support on noMMU architectures.

In follow-up commit efb497c23a6f4109bf8794342617cbc161c08301, it was
made even more clear: if you don't have fork() and you're not on
WIN32:

+#else
+#error "no way known to start child processes."
+#endif

There are apparently no autobuilder failures for this issue, but the
simple defconfig below allows to trigger the build failure:

BR2_arm=y
BR2_cortex_m7=y
BR2_GCC_VERSION_16_X=y
BR2_TOOLCHAIN_BUILDROOT_FORTRAN=y

Even though this issue is only starting from GCC 16.x, we make Fortran
unavailable on noMMU configurations regardless of the GCC version,
with the reasoning that:

1. Fortran on noMMU is unlikely to be in use

2. Moving forward, all future versions of GCC will have this
   restriction

Cc: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/gcc/Config.in.host | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index d8b89d942c..bc3223eb59 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -98,6 +98,8 @@ config BR2_TOOLCHAIN_BUILDROOT_FORTRAN
 	# on architecture building libquadmath, wchar is required
 	depends on !BR2_TOOLCHAIN_HAS_LIBQUADMATH || \
 		(BR2_TOOLCHAIN_HAS_LIBQUADMATH && BR2_USE_WCHAR)
+	# requires fork() since gcc 16.x
+	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	help
 	  Enable this option if you want your toolchain to support the
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
