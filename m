Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B21ECCF2D4
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 10:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 528D581DFC;
	Mon, 19 Jan 2026 10:00:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WhvAZgo5H0bo; Mon, 19 Jan 2026 10:00:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29E4981DF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768816853;
	bh=iJkwnLH2bIPBXveRqVICRamu+C1BfZRR5T5gwbF25mY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KDkA9JMm8e5oWX766BBZQJ2Ot0IofrIv/VI62q6sncHMGaaYnlBOKs5MKb1u7aPIU
	 3kLmGHNBA8u7t/lKaVrd544xYd6F39AsN7L43N8cW10ARU93l2KzE9OQeXp55WIc5S
	 GLm1ODtXjxWM68oWOqfOolHzFx9TreUg6rqMbFwslU3G2APO8T36bIPz4qyrwIWVEU
	 B2jKJ7qQQwfipQQEW4kZtlEgqhmUO+FWNc+BxpnIbHYLwWyzSYPEG23Qhq5doO3UE3
	 Y5BCcy5Dojy2hIerDfCVzvylZ3DIcMQNbYaYfXO4ppLW+3SjlrduqqdtXX0ktzWipr
	 jOPM6BTpndRYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29E4981DF3;
	Mon, 19 Jan 2026 10:00:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 473F2160
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:00:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 546EA40CCF
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:00:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PcpCPTYQAuS1 for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 10:00:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93F8340CF3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 93F8340CF3
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:00:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 928BC885F0; Mon, 19 Jan 2026 10:00:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Jan 2026 09:16:32 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 52b62340618dd3c07ac50de7f0a2103e01d5a1a0
X-Git-Newrev: 8a6bf80827f48074af7074f4222180682556daa1
X-Patchwork-Hint: ignore
Message-Id: <20260119100040.928BC885F0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/rpcbind: fix
 build failure due to missing BR2_PACKAGE_LIBTIRPC_RPCDB
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8a6bf80827f48074af7074f4222180682556daa1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Package rpcbind requires libtirpc rpcdb option enabled. Package
libtirpc with commit [1] disabled rpcdb functions by default so let's
select it by default to enable rpcdb functions required.

[1]:
https://git.linux-nfs.org/?p=steved/libtirpc.git;a=commit;h=7cea8ad66aecc21e6caae330b5d31075af399193

Fixes:
https://autobuild.buildroot.org/results/f461212605d9d5f1c38a1ffe00a83912522bf482/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a2159c80b51a4f8606e382c180bdeca8f92e9705)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/rpcbind/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rpcbind/Config.in b/package/rpcbind/Config.in
index 9cde7bba39..ec8f8ee1b5 100644
--- a/package/rpcbind/Config.in
+++ b/package/rpcbind/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_RPCBIND
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libtirpc
 	depends on BR2_USE_MMU 	# fork()
 	select BR2_PACKAGE_LIBTIRPC
+	select BR2_PACKAGE_LIBTIRPC_RPCDB
 	help
 	  The rpcbind utility is a server that converts RPC program
 	  numbers into universal addresses.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
