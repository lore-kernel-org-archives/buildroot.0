Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97689C77B7C
	for <buildroot@archiver.kernel.org>; Thu, 11 May 2023 08:37:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19FD3616AD;
	Thu, 11 May 2023 08:37:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19FD3616AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zHX3Ca9OmbBO; Thu, 11 May 2023 08:36:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D08E60BF2;
	Thu, 11 May 2023 08:36:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D08E60BF2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CC6471BF2A4
 for <buildroot@lists.busybox.net>; Thu, 11 May 2023 08:36:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8671560BF2
 for <buildroot@lists.busybox.net>; Thu, 11 May 2023 08:36:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8671560BF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6tNcu0R1nmkC for <buildroot@lists.busybox.net>;
 Thu, 11 May 2023 08:36:55 +0000 (UTC)
X-Greylist: delayed 00:08:15 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A2B460BF0
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0A2B460BF0
 for <buildroot@buildroot.org>; Thu, 11 May 2023 08:36:54 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 7EDC33520A7C; Thu, 11 May 2023 10:28:36 +0200 (CEST)
Date: Thu, 11 May 2023 10:28:36 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZFynNDDPCKXMDGsK@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1683793716; bh=tWPwKiAHv3GZxeV6/UYe3H7QSl2yx70c9+KeUqlosTk=;
 h=Date:From:To:Subject:From;
 b=b6dhYT2WUKR5ZXrQxEVCxQ4Foguc1BjPnO+X+nD/zWpOcoElJu9LPnBCGFYQhtr9j
 2K/OuZ9IVpCgCw4QpdgC3e4gwfr6ihpyq0kx6ZELbOd8VqTw1iUx8UjNq8Hrsk/XRq
 VQ7DFfbw/tbecj+8KkjeP52V9d54rYOXUFT1DQ0n7mQvUuGYngzsdZkfDKUiYb51PW
 9xR/ODERHnhfP8mR7hc7qA/877id+zaN3RM8ZGWWUNtymIOpbizAMM6ZxbRaeyMsjV
 QQ6/mnL/1tCiiQlqxuKZX2bUv/o9JGXE7t/xkiixafbv0HPLr7lSX9tTTswF9o1JCf
 TqKVq371slQMw==
Subject: [Buildroot] [PATCH] uclibc: fix static builds
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

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 .../0001-gettimeofday-fix-static-build.patch  | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/uclibc/0001-gettimeofday-fix-static-build.patch

diff --git a/package/uclibc/0001-gettimeofday-fix-static-build.patch b/package/uclibc/0001-gettimeofday-fix-static-build.patch
new file mode 100644
index 0000000000..f09d77b057
--- /dev/null
+++ b/package/uclibc/0001-gettimeofday-fix-static-build.patch
@@ -0,0 +1,28 @@
+From b19f8f360970ffd0c1a6ac41e07c66dc39790b16 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Wed, 10 May 2023 08:35:25 +0200
+Subject: [PATCH] gettimeofday: fix static build
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+---
+ libc/sysdeps/linux/common/gettimeofday.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/libc/sysdeps/linux/common/gettimeofday.c b/libc/sysdeps/linux/common/gettimeofday.c
+index e5141088e..12473a8e6 100755
+--- a/libc/sysdeps/linux/common/gettimeofday.c
++++ b/libc/sysdeps/linux/common/gettimeofday.c
+@@ -9,8 +9,9 @@
+ #include <sys/syscall.h>
+ #include <sys/time.h>
+ 
++#ifdef SHARED
+ #include "ldso.h"
+-
++#endif
+ 
+ 
+ #ifdef __VDSO_SUPPORT__
+-- 
+2.30.2
+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
