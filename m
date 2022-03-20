Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E93D9C433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 17:50:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A128F813F9;
	Sun, 20 Mar 2022 17:50:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3pp8768gZprQ; Sun, 20 Mar 2022 17:50:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC516813E1;
	Sun, 20 Mar 2022 17:50:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9B19F1BF352
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 17:49:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91B3C40593
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 17:49:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6EnPTO9BYQfN for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 17:49:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91DFC40012
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 17:49:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B9293845D9; Sun, 20 Mar 2022 17:40:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 20 Mar 2022 18:49:07 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 25fc940a4ca008f8c51395a0d210c0d8b7828b44
X-Git-Newrev: 44db0dba5976bc1b5ff979589e51c8d023af4195
X-Patchwork-Hint: ignore
Message-Id: <20220320174059.B9293845D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/bpftool: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=44db0dba5976bc1b5ff979589e51c8d023af4195
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
(cherry picked from commit c750dd4e5d03430148841d2d897e90dbe19ce172)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
