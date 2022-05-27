Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFFC3C433EF
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 07:59:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8038360BF3;
	Fri, 27 May 2022 07:59:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aV5cnd19CJNi; Fri, 27 May 2022 07:59:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31347614CF;
	Fri, 27 May 2022 07:59:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 766411BF35C
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 07:58:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD77840B2B
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 07:58:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wxkovv2ywiSt for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 07:58:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D986412F3
 for <buildroot@buildroot.org>; Fri, 27 May 2022 07:58:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 533BB865B4; Fri, 27 May 2022 07:46:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 27 May 2022 09:38:48 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: c31e50ccaaeadad77e8497b5216fae73046d8c1f
X-Git-Newrev: bc61e52ae5f8f6983c2033156df8bced12a0284a
X-Patchwork-Hint: ignore
Message-Id: <20220527074654.533BB865B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/pamtester: fix
 build without C++
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

commit: https://git.buildroot.net/buildroot/commit/?id=bc61e52ae5f8f6983c2033156df8bced12a0284a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

pamtester uses an archaic configure.in with archaic constructs. This
had generated a configure script that incorrectly tries to look for and
validate a C++ compiler:

    checking for powerpc64le-buildroot-linux-gnu-g++... no
    checking whether we are using the GNU C++ compiler... no
    checking whether no accepts -g... no
    checking how to run the C++ preprocessor... /lib/cpp
    configure: error: C++ preprocessor "/lib/cpp" fails sanity check

Calling autoreconf fixes the issue, as the generated configure no longer
tries to look for a C++ compiler at all anymore.

Fixes:
 - http://autobuild.buildroot.org/results/c000aff659da024b6eef42bca824bdea7b5541c2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr: expand commit log; add big-fat comment]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 9993a36f5e1296e86f00376f795de485386bd913)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pamtester/pamtester.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/pamtester/pamtester.mk b/package/pamtester/pamtester.mk
index b09e4d1cc0..77867403c3 100644
--- a/package/pamtester/pamtester.mk
+++ b/package/pamtester/pamtester.mk
@@ -10,4 +10,9 @@ PAMTESTER_DEPENDENCIES = linux-pam
 PAMTESTER_LICENSE = BSD-3-Clause
 PAMTESTER_LICENSE_FILES = LICENSE
 
+# Obsolete constructs in the archaic configure.in generated an outworn
+# configure script that incorrectly searches a C++ compiler. Regenerate
+# the autoconf machinery to avoid failures without a C++ compiler.
+PAMTESTER_AUTORECONF = YES
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
