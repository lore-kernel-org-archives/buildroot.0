Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B51C4345F
	for <buildroot@archiver.kernel.org>; Sun,  5 May 2024 13:14:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 942BA400F9;
	Sun,  5 May 2024 13:14:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DbMfZdc0zqbQ; Sun,  5 May 2024 13:14:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E5104027F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E5104027F;
	Sun,  5 May 2024 13:14:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CCF141BF31E
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 13:14:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B89344059B
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 13:14:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PXuB0POH2Zfw for <buildroot@lists.busybox.net>;
 Sun,  5 May 2024 13:14:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8338E4025F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8338E4025F
 for <buildroot@buildroot.org>; Sun,  5 May 2024 13:14:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D89C886659; Sun,  5 May 2024 13:14:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 5 May 2024 15:13:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4eeb69c9835450da8af8f55c776a7774914e2102
X-Git-Newrev: 826e0bc3360ac1daa3581232c52ee47697bfabc6
X-Patchwork-Hint: ignore
Message-Id: <20240505131446.D89C886659@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mdadm: do not hardcode -fpie
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

commit: https://git.buildroot.net/buildroot/commit/?id=826e0bc3360ac1daa3581232c52ee47697bfabc6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set LDLIBS to -ldl to remove -fpie and fix the following build failure
raised since bump to version 4.3 in commit
99e9ff08d0705279532ca0cf3de22ea54660cbdc and
https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=55a1150c7438afcb7756fccd49713ede20a58e4a:

/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/or1k-buildroot-linux-gnu/12.3.0/../../../../or1k-buildroot-linux-gnu/bin/ld: mdmon.o: non-pic relocation against symbol

Fixes: 99e9ff08d0705279532ca0cf3de22ea54660cbdc
 - http://autobuild.buildroot.org/results/827b714deeaf091b368d59791e4306b85a8f7f26

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mdadm/mdadm.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/mdadm/mdadm.mk b/package/mdadm/mdadm.mk
index c6178700ef..6de9467092 100644
--- a/package/mdadm/mdadm.mk
+++ b/package/mdadm/mdadm.mk
@@ -20,7 +20,8 @@ MDADM_BUILD_OPTS = \
 	CWFLAGS="" \
 	CXFLAGS="$(MDADM_CXFLAGS)" \
 	CPPFLAGS="$(TARGET_CPPFLAGS) -DBINDIR=\\\"/sbin\\\"" \
-	CHECK_RUN_DIR=0
+	CHECK_RUN_DIR=0 \
+	LDLIBS=-ldl
 
 MDADM_INSTALL_TARGET_OPTS = install-bin
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
