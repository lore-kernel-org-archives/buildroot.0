Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C07CA101F
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:15:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4057F80883;
	Thu,  4 Sep 2025 16:15:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZTf0BJuiGgsW; Thu,  4 Sep 2025 16:15:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1067E8087F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1067E8087F;
	Thu,  4 Sep 2025 16:15:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A12C106
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:14:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6144E8079C
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:13:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4pvoF7i3hXmK for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:13:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8E418079D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8E418079D
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:13:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B740987F46; Thu,  4 Sep 2025 16:13:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 13:57:24 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0f0fe331ff9ba6891e07e1c4da3751eeb7c20b8a
X-Git-Newrev: 9c5aeac0c41a8b4d611ddc115c3782504846f484
X-Patchwork-Hint: ignore
Message-Id: <20250904161349.B740987F46@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/vde2: fix build
 w/ gcc-15
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9c5aeac0c41a8b4d611ddc115c3782504846f484
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Fixes: https://autobuild.buildroot.net/results/8d14173f31922a737c326be75aa24c9f9471342a/

The vde2 source code uses empty argument function pointer prototypes like:

typedef ssize_t (* ssize_fun)();
extern ssize_fun vdehist_vderead;

In C17 and earlier, such prototypes means unknown number of arguments,
whereas with C23 it means no arguments, leading to build failures:

libvdehist.c:39:27: error: initialization of 'ssize_fun' {aka 'long int
  (*)(void)'} from incompatible pointer type 'ssize_t (*)(int,  void *,
  size_t)' {aka 'long int (*)(int,  void *, long unsigned int)'}
  [-Wincompatible-pointer-types]

Workaround it using -std=gnu99.  Vde2 is provided both as a host and target
package, so do this unconditionally for both.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 2218f0215557278cf9b9810960eca019f33fcfe7)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/vde2/vde2.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/vde2/vde2.mk b/package/vde2/vde2.mk
index ab4c32143d..7c7fbfca9c 100644
--- a/package/vde2/vde2.mk
+++ b/package/vde2/vde2.mk
@@ -38,5 +38,10 @@ HOST_VDE2_CONF_OPTS = \
 	--disable-profile \
 	--enable-tuntap
 
+# C23 changes meaning of empty argument prototypes like int (*)()
+# causing build failures, so force gnu99
+VDE2_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
+HOST_VDE2_CONF_ENV = CFLAGS="$(HOST_CFLAGS) -std=gnu99"
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
