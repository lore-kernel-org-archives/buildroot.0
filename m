Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A9FC4332F
	for <buildroot@archiver.kernel.org>; Thu, 15 Dec 2022 18:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D3D140CEB;
	Thu, 15 Dec 2022 18:33:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D3D140CEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H7dzhUr0DQfb; Thu, 15 Dec 2022 18:33:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 36A0D40C96;
	Thu, 15 Dec 2022 18:33:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36A0D40C96
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 49C561BF334
 for <buildroot@lists.busybox.net>; Thu, 15 Dec 2022 18:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2570582069
 for <buildroot@lists.busybox.net>; Thu, 15 Dec 2022 18:33:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2570582069
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 65QfeAYLlU1D for <buildroot@lists.busybox.net>;
 Thu, 15 Dec 2022 18:33:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E55918204C
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E55918204C
 for <buildroot@buildroot.org>; Thu, 15 Dec 2022 18:33:51 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id i15so442182edf.2
 for <buildroot@buildroot.org>; Thu, 15 Dec 2022 10:33:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i1e2ZEGhmykZA3YTP0XoZZhVBNw9Is7kY/M2P8r7o34=;
 b=z2N1LdpzLpNi61r7WTh11raqtj4OHHZ91jgOhqOknBJPg51Ma17RHkiUqky0rK7VQX
 wf8Sod7DC8FiGklLgrMhqFgIYNoLHqcvxSREDWcKT0y0Ep4FJBZEylPBHYO0yKEstZYM
 v6KTW68EH1gzLwJyF+hpWJWds1+GN+23BooLg6uM7iQhvGfo7R3xiu5R7WkEvayqqIgz
 4vVk8qh2XRj4FfwG12j4b0xJQUQFcIJHSSwbxHFF0/3iIi2izOIhTud8NO51j/XDvuEI
 QkEj6nC8zsNvm0s1gJIk4x6aPQxTCc4mg7i93pSel4z5Mjvfv1Im2E3AtutPvsdUjmhx
 3OFQ==
X-Gm-Message-State: ANoB5pkfL1Z/NAe5UghVv6TiYuMGJ8sF+wZXJkR/egd5tIf+9WV5b3p4
 N86DXVXBN5bqe8kmOzusduMbEHjfe3YSM7xD
X-Google-Smtp-Source: AA0mqf5PGz9jrflioi3s3UJuXIU6sv7c/Lx5BzOy2ue6HB33TVPyOa75WHzv+KE9CkeXj1k1p3wTsQ==
X-Received: by 2002:a50:ed0a:0:b0:46b:19ab:68d8 with SMTP id
 j10-20020a50ed0a000000b0046b19ab68d8mr26784570eds.40.1671129230035; 
 Thu, 15 Dec 2022 10:33:50 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 (host-82-54-95-136.retail.telecomitalia.it. [82.54.95.136])
 by smtp.gmail.com with ESMTPSA id
 j2-20020aa7de82000000b004585eba4baesm7709643edv.80.2022.12.15.10.33.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 10:33:49 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 15 Dec 2022 19:33:39 +0100
Message-Id: <20221215183339.3771397-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=i1e2ZEGhmykZA3YTP0XoZZhVBNw9Is7kY/M2P8r7o34=;
 b=QEsOP4F2ox+Z9nTS7oHMR1bqnUoxBqiohVeIpEvTI7y9Z45JgrUCxfVOg3Dbb9FkyP
 ki0c4grGgdkSWGkhO/JvhPQb2W/NtP6TY1GP7cugPvOPsQMSXW6fi6XqHkd3sZaiw5Yp
 kvpaHen2PAA+VaP1obNsrFbWA7Shu5A6H6CwE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=QEsOP4F2
Subject: [Buildroot] [PATCH v2 1/1] package/sscep: fix linking error
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Apply the patch to fix the following build failure raised since the
addition of the package in commit
72fa60dc102679f51b228336ec38f5af78ff7646:

