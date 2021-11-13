Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2A9C433FE
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 18:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8ED384B4F;
	Mon,  6 Dec 2021 18:13:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UAA0wmq5dBHw; Mon,  6 Dec 2021 18:13:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C5D284B8A;
	Mon,  6 Dec 2021 18:13:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 06B591BF9AC
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F290B829EE
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4ZKjFEbyD_ZZ for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 18:12:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 416D382AAA
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 18:12:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D10B581503; Mon,  6 Dec 2021 18:07:36 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 15:00:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 19575e9e9e0a9cdf900f95a56e00654fd77d1ca0
X-Git-Newrev: 377c3e5f4c7580a5bf81586e1f41ddc0bdb83cff
X-Patchwork-Hint: ignore
Message-Id: <20211206180736.D10B581503@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/pkg-stats: support values with an
 equal sign in them
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

commit: https://git.buildroot.net/buildroot/commit/?id=377c3e5f4c7580a5bf81586e1f41ddc0bdb83cff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The heuristic to extract the various variables of interest is pretty
crude: we filter on variables ending with certain suffixes (like
'%_VERSION' to get the version strings).

However, in doing so, we may dump variables that are not actual package
versions (especially with br2-external trees), and those may contain one
or more equal sign.  And anyway, an actual package version string may
very well contain an equal sign too.

But the current situation is that the output of 'printvars' is split on
all equal signs, which will not fit in the 2-tuple we assign the result,
thus causing an exception.

Fix that by limiting to a single split.

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 65ffa05f17..3992c8312a 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -388,7 +388,7 @@ def package_init_make_info():
 
     for item in variable_list:
         # Get variable name and value
-        pkgvar, value = item.split("=")
+        pkgvar, value = item.split("=", maxsplit=1)
 
         # Strip the suffix according to the variable
         if pkgvar.endswith("_LICENSE"):
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
