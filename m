Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DAE1C433FE
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 18:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F75980B95;
	Tue,  4 Jan 2022 18:11:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IO8L3epgJN3r; Tue,  4 Jan 2022 18:11:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83D89812E6;
	Tue,  4 Jan 2022 18:11:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 580C81BF5DB
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5156360B6A
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:09:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FPXWx54R9TU0 for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 18:09:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14C1060C0B
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 18:09:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 6F87983249; Tue,  4 Jan 2022 18:02:57 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 4 Jan 2022 18:49:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 17aa836bd7a2c90da053398ce024b4113cf8b53c
X-Git-Newrev: 7f1acbea1dc7ad7c6cbb4dfc2aafd4bd428b416e
X-Patchwork-Hint: ignore
Message-Id: <20220104180257.6F87983249@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freeipmi: fix uclibc-ng build
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

commit: https://git.buildroot.net/buildroot/commit/?id=7f1acbea1dc7ad7c6cbb4dfc2aafd4bd428b416e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since the addition of the package
in commit 663f39c88c01593855c18355a4decdceeffd884b:

/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/10.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: ../libfreeipmi/.libs/libfreeipmi.a(libfreeipmi_la-ipmi-kcs-driver.o): in function `_ipmi_kcs_test_if_state':
/home/buildroot/autobuild/instance-1/output-1/build/freeipmi-1.6.8/libfreeipmi/driver/ipmi-kcs-driver.c:537: undefined reference to `inb'

Fixes:
 - http://autobuild.buildroot.org/results/13f58266f7747c183033c811a4e8ca6fa30b6f4d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/freeipmi/0002-check-for-inb-and-outb.patch | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/package/freeipmi/0002-check-for-inb-and-outb.patch b/package/freeipmi/0002-check-for-inb-and-outb.patch
new file mode 100644
index 0000000000..3bc006acc7
--- /dev/null
+++ b/package/freeipmi/0002-check-for-inb-and-outb.patch
@@ -0,0 +1,50 @@
+From 47249279f3ef2c1fcfc312294f1c98c35232aed0 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 2 Jan 2022 10:37:00 +0100
+Subject: [PATCH] check for inb and outb
+
+Check for inb and outb before using them to avoid the following build
+failure on uclibc-ng:
+
+/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/10.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: ../libfreeipmi/.libs/libfreeipmi.a(libfreeipmi_la-ipmi-kcs-driver.o): in function `_ipmi_kcs_test_if_state':
+/home/buildroot/autobuild/instance-1/output-1/build/freeipmi-1.6.8/libfreeipmi/driver/ipmi-kcs-driver.c:537: undefined reference to `inb'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/13f58266f7747c183033c811a4e8ca6fa30b6f4d
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/chu11/freeipmi-mirror/pull/50]
+---
+ configure.ac                         | 2 +-
+ libfreeipmi/driver/ipmi-kcs-driver.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 711b27674..bcc4156ff 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -476,7 +476,7 @@ AC_CHECK_FUNCS([memcpy mempcpy memset mlock])
+ AC_CHECK_FUNCS([getline getprogname])
+ AC_CHECK_FUNCS([strerror strerror_r])
+ AC_CHECK_FUNCS([flockfile fputs_unlocked fwrite_unlocked])
+-AC_CHECK_FUNCS([iopl])
++AC_CHECK_FUNCS([inb iopl outb])
+ AC_CHECK_FUNCS([asprintf])
+ AC_CHECK_FUNCS([cbrt])
+ AC_CHECK_FUNCS([getmsg putmsg])
+diff --git a/libfreeipmi/driver/ipmi-kcs-driver.c b/libfreeipmi/driver/ipmi-kcs-driver.c
+index c212887c0..a9d4b2e96 100644
+--- a/libfreeipmi/driver/ipmi-kcs-driver.c
++++ b/libfreeipmi/driver/ipmi-kcs-driver.c
+@@ -162,7 +162,7 @@
+ #if defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__)
+ # define _INB(port)  inb (port)
+ # define _OUTB(data, port)  outb (port, data)
+-#elif defined(HAVE_IOPL)
++#elif defined(HAVE_INB) && defined(HAVE_OUTB)
+ # define _INB(port)  inb (port)
+ # define _OUTB(data, port)  outb (data, port)
+ #else
+-- 
+2.33.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
