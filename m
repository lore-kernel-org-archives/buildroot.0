Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF3B8C433F5
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 14:00:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D849E61156
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 14:00:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D849E61156
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9797760676;
	Sat, 13 Nov 2021 14:00:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZPmjjzWZoL7z; Sat, 13 Nov 2021 14:00:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EFF76064B;
	Sat, 13 Nov 2021 14:00:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0E1301BF2FD
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 14:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F21506064B
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 14:00:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KhW28lE6Tx6f for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 14:00:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6206E60638
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 14:00:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 4F9D68B411; Sat, 13 Nov 2021 13:56:32 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 15:00:26 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 19575e9e9e0a9cdf900f95a56e00654fd77d1ca0
X-Git-Newrev: 377c3e5f4c7580a5bf81586e1f41ddc0bdb83cff
X-Patchwork-Hint: ignore
Message-Id: <20211113135632.4F9D68B411@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/pkg-stats: support
 values with an equal sign in them
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
