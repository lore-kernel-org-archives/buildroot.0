Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD9BCA0EC3
	for <buildroot@archiver.kernel.org>; Tue, 12 Sep 2023 06:27:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5C1761102;
	Tue, 12 Sep 2023 06:27:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5C1761102
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9Zmw9stcjc44; Tue, 12 Sep 2023 06:27:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0C0E610FB;
	Tue, 12 Sep 2023 06:27:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0C0E610FB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 36CBF1BF964
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 06:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1080760E03
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 06:27:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1080760E03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y_2cxz718Y6t for <buildroot@lists.busybox.net>;
 Tue, 12 Sep 2023 06:27:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 17546610C3
 for <buildroot@buildroot.org>; Tue, 12 Sep 2023 06:27:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17546610C3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 07CBF86D74; Tue, 12 Sep 2023 06:27:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 12 Sep 2023 08:23:26 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: f167241d899acb48f79a7f0dce07008d1f674802
X-Git-Newrev: c8ab50d20696b4cea98ac4984606e2d43699dc20
X-Patchwork-Hint: ignore
Message-Id: <20230912062710.07CBF86D74@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/uclibc: add
 upstream patch to fix missing f_owner_ex
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

commit: https://git.buildroot.net/buildroot/commit/?id=c8ab50d20696b4cea98ac4984606e2d43699dc20
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

This was previously only defined for aarch64, define the missing
stuff for all architectures.
This is required for the zeek package.

Fixes:
 - http://autobuild.buildroot.net/results/f32/f32777b27c6b4f5a41c255df53502164d21b0fd4

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 55b47a406095085bad3dc7e147f1162ba9d2ff30)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-declare-f_owner_ex-for-all-architectures.patch | 85 ++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/package/uclibc/0002-fcntl.h-declare-f_owner_ex-for-all-architectures.patch b/package/uclibc/0002-fcntl.h-declare-f_owner_ex-for-all-architectures.patch
new file mode 100644
index 0000000000..da0135a5e3
--- /dev/null
+++ b/package/uclibc/0002-fcntl.h-declare-f_owner_ex-for-all-architectures.patch
@@ -0,0 +1,85 @@
+From 98576ab8de710507419b016fbcfc82ed7c57f9c3 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Wed, 9 Aug 2023 10:31:28 +0200
+Subject: [PATCH] fcntl.h: declare f_owner_ex for all architectures
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=98576ab8de710507419b016fbcfc82ed7c57f9c3
+---
+ include/fcntl.h                         | 20 ++++++++++++++++++++
+ libc/sysdeps/linux/aarch64/bits/fcntl.h | 21 ---------------------
+ 2 files changed, 20 insertions(+), 21 deletions(-)
+
+diff --git a/include/fcntl.h b/include/fcntl.h
+index 136f64d70..ce15ceaf6 100644
+--- a/include/fcntl.h
++++ b/include/fcntl.h
+@@ -296,6 +296,26 @@ int name_to_handle_at(int dirfd, const char *pathname,
+ int open_by_handle_at(int mount_fd, struct file_handle *handle, int flags);
+ #endif
+ 
++#ifdef __USE_GNU
++# define F_SETOWN_EX	15	/* Get owner (thread receiving SIGIO).  */
++# define F_GETOWN_EX	16	/* Set owner (thread receiving SIGIO).  */
++/* Owner types.  */
++enum __pid_type
++  {
++    F_OWNER_TID = 0,		/* Kernel thread.  */
++    F_OWNER_PID,		/* Process.  */
++    F_OWNER_PGRP,		/* Process group.  */
++    F_OWNER_GID = F_OWNER_PGRP	/* Alternative, obsolete name.  */
++  };
++
++/* Structure to use with F_GETOWN_EX and F_SETOWN_EX.  */
++struct f_owner_ex
++  {
++    enum __pid_type type;	/* Owner type of ID.  */
++    __pid_t pid;		/* ID of owner.  */
++  };
++#endif
++
+ __END_DECLS
+ 
+ #endif /* fcntl.h  */
+diff --git a/libc/sysdeps/linux/aarch64/bits/fcntl.h b/libc/sysdeps/linux/aarch64/bits/fcntl.h
+index c143ba9c9..dbe929351 100644
+--- a/libc/sysdeps/linux/aarch64/bits/fcntl.h
++++ b/libc/sysdeps/linux/aarch64/bits/fcntl.h
+@@ -94,8 +94,6 @@
+ #ifdef __USE_GNU
+ # define F_SETSIG	10	/* Set number of signal to be sent.  */
+ # define F_GETSIG	11	/* Get number of signal to be sent.  */
+-# define F_SETOWN_EX	15	/* Get owner (thread receiving SIGIO).  */
+-# define F_GETOWN_EX	16	/* Set owner (thread receiving SIGIO).  */
+ #endif
+ 
+ 
+@@ -170,25 +168,6 @@ struct flock64
+   };
+ #endif
+ 
+-
+-#ifdef __USE_GNU
+-/* Owner types.  */
+-enum __pid_type
+-  {
+-    F_OWNER_TID = 0,		/* Kernel thread.  */
+-    F_OWNER_PID,		/* Process.  */
+-    F_OWNER_PGRP,		/* Process group.  */
+-    F_OWNER_GID = F_OWNER_PGRP	/* Alternative, obsolete name.  */
+-  };
+-
+-/* Structure to use with F_GETOWN_EX and F_SETOWN_EX.  */
+-struct f_owner_ex
+-  {
+-    enum __pid_type type;	/* Owner type of ID.  */
+-    __pid_t pid;		/* ID of owner.  */
+-  };
+-#endif
+-
+ /* Define some more compatibility macros to be backward compatible with
+    BSD systems which did not managed to hide these kernel macros.  */
+ #ifdef	__USE_BSD
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
