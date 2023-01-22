Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75215C25B4E
	for <buildroot@archiver.kernel.org>; Sun, 22 Jan 2023 09:09:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E89F541624;
	Sun, 22 Jan 2023 09:09:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E89F541624
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aZibDOM0yiev; Sun, 22 Jan 2023 09:09:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFC4F4162D;
	Sun, 22 Jan 2023 09:09:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFC4F4162D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DB1F91BF36C
 for <buildroot@lists.busybox.net>; Sun, 22 Jan 2023 09:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B64714162D
 for <buildroot@lists.busybox.net>; Sun, 22 Jan 2023 09:09:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B64714162D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JfaqIaCUHHco for <buildroot@lists.busybox.net>;
 Sun, 22 Jan 2023 09:09:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BF7241624
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5BF7241624
 for <buildroot@buildroot.org>; Sun, 22 Jan 2023 09:09:51 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id j17so6983221wms.0
 for <buildroot@buildroot.org>; Sun, 22 Jan 2023 01:09:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4AnF7DEcquMkse03NS0niCpPWxoDnj9mTO5XYsP5nB8=;
 b=uhBvo56WktPGnzdIg0tH+4XqwN19iIBMzEutqfBRabSzUHe4sGc8UyW6aq8M1qi+Ik
 /fu4GYW/To/HmfaVXpUjcywqOt2SrhnJmlHQExi03nCvuvbpbFKWTliaX8fers9Sp+uN
 BbHOcsL53U9pv5nQeqjMMlDpV6ggC6mhghBTsIJadNGk9XCix7nL6eHuGapenah6cKeQ
 6Gjucc/PfIamHGI1iPT1DzLeQfH9KFoxPygKVq1ZClkCLUor5lbY5a1gUeTkO+ppyHSH
 h7+sFvHWmJJ03Q/E3XPvHq0JjB3xhYKDOowLC5eu6tUr/MRVE0fRLKSxRwuR//NWUvL0
 LC2w==
X-Gm-Message-State: AFqh2kqzc3EdB1SpoMWIcGvFzXh8YyTCQsSHBwEHfr+OrruXlXUo05V2
 Lvhc+QvFqbyIcnB5UoO0MO9mjABIJss=
X-Google-Smtp-Source: AMrXdXsyrLTTOr21fMimxzaJet+dvmg8nAxpBQ4QvWDM56IuoXdmBu6SQMA9TrnATERve8wnTR5XWw==
X-Received: by 2002:a05:600c:4928:b0:3d3:4aa6:4fe6 with SMTP id
 f40-20020a05600c492800b003d34aa64fe6mr20146651wmp.3.1674378589292; 
 Sun, 22 Jan 2023 01:09:49 -0800 (PST)
Received: from localhost.localdomain (1-1-22-171.ftth.cust.kwaoo.net.
 [171.22.1.1]) by smtp.gmail.com with ESMTPSA id
 f23-20020a7bc8d7000000b003d1f3e9df3csm7451075wml.7.2023.01.22.01.09.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Jan 2023 01:09:48 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Jan 2023 10:09:47 +0100
Message-Id: <20230122090947.1369673-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=4AnF7DEcquMkse03NS0niCpPWxoDnj9mTO5XYsP5nB8=;
 b=E1kfQg22ZrCwW/mf9gNwycxtA6KA05WXJT+7jKtWDrVxTiQiWhGbIkEdBEuNGJPP0S
 7felgDE3rYfAd950l1Kgf39fQaqoHGzoOE+RyVKgIn2P2wYeDwSebknQufs8lGRTHCgz
 U/0t66oTeIaeQNtBskPpIu9YMlxKxiU5e29V4OiEmvs4Fj6kZbJ9Kq8CCq3eHskLGUT9
 sWeaqwnEB2jsPBYh+WiOnaURrubnY8V9Ok6S9YupbbriEs/P+WixCN5c61R2dRI5m2Ul
 epaADbsxiFgWgRfrCHJM0mw6p7yNncC3sZCojHrFmv5k1Q6byKzAzNEYbAeS9hSFUFLh
 w8Bg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=E1kfQg22
Subject: [Buildroot] [PATCH] Makefile: fix build when $(O) ends in _defconfig
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
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
it actually lookes for a file named ".../configs//some/path/meh_defconfig"
and that indeed never matches anything.

The solution is to provide an actual rule for $(BASE_DIR), so that the
implicit rule does not kick in.

[0] Terminology and behaviour in make is hard, so the terms we used here
    may be wrong or incorrectly used, and/or the explanations for the
    behavious be wrong or incomplete... Still, the reasoning stands, and
    the root cause is the removal of the stem in the RHS of the rule
    (adding one back does fix the issue).

[1] not sure how the prerequisite was solved  before e6195c53041f,
    though...

Fixes: e6195c53041f

Reported-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Nevo Hed <nhed+buildroot@starry.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 8517d563d5..f39af5eae9 100644
--- a/Makefile
+++ b/Makefile
@@ -1042,7 +1042,7 @@ savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 
 # staging and target directories do NOT list these as
 # dependencies anywhere else
-$(BUILD_DIR) $(BASE_TARGET_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST) $(PER_PACKAGE_DIR):
+$(BASE_DIR) $(BUILD_DIR) $(BASE_TARGET_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST) $(PER_PACKAGE_DIR):
 	@mkdir -p $@
 
 # outputmakefile generates a Makefile in the output directory, if using a
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
