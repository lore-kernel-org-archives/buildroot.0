Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCE0DC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:05:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1C3D60F93
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:05:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A1C3D60F93
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B55960875;
	Tue,  3 Aug 2021 23:05:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YKI3rTJclnkd; Tue,  3 Aug 2021 23:05:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C48BE606A5;
	Tue,  3 Aug 2021 23:05:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 33E8B1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:13:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 755B840658
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wFd3uJ6b2Bug for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D96F4062B
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A278885C5F; Tue,  3 Aug 2021 21:09:50 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 13 Jun 2021 11:57:47 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5123d665186ef77c8ce001b6718abecda4ef7250
X-Git-Newrev: ea02ac3e061b36da1bfc0277b1f84126cd96328f
X-Patchwork-Hint: ignore
Message-Id: <20210803210950.A278885C5F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/daemon: fix build
 without BR2_ENABLE_RUNTIME_DEBUG
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=ea02ac3e061b36da1bfc0277b1f84126cd96328f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Since commit 5a8c50fe05afa ("core: enable 'NDEBUG' unless
BR2_ENABLE_RUNTIME_DEBUG is set"), NDEBUG is defined in compile flags
when BR2_ENABLE_RUNTIME_DEBUG is not enabled. Add a patch to make the
daemon package build with NDEBUG as it should.

Fixes:
http://autobuild.buildroot.net/results/995ef1b5d9fce05881b2a41025916fa45b68a9bc/
http://autobuild.buildroot.net/results/98cd9fb348d6cfe676667205b1f79ec2cd1490de/
http://autobuild.buildroot.net/results/a7c51e6f59656d8c1e1c82a7129a670a68eb8a62/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0002-Fix-build-with-NDEBUG-defined.patch       | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/package/daemon/0002-Fix-build-with-NDEBUG-defined.patch b/package/daemon/0002-Fix-build-with-NDEBUG-defined.patch
new file mode 100644
index 0000000000..e99e9d8ed7
--- /dev/null
+++ b/package/daemon/0002-Fix-build-with-NDEBUG-defined.patch
@@ -0,0 +1,46 @@
+From fc84d8d572ffcecb533fd6d6d025abea12ce027e Mon Sep 17 00:00:00 2001
+Message-Id: <fc84d8d572ffcecb533fd6d6d025abea12ce027e.1622722814.git.baruch@tkos.co.il>
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Thu, 3 Jun 2021 15:01:10 +0300
+Subject: [PATCH] Fix build with NDEBUG defined
+
+Build with NDEBUG fails because the debug() macro becomes empty. This
+creates invalid syntax with the debug() call is the only statement in
+the body of a 'for' loop.
+
+This fixes build failures like:
+
+daemon.c: In function 'show':
+daemon.c:3607:2: error: expected expression before '}' token
+  }
+  ^
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: https://github.com/raforg/daemon/pull/3
+
+ libslack/err.h | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/libslack/err.h b/libslack/err.h
+index 106bdb01e074..7acfbe46d60a 100644
+--- a/libslack/err.h
++++ b/libslack/err.h
+@@ -40,10 +40,10 @@
+ #undef check
+ 
+ #ifdef NDEBUG
+-#define debug(args)
+-#define vdebug(args)
+-#define debugsys(args)
+-#define vdebugsys(args)
++#define debug(args) do {} while (0);
++#define vdebug(args) do {} while (0);
++#define debugsys(args) do {} while (0);
++#define vdebugsys(args) do {} while (0);
+ #define check(cond, mesg) (void_cast(0))
+ #else
+ #define debug(args) debugf args;
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
