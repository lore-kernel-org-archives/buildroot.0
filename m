Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4561C79F99
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 13:00:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6657960609;
	Sun,  6 Sep 2026 13:00:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d2K_aOMlUR87; Sun,  6 Sep 2026 13:00:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 736766060C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788699601;
	b=PZ6iTHCgSAdTKtQ6haabhn619jf8rFAOs/5L5wBmSohFfauyfvfyibR0zVutTKdM4Dj9
	 sWGLtJCxXmPVTX24xjO042qLoxOkw31A18CfCe7h/KK5iMBu7D70y1HzNZ1FeOoz4W53a
	 8wAz+NgUBNJlNeoWSxDuZlJXrfu9vtv+erPJqpxnjusrfo1RNNAglggjwEL3Phbyfa/+k
	 ghc5c/gIB2ig0ri/9+Fd5uF3A0bHhIM4EzPvtf+zbOOjhOyg8fmhreJqoeVs9KMWCv5YD
	 SxIiALUcUwPQUO2XvN6yH/cl40njCgjqbzLS63Db/7d7D1mDMXnI0iUoupAzlZ2XAyg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788699601;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=PiQonvnMsivMimWY0I52/9hiiNiN/8Mcr5ZI8mo5Ilw=;
	b=qsEgbvudXjAQvnFHldBPZ3qDrV0jb8BqTNXHwWtr9I70JrR+drdhJQCbonWigiIUuQuK
	 H+LNtpAor6SXaA2+58MTrKDKom23vy+3HyyGmPBYJ+UIgVoQhRRbp9QpnnBvy71wtV2rb
	 x+qHlqHMzQFh/LrXSUS9/sKJBSDlSjqE9mfFJcAfp06do/2fNmdsUWngo8liUzwnXypHf
	 T3fh+WPVKDfoKYbIp3gvRRgSm2IQs9n9UQVcz/rYddG+yjcjlWpBK/L8eNOyUDnvR22hI
	 8LjMF8bQM0gJbUJtL5IkSTWIZk3zinugl6LnLQf+Qbn9f2Fn84ugg05JxWZFVJ2CAyQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788699601;
	bh=PiQonvnMsivMimWY0I52/9hiiNiN/8Mcr5ZI8mo5Ilw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gVppjSWDksUaHRla3pNAcxoD3YcnUMZGwgKf7XzReriZKiVQ14s2DAu+cPgVM8XlZ
	 crPcjJXsuYaaGxzvYWdhMrxQbnE3ML8wptyBuvVmL/Cn5PUI7DHejkwdfVXRNyEizu
	 /gXQoaNmOD6kG37OG1Ff1FXTky5LGoM9ShNo13UciN0GwZ4/40IFjY8AXnKsyqr/x0
	 4wVPq/W095iuvmTLzuPHb8tVrZmTBmoo1VgLwvLGpPYE3bfHFCf9ZRl7NqNEMR1K/U
	 hQsJwWY7SzknddybnO14zWgn6pJdLVsqSAr9D+UvFPieBz1RCtYE3ge1yHbmi/waEK
	 rCF+nx0Zla98g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 736766060C;
	Sun,  6 Sep 2026 13:00:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 24D522C7
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 13:00:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B08F4006B
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 13:00:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KIQKGGqTgaOi for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 12:59:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 511B640068
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788699599;
 b=WFACaMXFuIxCFCYXcdVkA5/NtyQqyDrV+nZVB5o/7a9dsDXY8rwg8JQnnPx5Xv9maHzs
 5sbKZ6nSte7DD1V+MNx75eIYkfXYxy4TpshRbwMBCQbjs3+O7H7Q4N5LoHPeNifWl/TOO
 RHT6VFGcEXRZQbS32SdnGtCygDYH0EOeJ0Pj2QIjHsQxTfunMsR5o0jsUfOJ1gYox3BAp
 XbegVOn4Bp+Zmjz2eF2ka5uFAmLdYmq/G2VKOYFPpMWAf1a4Mbd+bxWENK/VnQwdd2p0N
 +Amxrrv83/ccNP0ZMouUZWWZm5cHbnr0GBkgQ3/GFpdtn7vqJ6Uz0/cmDfcOTtmP1wQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788699599;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=48EHK9pO35F/TI/Vi4WMidWpC/LnnxFlBprbwACbOlo=;
 b=JGrvJrVnJS6p61Ii4SO6YyvP0B6TWe4b+jYaWN8VTeOrD322h6JNzMiTI7jJNKZRhgJ9
 PAB23LJSOFZgL1UNCgFTN5V3Of7oZysAFuwq2n5gqtx6l2P1XmRwIL8/1JBTN+KKuYq6H
 /+Nmav4fkX/6aeE6SiNDvkdXsPxzQg8Q2A5GbXClV3puSivw7zvF9qhdXT//zvLTIMJuT
 Cx5+fqmimtutM1Scady+D2S+hIYyoKhOIfDEI8aJ8MM6C+LrLgbpx5apOvoZd36+zlX7h
 1wte5UMjNNK9SKSsDxhE0ibfEfoI0rhK2J8BFPholiyYlywCeHBaEdHde/SZ7Urpi0Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 511B640068
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 12:59:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BDA9295438; Sun,  6 Sep 2026 12:58:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Sep 2026 14:51:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a07a17d00ebf2a3fdf8bc8531c1716f74d18e456
X-Git-Newrev: d0718179694b407cb93f1603cdf845997dac7345
X-Patchwork-Hint: ignore
Message-Id: <20260906125857.BDA9295438@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/igh-ethercat: remove stale patch
 0002
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d0718179694b407cb93f1603cdf845997dac7345
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

