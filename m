Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0178DC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 18:36:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 844474157F;
	Wed, 27 Jul 2022 18:36:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 844474157F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cnYEhYmAAZPm; Wed, 27 Jul 2022 18:36:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CB624155F;
	Wed, 27 Jul 2022 18:36:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CB624155F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C91071BF422
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 18:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A394E81D65
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 18:36:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A394E81D65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1FAWKeHIxVEr for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 18:36:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D96E281C58
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 18:36:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D96E281C58
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 433468671A; Wed, 27 Jul 2022 18:22:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 20:31:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d353d30deed97bf7953cda379315413ffbb70d89
X-Git-Newrev: d5c0eaef1f7c3b705cc1cf3087bd83ad9098aa2f
X-Patchwork-Hint: ignore
Message-Id: <20220727182255.433468671A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Makefile,
 toolchain-wrapper.c: disable ccache by default outside of Buildroot
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

commit: https://git.buildroot.net/buildroot/commit/?id=d5c0eaef1f7c3b705cc1cf3087bd83ad9098aa2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Until now, when BR2_CCACHE=y, ccache support was built into the
toolchain wrapper, and used regardless of whether the toolchain is
using during the Buildroot build itself, or later as part of the SDK.

However, having ccache support forcefully enabled in the SDK can
really be surprising, and is certainly unexpected for a
cross-compilation toolchain. This can be particularly surprising as
the ccache cache directory may be hardcoded in the ccache binary to
point to a folder that does not make sense on the SDK user's machine.

So what this commit does is create a BR2_USE_CCACHE variable, which
when set to 1 tells the toolchain wrapper to use ccache. Not defining
the variable, or specifying any other value that 1 causes the
toolchain wrapper to not use ccache. The main Buildroot Makefile is
modified to export BR2_USE_CCACHE = 1 when ccache support is enabled,
so that ccache is used during the Buildroot build.

However, when someone will use the SDK outside of Buildroot, the
toolchain wrapper will not use ccache.

The BR2_USE_CCACHE variable is only conditionally enabled in the main
Makefile (via ?=) so that it can be overridden in the environment if
one wants to quickly test disabling ccache in a ccache-enabled
Buildroot configuration. This is the scenario that was considered in
commit 792f1278e3fbc165086aebb8c07cfd18e10f374b ("toolchain-wrapper:
support change of BR2_CCACHE"), which added the BR_NO_CCACHE variable.

The BR_NO_CCACHE variable is no longer needed, and replaced by this
BR2_USE_CCACHE variable.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
[Thomas: almost entirely rework the implementation and commit log]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Makefile                      | 3 +--
 toolchain/toolchain-wrapper.c | 6 ++++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 4305c8c3dd..7d2081b98e 100644
--- a/Makefile
+++ b/Makefile
@@ -478,8 +478,7 @@ BR_CACHE_DIR ?= $(call qstrip,$(BR2_CCACHE_DIR))
 export BR_CACHE_DIR
 HOSTCC = $(CCACHE) $(HOSTCC_NOCCACHE)
 HOSTCXX = $(CCACHE) $(HOSTCXX_NOCCACHE)
-else
-export BR_NO_CCACHE
+export BR2_USE_CCACHE ?= 1
 endif
 
 # Scripts in support/ or post-build scripts may need to reference
diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 0fb6064b1c..37b24dd24a 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -507,8 +507,10 @@ int main(int argc, char **argv)
 
 	exec_args = args;
 #ifdef BR_CCACHE
-	if (getenv("BR_NO_CCACHE"))
-		/* Skip the ccache call */
+	/* If BR2_USE_CCACHE is not defined, or its value is not 1,
+	 * skip the ccache call */
+	char *br_use_ccache = getenv("BR2_USE_CCACHE");
+	if (!br_use_ccache || strncmp(br_use_ccache, "1", strlen("1")))
 		exec_args++;
 #endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
