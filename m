Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F2CBC433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Dec 2021 22:36:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9FFC8126B;
	Sun, 26 Dec 2021 22:36:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nGZtYCSzI6aD; Sun, 26 Dec 2021 22:36:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C56F8124D;
	Sun, 26 Dec 2021 22:36:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DFA141BF2B9
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 22:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D02F4401FC
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 22:36:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tnZjqBpu6GdE for <buildroot@lists.busybox.net>;
 Sun, 26 Dec 2021 22:36:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 27457401CC
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 22:36:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 62AB282B46; Sun, 26 Dec 2021 22:31:08 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 26 Dec 2021 23:36:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ea0f6e803af359173ff276f8c5706ff4cb025182
X-Git-Newrev: 1118f2c51c357d968e2d08e31ad3c741f5fa7df8
X-Patchwork-Hint: ignore
Message-Id: <20211226223108.62AB282B46@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lttng-libust: set
 -DUATOMIC_NO_LINK_ERROR
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

commit: https://git.buildroot.net/buildroot/commit/?id=1118f2c51c357d968e2d08e31ad3c741f5fa7df8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set -DUATOMIC_NO_LINK_ERROR as suggested by upstream in
https://www.mail-archive.com/lttng-dev@lists.lttng.org/msg12950.html to
avoid the following build failure with lttng-tools raised since bump to
version 2.13.1 in commit 733bf73e3ff86dd80e68e22c0ccc2f43e4a3d475:

/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mips64el-buildroot-linux-gnu/9.3.0/../../../../mips64el-buildroot-linux-gnu/bin/ld: /home/buildroot/autobuild/instance-1/output-1/host/mips64el-buildroot-linux-gnu/sysroot/usr/lib/liblttng-ust-ctl.so: undefined reference to `_uatomic_link_error'

Fixes:
 - http://autobuild.buildroot.org/results/066c72f04b4c82df3c5c6a75d2eef232d4468612

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lttng-libust/lttng-libust.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index 690d18fe3d..8ce47021c9 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -17,6 +17,8 @@ LTTNG_LIBUST_CONF_OPTS = \
 	--disable-tests \
 	--with-lttng-system-rundir=/run/lttng
 LTTNG_LIBUST_AUTORECONF = YES
+# https://www.mail-archive.com/lttng-dev@lists.lttng.org/msg12950.html
+LTTNG_LIBUST_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -DUATOMIC_NO_LINK_ERROR"
 
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 LTTNG_LIBUST_DEPENDENCIES += python
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
