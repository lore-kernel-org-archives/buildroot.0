Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5420BC433EF
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 22:15:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1574340207;
	Fri, 13 May 2022 22:15:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9d0WVvxsNoFv; Fri, 13 May 2022 22:15:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B45940438;
	Fri, 13 May 2022 22:15:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 05A431C11A9
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 22:11:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65C1E40983
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 22:11:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dTZG9raIvC5l for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 22:11:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96E104093B
 for <buildroot@buildroot.org>; Fri, 13 May 2022 22:11:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 3ED7785E29; Fri, 13 May 2022 22:00:45 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 13 May 2022 23:54:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bb40efa6f443207fc98b195f6c89795c290aadc1
X-Git-Newrev: 5ade3ecdb8a154779c219f49175fa72e417cd7ae
X-Patchwork-Hint: ignore
Message-Id: <20220513220045.3ED7785E29@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/numactl: needs atomic
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

commit: https://git.buildroot.net/buildroot/commit/?id=5ade3ecdb8a154779c219f49175fa72e417cd7ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

numactl unconditionally uses __atomic_fetch_and resulting in the
following build failure on architectures that need libatomic to provide
atomic intrinsics (e.g. microblaze) since commit
4ed540ddf59bec4b389be44d7f42820d2466904f:

/nvmedata/autobuild/instance-5/output-1/host/lib/gcc/microblaze-buildroot-linux-uclibc/10.3.0/../../../../microblaze-buildroot-linux-uclibc/bin/ld: ./.libs/libnuma.a(libnuma.o): in function `numa_node_to_cpus_v1':
(.text+0x2a34): undefined reference to `__atomic_fetch_and_1'

Fixes:
 - http://autobuild.buildroot.org/results/e225cb83dae390d9dc543d4da85c52180efbd40a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/numactl/Config.in  | 1 +
 package/rt-tests/Config.in | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/numactl/Config.in b/package/numactl/Config.in
index 23cf7facb0..325a05d609 100644
--- a/package/numactl/Config.in
+++ b/package/numactl/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_NUMACTL
 	bool "numactl"
 	depends on BR2_USE_MMU # madvise()
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	help
 	  numactl allows you to run your application on specific cpus
 	  and memory nodes. It does this by supplying a NUMA memory
diff --git a/package/rt-tests/Config.in b/package/rt-tests/Config.in
index 8efa3d194e..ccfa040d70 100644
--- a/package/rt-tests/Config.in
+++ b/package/rt-tests/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_RT_TESTS
 	bool "rt-tests"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # __sync_*_4 intrisics
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # numactl
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5
 	depends on BR2_USE_MMU # fork(), numactl
@@ -32,6 +33,7 @@ comment "rt-tests may not work on MIPS with an external uClibc toolchain"
 
 comment "rt-tests needs a uClibc or glibc toolchain w/ NPTL, headers >= 4.5, dynamic library"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
 		|| BR2_TOOLCHAIN_USES_MUSL || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5
 	depends on BR2_USE_MMU
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
