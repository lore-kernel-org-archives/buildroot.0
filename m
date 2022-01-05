Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93DEBC433EF
	for <buildroot@archiver.kernel.org>; Wed,  5 Jan 2022 21:01:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1837340A08;
	Wed,  5 Jan 2022 21:01:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i2OMxTuefhjL; Wed,  5 Jan 2022 21:01:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29BA3409D2;
	Wed,  5 Jan 2022 21:01:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 292691BF955
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 21:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16468428D1
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 21:00:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q9lLtDcm_wyW for <buildroot@lists.busybox.net>;
 Wed,  5 Jan 2022 21:00:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4AFCA428CD
 for <buildroot@buildroot.org>; Wed,  5 Jan 2022 21:00:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 1F557832DA; Wed,  5 Jan 2022 20:54:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 5 Jan 2022 21:59:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1a087dd17fcfb7df2053cde6286803d6ae326c14
X-Git-Newrev: 8c0b521987f929ce88ae97ee2bf6f923311061a7
X-Patchwork-Hint: ignore
Message-Id: <20220105205428.1F557832DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/checkpolicy: add host gcc >= 5
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=8c0b521987f929ce88ae97ee2bf6f923311061a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 56d9b887685c86fd4fbadda247cdbe733d499e81 forgot to add host
gcc >= 5 dependency

Fixes:
 - http://autobuild.buildroot.org/results/fc727efc0c658aaae55c83632a91af83701f0c49

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/checkpolicy/Config.in.host | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/checkpolicy/Config.in.host b/package/checkpolicy/Config.in.host
index 240a5b6dc4..38e35e2fc1 100644
--- a/package/checkpolicy/Config.in.host
+++ b/package/checkpolicy/Config.in.host
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_HOST_CHECKPOLICY
 	bool "host checkpolicy"
+	depends on BR2_HOST_GCC_AT_LEAST_5 # host-libselinux -> host-libsepol
 	help
 	  checkpolicy is the SELinux policy compiler. It uses libsepol
 	  to generate the binary policy. checkpolicy uses the static
@@ -8,3 +9,6 @@ config BR2_PACKAGE_HOST_CHECKPOLICY
 	  shared library interface.
 
 	  http://selinuxproject.org/page/Main_Page
+
+comment "host checkpolicy needs a toolchain w/ host gcc >= 5"
+	depends on !BR2_HOST_GCC_AT_LEAST_5
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
