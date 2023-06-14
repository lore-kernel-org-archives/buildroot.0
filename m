Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C86EB64D8
	for <buildroot@archiver.kernel.org>; Wed, 14 Jun 2023 13:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1A10418CA;
	Wed, 14 Jun 2023 13:34:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1A10418CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PRJ81Y7uHqpS; Wed, 14 Jun 2023 13:34:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA80741DD7;
	Wed, 14 Jun 2023 13:34:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA80741DD7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 71BA01BF2BA
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 13:34:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B03241783
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 13:34:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B03241783
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XhXkMW3G4Dzy for <buildroot@lists.busybox.net>;
 Wed, 14 Jun 2023 13:34:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72D5A40C26
 for <buildroot@buildroot.org>; Wed, 14 Jun 2023 13:34:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72D5A40C26
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5F71B83689; Wed, 14 Jun 2023 13:34:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Jun 2023 15:31:22 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 426a4509bb2d38b3cfcf9410b5e9a1e19442fcfc
X-Git-Newrev: ac5af7b883dc162a590795114b14bd54c7e2d502
X-Patchwork-Hint: ignore
Message-Id: <20230614133442.5F71B83689@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/vdr: Fix patch
 for uclibc build
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

commit: https://git.buildroot.net/buildroot/commit/?id=ac5af7b883dc162a590795114b14bd54c7e2d502
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

uClibc-ng 1.0.42 added support for getloadavg:
https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=ad3a130dad88ad7a59dcd965b0cf9bd0d713595e

leading to build errors of the vdr package:

skinlcars.c:1105:12: error: 'int getloadavg(double*, int)' was declared 'extern' and later 'static' [-fpermissive]

since its version bump in buildroot:
https://git.busybox.net/buildroot/commit/?id=61ae6add9e5d4761536fa4ff24150d5f8f82a61d

Fixes:
http://autobuild.buildroot.net/results/d3a/d3a65044fabdafa1b6d75a508eae006a2cfebdc0/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit f3b46aa2aa5636a5d6d578b6960dc380740fd775)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vdr/0001-getloadavg.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/vdr/0001-getloadavg.patch b/package/vdr/0001-getloadavg.patch
index 9e6316e284..f6ba84c9e5 100644
--- a/package/vdr/0001-getloadavg.patch
+++ b/package/vdr/0001-getloadavg.patch
@@ -14,7 +14,7 @@ diff -uwNr vdr-2.3.1.org/skinlcars.c vdr-2.3.1/skinlcars.c
  
 +/* uclibc and dietlibc do not have this junk -ReneR */
 +#if defined (__UCLIBC__) || defined (__dietlibc__)
-+static int getloadavg (double loadavg[], int nelem)
++int getloadavg (double loadavg[], int nelem)
 +{
 +  int fd;
 +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
