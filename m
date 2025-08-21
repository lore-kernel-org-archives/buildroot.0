Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84277CA0EEB
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 19:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E9C0617AD;
	Thu, 21 Aug 2025 19:20:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9UBEUiyj1xLF; Thu, 21 Aug 2025 19:20:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E983617B5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E983617B5;
	Thu, 21 Aug 2025 19:20:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AFA631C7
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D594616FA
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wnIh0gD2V1N3 for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 19:20:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5988F6148C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5988F6148C
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 544CA81373; Thu, 21 Aug 2025 19:20:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Aug 2025 10:53:06 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: c308939aafcebc6abe21e9f57175fcd7b21db0e3
X-Git-Newrev: 66c5fbb64ac91a6a43ec84d55abc1c88397a5590
X-Patchwork-Hint: ignore
Message-Id: <20250821192011.544CA81373@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/libtracefs: fix
 build failure due to missing NPTL
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

commit: https://git.buildroot.net/buildroot/commit/?id=66c5fbb64ac91a6a43ec84d55abc1c88397a5590
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

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
(cherry picked from commit 64fa978c5338500fbaa5ade8744f7d43cd918ee6)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
