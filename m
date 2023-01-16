Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55EBDC67871
	for <buildroot@archiver.kernel.org>; Mon, 16 Jan 2023 18:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC73040860;
	Mon, 16 Jan 2023 18:06:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC73040860
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OXPXh1-zc8TH; Mon, 16 Jan 2023 18:06:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AEF14085D;
	Mon, 16 Jan 2023 18:06:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AEF14085D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E8E921BF3D6
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 18:06:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C370B40B81
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 18:06:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C370B40B81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aEyhKQEzsQ7P for <buildroot@lists.busybox.net>;
 Mon, 16 Jan 2023 18:06:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE9D84052F
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AE9D84052F
 for <buildroot@buildroot.org>; Mon, 16 Jan 2023 18:06:04 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id qx13so11533022ejb.13
 for <buildroot@buildroot.org>; Mon, 16 Jan 2023 10:06:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i1e2ZEGhmykZA3YTP0XoZZhVBNw9Is7kY/M2P8r7o34=;
 b=g0wjvozgXQcsYk8PA4b+K8p1rx8URKE99t8+lAcQvL+amr/rIwQPumnESRYYI2W2Xu
 8mEcZeqvnBQZV8/a/pk77ZCElufVHgETWK+RE+4ZMxBgs3JZVdwmlKz2TA3t62QQqAxH
 +74Kf5oPUQrmGb08YuNagTNOjlHrO7Nj3XkugZddKAv+AGrV4obevhE8ZudptTm3okWC
 qRElZ/HELkKUukk6XqX1H3KkiE4XDCB1BYOtK38VWH+SBqYtuT/fgEwnAhcjeEnDhgOE
 9dSL7F87BY0KV3wfcy9mbtwO987g22Eja0EZOJ80Fn33jaI9m5CpB/ESHlcZscNXBvxJ
 SrxQ==
X-Gm-Message-State: AFqh2kpIkXKv35tFUHcYVCU/R2w29rI+SHChnsvi6rlT+nOi+Q/eqOCs
 hXyMj7C48xvQa5nNJJFqwVRRMwbj12g9mKjg
X-Google-Smtp-Source: AMrXdXs9QCIu2Sif1l4myATIpED5p6mcujIjOFESrGelmpZ+g4GTG3fVlhPqYEKnBtpb+8+9yVInvg==
X-Received: by 2002:a17:906:bc58:b0:872:2cc4:6886 with SMTP id
 s24-20020a170906bc5800b008722cc46886mr806245ejv.30.1673892362831; 
 Mon, 16 Jan 2023 10:06:02 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. (mob-5-90-75-145.net.vodafone.it.
 [5.90.75.145]) by smtp.gmail.com with ESMTPSA id
 d3-20020aa7d5c3000000b004835bd8dfe5sm11883094eds.35.2023.01.16.10.06.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 10:06:02 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 16 Jan 2023 19:05:50 +0100
Message-Id: <20230116180550.3144425-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=i1e2ZEGhmykZA3YTP0XoZZhVBNw9Is7kY/M2P8r7o34=;
 b=NIM6cLFMkW0UbZLAeN8mMlMlru5e/D2FvkUz8IR6+aalC3Lu5FZ+qySIG10tiIDKK+
 Kd/zF7NPShPPAFIiPuN5qYTqqtZxHgCHjIdm3vHHBmWigtqurxmqL+zWwzU99FUFXR8u
 3ZsKhaptPUHSkxdVkREGyR9LUcehqHFW5sWlY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=NIM6cLFM
Subject: [Buildroot] [RESEND PATCH v2 1/1] package/sscep: fix linking error
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
 "Yann E . MORIN" <yann.morin.1998@free.fr>, thomas.petazzoni@bootlin.com
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
