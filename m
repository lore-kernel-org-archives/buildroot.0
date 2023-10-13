Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 657A3CDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 14:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DC456F63C;
	Fri, 13 Oct 2023 14:48:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DC456F63C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id optacsA5xupL; Fri, 13 Oct 2023 14:48:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C23136F5DE;
	Fri, 13 Oct 2023 14:48:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C23136F5DE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3CFBC1BF997
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 14:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5DCCD4049A
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 14:47:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DCCD4049A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pYkYkuJX21WS for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 14:47:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2312D405A9
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 14:47:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2312D405A9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0DB8D847A3; Fri, 13 Oct 2023 14:47:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 16:41:34 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 97128028df9b116149fb2d2f482e0454bc1077e5
X-Git-Newrev: 8fceb06e6c31067e79bedc28f7ac1f8df749335b
X-Patchwork-Hint: ignore
Message-Id: <20231013144707.0DB8D847A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/pkg-generic.mk:
 fix rule order for reinstall/rebuild/reconfigure
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

commit: https://git.buildroot.net/buildroot/commit/?id=8fceb06e6c31067e79bedc28f7ac1f8df749335b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

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
(cherry picked from commit 7e3105d5c8bd9ab31e728af9732a67d203c0a2e4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile               | 3 +++
 package/pkg-generic.mk | 6 +++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 5635bff6e8..ae7ba3cdbe 100644
--- a/Makefile
+++ b/Makefile
@@ -1254,4 +1254,7 @@ include docs/manual/manual.mk
 
 .PHONY: $(noconfig_targets)
 
+# .WAIT was introduced in make 4.4. For older make, define it as phony.
+.PHONY: .WAIT
+
 endif #umask / $(CURDIR) / $(O)
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 5d1c1da128..9947e4cc6d 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1057,17 +1057,17 @@ endif
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