igh-ethercat is failing while attempting to apply patches,
with error:

    Applying 0002-Linux-6.19.0-support.patch using patch:
    patching file devices/generic.c
    Reversed (or previously applied) patch detected!  Skipping patch.
    1 out of 1 hunk ignored -- saving rejects to file devices/generic.c.rej

The package patch 0002 was added in [1] in branch "master" while it
was in release client cycle. It was cherry-picked in [2] in branch
"next" to apply the bump [3] (which removes the package patches 0001
and 0002). When the branch "next" was merged in "master" in commit [4],
the patch 0002 was kept.

This commit removes this stale patch.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/e4cf512c394f218cc71eb6b496ce4cb004c917bb
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/8a5fc970b48a432f5df3be1f1e7667095e712b3d
[3] https://gitlab.com/buildroot.org/buildroot/-/commit/0a91e760f467a90b0f0acf00ec76aac011b241f1
[4] https://gitlab.com/buildroot.org/buildroot/-/commit/5f2687795595c9af579312c1d504373ece56f43f

Fixes:
- https://autobuild.buildroot.org/results/4f509f1f788c1b8dc5a840ffa2e435c5ed7b6eea/

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../igh-ethercat/0002-Linux-6.19.0-support.patch   | 36 ----------------------
 1 file changed, 36 deletions(-)

diff --git a/package/igh-ethercat/0002-Linux-6.19.0-support.patch b/package/igh-ethercat/0002-Linux-6.19.0-support.patch
deleted file mode 100644
index 6a6af5508c..0000000000
--- a/package/igh-ethercat/0002-Linux-6.19.0-support.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 2c947e90d93d9c5a0129b62744de9720b48d2a17 Mon Sep 17 00:00:00 2001
-From: Nicola Fontana <ntd@entidi.it>
-Date: Sun, 8 Mar 2026 15:39:41 +0100
-Subject: [PATCH] Linux 6.19.0 support
-
-Commit 89aec171d9d1ab168e43fcf9754b82e4c0aef9b9 (part of linux kernel
-6.19.0-rc1) introduced an arbitrarily sized sockaddr struct to be used
-instead of the classical one.
-
-Closes #200
-
-Upstream: https://gitlab.com/etherlab.org/ethercat/-/commit/c42c9cf8bc31c56cc20ae630605495e3f19f3f9a
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- devices/generic.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/devices/generic.c b/devices/generic.c
-index f6cef9b5..a08af54b 100644
---- a/devices/generic.c
-+++ b/devices/generic.c
-@@ -234,7 +234,11 @@ int ec_gen_device_create_socket(
-     sa.sll_family = AF_PACKET;
-     sa.sll_protocol = htons(ETH_P_ETHERCAT);
-     sa.sll_ifindex = desc->ifindex;
-+#if LINUX_VERSION_CODE >= KERNEL_VERSION(6, 19, 0)
-+    ret = kernel_bind(dev->socket, (struct sockaddr_unsized *) &sa, sizeof(sa));
-+#else
-     ret = kernel_bind(dev->socket, (struct sockaddr *) &sa, sizeof(sa));
-+#endif
-     if (ret) {
-         printk(KERN_ERR PFX "Failed to bind() socket to interface"
-                 " (ret = %i).\n", ret);
--- 
-2.55.0
-
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
