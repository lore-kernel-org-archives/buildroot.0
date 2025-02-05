Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E07BEC02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 12:04:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACC5E40603;
	Wed,  5 Feb 2025 12:04:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YkTZKGk1WH8g; Wed,  5 Feb 2025 12:04:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79B754062C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79B754062C;
	Wed,  5 Feb 2025 12:04:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1507112F
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 12:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 049BE409BD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 12:04:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sCibs7qEmFHQ for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 12:04:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB19A405A5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB19A405A5
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 12:04:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D3DCA86F04; Wed,  5 Feb 2025 12:04:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Feb 2025 13:02:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 38090cdbb610e60015c288e80b1aaedc3d052af4
X-Git-Newrev: 868f2dd1832bd601556108def162c089e19cd5f7
X-Patchwork-Hint: ignore
Message-Id: <20250205120408.D3DCA86F04@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/swipl: fix build without C++
 compiler
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

commit: https://git.buildroot.net/buildroot/commit/?id=868f2dd1832bd601556108def162c089e19cd5f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/b24a96b999676990995a466686fe1eacf6cddfef

Some of the optional packages in swipl are written in C++, so CMake thinks a
C++ compiler is needed even though we build with -DSWIPL_PACKAGES=OFF since
the bump to 9.2.6 in commit 33d45b9c672df0 ("package/swipl: bump version to
9.2.6").

Add -DCMAKE_CXX_COMPILER=true to satisfy this check even in setups without
C++:

-- Check for working CXX compiler: /usr/bin/true
-- Check for working CXX compiler: /usr/bin/true - works

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/swipl/swipl.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/swipl/swipl.mk b/package/swipl/swipl.mk
index ef9aedcd2d..e29b8d8f46 100644
--- a/package/swipl/swipl.mk
+++ b/package/swipl/swipl.mk
@@ -36,7 +36,8 @@ SWIPL_CONF_OPTS = \
 	-DQSORT_R_GNU=1 \
 	-DSWIPL_NATIVE_FRIEND=$(HOST_SWIPL_SRCDIR) \
 	-DSWIPL_PACKAGES=OFF \
-	-DUSE_TCMALLOC=OFF
+	-DUSE_TCMALLOC=OFF \
+	-DCMAKE_CXX_COMPILER=true
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 SWIPL_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
