Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762F8C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 15:36:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE6C0404AA;
	Sun, 11 Dec 2022 15:36:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE6C0404AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y6UoX2qgatSr; Sun, 11 Dec 2022 15:36:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 954B54050F;
	Sun, 11 Dec 2022 15:36:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 954B54050F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 48CF31BF3D6
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 15:36:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A9F94050F
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 15:36:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A9F94050F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0bRQWlk-ntSu for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 15:36:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE6AA404AA
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE6AA404AA
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 15:36:12 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id ud5so22293295ejc.4
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 07:36:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bnpsw5wPaWAmDhb5ChX5cBEmLXNHNcsu8nmPBqUkJFg=;
 b=qPd+9zm8lH0J8rUS9m6G3N36LmdkhIh/06wGDbM5/Mtqcf6uETxb65ShQpClZ2IhwY
 2TIfeudt4gSxDGQBbT7ZgAFYBQ25I3POrXoAbPIUZfpwJwDIttWwkArpmYlcCLml7z1l
 eb3JVjm6MBgE5Sqa3M2xdbONJbN3Pc65/iLoH4zJ5Fb9scL0RKpXRmQvZ2CHD7yOQmGn
 YvEIiY0Z/ct2yH+DJdiZZL2mpqswfD/mSkW73ReO5rm4s6cpUtRT+eEFxDriR8vNQ/HR
 fcqDuLeUVDZd0bYXk3Flvi5tdyJ2FfwqjzlwHWw/O7swfK/g0NXsS1B7lGranpDTRu1T
 J9SQ==
X-Gm-Message-State: ANoB5pmHbDKa2thhbU7kfOUU0tF6tNWhSSk2JR0gsPXUnv7qgg1517NR
 i9dgV5RJq/Fny8SjiH723tEuutCAaw+o7qGn
X-Google-Smtp-Source: AA0mqf6u+Z77T9UpB8/WG6XCSpc3mxqFzhI61ASnUMuihkEKbkH9JRKK5nE8zwV8RSMNgeyUJZhtCg==
X-Received: by 2002:a17:907:2175:b0:7c1:a0e:1607 with SMTP id
 rl21-20020a170907217500b007c10a0e1607mr10611876ejb.12.1670772970605; 
 Sun, 11 Dec 2022 07:36:10 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-54-95-136.retail.telecomitalia.it. [82.54.95.136])
 by smtp.gmail.com with ESMTPSA id
 1-20020a170906210100b007c1675d2626sm797785ejt.96.2022.12.11.07.36.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Dec 2022 07:36:10 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 16:36:02 +0100
Message-Id: <20221211153602.2530749-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bnpsw5wPaWAmDhb5ChX5cBEmLXNHNcsu8nmPBqUkJFg=;
 b=F77nqe+OJ1GfOc6oHaCVosn2TwgPdPQU2Ac9+zP3dmc4JD9IOLXsIHbMbmuhkOfiRF
 HTCj7K0G0oXztlV4Zt8Xz+SxVppvTI5564X3XLmeJGnNZpfGUvHejSPcbPiTJVxyChE3
 pzV24WyDs5qkZMU91IMcJklbnAxBiEsQMJ73k=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=F77nqe+O
Subject: [Buildroot] [PATCH 1/1] package/sscep: fix linking error
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch fixes the following linking error:
buildroot/output/host/lib/gcc/arc-buildroot-linux-uclibc/11.3.0/../../../../arc-buildroot-linux-uclibc/bin/ld:
buildroot/output/host/bin/../arc-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(getopt.os):(.data+0x8):
multiple definition of `optind'; src/getopt.o:(.data+0x0): first defined here
buildroot/output/host/lib/gcc/arc-buildroot-linux-uclibc/11.3.0/../../../../arc-buildroot-linux-uclibc/bin/ld:
buildroot/output/host/bin/../arc-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(getopt.os): in function `__GI_getopt':
getopt.c:(.text+0x5a4): multiple definition of `getopt'; src/getopt.o:getopt.c:(.text+0x0): first defined here
buildroot/output/host/lib/gcc/arc-buildroot-linux-uclibc/11.3.0/../../../../arc-buildroot-linux-uclibc/bin/ld:
buildroot/output/host/bin/../arc-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(getopt.os): in function `getopt_long':
getopt.c:(.text+0x5b0): multiple definition of `getopt_long'; src/getopt.o:getopt.c:(.text+0x128): first defined here
collect2: error: ld returned 1 exit status
make[2]: *** [Makefile:507: sscep] Error 1
make[1]: *** [package/pkg-generic.mk:293: buildroot/output/build/sscep-0.10.0/.stamp_built] Error 2

Patch submitted upstream: https://github.com/certnanny/sscep/pull/163

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
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
