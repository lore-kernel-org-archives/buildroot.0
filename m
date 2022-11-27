Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF0C6C4321E
	for <buildroot@archiver.kernel.org>; Sun, 27 Nov 2022 20:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7FF38405E6;
	Sun, 27 Nov 2022 20:25:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7FF38405E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CK6Jvrku4-WW; Sun, 27 Nov 2022 20:25:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0BED402E0;
	Sun, 27 Nov 2022 20:25:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0BED402E0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E71CE1BF863
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 20:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD27B410B0
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 20:25:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD27B410B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q1g-igDfK8yQ for <buildroot@lists.busybox.net>;
 Sun, 27 Nov 2022 20:25:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB41A410A0
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 20:25:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB41A410A0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CA7B084958; Sun, 27 Nov 2022 20:25:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 27 Nov 2022 21:08:21 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: e5869ad653ace20b65cb9ada9bb7acb7ed42844a
X-Git-Newrev: cd4658b25ea54c2e5c0e066623ca1b6d6a2b0259
X-Patchwork-Hint: ignore
Message-Id: <20221127202517.CA7B084958@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/swupdate: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=cd4658b25ea54c2e5c0e066623ca1b6d6a2b0259
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
index 5917c93f6a..012e64f71f 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -88,6 +88,10 @@ else
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
