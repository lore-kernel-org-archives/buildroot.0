Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68EC5C4320A
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 13:21:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0933860F49
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 13:21:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0933860F49
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8F0D8247F;
	Sun, 25 Jul 2021 13:21:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1amy6JrEIkXL; Sun, 25 Jul 2021 13:21:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF89E82A6C;
	Sun, 25 Jul 2021 13:21:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E99B41BF95A
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 13:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D90A1401A4
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 13:20:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DONWx07ncY3d for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 13:20:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1205F40154
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 13:20:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id CFA2082DF2; Sun, 25 Jul 2021 12:46:16 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 15:20:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5b5df66b7d0a9fd887b042de0401ba5094522857
X-Git-Newrev: c7d71b707d96f7b9c4959951af147af6fb5dee2f
X-Patchwork-Hint: ignore
Message-Id: <20210725124616.CFA2082DF2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-kconfig: generate generic help
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=c7d71b707d96f7b9c4959951af147af6fb5dee2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, as Thomas pointed out [0], the help for kconfig packages is
not consistently used and handled by the different packages.

This commit introduces a generic help text for kconfig packages, that is
based on what the package declares:

  - the list of kconfig editors it supports;

  - whether it is possible to save back the configuration (impossible if
    the package uses an in-tree defconfig file);

  - whether the package actually supports (loading and saving) defconfig
    files, by introducing a new variable a package can set if it does
    not (only busybox is known to be in that case).

That new help helper is only used if the package does not already define
its own help, to be consistent with what we do for other _CMDS.

[0] http://lists.busybox.net/pipermail/buildroot/2021-July/313570.html

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 docs/manual/adding-packages-kconfig.txt |  3 +++
 package/pkg-kconfig.mk                  | 24 ++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/docs/manual/adding-packages-kconfig.txt b/docs/manual/adding-packages-kconfig.txt
index 8f40ea6099..a35681775f 100644
--- a/docs/manual/adding-packages-kconfig.txt
+++ b/docs/manual/adding-packages-kconfig.txt
@@ -91,3 +91,6 @@ be set to suit the needs of the package under consideration:
 * +FOO_KCONFIG_DEPENDENCIES+: the list of packages (most probably, host
   packages) that need to be built before this package's kconfig is
   interpreted. Seldom used. By default, empty.
+
+* +FOO_KCONFIG_SUPPORTS_DEFCONFIG+: whether the package's kconfig system
+  supports using defconfig files; few packages do not. By default, 'YES'.
diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 49074f9220..715c3e04ec 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -85,11 +85,35 @@ $(2)_KCONFIG_OPTS ?=
 $(2)_KCONFIG_FIXUP_CMDS ?=
 $(2)_KCONFIG_FRAGMENT_FILES ?=
 $(2)_KCONFIG_DOTCONFIG ?= .config
+$(2)_KCONFIG_SUPPORTS_DEFCONFIG ?= YES
 
 # Register the kconfig dependencies as regular dependencies, so that
 # they are also accounted for in the generated graphs.
 $(2)_DEPENDENCIES += $$($(2)_KCONFIG_DEPENDENCIES)
 
+# Generate the kconfig-related help: one entry for each editor.
+# Additionally, if the package is *not* using an in-tree defconfig
+# name, an entry for updating the package configuration file.
+ifndef $(2)_HELP_CMDS
+define $(2)_HELP_CMDS
+	$$(foreach editor, $$($(2)_KCONFIG_EDITORS), \
+		@printf '  %-22s - Run %s %s\n' $(1)-$$(editor) $(1) $$(editor)
+	)
+	$$(if $$($(2)_KCONFIG_DEFCONFIG),,\
+		$$(if $$(filter YES,$$($(2)_KCONFIG_SUPPORTS_DEFCONFIG)),\
+			@printf '  %-22s - Save the %s configuration as a defconfig file\n' \
+				$(1)-update-defconfig $(1)
+			@printf '  %-22s     to %s\n' '' $$($(2)_KCONFIG_FILE)
+			@printf '  %-22s     (or override with %s_KCONFIG_FILE)\n' '' $(2)
+		)
+		@printf '  %-22s - Save the %s configuration as a full .config file\n' \
+			$(1)-update-config $(1)
+		@printf '  %-22s     to %s\n' '' $$($(2)_KCONFIG_FILE)
+		@printf '  %-22s     (or override with %s_KCONFIG_FILE)\n' '' $(2)
+	)
+endef
+endif
+
 # Call the generic package infrastructure to generate the necessary
 # make targets.
 # Note: this must be done _before_ attempting to use $$($(2)_DIR) in a
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
