Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BCC4C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 12:43:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBBF281987;
	Mon, 15 Aug 2022 12:43:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBBF281987
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LYeXs9gkLraV; Mon, 15 Aug 2022 12:43:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E41D78188A;
	Mon, 15 Aug 2022 12:43:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E41D78188A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 39B311BF3B9
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 12:43:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 146CD60AF7
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 12:43:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 146CD60AF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vtojgZLCyyoc for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 12:43:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B55426072A
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B55426072A
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 12:43:52 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id l4so8917169wrm.13
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 05:43:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=y5S6OkQ70nOENKerPqPbZKqwv5t32Xn+4ALmQxYTfk0=;
 b=CLabTK53JoUhuKYuT5wwLNRKcHwFgW8fTMap+1bsx+ge67Uf1pM59bl9+3pcaNw1Uz
 KMo4jcmec4IBJF4OTTjM0irDaTsTvXeDZ5BZSiK73BEn4IjYfPAwU2LfWB15MpM6pm0r
 dbwff9ddgrlq9VlWXwJUcOIAemz8JqRDfwl3VYi/zS7kTHk563JdC3PjaE9uCxgzd2gm
 TuVXdj+6IsJY8h2jFG7xClxsshLCsFzGruq8Tx7I2zVQWpODwhJKP0AH1G/O6kZKAXIU
 X9DunYNt8euleQwPJb9BtnIKTlkBuZk8e4QX2ULhlhs8qMAdT8oE4Ru7lxKjOwsG2VHD
 sa6A==
X-Gm-Message-State: ACgBeo2Moeg1iXB/1V6l4maayuWH8VtWPYYJdQwVL9tb0lfuyqnFmBnt
 JRs/Ehm1E0k29r8ftmKaGju/Du02Kl0=
X-Google-Smtp-Source: AA6agR45iP/JLpKSYDU/3vizmgCGhfVSNwiPxd418dZchKG08wILGfHCNYhCOG0SlPQxDUMUKC6yKA==
X-Received: by 2002:a5d:588d:0:b0:220:73d3:997e with SMTP id
 n13-20020a5d588d000000b0022073d3997emr8319231wrf.546.1660567430592; 
 Mon, 15 Aug 2022 05:43:50 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b00a06515eff6d24302.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:a065:15ef:f6d2:4302])
 by smtp.gmail.com with ESMTPSA id
 o24-20020a05600c511800b003a545ff43c5sm9046320wms.45.2022.08.15.05.43.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 05:43:50 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 14:43:48 +0200
Message-Id: <20220815124348.560482-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=y5S6OkQ70nOENKerPqPbZKqwv5t32Xn+4ALmQxYTfk0=;
 b=nqLa2a22EvetX0jK7Dlyk/eSfi+wgdeRG/MVW+AW9p/8ghbSz7Y6VTYBg1dw3Pb2ec
 OAgQbMIQkSVKiVxA4OLbLa9QAc3SxL/lstwKp0pllAWuDDH61mzlJnVtK951DLlcvKdt
 rfsrkLI1lIBbkrHEsx3DSKT6E+p4T7hpUL726CpeKU2DhIYcongSUYhTHv+Ycs0hGDmG
 pyWKLbgtx1V28btamD+FqH0xv+bnICrs/RpCulJ3BkErqb00a5wiKFCPmdYSsA7FGsFn
 S5txqOshkSuCjniZfjSd+UqUFuXf0ngP4cDc+qTBbEHj3TBp0h285qbJrfDVELMok+Sd
 HlYA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=nqLa2a22
Subject: [Buildroot] [PATCH 1/1] package/rng-tools: fix uclibc build
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following uclibc build failure on aarch64 raised since bump to
version 6.14 in commit 5292d1cf9ad0605cc264fedc75c1b9a169aa183b and
https://github.com/nhorman/rng-tools/commit/9070a04adfcd21ec3839ee8ff190e7130ccd5c9b:

rngd_rndr.c:34:10: fatal error: sys/auxv.h: No such file or directory
   34 | #include <sys/auxv.h>
      |          ^~~~~~~~~~~~

