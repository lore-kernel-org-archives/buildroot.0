Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CB3C636D6
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 12:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 545C040FD0;
	Thu, 23 Feb 2023 12:36:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 545C040FD0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id on8kPQZ5GcW8; Thu, 23 Feb 2023 12:36:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 740304105D;
	Thu, 23 Feb 2023 12:36:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 740304105D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AF1741BF573
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 12:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 885EB8206F
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 12:36:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 885EB8206F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id De3sZ2HgMWrr for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 12:36:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26DD481FED
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 26DD481FED
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 12:36:49 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id t13so10495026wrv.13
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 04:36:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X/mTefTqQwTA7AKsNhZulDjVUICOY2rqurqI5e22npI=;
 b=sVz/jHIVXNNanh3AuYCokyax7O+X5nevG4CyeuBm9rYrmduTOUbEp1O1G0SxoG6JnK
 CKU8HkFCBaUPs6wDM59Y31xNmke+GoPfd2Hsr0bKoY3QmBNYYfxbddzNpSw2lTyHZ0wG
 XPCHTmKD4Jexnwx80FkyRm+yvQ/UF0KujvirNW8mHvB/QY5ztwmTbPIUY+xHxa3VnNRK
 +X+/iBfwGWSkwW6k9nFY7REE7aPdgi9v0WAey2P0SlgN6doplvB0ft6jW6RHtimAcf4u
 DQREHBgvooEhuSfvhO48DaftIgrPMQ2Ozxas9zht1KrTRMw9lNXgmbulSbjm3RXmNONf
 wztw==
X-Gm-Message-State: AO0yUKXk/HQvdHETlzNcSj5GvVWmLX3TizhCA4+0LYYrq0b6yIn6DQUe
 VHKFglnmSM8nA6BF2KmwGDMLpOuEjiM=
X-Google-Smtp-Source: AK7set9GKSi4NsO9Ts8WyEW3AqXZ63yWjxO9zxmk0L7Xc4aRnzV4HxKy3w6P9enX5kEPS+QfDusxpA==
X-Received: by 2002:a5d:6405:0:b0:2bf:ae11:c40c with SMTP id
 z5-20020a5d6405000000b002bfae11c40cmr10864676wru.32.1677155806888; 
 Thu, 23 Feb 2023 04:36:46 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 p13-20020a1c544d000000b003e208cec49bsm4813445wmi.3.2023.02.23.04.36.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 04:36:46 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 23 Feb 2023 13:36:44 +0100
Message-Id: <20230223123644.402595-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=X/mTefTqQwTA7AKsNhZulDjVUICOY2rqurqI5e22npI=;
 b=n3a2CRrMqKRsHTNOzZiD92fe246sFAnvHE9y+4LsYGdZdxp50sFeRt54eNp487FdII
 17Zmk/jpoBr9OEKoYZixRto2xtgSInBCfHrsOQUO46XdzCw1xjxEwgzp4G06dZmkRByi
 hlhmFf8uvUFWscN4mlFCMD+WxuXvUeNjXwnMFp4oh4qV4D08WRZ7soKnOF2z/0ES0HDp
 o5OKdKSIHUi/Qsr0CJnJnlMkPX+qZm8ZXWWY8bgHRO48o7ELMtBfm0hSLsFKwVfQQYl5
 HiDjGXx/wjTow2neWwp3cako+CBUfElSqfulYidw1RCzVO+2Q97b7iHEjT9RZbG8V1EM
 4xfg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=n3a2CRrM
Subject: [Buildroot] [PATCH 1/1] package/lttng-babeltrace: fix popt static
 build with libiconv
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
Cc: Philippe Proulx <eeppeliteloop@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following popt static build failure with libiconv:

configure:18149: checking for poptGetContext in -lpopt
configure:18172: /home/buildroot/autobuild/instance-2/output-1/host/bin/m68k-buildroot-linux-uclibc-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -static  -I/home/buildroot/autobuild/instance-2/output-1/host/bin/../m68k-buildroot-linux-uclibc/sysroot/usr/include/uuid  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -static conftest.c -lpopt  -L/home/buildroot/autobuild/instance-2/output-1/host/bin/../m68k-buildroot-linux-uclibc/sysroot/usr/lib -luuid    >&5
/home/buildroot/autobuild/instance-2/output-1/host/lib/gcc/m68k-buildroot-linux-uclibc/10.4.0/../../../../m68k-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/instance-2/output-1/host/bin/../m68k-buildroot-linux-uclibc/sysroot/usr/lib/libpopt.a(poptint.o): in function `POPT_fprintf':
poptint.c:(.text+0x28a): undefined reference to `libiconv_open'

[...]

checking for poptGetContext in -lpopt... no
configure: error: Cannot find popt.

Fixes:
 - http://autobuild.buildroot.org/results/4f465fe15664b1f9df3f26c331dc550852972f2f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...2-configure.ac-fix-popt-static-build.patch | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 package/lttng-babeltrace/0002-configure.ac-fix-popt-static-build.patch

diff --git a/package/lttng-babeltrace/0002-configure.ac-fix-popt-static-build.patch b/package/lttng-babeltrace/0002-configure.ac-fix-popt-static-build.patch
new file mode 100644
index 0000000000..896c67470f
--- /dev/null
+++ b/package/lttng-babeltrace/0002-configure.ac-fix-popt-static-build.patch
@@ -0,0 +1,48 @@
+From 35076fd4592ca23136ff5eacdf8eaebc926e0224 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 23 Feb 2023 13:04:08 +0100
+Subject: [PATCH] configure.ac: fix popt static build
+
+Fix the following popt static build failure:
+
+configure:18149: checking for poptGetContext in -lpopt
+configure:18172: /home/buildroot/autobuild/instance-2/output-1/host/bin/m68k-buildroot-linux-uclibc-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -static  -I/home/buildroot/autobuild/instance-2/output-1/host/bin/../m68k-buildroot-linux-uclibc/sysroot/usr/include/uuid  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -static conftest.c -lpopt  -L/home/buildroot/autobuild/instance-2/output-1/host/bin/../m68k-buildroot-linux-uclibc/sysroot/usr/lib -luuid    >&5
+/home/buildroot/autobuild/instance-2/output-1/host/lib/gcc/m68k-buildroot-linux-uclibc/10.4.0/../../../../m68k-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/instance-2/output-1/host/bin/../m68k-buildroot-linux-uclibc/sysroot/usr/lib/libpopt.a(poptint.o): in function `POPT_fprintf':
+poptint.c:(.text+0x28a): undefined reference to `libiconv_open'
+
+[...]
+
+checking for poptGetContext in -lpopt... no
+configure: error: Cannot find popt.
+
+Fixes:
+ - http://autobuild.buildroot.org/results/4f465fe15664b1f9df3f26c331dc550852972f2f
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: not upstreamable as popt has been removed with
+https://github.com/efficios/babeltrace/commit/916d0d910ad5407bc7826505aa05b277f5739a34]
+---
+ configure.ac | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index a17c23c3..8f700d3e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -223,8 +223,11 @@ AC_CHECK_LIB([c], [faccessat],
+ ]
+ )
+ 
+-AC_CHECK_LIB([popt], [poptGetContext], [],
+-        [AC_MSG_ERROR([Cannot find popt.])]
++PKG_CHECK_MODULES([POPT], [popt], [LIBS="${POPT_LIBS} ${LIBS}"],
++[
++	AC_CHECK_LIB([popt], [poptGetContext], [],
++		[AC_MSG_ERROR([Cannot find popt.])])
++]
+ )
+ 
+ # For Python
+-- 
+2.39.1
+
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
