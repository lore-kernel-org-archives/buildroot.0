Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9322C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 13:03:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 728C441A4E;
	Mon,  6 Jun 2022 13:03:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dLGf5WByEZJQ; Mon,  6 Jun 2022 13:03:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52B2D41A27;
	Mon,  6 Jun 2022 13:03:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 19CD61BF339
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 13:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0844B41A27
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 13:03:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qgKsdRCdbW6c for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 13:03:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9066416F3
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 13:03:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id B23A486D91; Mon,  6 Jun 2022 12:52:01 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 6 Jun 2022 14:53:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f642d28e48497f98868f694476fb39ff5cb30110
X-Git-Newrev: 41498af0df34a3ab61ce8e4f846c06bc534e6d16
X-Patchwork-Hint: ignore
Message-Id: <20220606125201.B23A486D91@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gensio: needs atomic
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

commit: https://git.buildroot.net/buildroot/commit/?id=41498af0df34a3ab61ce8e4f846c06bc534e6d16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gensio needs atomic since bump to version 2.0.1 in commit
0f8d4a6ecd874770ce677b617b2c7f459eb1505d and
https://github.com/cminyard/gensio/commit/5528267b54ac5a8ac0ecd7fd9ba481d654b0e92b:

/nvmedata/autobuild/instance-7/output-1/per-package/gensio/host/bin/../lib/gcc/arc-buildroot-linux-uclibc/11.3.0/../../../../arc-buildroot-linux-uclibc/bin/ld: ../lib/.libs/libgensio.a(gensio_osops.o): in function `gensio_addr_dup':
gensio_osops.c:(.text+0x1558): undefined reference to `__atomic_fetch_add_4'

Fixes:
 - http://autobuild.buildroot.org/results/229e4bd1ba1787953899875ab56721c9609f035a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gensio/Config.in  | 1 +
 package/ser2net/Config.in | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/gensio/Config.in b/package/gensio/Config.in
index f874d1a469..fd0e476970 100644
--- a/package/gensio/Config.in
+++ b/package/gensio/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_GENSIO
 	bool "gensio"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	help
 	  A library to abstract stream I/O like serial port, TCP,
 	  telnet, UDP, SSL, IPMI SOL, etc.
diff --git a/package/ser2net/Config.in b/package/ser2net/Config.in
index 3d110b70f2..1859d42c8f 100644
--- a/package/ser2net/Config.in
+++ b/package/ser2net/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SER2NET
 	bool "ser2net"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # gensio
 	select BR2_PACKAGE_GENSIO
 	select BR2_PACKAGE_LIBYAML
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
