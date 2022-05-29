Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB81C433EF
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 21:21:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B00E40B81;
	Sun, 29 May 2022 21:21:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V9kexacUZJti; Sun, 29 May 2022 21:21:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0AAAB401C2;
	Sun, 29 May 2022 21:21:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0D8C91BF336
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 21:21:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0431401C2
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 21:21:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KAMPsi6JTxwF for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 21:21:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C52C400FF
 for <buildroot@buildroot.org>; Sun, 29 May 2022 21:21:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 98AE686718; Sun, 29 May 2022 21:10:11 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 May 2022 23:16:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5ce233da959882032af6e64e71541425247cc397
X-Git-Newrev: a7a5626e8e9a813c6f7d8493fec3df2bae9b8f9b
X-Patchwork-Hint: ignore
Message-Id: <20220529211011.98AE686718@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: fix musl and uclibc-ng build
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

commit: https://git.buildroot.net/buildroot/commit/?id=a7a5626e8e9a813c6f7d8493fec3df2bae9b8f9b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following musl and uclibc-ng build failure raised since bump to
version 7.0.0 in commit 3fa79c038ec75228015ea0022de80c5e7a2003f8 and
https://git.qemu.org/?p=qemu.git;a=commit;h=244fd08323088db73590ff2317dfe86f810b51d7:

../linux-user/syscall.c: In function 'target_to_host_resource':
../linux-user/syscall.c:1057:16: error: 'RLIMIT_RTTIME' undeclared (first use in this function); did you mean 'RLIMIT_NOFILE'?
 1057 |         return RLIMIT_RTTIME;
      |                ^~~~~~~~~~~~~
      |                RLIMIT_NOFILE

Fixes:
 - http://autobuild.buildroot.org/results/22d3b584b704613d030e1ea9e6b709b713e4cc26

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...syscall.c-fix-build-without-RLIMIT_RTTIME.patch | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/package/qemu/0003-linux-user-syscall.c-fix-build-without-RLIMIT_RTTIME.patch b/package/qemu/0003-linux-user-syscall.c-fix-build-without-RLIMIT_RTTIME.patch
new file mode 100644
index 0000000000..729c2e9be8
--- /dev/null
+++ b/package/qemu/0003-linux-user-syscall.c-fix-build-without-RLIMIT_RTTIME.patch
@@ -0,0 +1,48 @@
+From 84863e007d4ef0858e74a1250e2472954924c617 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 14 May 2022 16:10:16 +0200
+Subject: [PATCH] linux-user/syscall.c: fix build without RLIMIT_RTTIME
+
+RLIMIT_RTTIME is not provided by uclibc-ng or by musl prior to version
+1.2.0 and
+https://github.com/bminor/musl/commit/2507e7f5312e79620f6337935d0a6c9045ccba09
+resulting in the following build failure since
+https://git.qemu.org/?p=qemu.git;a=commit;h=244fd08323088db73590ff2317dfe86f810b51d7:
+
+../linux-user/syscall.c: In function 'target_to_host_resource':
+../linux-user/syscall.c:1057:16: error: 'RLIMIT_RTTIME' undeclared (first use in this function); did you mean 'RLIMIT_NOFILE'?
+ 1057 |         return RLIMIT_RTTIME;
+      |                ^~~~~~~~~~~~~
+      |                RLIMIT_NOFILE
+
+Fixes:
+ - http://autobuild.buildroot.org/results/22d3b584b704613d030e1ea9e6b709b713e4cc26
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://patchwork.ozlabs.org/project/qemu-devel/patch/20220523105239.1499162-1-fontaine.fabrice@gmail.com]
+---
+Changes v1 -> v2 (after review of Laurent Vivier):
+ - Use an ifdef block instead of defining RLIMIT_RTTIME
+
+ linux-user/syscall.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/linux-user/syscall.c b/linux-user/syscall.c
+index dd0d92ba4e..488facb356 100644
+--- a/linux-user/syscall.c
++++ b/linux-user/syscall.c
+@@ -1053,8 +1053,10 @@ static inline int target_to_host_resource(int code)
+         return RLIMIT_RSS;
+     case TARGET_RLIMIT_RTPRIO:
+         return RLIMIT_RTPRIO;
++#ifdef RLIMIT_RTTIME
+     case TARGET_RLIMIT_RTTIME:
+         return RLIMIT_RTTIME;
++#endif
+     case TARGET_RLIMIT_SIGPENDING:
+         return RLIMIT_SIGPENDING;
+     case TARGET_RLIMIT_STACK:
+-- 
+2.35.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
