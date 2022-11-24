Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA53C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 632EA42B00;
	Mon, 20 Feb 2023 21:23:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 632EA42B00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V_l9qR_bwFw0; Mon, 20 Feb 2023 21:23:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29F4D42D70;
	Mon, 20 Feb 2023 21:23:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29F4D42D70
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C9251BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0553E4159B
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0553E4159B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u61BabFuti5G for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1AFB14156D
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1AFB14156D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1468A8648F; Mon, 20 Feb 2023 20:51:53 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 24 Nov 2022 13:15:11 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e3959a039059d6b3bc95100409975e87e9c14d3b
X-Git-Newrev: a11b36089b34dcf0c1b90835a436f50efec3d8fb
X-Patchwork-Hint: ignore
Message-Id: <20230220205153.1468A8648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/swupdate: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=a11b36089b34dcf0c1b90835a436f50efec3d8fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