uclibc/sysroot/usr/lib/libc.a(getopt.os): in function `__GI_getopt':
getopt.c:(.text+0x598): multiple definition of `getopt'; src/getopt.o:getopt.c:(.text+0x0): first defined here

The patch has been submitted and accepted upstream to address this issue.

Fixes:
 - http://autobuild.buildroot.net/results/844c7dd79f69ef2ea8f293bb73a2d4b7533aa97c

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
Changes in v2:
- Add autobuild reference to commit message.
- The applied patch has ben accepted, so update the commit message.

 .../sscep/0001-Fix-getopt-linking-error.patch | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 package/sscep/0001-Fix-getopt-linking-error.patch

diff --git a/package/sscep/0001-Fix-getopt-linking-error.patch b/package/sscep/0001-Fix-getopt-linking-error.patch
new file mode 100644
index 000000000000..b32613b3cc18
--- /dev/null
+++ b/package/sscep/0001-Fix-getopt-linking-error.patch
@@ -0,0 +1,55 @@
+From c4fc8d9e282e05fcfa0cee9362c60742b26f4b33 Mon Sep 17 00:00:00 2001
+From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Date: Fri, 9 Dec 2022 18:18:27 +0100
+Subject: [PATCH] Fix getopt linking error
+
+The buildroot project, to which the sscep application was added, has
+configurations that raise the following linking error:
+buildroot/output/host/lib/gcc/arc-buildroot-linux-uclibc/11.3.0/../../../../arc-buildroot-linux-uclibc/bin/ld: buildroot/output/host/bin/../arc-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(getopt.os):(.data+0x8): multiple definition of `optind'; src/getopt.o:(.data+0x0): first defined here
+buildroot/output/host/lib/gcc/arc-buildroot-linux-uclibc/11.3.0/../../../../arc-buildroot-linux-uclibc/bin/ld: buildroot/output/host/bin/../arc-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(getopt.os): in function `__GI_getopt':
+getopt.c:(.text+0x5a4): multiple definition of `getopt'; src/getopt.o:getopt.c:(.text+0x0): first defined here
+buildroot/output/host/lib/gcc/arc-buildroot-linux-uclibc/11.3.0/../../../../arc-buildroot-linux-uclibc/bin/ld: buildroot/output/host/bin/../arc-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(getopt.os): in function `getopt_long':
+getopt.c:(.text+0x5b0): multiple definition of `getopt_long'; src/getopt.o:getopt.c:(.text+0x128): first defined here
+collect2: error: ld returned 1 exit status
+make[2]: *** [Makefile:507: sscep] Error 1
+make[1]: *** [package/pkg-generic.mk:293: buildroot/output/build/sscep-0.10.0/.stamp_built] Error 2
+
+The patch re-added a check that commit
+81f56f635259b9 ("Replaced GNU getopt by a BSD licensed alternative")
+removed.
+
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+---
+ src/getopt.c | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/src/getopt.c b/src/getopt.c
+index eae36a64afff..0109406ba4ac 100644
+--- a/src/getopt.c
++++ b/src/getopt.c
+@@ -31,6 +31,16 @@
+ #include <stddef.h>
+ #include <string.h>
+ 
++#define GETOPT_INTERFACE_VERSION 2
++#if !defined _LIBC && defined __GLIBC__ && __GLIBC__ >= 2
++# include <gnu-versions.h>
++# if _GNU_GETOPT_INTERFACE_VERSION == GETOPT_INTERFACE_VERSION
++#  define ELIDE_CODE
++# endif
++#endif
++
++#ifndef ELIDE_CODE
++
+ char* optarg;
+ int optopt;
+ /* The variable optind [...] shall be initialized to 1 by the system. */
+@@ -226,3 +236,5 @@ int getopt_long(int argc, char* const argv[], const char* optstring,
+   ++optind;
+   return retval;
+ }
++
++#endif	/* Not ELIDE_CODE.  */
+-- 
+2.32.0
+
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
