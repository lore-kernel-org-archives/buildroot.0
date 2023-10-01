Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5775E748EE
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 15:58:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B46C82007;
	Sun,  1 Oct 2023 15:58:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B46C82007
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id adtS9AjMpcHE; Sun,  1 Oct 2023 15:58:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B4B181F4C;
	Sun,  1 Oct 2023 15:58:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B4B181F4C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2C9491BF5AA
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 15:58:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1395A81F4C
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 15:58:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1395A81F4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hsu7RXJU8liF for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 15:58:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF77081F4B
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 15:58:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF77081F4B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C6C1E8386F; Sun,  1 Oct 2023 15:58:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Oct 2023 17:48:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d4d483451f0a305781b94b96c15a6cf4b489cd84
X-Git-Newrev: 7e3105d5c8bd9ab31e728af9732a67d203c0a2e4
X-Patchwork-Hint: ignore
Message-Id: <20231001155825.C6C1E8386F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-generic.mk: fix rule order for
 reinstall/rebuild/reconfigure
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7e3105d5c8bd9ab31e728af9732a67d203c0a2e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The reinstall, rebuild and reconfigure commands rely on the
left-to-right order of evaluation of the dependencies to make sure that
the stamp files are removed before attempting to rebuild. However, this
order of evaluation is not guaranteed. In particular, if top-level
parallel build is enabled, they are executed in parallel and the stamp
file may not have been removed yet when it is evaluated to decide if
rebuild has to be done.

Since make 4.4, it is possible to reproduce this issue by passing
`--shuffle=reverse` to the make commandline.

To solve this, add a .WAIT directive between the clean and
install/build/configure dependencies. .WAIT was introduced in make 4.4
as well. It makes sure that the dependencies on the left are evaluated
before the dependencies on the right - exactly what we want here.

Earlier versions of make don't know about .WAIT, so we need to add a
.PHONY dependency to effectively ignore it.

Note that this doesn't fix the problem for make versions earlier than
4.4. However, the issue isn't really that important: reinstall, rebuild
and reconfigure are development tools, they're not fully reliable to
begin with, and it's anyway less likely that someone uses `make -j` when
doing a reinstall/rebuild/reconfigure.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
Reported-by: James Hilliard <james.hilliard1@gmail.com>
---
 Makefile               | 3 +++
 package/pkg-generic.mk | 6 +++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index a12564ff96..dc4dbc64e1 100644
--- a/Makefile
+++ b/Makefile
@@ -1260,4 +1260,7 @@ include docs/manual/manual.mk
 
 .PHONY: $(noconfig_targets)
 
+# .WAIT was introduced in make 4.4. For older make, define it as phony.
+.PHONY: .WAIT
+
 endif #umask / $(CURDIR) / $(O)
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index d55edb1b74..6e944dd6b7 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1063,17 +1063,17 @@ endif
 			rm -f $$($(2)_TARGET_INSTALL_IMAGES)
 			rm -f $$($(2)_TARGET_INSTALL_HOST)
 
-$(1)-reinstall:		$(1)-clean-for-reinstall $(1)
+$(1)-reinstall:		$(1)-clean-for-reinstall .WAIT $(1)
 
 $(1)-clean-for-rebuild: $(1)-clean-for-reinstall
 			rm -f $$($(2)_TARGET_BUILD)
 
-$(1)-rebuild:		$(1)-clean-for-rebuild $(1)
+$(1)-rebuild:		$(1)-clean-for-rebuild .WAIT $(1)
 
 $(1)-clean-for-reconfigure: $(1)-clean-for-rebuild
 			rm -f $$($(2)_TARGET_CONFIGURE)
 
-$(1)-reconfigure:	$(1)-clean-for-reconfigure $(1)
+$(1)-reconfigure:	$(1)-clean-for-reconfigure .WAIT $(1)
 
 # define the PKG variable for all targets, containing the
 # uppercase package variable prefix
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
