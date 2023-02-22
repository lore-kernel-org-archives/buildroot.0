Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C804C61DA4
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 16:32:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E699D416C8;
	Wed, 22 Feb 2023 16:32:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E699D416C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TVAGRMDl-Pcg; Wed, 22 Feb 2023 16:32:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20F0640BE0;
	Wed, 22 Feb 2023 16:32:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20F0640BE0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 348461BF847
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 16:31:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E92440BE0
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 16:31:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E92440BE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qn2fMrFot-3B for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 16:31:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E924940108
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E924940108
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 16:31:49 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5FE9B20010;
 Wed, 22 Feb 2023 16:31:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pUs1y-007yDt-DV; Wed, 22 Feb 2023 17:31:46 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Sebastian WEYER <sebastian.weyer@smile.fr>
References: <20230122090947.1369673-1-yann.morin.1998@free.fr>
 <038b530f-18f1-fd5e-f926-32e73d434a63@smile.fr>
Date: Wed, 22 Feb 2023 17:31:46 +0100
In-Reply-To: <038b530f-18f1-fd5e-f926-32e73d434a63@smile.fr> (Sebastian
 WEYER's message of "Mon, 6 Feb 2023 11:57:11 +0100")
Message-ID: <877cw9vez1.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] Makefile: fix build when $(O) ends in
 _defconfig
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
Cc: Romain Naour <romain.naour@gmail.com>, Nevo Hed <nhed+buildroot@starry.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Sebastian" == Sebastian WEYER <sebastian.weyer@smile.fr> writes:

 > Hi all,
 > On 22/01/2023 10:09, Yann E. MORIN wrote:
 >> Commit e6195c53041f (Makefile: fix use of many br2-external trees) fixed
 >> a slowdown with many br2-external trees. In doing so, it changed the
 >> type of the %_defconfig rule: the stem is no longer present in the
 >> prerequisites, so it changes from a pattern rule to an implicit pattern
 >> rule [0].
 >> 
 >> It is not unusual to name the build directory after the defconfig that
 >> is being built, so we may end up with a build directory named
 >> meh_defconfig. Before e6195c53041f, the pattern rule would not match
 >> [1], but now it does, which causes somewhat-cryptic build failures:
 >> 
 >> Makefile:1015: *** "Can't find /some/path/meh_defconfig".  Stop.
 >> 
 >> The issue is that we have this set of rules and assignments (elided and
 >> reordered for legibility):
 >> 
 >> all: world
 >> world: target-post-image
 >> target-post-image: staging-finalize
 >> staging-finalize: $(STAGING_DIR_SYMLINK)
 >> $(STAGING_DIR_SYMLINK): | $(BASE_DIR)
 >> BASE_DIR := $(CANONICAL_O)
 >> CANONICAL_O := $(shell mkdir -p $(O) >/dev/null 2>&1)$(realpath $(O))
 >> 
 >> So, there is a rule that (eventually) has a dependency on $(O), but we
 >> have no rule that provides it explicitly, so the %_defconfig rule kicks
 >> in, with the stem as "/some/path/meh". When the loop searches all the
 >> ".../configs/" directories for a file named ".../configs/%_defconfig",
 >> it actually lookes for a file named ".../configs//some/path/meh_defconfig"
 >> and that indeed never matches anything.
 >> 
 >> The solution is to provide an actual rule for $(BASE_DIR), so that the
 >> implicit rule does not kick in.
 >> 
 >> [0] Terminology and behaviour in make is hard, so the terms we used here
 >> may be wrong or incorrectly used, and/or the explanations for the
 >> behavious be wrong or incomplete... Still, the reasoning stands, and
 >> the root cause is the removal of the stem in the RHS of the rule
 >> (adding one back does fix the issue).
 >> 
 >> [1] not sure how the prerequisite was solved  before e6195c53041f,
 >> though...
 >> 
 >> Fixes: e6195c53041f
 >> 
 >> Reported-by: Romain Naour <romain.naour@gmail.com>
 >> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 >> Cc: Nevo Hed <nhed+buildroot@starry.com>
 >> Cc: Peter Korsgaard <peter@korsgaard.com>
 >> ---
 >> Makefile | 2 +-
 >> 1 file changed, 1 insertion(+), 1 deletion(-)
 >> 
 >> diff --git a/Makefile b/Makefile
 >> index 8517d563d5..f39af5eae9 100644
 >> --- a/Makefile
 >> +++ b/Makefile
 >> @@ -1042,7 +1042,7 @@ savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 >> 
 >> # staging and target directories do NOT list these as
 >> # dependencies anywhere else
 >> -$(BUILD_DIR) $(BASE_TARGET_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST) $(PER_PACKAGE_DIR):
 >> +$(BASE_DIR) $(BUILD_DIR) $(BASE_TARGET_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST) $(PER_PACKAGE_DIR):
 >> @mkdir -p $@
 >> 
 >> # outputmakefile generates a Makefile in the output directory, if using a

 > I first verified that the build fails when the output folder's name ends in
 > "_defconfig" with "make O=./test/second_defconfig qemu_aarch64_virt_defconfig"
 > followed by "make O=./test/second_defconfig".
 > I then applied the patch and redid "make O=./test/second_defconfig" and verified
 > that the build succeeded.

 > Tested-by: Sebastian Weyer <sebastian.weyer@smile.fr>

Committed to 2022.11.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
