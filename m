Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACF07C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:32:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67EFE60F58
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:32:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 67EFE60F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43436828EF;
	Wed,  4 Aug 2021 00:32:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DzOQJuXMVIDp; Wed,  4 Aug 2021 00:32:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83E2E84341;
	Wed,  4 Aug 2021 00:32:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0AD801BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AEA3541519
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WXrKiDbsmsaN for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EFDED40F54
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 457C983FBA; Tue,  3 Aug 2021 21:10:17 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 15:20:24 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9d8b1d3977fa5cd2829a7214a8f2ea479560d421
X-Git-Newrev: 5b5df66b7d0a9fd887b042de0401ba5094522857
X-Patchwork-Hint: ignore
Message-Id: <20210803211017.457C983FBA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/pkg-kconfig: move
 defaults before calling pkg-generic
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

commit: https://git.buildroot.net/buildroot/commit/?id=5b5df66b7d0a9fd887b042de0401ba5094522857
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Currently, we define the default values for kconfig-specific variables
after we call into the generic package infrastructure.

So far, this was totally unconsequential, because there was no kconfig
variable that could influence the generic parts. But conversely, there
are generic variables that do influence the kconfig part (e.g. $(2)_DIR
that is used in some dependency definitions), but none that do influence
the kconfig variables.

However, we are going to add a new kconfig-related variable that will
have an impact on the generic parts, so we will want that kconfig
variable to be defined before calling into the generic infrastructure.

For consistency, move all the defaults before calling the generic infra.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-kconfig.mk | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index dd727b7200..49074f9220 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -78,6 +78,14 @@ endef
 
 define inner-kconfig-package
 
+# Default values
+$(2)_MAKE ?= $$(MAKE)
+$(2)_KCONFIG_EDITORS ?= menuconfig
+$(2)_KCONFIG_OPTS ?=
+$(2)_KCONFIG_FIXUP_CMDS ?=
+$(2)_KCONFIG_FRAGMENT_FILES ?=
+$(2)_KCONFIG_DOTCONFIG ?= .config
+
 # Register the kconfig dependencies as regular dependencies, so that
 # they are also accounted for in the generated graphs.
 $(2)_DEPENDENCIES += $$($(2)_KCONFIG_DEPENDENCIES)
@@ -88,14 +96,6 @@ $(2)_DEPENDENCIES += $$($(2)_KCONFIG_DEPENDENCIES)
 # dependency expression
 $(call inner-generic-package,$(1),$(2),$(3),$(4))
 
-# Default values
-$(2)_MAKE ?= $$(MAKE)
-$(2)_KCONFIG_EDITORS ?= menuconfig
-$(2)_KCONFIG_OPTS ?=
-$(2)_KCONFIG_FIXUP_CMDS ?=
-$(2)_KCONFIG_FRAGMENT_FILES ?=
-$(2)_KCONFIG_DOTCONFIG ?= .config
-
 # Do not use $(2)_KCONFIG_DOTCONFIG as stamp file, because the package
 # buildsystem (e.g. linux >= 4.19) may touch it, thus rendering our
 # timestamps out of date, thus re-trigerring the build of the package.
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
