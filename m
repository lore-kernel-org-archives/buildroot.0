Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C269DCF31BA
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 20:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FAF581414;
	Wed,  2 Oct 2024 20:35:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id llVV8RqdOCSy; Wed,  2 Oct 2024 20:35:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A89BC81F71
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A89BC81F71;
	Wed,  2 Oct 2024 20:35:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DE6BE1BF282
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 20:35:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9EF140C7F
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 20:35:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qt9yYr9Q4RlZ for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 20:35:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6808407DE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6808407DE
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 20:35:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C256F84701; Wed,  2 Oct 2024 20:35:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 2 Oct 2024 22:34:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4e8d8d2345ea121b1e9d228603ece1142c9bb82f
X-Git-Newrev: 78e494e23908da964da3632735784dbc6b857947
X-Patchwork-Hint: ignore
Message-Id: <20241002203511.C256F84701@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uclibc: enable NPTL on no-MMU ARM
 w/ FDPIC
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=78e494e23908da964da3632735784dbc6b857947
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

NPTL is supported on no-MMU ARM systems if FDPIC binaries are used.

Signed-off-by: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/uclibc/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 73ddd5ef58..4c360809c3 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -78,7 +78,7 @@ choice
 
 config BR2_PTHREADS_NATIVE
 	bool "Native POSIX Threading (NPTL)"
-	depends on BR2_USE_MMU
+	depends on BR2_USE_MMU || ((BR2_arm || BR2_armeb) && BR2_BINFMT_FDPIC)
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
