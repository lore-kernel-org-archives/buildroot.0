Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3688C678D5
	for <buildroot@archiver.kernel.org>; Wed,  8 Mar 2023 20:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 618284052B;
	Wed,  8 Mar 2023 20:34:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 618284052B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0sXEWKm9THTk; Wed,  8 Mar 2023 20:34:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88B2C405A0;
	Wed,  8 Mar 2023 20:34:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88B2C405A0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 099351BF426
 for <buildroot@lists.busybox.net>; Wed,  8 Mar 2023 20:34:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D568440520
 for <buildroot@lists.busybox.net>; Wed,  8 Mar 2023 20:34:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D568440520
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KGzLiS8_7QVY for <buildroot@lists.busybox.net>;
 Wed,  8 Mar 2023 20:34:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 078F1404D4
 for <buildroot@buildroot.org>; Wed,  8 Mar 2023 20:34:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 078F1404D4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E4B7C86A3A; Wed,  8 Mar 2023 20:34:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Mar 2023 21:27:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 63e33bf88dd2138c4caa3dbfd5e1d89518ddd398
X-Git-Newrev: 3c4d6288278b46b122ab9c011bbbdf8696281b88
X-Patchwork-Hint: ignore
Message-Id: <20230308203404.E4B7C86A3A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "package/pkg-autotools: force cross
 compiling"
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

commit: https://git.buildroot.net/buildroot/commit/?id=3c4d6288278b46b122ab9c011bbbdf8696281b88
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 83e06196ab2193b73b4d7c1decc12bdd654a91e1 which
raises the following build failure with thttpd or wipe:

configure: warning: cross_compiling=yes: invalid host type
loading site script /dev/null
creating cache ./config.cache
configure: error: can only configure for one host and one target at a time

Fixes:
 - http://autobuild.buildroot.org/results/e2156c3747b37d0ec2559a67f2f468ad42a20dbc
 - http://autobuild.buildroot.org/results/a356dd0cd1fb4c9a1b9d6a4cbad4ae2a34dbb562

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-autotools.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index aac80369e0..717ff81593 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -195,7 +195,6 @@ define $(2)_CONFIGURE_CMDS
 		--disable-documentation \
 		--with-xmlto=no \
 		--with-fop=no \
-		cross_compiling=yes \
 		$$(if $$($$(PKG)_OVERRIDE_SRCDIR),,--disable-dependency-tracking) \
 		--enable-ipv6 \
 		$$(NLS_OPTS) \
@@ -230,7 +229,6 @@ define $(2)_CONFIGURE_CMDS
 		--with-xmlto=no \
 		--with-fop=no \
 		--disable-nls \
-		cross_compiling=no \
 		$$(if $$($$(PKG)_OVERRIDE_SRCDIR),,--disable-dependency-tracking) \
 		$$(QUIET) $$($$(PKG)_CONF_OPTS) \
 	)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
