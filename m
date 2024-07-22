Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE92C3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 12:32:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E154400D2;
	Mon, 22 Jul 2024 12:32:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q-jVGAIVYrts; Mon, 22 Jul 2024 12:32:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9ED44053D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B9ED44053D;
	Mon, 22 Jul 2024 12:32:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6E6DA1BF2A1
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:32:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 598E1401E1
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:32:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qz7w-7ccTPt9 for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 12:32:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49EC5401DE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 49EC5401DE
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 12:32:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 33DB48702F; Mon, 22 Jul 2024 12:32:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 22 Jul 2024 14:31:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1b8e5c93d3789c900fbd5ab62badfe4d4eec61a6
X-Git-Newrev: 7103da7c96fc188e8470c39d967a677365ec8398
X-Patchwork-Hint: ignore
Message-Id: <20240722123238.33DB48702F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sysprof: needs headers >= 5.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=7103da7c96fc188e8470c39d967a677365ec8398
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

sysprof unconditionally uses PERF_RECORD_MISC_MMAP_BUILD_ID which is
only available since kernel 5.12 and
https://github.com/torvalds/linux/commit/88a16a1309333e43d328621ece3e9fa37027e8eb
resulting in the following build failure with kernel < 5.12 since bump
to version 46.0 in commit 0d57555407f2a0708515e7c377f57a6466c78b1b:

../src/libsysprof/sysprof-sampler.c: In function 'sysprof_sampler_perf_event_stream_cb':
../src/libsysprof/sysprof-sampler.c:186:33: error: 'PERF_RECORD_MISC_MMAP_BUILD_ID' undeclared (first use in this function); did you mean 'PERF_RECORD_MISC_MMAP_DATA'?
  186 |       if ((event->header.misc & PERF_RECORD_MISC_MMAP_BUILD_ID) != 0)
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                 PERF_RECORD_MISC_MMAP_DATA

While at it, also fix a typo in "library"

Fixes: 0d57555407f2a0708515e7c377f57a6466c78b1b
 - http://autobuild.buildroot.org/results/9a9f8462bd1d7127dc80de7f280ab9d100db47fe

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sysprof/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/sysprof/Config.in b/package/sysprof/Config.in
index be4f7653b0..32a5f99798 100644
--- a/package/sysprof/Config.in
+++ b/package/sysprof/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_SYSPROF
 	depends on !BR2_STATIC_LIBS # libunwind, polkit
 	depends on !BR2_OPTIMIZE_FAST # polkit
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_12
 	select BR2_PACKAGE_JSON_GLIB
 	select BR2_PACKAGE_LIBDEX
 	select BR2_PACKAGE_LIBGLIB2
@@ -19,12 +20,13 @@ config BR2_PACKAGE_SYSPROF
 
 	  http://sysprof.com
 
-comment "sysprof needs a toolchain w/ dynamic libraray, wchar, threads, C++, gcc >= 7"
+comment "sysprof needs a toolchain w/ dynamic library, wchar, threads, C++, gcc >= 7, headers >= 5.12"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
-		BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP
+		BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_12
 
 comment "sysprof can't be built with Optimize for fast"
 	depends on BR2_OPTIMIZE_FAST
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