Strangely enough, there is no autobuilder failure for powerpc64le raised
since version bump to version 6.11 in commit
da83261c9be0484924c845bb033e2ca752556504

Fixes:
 - http://autobuild.buildroot.org/results/41d5ab9e67eb0d8af8d789fc94d4366f130a7fb2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...gure.ac-fix-build-without-sys-auxv.h.patch | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 package/rng-tools/0001-configure.ac-fix-build-without-sys-auxv.h.patch

diff --git a/package/rng-tools/0001-configure.ac-fix-build-without-sys-auxv.h.patch b/package/rng-tools/0001-configure.ac-fix-build-without-sys-auxv.h.patch
new file mode 100644
index 0000000000..0c15ab6b7d
--- /dev/null
+++ b/package/rng-tools/0001-configure.ac-fix-build-without-sys-auxv.h.patch
@@ -0,0 +1,52 @@
+From 6ea89861c300a732d1bbcffd085d92f5c4c9228e Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 15 Aug 2022 11:57:21 +0200
+Subject: [PATCH] configure.ac: fix build without sys/auxv.h
+
+Fix the following build failure on aarch64 without sys/auxv.h (e.g. on
+uclibc) raised since version 6.13 and
+https://github.com/nhorman/rng-tools/commit/9070a04adfcd21ec3839ee8ff190e7130ccd5c9b:
+
+rngd_rndr.c:34:10: fatal error: sys/auxv.h: No such file or directory
+   34 | #include <sys/auxv.h>
+      |          ^~~~~~~~~~~~
+
+The same issue could be raised on powerpc64le since version 6.11 and
+https://github.com/nhorman/rng-tools/commit/ade348cdb90c25b44b203fd4e9c33ec4bccff323
+
+Fixes:
+ - http://autobuild.buildroot.org/results/41d5ab9e67eb0d8af8d789fc94d4366f130a7fb2
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/nhorman/rng-tools/commit/6ea89861c300a732d1bbcffd085d92f5c4c9228e]
+---
+ configure.ac | 11 +++++++----
+ 1 file changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 0af64e7..411c7b8 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -76,14 +76,17 @@ AC_PROG_GCC_TRADITIONAL
+ 
+ AX_PTHREAD
+ 
++dnl Checks for header files.
++AC_CHECK_HEADERS(sys/auxv.h)
++
+ AM_CONDITIONAL([RDRAND], [test $host_cpu = x86_64 || test $host_cpu = i686])
+ AS_IF([test $host_cpu = x86_64 || test $host_cpu = i686], [AC_DEFINE([HAVE_RDRAND],1,[Enable RDRAND])],[])
+ 
+-AM_CONDITIONAL([DARN], [test $host_cpu = powerpc64le])
+-AS_IF([test $host_cpu = powerpc64le], [AC_DEFINE([HAVE_DARN],1,[Enable DARN])],[])
++AM_CONDITIONAL([DARN], [test $host_cpu = powerpc64le -a "$ac_cv_header_sys_auxv_h" = "yes"])
++AS_IF([test $host_cpu = powerpc64le -a "$ac_cv_header_sys_auxv_h" = "yes"], [AC_DEFINE([HAVE_DARN],1,[Enable DARN])],[])
+ 
+-AM_CONDITIONAL([RNDR], [test $host_cpu = aarch64])
+-AS_IF([test $host_cpu = aarch64], [AC_DEFINE([HAVE_RNDR],1,[Enable RNDR])],[])
++AM_CONDITIONAL([RNDR], [test $host_cpu = aarch64 -a "$ac_cv_header_sys_auxv_h" = "yes"])
++AS_IF([test $host_cpu = aarch64 -a "$ac_cv_header_sys_auxv_h" = "yes"], [AC_DEFINE([HAVE_RNDR],1,[Enable RNDR])],[])
+ AM_CONDITIONAL([JITTER], [false])
+ 
+ AC_ARG_ENABLE(jitterentropy,
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
