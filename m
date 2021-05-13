Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E8A9C432BE
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:10:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15EFB60F02
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:10:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 15EFB60F02
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9AD40414FF;
	Tue,  3 Aug 2021 21:10:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HGHF38YC0_62; Tue,  3 Aug 2021 21:10:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CEA3440E6D;
	Tue,  3 Aug 2021 21:10:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5E51B1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 567A14044C
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UCGHwgT8Q2IG for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47059400C7
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9E5578B43E; Tue,  3 Aug 2021 21:09:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 13 May 2021 09:47:51 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a7a58df5f0de618360c8b4e39ec5f5f6b2da0975
X-Git-Newrev: b8a1301e81b56e81b8abca6c00e5dccb6e3ff661
X-Patchwork-Hint: ignore
Message-Id: <20210803210935.9E5578B43E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/rt-tests: add patch to
 fix compatibility with make 3.81
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=b8a1301e81b56e81b8abca6c00e5dccb6e3ff661
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes:
http://autobuild.buildroot.net/results/cf7c4f360f5464c700788cc8299fd086544c80e8/build-end.log

Older GNU make versions don't like the explicit undefine.  It isn't really
needed as ifdef handles undefined and defined-to-the-empty-string the same
way, so just drop the undefine logic.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...op-explicit-undefine-PYLIB-for-compatibil.patch | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/package/rt-tests/0002-Makefile-drop-explicit-undefine-PYLIB-for-compatibil.patch b/package/rt-tests/0002-Makefile-drop-explicit-undefine-PYLIB-for-compatibil.patch
new file mode 100644
index 0000000000..f71ba09a79
--- /dev/null
+++ b/package/rt-tests/0002-Makefile-drop-explicit-undefine-PYLIB-for-compatibil.patch
@@ -0,0 +1,48 @@
+From 84fea5d784e010f84c860b34e55ea2c855c17b3b Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <peter@korsgaard.com>
+Date: Wed, 12 May 2021 09:18:33 +0200
+Subject: [PATCH] Makefile: drop explicit undefine PYLIB for compatibility with
+ make 3.81
+
+GNU make 3.81 does not like the explicit tab-indented undefine:
+
+Makefile:41: *** commands commence before first target.  Stop.
+
+Dropping the indentation also doesn't work:
+
+Makefile:41: *** missing separator.  Stop.
+
+So simply drop the undefine logic.  As explained in the GNU make manual,
+undefine is not commonly needed as E.G. ifdef checks for a non-zero string:
+
+https://www.gnu.org/software/make/manual/html_node/Undefine-Directive.html
+https://www.gnu.org/software/make/manual/html_node/Conditional-Syntax.html
+
+Fixes:
+http://autobuild.buildroot.net/results/cf7c4f360f5464c700788cc8299fd086544c80e8/build-end.log
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+[Upstream: https://marc.info/?l=linux-rt-users&m=162080462211139&w=2]
+---
+ Makefile | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index b17ac09..ec85ac8 100644
+--- a/Makefile
++++ b/Makefile
+@@ -36,11 +36,6 @@ LDFLAGS ?=
+ 
+ PYLIB  ?= $(shell python3 -c 'import distutils.sysconfig;  print (distutils.sysconfig.get_python_lib())')
+ 
+-# Check for errors, such as python3 not available
+-ifeq (${PYLIB},)
+-	undefine PYLIB
+-endif
+-
+ MANPAGES = src/cyclictest/cyclictest.8 \
+ 	   src/pi_tests/pi_stress.8 \
+ 	   src/ptsematest/ptsematest.8 \
+-- 
+2.20.1
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
