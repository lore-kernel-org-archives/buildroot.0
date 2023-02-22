Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28222C636D6
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 16:36:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3FFC416F7;
	Wed, 22 Feb 2023 16:36:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3FFC416F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wU5uLvXsTRsJ; Wed, 22 Feb 2023 16:36:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F0C2541718;
	Wed, 22 Feb 2023 16:36:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0C2541718
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E363D1BF847
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 16:35:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BBA074198A
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 16:35:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBA074198A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oTIZjXU-8p_E for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 16:35:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B7604196A
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 16:35:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B7604196A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 89130867D1; Wed, 22 Feb 2023 16:35:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 17:31:16 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: a3fd22e80cdf15465cf2297e8a1817ea79e638fb
X-Git-Newrev: 2759b8a3081e806c10b3c2ff7f04efcdef8a8212
X-Patchwork-Hint: ignore
Message-Id: <20230222163531.89130867D1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] Makefile: fix build when
 $(O) ends in _defconfig
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

commit: https://git.buildroot.net/buildroot/commit/?id=2759b8a3081e806c10b3c2ff7f04efcdef8a8212
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Commit e6195c53041f (Makefile: fix use of many br2-external trees) fixed
a slowdown with many br2-external trees. In doing so, it changed the
type of the %_defconfig rule: the stem is no longer present in the
prerequisites, so it changes from a pattern rule to an implicit pattern
rule [0].

It is not unusual to name the build directory after the defconfig that
is being built, so we may end up with a build directory named
meh_defconfig. Before e6195c53041f, the pattern rule would not match
[1], but now it does, which causes somewhat-cryptic build failures:

    Makefile:1015: *** "Can't find /some/path/meh_defconfig".  Stop.

The issue is that we have this set of rules and assignments (elided and
reordered for legibility):

    all: world
    world: target-post-image
    target-post-image: staging-finalize
    staging-finalize: $(STAGING_DIR_SYMLINK)
    $(STAGING_DIR_SYMLINK): | $(BASE_DIR)
    BASE_DIR := $(CANONICAL_O)
    CANONICAL_O := $(shell mkdir -p $(O) >/dev/null 2>&1)$(realpath $(O))

So, there is a rule that (eventually) has a dependency on $(O), but we
have no rule that provides it explicitly, so the %_defconfig rule kicks
in, with the stem as "/some/path/meh". When the loop searches all the
".../configs/" directories for a file named ".../configs/%_defconfig",
it actually looks for a file named ".../configs//some/path/meh_defconfig"
and that indeed never matches anything.

The solution is to provide an actual rule for $(BASE_DIR), so that the
implicit rule does not kick in.

[0] Terminology and behaviour in make is hard, so the terms we used here
    may be wrong or incorrectly used, and/or the explanations for the
    behaviour be wrong or incomplete... Still, the reasoning stands, and
    the root cause is the removal of the stem in the RHS of the rule
    (adding one back does fix the issue).

[1] not sure how the prerequisite was solved  before e6195c53041f,
    though...

Fixes: e6195c53041f

Reported-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Nevo Hed <nhed+buildroot@starry.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Tested-by: Sebastian Weyer <sebastian.weyer@smile.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 5bd2cafc326141eede4f917069ed21b6d38f88c2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index ab5f97aeff..804ae58689 100644
--- a/Makefile
+++ b/Makefile
@@ -1041,7 +1041,7 @@ savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 
 # staging and target directories do NOT list these as
 # dependencies anywhere else
-$(BUILD_DIR) $(BASE_TARGET_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST) $(PER_PACKAGE_DIR):
+$(BASE_DIR) $(BUILD_DIR) $(BASE_TARGET_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST) $(PER_PACKAGE_DIR):
 	@mkdir -p $@
 
 # outputmakefile generates a Makefile in the output directory, if using a
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
