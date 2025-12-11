Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF68D43342
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:28:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6FFA8272C;
	Thu, 11 Dec 2025 19:28:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IeCJiZHG4QNO; Thu, 11 Dec 2025 19:28:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23F1881604
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481290;
	bh=ScPBHXcQn8L/bwXVk6+z0lPRJpWlwW317tqlwY/J2OA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qaZ5Q4Hcfdhqc0Pm8T/gZ5TLu+EQ8JdheplwQuxPlxidnOLqit0hzxL3Umn687A65
	 4159jqwLxgH7xsoAke7dNb/8+K51iiD7TTnATEi0Ge8pRxCsltadd3MR7fyRpbl3dL
	 1aloVaICpnZRMMzKm34uFp5E8OkB9uqvH7t7By/uxbeBrHFzFgE0OGi7VkxZ7yCWPQ
	 N01TAYsD/RWSC8IFB6sFHxq5gSS7aIkXtD5jMAoRRz8mFMEFaOQzlOZ74hcOz2LyJW
	 A5VTUWwHjHjcSbpxKZ1xuqCX+kd20QXBIA4zUVqDEfQ0tNKg2xm51v2Y0ysc9kSayB
	 +IIi6AEve9lbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23F1881604;
	Thu, 11 Dec 2025 19:28:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8049AE7
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:27:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5143340073
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:27:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h1F_95gHjKMn for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:27:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 201C2400C4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 201C2400C4
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:27:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1FAD086B47; Thu, 11 Dec 2025 19:27:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 10:22:12 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: afdebefb0bb144df34af1b19c66a2dfb19fdfb81
X-Git-Newrev: bf19b074ec46d1d55a2ba8807d7a75b597b73a5a
X-Patchwork-Hint: ignore
Message-Id: <20251211192747.1FAD086B47@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/glibc: use
 DESTDIR instead of install_root to fix build issue
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

commit: https://git.buildroot.net/buildroot/commit/?id=bf19b074ec46d1d55a2ba8807d7a75b597b73a5a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Building a simple configuration such as:

BR2_aarch64=y
BR2_FORCE_HOST_BUILD=y

Under our reference Docker container, as an out-of-tree build:

./utils/docker-run make O=output-test

will fail during the glibc staging installation step with:

/usr/bin/install -c -m 644 /home/thomas/buildroot/br/output-glibc/build/glibc-2.42-3-gbc13db73937730401d592b33092db6df806d193e/build/libc.a /usr/lib64/libc.a
/usr/bin/install: cannot create regular file '/usr/lib64/libc.a': Permission denied

The problem being that the install_root variable is for some reason
lost along the way. We definitely pass it during the staging
installation step, but then glibc calls a sub-make and in that
submake, install_root is empty.

Observations:

- Building the same configuration inside the Docker container, but
  in-tree, doesn't exhibit the problem.

- Building outside of the Docker container, but with the same make
  version as the one we build due to BR2_FORCE_HOST_BUILD=y doesn't
  exhibit the problem.

However, it turns out that glibc sets install_root to $(DESTDIR). And
passing DESTDIR just works. So we drop our custom
GLIBC_INSTALL_STAGING_OPTS to rely on the default one, and this fixes
the problem. It's not extremely satisfying to not fully understand
what's going on, but after spending quite some time on this, and
having a trivial and actually pretty nice workaround, we simply
propose to use this solution.

There is no autobuilder issue as we're not using our Docker container
to do autobuild builds.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 3ce3e04d02aa6b8f1841b6faafa14260085fc350)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/glibc/glibc.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 239e39a2ba..4a41665f81 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -60,8 +60,6 @@ GLIBC_SUBDIR = build
 
 GLIBC_INSTALL_STAGING = YES
 
-GLIBC_INSTALL_STAGING_OPTS = install_root=$(STAGING_DIR) install
-
 # Thumb build is broken, build in ARM mode
 ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
 GLIBC_EXTRA_CFLAGS += -marm
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
