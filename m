Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62959C25B06
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 12:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF4CA40AE2;
	Mon, 15 Aug 2022 12:36:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF4CA40AE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kWRE0W3kz_ea; Mon, 15 Aug 2022 12:36:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E2BC408E5;
	Mon, 15 Aug 2022 12:36:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E2BC408E5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9FD931BF97E
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 12:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 890D840AD5
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 12:36:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 890D840AD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ro1k1WVnNSDm for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 12:36:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5223408E5
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 12:36:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5223408E5
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 702C687632; Mon, 15 Aug 2022 12:22:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 14:36:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ecba9d9a91db332ab64735c9cec708d4ae8637dc
X-Git-Newrev: 5ea5ac0c60bb91af0e50302253ac2a576d3cf2ab
X-Patchwork-Hint: ignore
Message-Id: <20220815122201.702C687632@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/snort: fix sparc build with
 BR2_OPTIMIZE_FAST
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5ea5ac0c60bb91af0e50302253ac2a576d3cf2ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following sparc build failure with BR2_OPTIMIZE_FAST raised
since bump to version 2.9.19 in commit
65ed981ce0135379b7faeb69519f4e3e666c0717:

cc1: error: argument to '-O' should be a non-negative integer, 'g', 's' or 'fast'

Fixes:
 - http://autobuild.buildroot.org/results/e1a330e1a899fcdf4900e9156d62c90813321e30

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/snort/0008-Fix-NO-OPTIMIZE.patch | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/package/snort/0008-Fix-NO-OPTIMIZE.patch b/package/snort/0008-Fix-NO-OPTIMIZE.patch
new file mode 100644
index 0000000000..936973fdd6
--- /dev/null
+++ b/package/snort/0008-Fix-NO-OPTIMIZE.patch
@@ -0,0 +1,24 @@
+Fix NO_OPTIMIZE
+
+Fix the following build failure when NO_OPTIMIZE is enabled (e.g. on
+sparc) and -Ofast:
+
+cc1: error: argument to '-O' should be a non-negative integer, 'g', 's' or 'fast'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/e1a330e1a899fcdf4900e9156d62c90813321e30
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+
+diff -Nura snort-2.9.19.orig/configure.in snort-2.9.19/configure.in
+--- snort-2.9.19.orig/configure.in	2022-08-09 20:21:00.236777320 +0200
++++ snort-2.9.19/configure.in	2022-08-09 20:29:02.260993315 +0200
+@@ -1694,7 +1694,7 @@
+ 
+ # Set to no optimization regardless of what user or autostuff set
+ if test "x$NO_OPTIMIZE" = "xyes"; then
+-    CFLAGS=`echo $CFLAGS | sed -e "s/-O./-O0/"`
++    CFLAGS=`echo $CFLAGS | sed -e "s/-O[0-9a-z]*/-O0/"`
+ 
+     # in case user override doesn't include -O
+     if echo $CFLAGS | grep -qve -O0 ; then
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
