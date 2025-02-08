Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA73BC282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:16:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DEA085C25;
	Fri, 28 Feb 2025 17:16:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tlEgoQIguxrT; Fri, 28 Feb 2025 17:16:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09E9985C28
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09E9985C28;
	Fri, 28 Feb 2025 17:16:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0885968
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A18C42516
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U47w9uUEGezf for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BAAB445A5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7BAAB445A5
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7480387611; Fri, 28 Feb 2025 16:30:37 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 8 Feb 2025 22:36:48 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5f5e35104322e72a2d683248e86b157c9d0f2819
X-Git-Newrev: 912a8458a96a7ee3fb391a507244a9084b03fb72
X-Patchwork-Hint: ignore
Message-Id: <20250228163037.7480387611@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/qemu: fix build with
 glibc >= 2.41
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: multipart/mixed; boundary="===============0274598405603496767=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0274598405603496767==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=912a8458a96a7ee3fb391a507244a9084b03fb72
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

When host or target qemu is built with glibc >= 2.41 and Linux
user-land emulation (BR2_PACKAGE_QEMU_LINUX_USER=y or
BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE=y), compilation fails with
output:

    ../linux-user/syscall.c:362:8: error: redefinition of ‘struct sched_attr’
      362 | struct sched_attr {
          |        ^~~~~~~~~~
    In file included from /usr/include/bits/sched.h:63,
                     from /usr/include/sched.h:43,
                     from /usr/include/pthread.h:22,
                     from /home/buildroot/buildroot/output/per-package/host-qemu/host/include/glib-2.0/glib/deprecated/gthread.h:126,
                     from /home/buildroot/buildroot/output/per-package/host-qemu/host/include/glib-2.0/glib.h:115,
                     from /home/buildroot/buildroot/output/build/host-qemu-9.2.0/include/glib-compat.h:32,
                     from /home/buildroot/buildroot/output/build/host-qemu-9.2.0/include/qemu/osdep.h:161,
                     from ../linux-user/syscall.c:20:
    /usr/include/linux/sched/types.h:98:8: note: originally defined here
       98 | struct sched_attr {
          |        ^~~~~~~~~~

For information, the Buildroot glibc package has been bumped in
commit [1]. Also, major distributions are starting to publish updates
to glibc 2.41. See for example Arch Linux update [2].

This commit adds a package patch to solve this issue.

Fixes:
- https://autobuild.buildroot.org/results/e8733bdf78d8e9448988c3d300c43a47f62375d8/
- and many others...

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/6ecab31fad12a494ec0d2a3767c736a55c80a769
[2] https://gitlab.archlinux.org/archlinux/packaging/packages/glibc/-/commit/7cebc144906a0fb68a5f6e75985b386c722ffbd9

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Julien: reworded the commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...3-sched_attr-Do-not-define-for-glibc-2.41.patch | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/package/qemu/0003-sched_attr-Do-not-define-for-glibc-2.41.patch b/package/qemu/0003-sched_attr-Do-not-define-for-glibc-2.41.patch
new file mode 100644
index 0000000000..11edc27c2f
--- /dev/null
+++ b/package/qemu/0003-sched_attr-Do-not-define-for-glibc-2.41.patch
@@ -0,0 +1,49 @@
+From 66b1926d72ef51d4d59d0f97061f26a75651e265 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 11 Oct 2024 12:31:40 -0700
+Subject: [PATCH] sched_attr: Do not define for glibc >= 2.41
+
+glibc 2.41+ has added [1] definitions for sched_setattr and sched_getattr functions
+and struct sched_attr. Therefore, it needs to be checked for here as well before
+defining sched_attr
+
+Define sched_attr conditionally on SCHED_ATTR_SIZE_VER0
+
+Fixes builds with glibc/trunk
+
+[1] https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=21571ca0d70302909cf72707b2a7736cf12190a0;hp=298bc488fdc047da37482f4003023cb9adef78f8
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Cc: Laurent Vivier <laurent@vivier.eu>
+Cc: Paolo Bonzini <pbonzini@redhat.com>
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+Upstream: https://patchwork.kernel.org/project/qemu-devel/patch/20241011193140.1047648-1-raj.khem@gmail.com/
+---
+ linux-user/syscall.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/linux-user/syscall.c b/linux-user/syscall.c
+index 1ce4c79784..a407d4a023 100644
+--- a/linux-user/syscall.c
++++ b/linux-user/syscall.c
+@@ -358,7 +358,8 @@ _syscall3(int, sys_sched_getaffinity, pid_t, pid, unsigned int, len,
+ #define __NR_sys_sched_setaffinity __NR_sched_setaffinity
+ _syscall3(int, sys_sched_setaffinity, pid_t, pid, unsigned int, len,
+           unsigned long *, user_mask_ptr);
+-/* sched_attr is not defined in glibc */
++/* sched_attr is not defined in glibc < 2.41 */
++#ifndef SCHED_ATTR_SIZE_VER0
+ struct sched_attr {
+     uint32_t size;
+     uint32_t sched_policy;
+@@ -371,6 +372,7 @@ struct sched_attr {
+     uint32_t sched_util_min;
+     uint32_t sched_util_max;
+ };
++#endif
+ #define __NR_sys_sched_getattr __NR_sched_getattr
+ _syscall4(int, sys_sched_getattr, pid_t, pid, struct sched_attr *, attr,
+           unsigned int, size, unsigned int, flags);
+-- 
+2.34.1
+

--===============0274598405603496767==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0274598405603496767==--
