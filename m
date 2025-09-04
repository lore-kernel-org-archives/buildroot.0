Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDCBCCA1002
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:34:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8F9160854;
	Thu,  4 Sep 2025 16:34:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vtw7RTS_bM3z; Thu,  4 Sep 2025 16:34:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DE7D607E6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DE7D607E6;
	Thu,  4 Sep 2025 16:34:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F13D4106
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13CED4007B
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FjCh-wr8J_1B for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:33:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F898400AE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F898400AE
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7DD7487EEF; Thu,  4 Sep 2025 16:33:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 14:19:31 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 631bda1a189c52cdf75708b86429f29f126785af
X-Git-Newrev: 14955d287355d11774212329236ca0e02e6fd72f
X-Patchwork-Hint: ignore
Message-Id: <20250904163336.7DD7487EEF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/vde2: fix build
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

commit: https://git.buildroot.net/buildroot/commit/?id=14955d287355d11774212329236ca0e02e6fd72f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

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
