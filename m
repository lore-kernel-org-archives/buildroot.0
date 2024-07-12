Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 259BAC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 20:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9AEA41604;
	Fri, 12 Jul 2024 20:17:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qpHCE0oqpSaU; Fri, 12 Jul 2024 20:17:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D01084187C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D01084187C;
	Fri, 12 Jul 2024 20:17:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8160B1BF995
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E2A74000B
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:17:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DM67x-yPnzbN for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 20:17:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DD37400C1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5DD37400C1
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 20:17:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 503F285CC6; Fri, 12 Jul 2024 20:17:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 22:12:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e6d5cdcd5b45d812a6f091e78b51212a46682c90
X-Git-Newrev: 77e945b003e1b401c0def36db403c937e4d604bb
X-Patchwork-Hint: ignore
Message-Id: <20240712201717.503F285CC6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/check: disable static build
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=77e945b003e1b401c0def36db403c937e4d604bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

check can't be built statically since switch to cmake in commit
6dfc789f4f21367bc5f4b5454db0922821a765bc:

/home/autobuild/autobuild/instance-2/output-1/host/lib/gcc/mipsel-buildroot-linux-uclibc/12.3.0/../../../../mipsel-buildroot-linux-uclibc/bin/ld: libcheck.so.0.15.2: hidden symbol `__fini_array_end' isn't defined

Fixes:
 - http://autobuild.buildroot.org/results/0d6/0d6fcbedef29bf0d6a1d9ecb8e4d82b4ad06cfa8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/check/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/check/Config.in b/package/check/Config.in
index 2312fbf81c..a3a7ff1f11 100644
--- a/package/check/Config.in
+++ b/package/check/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_CHECK
 	bool "check"
+	depends on !BR2_STATIC_LIBS
 	help
 	  Check is a unit testing framework for C.
 
 	  https://libcheck.github.io/check/
+
+comment "check needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
