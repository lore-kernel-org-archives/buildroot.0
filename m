Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C551AC83F04
	for <buildroot@archiver.kernel.org>; Wed,  2 Jul 2025 13:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 635C840A08;
	Wed,  2 Jul 2025 13:45:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d5sYAAJKSkOh; Wed,  2 Jul 2025 13:45:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B3CF40AA0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B3CF40AA0;
	Wed,  2 Jul 2025 13:45:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D0F9128
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 13:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8283940A08
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 13:45:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VVeGQPoyy9UP for <buildroot@buildroot.org>;
 Wed,  2 Jul 2025 13:45:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3428A4099F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3428A4099F
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 13:45:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 11B87856F1; Wed,  2 Jul 2025 13:45:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 2 Jul 2025 15:14:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 77242680343df0c619bcba9658039cdb59b05ab1
X-Git-Newrev: 49dbfba22f4ae4d39e36484ee403bbb390ddbc6c
X-Patchwork-Hint: ignore
Message-Id: <20250702134536.11B87856F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc: add logic to hide gcc 15 for
 unsupported CPUs
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

commit: https://git.buildroot.net/buildroot/commit/?id=49dbfba22f4ae4d39e36484ee403bbb390ddbc6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This logic is to prepare for future gcc versions and their new
supported CPUs. As of today, gcc 15 is the latest gcc version
and all architectures and CPUs in Buildroot are supported by
this version.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/gcc/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 8640280fdf..23fcaa9825 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -43,6 +43,7 @@ config BR2_GCC_VERSION_14_X
 
 config BR2_GCC_VERSION_15_X
 	bool "gcc 15.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	# powerpc spe support has been deprecated since gcc 8.x.
 	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
 	depends on !BR2_POWERPC_CPU_HAS_SPE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
