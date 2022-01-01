Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 916D2C433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 10:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C265404A9;
	Sat,  1 Jan 2022 10:26:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4puqM2RcTxzt; Sat,  1 Jan 2022 10:26:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 340FF4012F;
	Sat,  1 Jan 2022 10:26:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D5BE11BF5A4
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 10:26:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE36D4012F
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 10:26:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2YPd7MkVjNVC for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 10:26:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9412400D9
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 10:26:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id B6B9D8190F; Sat,  1 Jan 2022 10:20:26 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 1 Jan 2022 11:26:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ef7ace1017f13ca9266bb689c18bc008cca92ed2
X-Git-Newrev: c87659ec8030de5155667664de1bf67ab18a7613
X-Patchwork-Hint: ignore
Message-Id: <20220101102026.B6B9D8190F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libexecinfo: needs dynamic library
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

commit: https://git.buildroot.net/buildroot/commit/?id=c87659ec8030de5155667664de1bf67ab18a7613
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since the addition of the package
in commit eea8ba446c10701a273432552108d80fb2224ef4:

execinfo.c:32:10: fatal error: dlfcn.h: No such file or directory
   32 | #include <dlfcn.h>
      |          ^~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/ea33c8c6aa5091983837609eec5d129902183ef1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libexecinfo/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libexecinfo/Config.in b/package/libexecinfo/Config.in
index 473a4f7181..e90dfc4e87 100644
--- a/package/libexecinfo/Config.in
+++ b/package/libexecinfo/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_LIBEXECINFO
 	bool "libexecinfo"
+	depends on !BR2_STATIC_LIBS # dlfcn.h
 	depends on !BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Library for inspecting program's backtrace
 
 	  https://github.com/mikroskeem/libexecinfo
+
+comment "libexecinfo needs a musl or uclibc toolchain w/ dynamic library"
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_STATIC_LIBS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
