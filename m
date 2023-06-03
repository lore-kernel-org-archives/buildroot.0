Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB5CC77B7A
	for <buildroot@archiver.kernel.org>; Sat,  3 Jun 2023 19:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB29940917;
	Sat,  3 Jun 2023 19:53:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB29940917
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QTY0lyywZnPa; Sat,  3 Jun 2023 19:53:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 635D941E3F;
	Sat,  3 Jun 2023 19:53:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 635D941E3F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DE1681BF487
 for <buildroot@lists.busybox.net>; Sat,  3 Jun 2023 19:53:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B402160F0F
 for <buildroot@lists.busybox.net>; Sat,  3 Jun 2023 19:53:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B402160F0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iQYxtrApCOQh for <buildroot@lists.busybox.net>;
 Sat,  3 Jun 2023 19:53:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD9F460EF6
 for <buildroot@buildroot.org>; Sat,  3 Jun 2023 19:53:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD9F460EF6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B627A8697E; Sat,  3 Jun 2023 19:53:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Jun 2023 21:44:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 11db2d6fde313fc832baef38a25b4a24c31375ce
X-Git-Newrev: f3b46aa2aa5636a5d6d578b6960dc380740fd775
X-Patchwork-Hint: ignore
Message-Id: <20230603195319.B627A8697E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vdr: Fix patch for uclibc build
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

commit: https://git.buildroot.net/buildroot/commit/?id=f3b46aa2aa5636a5d6d578b6960dc380740fd775
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
