Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73E34C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:09:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EBFC60F93
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:09:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2EBFC60F93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09A0D605C3;
	Tue,  3 Aug 2021 23:09:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QDa35UwurhFS; Tue,  3 Aug 2021 23:09:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EF226066F;
	Tue,  3 Aug 2021 23:09:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C1BA1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:13:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3AF48404D4
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2JWIXvprP7gx for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 68B67404DA
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id BCA3D8674F; Tue,  3 Aug 2021 21:09:52 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 16 Jun 2021 21:54:54 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 54d0a7cc1828c05719e14170e88811b21cffd82e
X-Git-Newrev: ee5e14ff17fda761784feda2f887b6fbde5355e5
X-Patchwork-Hint: ignore
Message-Id: <20210803210952.BCA3D8674F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] core/pkg-generic: fix
 instrumentation for packages that install nowhere
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

commit: https://git.buildroot.net/buildroot/commit/?id=ee5e14ff17fda761784feda2f887b6fbde5355e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

A (target [0]) package can independently declare installing in various
locations: target, staging, or images. The default is to only install
in target.

When a package opts out from installing to target, but does not opts
in to install in any other location, the package is not downloaded,
extracted, patched, configured, nor built at all. As a consequence, none
of the per-step instrumentation is executed, specifically the listing
of files before/after the package sequence.

Down the line, the package infra does not cope well with that situation,
because the gathering-install step, the one that synchronises all the
optional target, staging, or images install steps, still gets run.

And as #13836 shows, this does not go well:

    /bin/sh: /home/tbuild/myboard/build/foo/.files-list.after: No such file or directory
    make[1]: *** [/home/tbuild/myboard/build/foo/.stamp_installed] Error 1
    make: *** [_all] Error 2

So, we should have ensured that the gathering-install step itself
depends on the build step, which would have solved the issue.

However, this bug really illustrates a more fundamental issue: does it
even make sense to have a package that installs nothing in any location?
Indeed, why even bother with that package to begin with if it will not
provide anything at all?

It turns out that yes, this makes sense. We have some packages, that
do not install anything at all, and do not even build anything; they are
there just to ensure that we can download something that will ultimately
be used by another package. This is the case for example for packages
that provide linux extensions, like aufs [1].

Additionally, some ugly out-of-tree packages could conceivably install
things during the build (or even configure!) steps. That's not unheard
of... [2]

So, the solution is to ensure that the gathering-install step does
depend on the build step, to trigger the proper dependency chain and
have the instrumentation hooks properly run even in that degenerate
case.

Fixes: #13836

[0] a host package can't opt out of installing anything.
[1] that one is actually missing AUFS_INSTALL_TARGET = NO, so this
    hides the issue.
[2] even us are not 100% clean on that topic: gcc will install files in
    staging and target as part of the same step (not the build, granted,
    but still...)

Reported-by: "Weber, Matthew L Collins" <Matthew.Weber@collins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Tested-by: Matthew Weber <matthew.weber@collins.com
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-generic.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 9fbc63d19e..45589bcbb4 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -826,6 +826,7 @@ endif
 # human-friendly targets and target sequencing
 $(1):			$(1)-install
 $(1)-install:		$$($(2)_TARGET_INSTALL)
+$$($(2)_TARGET_INSTALL): $$($(2)_TARGET_BUILD)
 
 ifeq ($$($(2)_TYPE),host)
 $$($(2)_TARGET_INSTALL): $$($(2)_TARGET_INSTALL_HOST)
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
