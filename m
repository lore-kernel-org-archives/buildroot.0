Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11959C433F5
	for <buildroot@archiver.kernel.org>; Sat,  5 Mar 2022 14:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AFB8F40523;
	Sat,  5 Mar 2022 14:55:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3uGtCPmZh-aE; Sat,  5 Mar 2022 14:55:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9287B40438;
	Sat,  5 Mar 2022 14:55:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4DA791BF616
 for <buildroot@lists.busybox.net>; Sat,  5 Mar 2022 14:54:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 412DE40526
 for <buildroot@lists.busybox.net>; Sat,  5 Mar 2022 14:54:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vRyVAjUb2O0d for <buildroot@lists.busybox.net>;
 Sat,  5 Mar 2022 14:54:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48AF84018D
 for <buildroot@buildroot.org>; Sat,  5 Mar 2022 14:54:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 9F725826C4; Sat,  5 Mar 2022 14:46:36 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 5 Mar 2022 15:05:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0f3b4f9402b7f5da8f0e0840523d43ef40c3f73f
X-Git-Newrev: e0d94c6104496373476919931553fe58d5e927a5
X-Patchwork-Hint: ignore
Message-Id: <20220305144636.9F725826C4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bpftool: needs headers >= 4.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=e0d94c6104496373476919931553fe58d5e927a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

NETLINK_EXT_ACK is only available since kernel 4.12 and
https://github.com/torvalds/linux/commit/2d4bc93368f5a0ddb57c8c885cdad9c9b7a10ed5
resulting in the following build failure since addition of the package
in commit 3675131e6c654d7536a184db0184fde7a97040e0:

net.c: In function 'netlink_open':
net.c:110:36: error: 'NETLINK_EXT_ACK' undeclared (first use in this function); did you mean 'NETLINK_CAP_ACK'?
  110 |  if (setsockopt(sock, SOL_NETLINK, NETLINK_EXT_ACK,
      |                                    ^~~~~~~~~~~~~~~
      |                                    NETLINK_CAP_ACK

Fixes:
 - http://autobuild.buildroot.org/results/c61678e56bd73609838747048f27068818c21150

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/bpftool/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/bpftool/Config.in b/package/bpftool/Config.in
index 39475aa962..e81d874343 100644
--- a/package/bpftool/Config.in
+++ b/package/bpftool/Config.in
@@ -5,14 +5,16 @@ config BR2_PACKAGE_BPFTOOL
 	depends on !BR2_STATIC_LIBS # elfutils
 	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils
 	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
 	select BR2_PACKAGE_BINUTILS
 	select BR2_PACKAGE_ELFUTILS
 	help
 	  bpftool is a tool for for inspection and simple manipulation
 	  of eBPF programs and maps.
 
-comment "bpftool needs a uClibc or glibc toolchain w/ wchar, dynamic library, threads"
+comment "bpftool needs a uClibc or glibc toolchain w/ wchar, dynamic library, threads, headers >= 4.12"
 	depends on !BR2_nios2
 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
 		|| !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
+		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC) \
+		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
