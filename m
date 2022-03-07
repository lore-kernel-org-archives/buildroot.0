Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4753AC433F5
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 19:30:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFC6B41715;
	Mon,  7 Mar 2022 19:30:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1-QAfS7XXVAv; Mon,  7 Mar 2022 19:30:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28DCF41714;
	Mon,  7 Mar 2022 19:30:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 948631BF36D
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 19:29:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 822694170F
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 19:29:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SCTLUZL7JQaS for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 19:29:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9BFB441711
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 19:29:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0C5C882DB9; Mon,  7 Mar 2022 19:21:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 7 Mar 2022 20:12:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 301b7c3c8120e6bd05872777b6c292ebc8230a27
X-Git-Newrev: 43c8f8b77bf2d318882c5fffb886852872ca74b7
X-Patchwork-Hint: ignore
Message-Id: <20220307192114.0C5C882DB9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/frr: fix elf_py TLS section
 handling
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

commit: https://git.buildroot.net/buildroot/commit/?id=43c8f8b77bf2d318882c5fffb886852872ca74b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised on mipsel, or1k, powerpc raised
since bump to version 8.1 in commit
ca2753fd47d47e5ad0eec16ea62f7b7f096331b6:

struct.error: unpack requires a buffer of 20 bytes

Fixes:
 - http://autobuild.buildroot.org/results/74f39c6f14e3f60babdcabceb5e42656f69cdaa7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-lib-fix-elf_py-TLS-section-handling.patch | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/package/frr/0002-lib-fix-elf_py-TLS-section-handling.patch b/package/frr/0002-lib-fix-elf_py-TLS-section-handling.patch
new file mode 100644
index 0000000000..d491cb1a7d
--- /dev/null
+++ b/package/frr/0002-lib-fix-elf_py-TLS-section-handling.patch
@@ -0,0 +1,31 @@
+From 3942ee1f7bc754dd0dd9ae79f89d0f2635be334f Mon Sep 17 00:00:00 2001
+From: David Lamparter <equinox@opensourcerouting.org>
+Date: Wed, 10 Nov 2021 15:30:07 +0100
+Subject: [PATCH] lib: fix elf_py TLS section handling
+
+... need to ignore TLS sections, their address is effectively
+meaningless but can overlap other sections we actually need to access.
+
+Signed-off-by: David Lamparter <equinox@opensourcerouting.org>
+
+[Retrieved from:
+https://github.com/FRRouting/frr/commit/3942ee1f7bc754dd0dd9ae79f89d0f2635be334f]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ lib/elf_py.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/lib/elf_py.c b/lib/elf_py.c
+index 1c306893ad8..f230add6957 100644
+--- a/lib/elf_py.c
++++ b/lib/elf_py.c
+@@ -636,6 +636,9 @@ static Elf_Scn *elf_find_addr(struct elffile *ef, uint64_t addr, size_t *idx)
+ 		Elf_Scn *scn = elf_getscn(ef->elf, i);
+ 		GElf_Shdr _shdr, *shdr = gelf_getshdr(scn, &_shdr);
+ 
++		/* virtual address is kinda meaningless for TLS sections */
++		if (shdr->sh_flags & SHF_TLS)
++			continue;
+ 		if (addr < shdr->sh_addr ||
+ 		    addr >= shdr->sh_addr + shdr->sh_size)
+ 			continue;
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
