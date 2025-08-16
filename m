Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEAC9CA0EE9
	for <buildroot@archiver.kernel.org>; Sat, 16 Aug 2025 20:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C9E7813D7;
	Sat, 16 Aug 2025 20:05:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HQk_1s9HThjD; Sat, 16 Aug 2025 20:05:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB8D281360
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB8D281360;
	Sat, 16 Aug 2025 20:05:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A223C196
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 20:05:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88E2681360
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 20:05:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TXSxyHdZV96c for <buildroot@buildroot.org>;
 Sat, 16 Aug 2025 20:05:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF4AB81357
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF4AB81357
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 20:05:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AA55B8762C; Sat, 16 Aug 2025 20:05:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 16 Aug 2025 21:57:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c73243468fbf65b815f39fdf95068f2d49fad6ac
X-Git-Newrev: 64fa978c5338500fbaa5ade8744f7d43cd918ee6
X-Patchwork-Hint: ignore
Message-Id: <20250816200515.AA55B8762C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libtracefs: fix build failure due
 to missing NPTL
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=64fa978c5338500fbaa5ade8744f7d43cd918ee6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With commit:
https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git/commit/?id=31acfe1747b273e147f864b5a62a4e39197ca1a2
package libtracefs utest started to use pthread_barrier_() functions and
this lead to build failure when we build without NPTL. Since utest is
not needed on the target we can avoid to build it, so let's disable it.

Fixes: 117ece4835 ("package/libtracefs: bump to version 1.8.0")
Fixes:
https://autobuild.buildroot.net/results/69b/69b75908bebdf9382a4cd9b138fcaf1e34daba09//

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libtracefs/libtracefs.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libtracefs/libtracefs.mk b/package/libtracefs/libtracefs.mk
index d24763fa7d..6b8f838c2e 100644
--- a/package/libtracefs/libtracefs.mk
+++ b/package/libtracefs/libtracefs.mk
@@ -14,6 +14,7 @@ LIBTRACEFS_DEPENDENCIES = host-bison host-flex host-pkgconf libtraceevent
 
 LIBTRACEFS_CONF_OPTS = \
 	-Ddoc=false \
-	-Dsamples=false
+	-Dsamples=false \
+	-Dutest=false
 
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
