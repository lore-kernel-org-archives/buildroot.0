Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBEF4C4321E
	for <buildroot@archiver.kernel.org>; Sun, 27 Nov 2022 20:24:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 850A08176D;
	Sun, 27 Nov 2022 20:24:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 850A08176D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ph7ZBM6r9qU4; Sun, 27 Nov 2022 20:24:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C95E81769;
	Sun, 27 Nov 2022 20:24:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C95E81769
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 11C3D1BF39F
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 20:23:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E099880FAD
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 20:23:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E099880FAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IMnnyTzAowPl for <buildroot@lists.busybox.net>;
 Sun, 27 Nov 2022 20:23:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3163F8135C
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 20:23:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3163F8135C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1E828848CE; Sun, 27 Nov 2022 20:23:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 27 Nov 2022 21:08:05 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 6943cfb1d1c8647ef2dad0ac90498b902e4d3566
X-Git-Newrev: 311d28cc595e70087b6b3f140ae14d785358054a
X-Patchwork-Hint: ignore
Message-Id: <20221127202358.1E828848CE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/swupdate: add
 libubootenv as optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=311d28cc595e70087b6b3f140ae14d785358054a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

If the swupdate configuration contains CONFIG_UBOOT=y it uses
libubootenv to access the U-Boot environment.

We don't have Buildroot config options for all the different optional
dependencies of swupdate, instead we rely on the user to select the
appropriate packages and simply add the dependency in the .mk file. Do
this for libubootenv as well. swupdate doesn't have anything like
HAVE_LIBUBOOTENV, it just assumes libubootenv is available.

Fixes:
bootloader/uboot.c:23:10: fatal error: libuboot.h: No such file or directory
   23 | #include <libuboot.h>

Note that libubootenv is normally built before swupdate (alphabetical
ordering), so the error only occrus with BR2_PER_PACKAGE_DIRECTORIES or
when building swupdate directly.

Note that the autobuilders don't have this error, because they only
build swupdate with a default configuration that doesn't have U-Boot
support.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit a11b36089b34dcf0c1b90835a436f50efec3d8fb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/swupdate/swupdate.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index bfc161d490..ed0c1e56a8 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -81,6 +81,10 @@ else
 SWUPDATE_MAKE_ENV += HAVE_LIBGPIOD=n
 endif
 
+ifeq ($(BR2_PACKAGE_LIBUBOOTENV),y)
+SWUPDATE_DEPENDENCIES += libubootenv
+endif
+
 ifeq ($(BR2_PACKAGE_LIBURIPARSER),y)
 SWUPDATE_DEPENDENCIES += liburiparser
 SWUPDATE_MAKE_ENV += HAVE_URIPARSER=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
