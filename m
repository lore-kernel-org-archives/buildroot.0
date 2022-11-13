Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 751FDC61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:20:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED40042B13;
	Mon, 20 Feb 2023 21:20:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED40042B13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PLttnI3TyynJ; Mon, 20 Feb 2023 21:20:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C03FA42D28;
	Mon, 20 Feb 2023 21:20:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C03FA42D28
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1ABBF1BF94D
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92AF8610A6
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92AF8610A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UPqYL-SAqtAh for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7FEFF61026
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FEFF61026
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6C5E28648F; Mon, 20 Feb 2023 20:51:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Nov 2022 21:59:00 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 515319b86f17ea5a2ce3e51c9063bac9f9e00a01
X-Git-Newrev: b44f6c2f303ef03f563edd159b1c88d1cf118ed5
X-Patchwork-Hint: ignore
Message-Id: <20230220205150.6C5E28648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/matchbox-starup-monitor: fix build without C++
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
