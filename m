Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A409C47087
	for <buildroot@archiver.kernel.org>; Mon, 14 Mar 2022 12:22:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBC4284116;
	Mon, 14 Mar 2022 12:22:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7uL3GSBU8jst; Mon, 14 Mar 2022 12:22:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB437840AC;
	Mon, 14 Mar 2022 12:22:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4937D1BF3A9
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 12:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2403841550
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 12:20:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o4hBopDChJdE for <buildroot@lists.busybox.net>;
 Mon, 14 Mar 2022 12:20:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 05F5A4154F
 for <buildroot@buildroot.org>; Mon, 14 Mar 2022 12:20:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 36A5283E3E; Mon, 14 Mar 2022 12:11:53 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 14 Mar 2022 13:17:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 96ebed1eed6dcd55d8024cbc6fe8bec646d739c6
X-Git-Newrev: c750dd4e5d03430148841d2d897e90dbe19ce172
X-Patchwork-Hint: ignore
Message-Id: <20220314121153.36A5283E3E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bpftool: add
 BR2_PACKAGE_BPFTOOL_ARCH_SUPPORTS
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c750dd4e5d03430148841d2d897e90dbe19ce172
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

bpftool uses its own local copy of libbpf so add
BR2_PACKAGE_BPFTOOL_ARCH_SUPPORTS to avoid the following build failure
on ARM:

btf.c: In function 'btf_type_by_id':
btf.c:461:14: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
  if (type_id < btf->start_id)
              ^
bpf.c:62:4: error: #error __NR_bpf not defined. libbpf does not support your arch.
 #  error __NR_bpf not defined. libbpf does not support your arch.
    ^

Fixes:
 - http://autobuild.buildroot.org/results/aae772f1cfb16516a57f310c4f022e80a2a8d65e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/bpftool/Config.in | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/bpftool/Config.in b/package/bpftool/Config.in
index e81d874343..a1ef3843e6 100644
--- a/package/bpftool/Config.in
+++ b/package/bpftool/Config.in
@@ -1,5 +1,15 @@
+config BR2_PACKAGE_BPFTOOL_ARCH_SUPPORTS
+	bool
+	# see libbpf/src/bpf.c
+	default y if BR2_arc
+	default y if BR2_aarch64 || BR2_aarch64_be
+	default y if BR2_i386 || BR2_x86_64
+	default y if BR2_sparc || BR2_sparc64
+	default y if BR2_s390x
+
 config BR2_PACKAGE_BPFTOOL
 	bool "bpftool"
+	depends on BR2_PACKAGE_BPFTOOL_ARCH_SUPPORTS
 	depends on !BR2_nios2 # binutils
 	depends on BR2_USE_WCHAR # binutils, elfutils
 	depends on !BR2_STATIC_LIBS # elfutils
@@ -13,6 +23,7 @@ config BR2_PACKAGE_BPFTOOL
 	  of eBPF programs and maps.
 
 comment "bpftool needs a uClibc or glibc toolchain w/ wchar, dynamic library, threads, headers >= 4.12"
+	depends on BR2_PACKAGE_BPFTOOL_ARCH_SUPPORTS
 	depends on !BR2_nios2
 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
 		|| !BR2_TOOLCHAIN_HAS_THREADS \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
