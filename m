Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCE07C433FE
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 18:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E74960EDB;
	Thu, 21 Apr 2022 18:02:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FYS_m-NkqTh5; Thu, 21 Apr 2022 18:02:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CD6D60FAC;
	Thu, 21 Apr 2022 18:02:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7943D1C1189
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 18:01:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 297E060B17
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 18:01:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NY8Yq4t7w0Om for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 18:01:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5795760ED2
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 18:01:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 719DB83FB8; Thu, 21 Apr 2022 17:50:56 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 21 Apr 2022 19:31:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 090a6ab0fcd24a20fd51882d8b4ce11c184d29aa
X-Git-Newrev: 30cbb1e21716b205d1bbd5fc23d53a3f83773f22
X-Patchwork-Hint: ignore
Message-Id: <20220421175056.719DB83FB8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bpftool: needs __sync_*_4 intrisics
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

commit: https://git.buildroot.net/buildroot/commit/?id=30cbb1e21716b205d1bbd5fc23d53a3f83773f22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

bpftool needs __sync_*_4 intrisics since its addition in commit
3675131e6c654d7536a184db0184fde7a97040e0 and
https://github.com/libbpf/libbpf/commit/b0c3d7133faa55fbcbc19f76f9cc9e183e178c97:

/nvmedata/autobuild/instance-26/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /nvmedata/autobuild/instance-26/output-1/build/bpftool-v6.7.0/src/libbpf/libbpf.a(libbpf.o): in function `bpf_program__attach_kprobe_opts':
libbpf.c:(.text+0xff88): undefined reference to `__sync_fetch_and_add_4'

Fixes:
 - http://autobuild.buildroot.org/results/919b8351d3783ca30a860df87ae814d5c4b9fd41

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
