Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F7CC001DE
	for <buildroot@archiver.kernel.org>; Fri, 11 Aug 2023 01:41:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E9C341E08;
	Fri, 11 Aug 2023 01:41:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E9C341E08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L9foif-keiki; Fri, 11 Aug 2023 01:41:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15D7641E10;
	Fri, 11 Aug 2023 01:41:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15D7641E10
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7ECDC1BF3C3
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 01:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4AF1F60AB1
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 01:41:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AF1F60AB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y-qIfonyYDmd for <buildroot@lists.busybox.net>;
 Fri, 11 Aug 2023 01:41:18 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 17A0D60AA6
 for <buildroot@buildroot.org>; Fri, 11 Aug 2023 01:41:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17A0D60AA6
Received: by helium.openadk.org (Postfix, from userid 1000)
 id A3934352BD31; Fri, 11 Aug 2023 03:41:15 +0200 (CEST)
Date: Fri, 11 Aug 2023 03:41:15 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZNWRuw83P+HDmpjP@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1691718075; bh=B0FxoFIYIe4We5o550PGJKUbo3k4Tn6M1pSvtT5Mo1I=;
 h=Date:From:To:Subject:From;
 b=iuf0nWElSd55nIMPwXv2hge9sTvBjRAflYaLlVLaJ/tIQj6ccMli0K+z7jk6L1IMS
 iRKfvRuTiJA9s8F67X/dNl0wMrx41uTWNi5xyT1Pco2hSZ17q3RkSFpNxUFPCsvMOr
 u4AQkFWq+2/wFuEf2oI9mx2UvexEqtOvRYvvuoD7TdrS6Wwo9j9IcsfjR8roVipV7w
 oW08XIE7DqslY5cFlc8XnTO2Mc6yf80DzkH7FpNX2zALYiM7GPVtA6q2sSH3WXNhmO
 AV7oUfUHKJx05Ppy9x0ZsFOfeJmPSl1pJbHPWeZTjfh4Il5JfUDxAvj9Ml503eYbhe
 Rrg1qmlgIZSuQ==
Subject: [Buildroot] [PATCH] package/uclibc: add upstream patch to fix
 missing f_owner_ex
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This was previously only defined for aarch64, define the missing
stuff for all architectures.
This is required for the zeek package.

Fixes:
 - http://autobuild.buildroot.net/results/f32/f32777b27c6b4f5a41c255df53502164d21b0fd4

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 ...are-f_owner_ex-for-all-architectures.patch | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 package/uclibc/0002-fcntl.h-declare-f_owner_ex-for-all-architectures.patch

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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
