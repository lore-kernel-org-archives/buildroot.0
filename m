Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7300C433F5
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 22:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B6EF60F96;
	Tue,  1 Feb 2022 22:07:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NxxcNooJGQCI; Tue,  1 Feb 2022 22:07:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF2B560EE9;
	Tue,  1 Feb 2022 22:07:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 353981BF97F
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:05:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 81ACA82F40
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:05:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6_chL-qJn9xc for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 22:05:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA15D832D1
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 22:05:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id F0AD282817; Tue,  1 Feb 2022 21:58:21 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 1 Feb 2022 22:23:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c97e139924c28f98dae13b3c0ef2f5c1f75e1d70
X-Git-Newrev: d3e453e96401e0df74b385e296373bd29ddd6c4c
X-Patchwork-Hint: ignore
Message-Id: <20220201215821.F0AD282817@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/liburing: fix static build
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

commit: https://git.buildroot.net/buildroot/commit/?id=d3e453e96401e0df74b385e296373bd29ddd6c4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following static build failure raised since the addition of the
package in commit 03ca6f4e39874583060317e7e15e9e360220877e:

>>> liburing 2.1 Installing to staging directory
PATH="/home/buildroot/autobuild/instance-3/output-1/host/bin:/home/buildroot/autobuild/instance-3/output-1/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" /usr/bin/make -j4 -C /home/buildroot/autobuild/instance-3/output-1/build/liburing-2.1 DESTDIR=/home/buildroot/autobuild/instance-3/output-1/host/arc-buildroot-linux-uclibc/sysroot install
make[1]: Entering directory '/home/buildroot/autobuild/instance-3/output-1/build/liburing-2.1'
sed -e "s%@prefix@%/usr%g" \
    -e "s%@libdir@%/usr/lib%g" \
    -e "s%@includedir@%/usr/include%g" \
    -e "s%@NAME@%liburing%g" \
    -e "s%@VERSION@%2.0%g" \
    liburing.pc.in >liburing.pc
make[2]: Entering directory '/home/buildroot/autobuild/instance-3/output-1/build/liburing-2.1/src'
     CC setup.os
     CC queue.os
     CC syscall.os
     CC register.os
     CC liburing.so.2.1.0
/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/arc-buildroot-linux-uclibc/10.2.0/../../../../arc-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/instance-3/output-1/host/arc-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(__uClibc_main.os): in function `__uClibc_fini':
__uClibc_main.c:(.text+0xa2): undefined reference to `__fini_array_start'

Fixes:
 - http://autobuild.buildroot.org/results/54c67e0f5bd2b5f520a250dc13b5846f94fc1790

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/liburing/liburing.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/liburing/liburing.mk b/package/liburing/liburing.mk
index 74ce4156f8..874e268d43 100644
--- a/package/liburing/liburing.mk
+++ b/package/liburing/liburing.mk
@@ -30,11 +30,13 @@ define LIBURING_BUILD_CMDS
 endef
 
 define LIBURING_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) $(LIBURING_MAKE_OPTS) -C $(@D) \
+		DESTDIR=$(STAGING_DIR) install
 endef
 
 define LIBURING_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) $(LIBURING_MAKE_OPTS) -C $(@D) \
+		DESTDIR=$(TARGET_DIR) install
 endef
 
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
