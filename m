Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02870C5478C
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 11:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A08D8820BC;
	Mon,  4 Mar 2024 11:47:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iC6_comoGv1a; Mon,  4 Mar 2024 11:47:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5CD5820EF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5CD5820EF;
	Mon,  4 Mar 2024 11:47:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9C0821BF2F3
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 11:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8980B408DF
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 11:47:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H9hsyvau7GAV for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 11:47:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF1B54071B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF1B54071B
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 11:47:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8EFA688036; Mon,  4 Mar 2024 11:47:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Mar 2024 12:47:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 077741623fcd5372a43dd78719f859c479815901
X-Git-Newrev: 8035ea0a712eaa16d2ac96cd29db0e8726b0f685
X-Patchwork-Hint: ignore
Message-Id: <20240304114725.8EFA688036@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/shadow: disable on uclibc
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

commit: https://git.buildroot.net/buildroot/commit/?id=8035ea0a712eaa16d2ac96cd29db0e8726b0f685
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

shadow unconditionally uses reallocarray and explicit_bzero
since bump to version 4.14.3 in commit
8a01774d9897310c00a0945865f5a6d5167dfca3 and
https://github.com/shadow-maint/shadow/commit/1aa22c14674e14e84efa171614dea2b515d5a223
https://github.com/shadow-maint/shadow/commit/0e0a310acf5111251589116343897a63ebc88e7a
resulting in the following uclibc build failure:

/home/autobuild/autobuild/instance-9/output-1/host/lib/gcc/arc-buildroot-linux-uclibc/13.1.1/../../../../arc-buildroot-linux-uclibc/bin/ld: groups.o: in function `main':
groups.c:(.text.startup+0x20): undefined reference to `reallocarray'

Fixes:
 - http://autobuild.buildroot.org/results/98be07d299aa383a447a1f1dd2924a00c1a29a34

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Peter: add a comment about what functions are missing, reallocf reference]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/shadow/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/shadow/Config.in b/package/shadow/Config.in
index 230271af7d..b08b06457b 100644
--- a/package/shadow/Config.in
+++ b/package/shadow/Config.in
@@ -2,6 +2,7 @@ menuconfig BR2_PACKAGE_SHADOW
 	bool "shadow"
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # reallocarray, explicit_bzero
 	help
 	  Utilities to deal with user accounts.
 
@@ -55,5 +56,6 @@ config BR2_PACKAGE_SHADOW_YESCRYPT
 
 endif # BR2_PACKAGE_SHADOW
 
-comment "shadow needs a toolchain w/ headers >= 4.14, dynamic library"
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 || BR2_STATIC_LIBS
+comment "shadow needs a glibc or musl toolchain w/ headers >= 4.14, dynamic library"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 || \
+		BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_UCLIBC
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
