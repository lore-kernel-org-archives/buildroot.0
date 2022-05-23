Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB8BC433EF
	for <buildroot@archiver.kernel.org>; Mon, 23 May 2022 15:37:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB1C940915;
	Mon, 23 May 2022 15:37:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OvWw-Is0har2; Mon, 23 May 2022 15:37:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E99D408F8;
	Mon, 23 May 2022 15:37:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DCE6C1BF977
 for <buildroot@lists.busybox.net>; Mon, 23 May 2022 15:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CBB3C41926
 for <buildroot@lists.busybox.net>; Mon, 23 May 2022 15:36:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hjm_B9GY8H13 for <buildroot@lists.busybox.net>;
 Mon, 23 May 2022 15:36:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E10324184B
 for <buildroot@buildroot.org>; Mon, 23 May 2022 15:36:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7C233863F0; Mon, 23 May 2022 15:25:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 23 May 2022 17:30:43 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 8961298f501bdecd0df25b9de532bc7954f56e5c
X-Git-Newrev: d9847c7f81804b3f2ee0a82816d46ee6a5349e49
X-Patchwork-Hint: ignore
Message-Id: <20220523152532.7C233863F0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/bpftool: needs
 __sync_*_4 intrisics
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

commit: https://git.buildroot.net/buildroot/commit/?id=d9847c7f81804b3f2ee0a82816d46ee6a5349e49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

bpftool needs __sync_*_4 intrisics since its addition in commit
3675131e6c654d7536a184db0184fde7a97040e0 and
https://github.com/libbpf/libbpf/commit/b0c3d7133faa55fbcbc19f76f9cc9e183e178c97:

/nvmedata/autobuild/instance-26/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /nvmedata/autobuild/instance-26/output-1/build/bpftool-v6.7.0/src/libbpf/libbpf.a(libbpf.o): in function `bpf_program__attach_kprobe_opts':
libbpf.c:(.text+0xff88): undefined reference to `__sync_fetch_and_add_4'

Fixes:
 - http://autobuild.buildroot.org/results/919b8351d3783ca30a860df87ae814d5c4b9fd41

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 30cbb1e21716b205d1bbd5fc23d53a3f83773f22)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bpftool/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/bpftool/Config.in b/package/bpftool/Config.in
index a1ef3843e6..461be9e5b4 100644
--- a/package/bpftool/Config.in
+++ b/package/bpftool/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_BPFTOOL_ARCH_SUPPORTS
 config BR2_PACKAGE_BPFTOOL
 	bool "bpftool"
 	depends on BR2_PACKAGE_BPFTOOL_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_nios2 # binutils
 	depends on BR2_USE_WCHAR # binutils, elfutils
 	depends on !BR2_STATIC_LIBS # elfutils
@@ -24,6 +25,7 @@ config BR2_PACKAGE_BPFTOOL
 
 comment "bpftool needs a uClibc or glibc toolchain w/ wchar, dynamic library, threads, headers >= 4.12"
 	depends on BR2_PACKAGE_BPFTOOL_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_nios2
 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
 		|| !BR2_TOOLCHAIN_HAS_THREADS \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
