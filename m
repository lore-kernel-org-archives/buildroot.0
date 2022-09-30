Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86191C433F5
	for <buildroot@archiver.kernel.org>; Fri, 30 Sep 2022 15:16:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11E66842CD;
	Fri, 30 Sep 2022 15:16:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11E66842CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KANUaRwQkQRc; Fri, 30 Sep 2022 15:16:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2233F842CB;
	Fri, 30 Sep 2022 15:16:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2233F842CB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 58C6E1BF2F7
 for <buildroot@lists.busybox.net>; Fri, 30 Sep 2022 15:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1EC6D842CA
 for <buildroot@lists.busybox.net>; Fri, 30 Sep 2022 15:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1EC6D842CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cNhwCq_XYmmO for <buildroot@lists.busybox.net>;
 Fri, 30 Sep 2022 15:16:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 32975842AE
 for <buildroot@buildroot.org>; Fri, 30 Sep 2022 15:16:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32975842AE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1776586662; Fri, 30 Sep 2022 15:16:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 30 Sep 2022 17:00:08 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 0b3dcd00fec321d38f5618313a053bd75686df56
X-Git-Newrev: 6a202ef4864c5e14408c2e38083d2424c11be2f8
X-Patchwork-Hint: ignore
Message-Id: <20220930151609.1776586662@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/ncurses: drop our
 custom host build commands
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

commit: https://git.buildroot.net/buildroot/commit/?id=6a202ef4864c5e14408c2e38083d2424c11be2f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Commit bf446513e7e7 (ncurses: fix hanging installation due to old
version of tic) introduced the build of the host tic, to be used by the
target ncurses. That commit purportedly built a static tic, but that is
(at least now) wrong: there is nothing that makes the build of tic
static.

Initially, host-ncurses was configured with --without-shared, but that
only drives whether to generate shared libs or not, it does not drive
whether to do a shared or static link of executables.

And in any case, in af23d762e51b (ncurses: enable shared library build
on the host) we explicitly stopped requesting the build of a static
library, to instead require the build of a shared library.

So, we never had a statically linked tic ever.

Furthermore, we override the _BUKLLD_CMDS, but we do not provide any
_INSTALL_CMDS. As a consequence, the full ncurses is installed, not just
tic. And since we override the _BUILD_CMDS, the libraries are not built,
so they get built during the install step.

And we do indeed need the libraries (host-gettext needs them), and not
just tic.

So, just drop our custom _BUILD_CMDS and just build the whole package
with the default settings. We keep the explicit use of --with-shared,
as this is not the standard flag (--enable-shared) and it is not obvious
what the default is.

The set of files installed before and after this change is exactly the
same, and tic still is an "ELF 64-bit LSB shared object" with a RUNPATH
that still correctly points to $(HOST_DIR)/lib

To be noted: there is no regressin in build time either, since we were
already building everything anyway.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8b15de20a07b31ca3c4954a1f1ce035e00161934)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ncurses/ncurses.mk | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 5d9c6bb0dd..2881ca1308 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -184,16 +184,6 @@ define NCURSES_TARGET_CLEANUP_TERMINFO
 endef
 NCURSES_POST_INSTALL_TARGET_HOOKS += NCURSES_TARGET_CLEANUP_TERMINFO
 
-#
-# On systems with an older version of tic, the installation of ncurses hangs
-# forever. To resolve the problem, build a static version of tic on host
-# ourselves, and use that during installation.
-#
-define HOST_NCURSES_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(MAKE1) -C $(@D) sources
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)/progs tic
-endef
-
 HOST_NCURSES_CONF_ENV = \
 	ac_cv_path_LDCONFIG=""
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
