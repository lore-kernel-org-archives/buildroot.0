Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F082C77B7A
	for <buildroot@archiver.kernel.org>; Wed, 24 May 2023 19:16:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFCBF83FF8;
	Wed, 24 May 2023 19:16:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFCBF83FF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OTh1PJRburIF; Wed, 24 May 2023 19:16:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03EDF83051;
	Wed, 24 May 2023 19:16:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03EDF83051
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 263391BF2F9
 for <buildroot@lists.busybox.net>; Wed, 24 May 2023 19:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9D6A41788
 for <buildroot@lists.busybox.net>; Wed, 24 May 2023 19:16:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9D6A41788
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0282YSdTgRSZ for <buildroot@lists.busybox.net>;
 Wed, 24 May 2023 19:16:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2008841C4B
 for <buildroot@buildroot.org>; Wed, 24 May 2023 19:16:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2008841C4B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 09306868B3; Wed, 24 May 2023 19:16:09 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 24 May 2023 21:07:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f0795bd104248c5d5af71769e4b657dc9fd3ade8
X-Git-Newrev: ddcefbcfd81b104f881a0194be69f013722ba852
X-Patchwork-Hint: ignore
Message-Id: <20230524191609.09306868B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmnl: fix build failure
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

commit: https://git.buildroot.net/buildroot/commit/?id=ddcefbcfd81b104f881a0194be69f013722ba852
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The rtnl-link-can application requires kernel headers of at least
version 4.11. Since the `make check` command compiles all examples, their
compilation is enabled only if the condition regarding the kernel headers
is satisfied.

Fixes:
- http://autobuild.buildroot.net/results/36c1619c8b02efeaf9caebae8bb5c3eb8a26238b/
- http://autobuild.buildroot.net/results/15f6dc103eec7bdeb5020acbc0ae99dc97c00e4e/

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libmnl/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libmnl/Config.in b/package/libmnl/Config.in
index b4a4195751..434778bf55 100644
--- a/package/libmnl/Config.in
+++ b/package/libmnl/Config.in
@@ -10,7 +10,11 @@ if BR2_PACKAGE_LIBMNL
 
 config BR2_PACKAGE_LIBMNL_EXAMPLES
 	bool "install examples"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11
 	help
 	  Install binary examples.
 
+comment "examples needs a toolchain w/ headers >= 4.11"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11
+
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
