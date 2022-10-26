Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C273EC38A2D
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 20:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54AA160DB2;
	Wed, 26 Oct 2022 20:09:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54AA160DB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C6HinZNcV_v3; Wed, 26 Oct 2022 20:09:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C98C60D9D;
	Wed, 26 Oct 2022 20:09:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C98C60D9D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CBA681BF2C2
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 20:09:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B03B24020B
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 20:09:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B03B24020B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wixtIjsxPqH9 for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 20:09:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 92D48401FF
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 20:09:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92D48401FF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 760C28716D; Wed, 26 Oct 2022 20:09:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 26 Oct 2022 22:08:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9c2dec7a2ba990233784f0e6baf1cd67d9220f9f
X-Git-Newrev: 51ecbe500f1bce6725ea78c8193b9efae5da2e6f
X-Patchwork-Hint: ignore
Message-Id: <20221026200948.760C28716D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libbpf: remove architecture
 restrictions
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

commit: https://git.buildroot.net/buildroot/commit/?id=51ecbe500f1bce6725ea78c8193b9efae5da2e6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since Buildroot commit 3145adfb69ba ("package/libbpf: needs headers >=
4.13"), libbpf depends on Linux headers >= 4.13. This requirement
renders the explicit list of supported architectures, previously added
in f693354c30bd overly restrictive, as the syscall number for bpf(2)
has been defined since Linux 3.18.

Commit f693354c30bd ("package/libbpf: add
BR2_PACKAGE_LIBBPF_ARCH_SUPPORTS") was introduced to fix a build issue
where a toolchain using very old kernel headers (3.13) failed to build
libbpf for ARM, but these architecture dependencies are no longer
needed due to the bump on the kernel headers version requirement.

Signed-off-by: Tobias Waldekranz <tobias@waldekranz.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libbpf/Config.in | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/package/libbpf/Config.in b/package/libbpf/Config.in
index b3d6e44c6a..1465366c9e 100644
--- a/package/libbpf/Config.in
+++ b/package/libbpf/Config.in
@@ -1,15 +1,5 @@
-config BR2_PACKAGE_LIBBPF_ARCH_SUPPORTS
-	bool
-	# see src/bpf.c
-	default y if BR2_arc
-	default y if BR2_aarch64 || BR2_aarch64_be
-	default y if BR2_i386 || BR2_x86_64
-	default y if BR2_sparc || BR2_sparc64
-	default y if BR2_s390x
-
 config BR2_PACKAGE_LIBBPF
 	bool "libbpf"
-	depends on BR2_PACKAGE_LIBBPF_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_USE_WCHAR # elfutils
 	depends on !BR2_STATIC_LIBS # elfutils
@@ -27,7 +17,6 @@ config BR2_PACKAGE_LIBBPF
 	  https://github.com/libbpf/libbpf
 
 comment "libbpf needs a uClibc or glibc toolchain w/ wchar, dynamic library, threads, headers >= 4.13"
-	depends on BR2_PACKAGE_LIBBPF_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
 		|| !BR2_TOOLCHAIN_HAS_THREADS \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
