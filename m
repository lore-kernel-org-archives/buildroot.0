Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD674C4167B
	for <buildroot@archiver.kernel.org>; Tue, 28 Nov 2023 16:12:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5566441724;
	Tue, 28 Nov 2023 16:12:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5566441724
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5moLclXHeReV; Tue, 28 Nov 2023 16:12:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8FFC41736;
	Tue, 28 Nov 2023 16:11:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8FFC41736
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A849A1BF3F9
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 16:11:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F65E41734
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 16:11:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F65E41734
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s2v9uQj3zySD for <buildroot@lists.busybox.net>;
 Tue, 28 Nov 2023 16:11:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A355F4172A
 for <buildroot@buildroot.org>; Tue, 28 Nov 2023 16:11:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A355F4172A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8FFE18750D; Tue, 28 Nov 2023 16:11:56 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 28 Nov 2023 17:03:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1267a234fff8c5270d8ead5541167053771636b1
X-Git-Newrev: aa0f115bf7d1d6c63670115582b77af54a4a9653
X-Patchwork-Hint: ignore
Message-Id: <20231128161156.8FFE18750D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/janet: needs MMU
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

commit: https://git.buildroot.net/buildroot/commit/?id=aa0f115bf7d1d6c63670115582b77af54a4a9653
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

janet unconditionally uses fork since version 1.32.0 and
https://github.com/janet-lang/janet/commit/4b8c1ac2d2d5c13d7c8592fd6d94b34a6a8b3549
resulting in the following build failure since bump to version 1.32.1 in
commit c87abf01a9153a2b2fe6c046fa83c86db92d79a7:

janet.c:(.text+0x19bbc): undefined reference to `fork'

Fixes:
 - http://autobuild.buildroot.org/results/f0771fc6c9905d3a6d60ce245df585b3c6096f7f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/janet/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/janet/Config.in b/package/janet/Config.in
index 7b78c14bf4..bb4bf462aa 100644
--- a/package/janet/Config.in
+++ b/package/janet/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_JANET
 	bool "janet"
+	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h
 	help
 	  Janet is a functional and imperative programming language.
@@ -11,4 +12,5 @@ config BR2_PACKAGE_JANET
 	  https://janet-lang.org/
 
 comment "janet needs a toolchain w/ gcc >= 4.9"
+	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
