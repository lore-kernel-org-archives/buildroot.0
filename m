Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED8E4C433FE
	for <buildroot@archiver.kernel.org>; Tue, 15 Nov 2022 13:26:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9BFEB40A38;
	Tue, 15 Nov 2022 13:26:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BFEB40A38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mq-e8X0Qlf_r; Tue, 15 Nov 2022 13:26:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA879409EF;
	Tue, 15 Nov 2022 13:26:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA879409EF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4ED7C1BF319
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 13:26:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2AA4960E26
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 13:26:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AA4960E26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sUC9EjjdKjvT for <buildroot@lists.busybox.net>;
 Tue, 15 Nov 2022 13:26:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 541D160DDF
 for <buildroot@buildroot.org>; Tue, 15 Nov 2022 13:26:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 541D160DDF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 445EC83CA1; Tue, 15 Nov 2022 13:26:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 15 Nov 2022 14:16:39 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 7fcd29cb57c50b8e9dea84878b8b54e4fed0ec3c
X-Git-Newrev: ebe54c8ae06b815cac6d9028a733f63c7e4ca2be
X-Patchwork-Hint: ignore
Message-Id: <20221115132631.445EC83CA1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x]
 package/matchbox-startup-monitor: fix build without C++
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

commit: https://git.buildroot.net/buildroot/commit/?id=ebe54c8ae06b815cac6d9028a733f63c7e4ca2be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

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
(cherry picked from commit b44f6c2f303ef03f563edd159b1c88d1cf118ed5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
