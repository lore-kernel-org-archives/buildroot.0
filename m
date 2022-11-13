Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B0C4C4332F
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 20:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFEA540343;
	Sun, 13 Nov 2022 20:59:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFEA540343
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ah0E4-hMWiI5; Sun, 13 Nov 2022 20:59:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5FB040242;
	Sun, 13 Nov 2022 20:59:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5FB040242
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B5E621BF267
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 20:59:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8FB0540242
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 20:59:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FB0540242
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XrW4-9rBEPf6 for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 20:59:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E77D401E2
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 20:59:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E77D401E2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1C8ED8378B; Sun, 13 Nov 2022 20:59:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Nov 2022 21:59:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 515319b86f17ea5a2ce3e51c9063bac9f9e00a01
X-Git-Newrev: b44f6c2f303ef03f563edd159b1c88d1cf118ed5
X-Patchwork-Hint: ignore
Message-Id: <20221113205910.1C8ED8378B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/matchbox-starup-monitor: fix build
 without C++
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

commit: https://git.buildroot.net/buildroot/commit/?id=b44f6c2f303ef03f563edd159b1c88d1cf118ed5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

matchbox-startup-monitor is an ageing package, and uses an old
configure.ac with archaic constructs. This had generated a configure
script that incorrectly tries to look for and validate a C++ compiler:

    checking for powerpc64le-buildroot-linux-gnu-g++... no
    checking whether we are using the GNU C++ compiler... no
    checking whether no accepts -g... no
    checking dependency style of no... none
    checking how to run the C++ preprocessor... /lib/cpp
    configure: error: C++ preprocessor "/lib/cpp" fails sanity check

Calling autoreconf fixes the issue, as the generated configure no longer
tries to look for a C++ compiler at all anymore. Running autoreconf does
not add any new dependency, as they are already in the dependency chain
via other packages.

Fixes:
    http://autobuild.buildroot.org/results/223/223f43dd76ee907c5f25c4fee94a0f5d75614dd5/

See also similar changes:
    9993a36f5e12 package/pamtester: fix build without C++
    c05cc5de868c package/madplay: needs autoreconf
    eae18d01abc7 libmad: needs autoreconf
    43274dd3e0da package/libid3tag: needs autoreconf

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/matchbox-startup-monitor/matchbox-startup-monitor.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/matchbox-startup-monitor/matchbox-startup-monitor.mk b/package/matchbox-startup-monitor/matchbox-startup-monitor.mk
index c80e75332c..cd2ae4162f 100644
--- a/package/matchbox-startup-monitor/matchbox-startup-monitor.mk
+++ b/package/matchbox-startup-monitor/matchbox-startup-monitor.mk
@@ -11,4 +11,9 @@ MATCHBOX_STARTUP_MONITOR_LICENSE = GPL-2.0+
 MATCHBOX_STARTUP_MONITOR_LICENSE_FILES = COPYING
 MATCHBOX_STARTUP_MONITOR_DEPENDENCIES = matchbox-lib startup-notification
 
+# Obsolete constructs in the archaic configure.ac generated an outworn
+# configure script that incorrectly searches a C++ compiler. Regenerate
+# the autoconf machinery to avoid failures without a C++ compiler.
+MATCHBOX_STARTUP_MONITOR_AUTORECONF = YES
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
