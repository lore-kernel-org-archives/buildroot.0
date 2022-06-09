Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 487E3C433EF
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 20:35:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08CDC8426F;
	Thu,  9 Jun 2022 20:35:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oH24O0Kqzrmj; Thu,  9 Jun 2022 20:35:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33A7B84268;
	Thu,  9 Jun 2022 20:35:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 18FFA1BF35E
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:35:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 07FBA84268
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:35:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C5ffUIi4csqh for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 20:35:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43B5C8425F
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 20:35:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7C6A986EA1; Thu,  9 Jun 2022 20:23:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 9 Jun 2022 22:24:46 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 641f27b7bb2032fac0809cd581758b31b57f291f
X-Git-Newrev: 36a69726a944bdb86810b0221bdd7f9554935348
X-Patchwork-Hint: ignore
Message-Id: <20220609202328.7C6A986EA1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/gensio: needs
 atomic
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

commit: https://git.buildroot.net/buildroot/commit/?id=36a69726a944bdb86810b0221bdd7f9554935348
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

gensio needs atomic since bump to version 2.0.1 in commit
0f8d4a6ecd874770ce677b617b2c7f459eb1505d and
https://github.com/cminyard/gensio/commit/5528267b54ac5a8ac0ecd7fd9ba481d654b0e92b:

/nvmedata/autobuild/instance-7/output-1/per-package/gensio/host/bin/../lib/gcc/arc-buildroot-linux-uclibc/11.3.0/../../../../arc-buildroot-linux-uclibc/bin/ld: ../lib/.libs/libgensio.a(gensio_osops.o): in function `gensio_addr_dup':
gensio_osops.c:(.text+0x1558): undefined reference to `__atomic_fetch_add_4'

Fixes:
 - http://autobuild.buildroot.org/results/229e4bd1ba1787953899875ab56721c9609f035a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 41498af0df34a3ab61ce8e4f846c06bc534e6d16)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
