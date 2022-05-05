Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D2DEC433F5
	for <buildroot@archiver.kernel.org>; Thu,  5 May 2022 21:22:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDC1581414;
	Thu,  5 May 2022 21:22:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k24TWNXVEKuq; Thu,  5 May 2022 21:22:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EDA2813FC;
	Thu,  5 May 2022 21:22:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 51E6C1BF308
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 21:22:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4053641299
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 21:22:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jZl_0qkjHlcW for <buildroot@lists.busybox.net>;
 Thu,  5 May 2022 21:22:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2647840913
 for <buildroot@buildroot.org>; Thu,  5 May 2022 21:22:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 2AE4D85BF7; Thu,  5 May 2022 21:11:39 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 5 May 2022 23:11:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8c4b55053e093bfaa88d93a9e3ad0ca241679bcd
X-Git-Newrev: 227d7e0cbaaf093f509f5728f06fad5f53caed7b
X-Patchwork-Hint: ignore
Message-Id: <20220505211139.2AE4D85BF7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ninja: add make jobserver support
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=227d7e0cbaaf093f509f5728f06fad5f53caed7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to the Kitware(cmake maintainer) fork of ninja with make
jobserver support.

This fork has tagged releases based on upstream release tags with
jobserver support added.

It is sad that we need to switch to a fork to get this feature, but
upstream is fighting it over philosophical issues, even though dozens of
people request the feature and a PR for it has existed since 6 years
[1].

[1] https://github.com/ninja-build/ninja/issues/1139

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/ninja/ninja.hash | 2 +-
 package/ninja/ninja.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/ninja/ninja.hash b/package/ninja/ninja.hash
index fd2c594a77..ecde199844 100644
--- a/package/ninja/ninja.hash
+++ b/package/ninja/ninja.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  ce35865411f0490368a8fc383f29071de6690cbadc27704734978221f25e2bed  ninja-1.10.2.tar.gz
+sha256  549c31ee596566b952c600e23eb9b8d39a4112cd5fdeb2e5a83370669176da40  ninja-1.10.2.g51db2.kitware.jobserver-1.tar.gz
 sha256  eb7e9ab9690124c5c9f42bdc81383d886a3dede26345b6ed15bbad7caf81f7ea  COPYING
diff --git a/package/ninja/ninja.mk b/package/ninja/ninja.mk
index ab1941023e..bc84046414 100644
--- a/package/ninja/ninja.mk
+++ b/package/ninja/ninja.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-NINJA_VERSION = 1.10.2
-NINJA_SITE = $(call github,ninja-build,ninja,v$(NINJA_VERSION))
+NINJA_VERSION_MAJOR = 1.10.2
+NINJA_VERSION = $(NINJA_VERSION_MAJOR).g51db2.kitware.jobserver-1
+NINJA_SITE = $(call github,Kitware,ninja,v$(NINJA_VERSION))
 NINJA_LICENSE = Apache-2.0
 NINJA_LICENSE_FILES = COPYING
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
