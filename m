Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3572CA0FF9
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 17:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A6CC81B8A;
	Fri, 29 Aug 2025 17:54:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bZbJIgbp8Zkh; Fri, 29 Aug 2025 17:54:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8951081D3A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8951081D3A;
	Fri, 29 Aug 2025 17:54:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 595691F4
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 17:54:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 499F384310
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 17:54:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3VCmlf2WdQEG for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 17:54:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80ABC81DFD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80ABC81DFD
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 17:54:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6F85487E41; Fri, 29 Aug 2025 17:54:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 19:35:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 08a1e10fbe7538d8775196ae680df002c0271854
X-Git-Newrev: 2218f0215557278cf9b9810960eca019f33fcfe7
X-Patchwork-Hint: ignore
Message-Id: <20250829175420.6F85487E41@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vde2: fix build w/ gcc-15
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2218f0215557278cf9b9810960eca019f33fcfe7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
