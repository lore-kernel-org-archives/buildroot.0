Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 289E7C4167B
	for <buildroot@archiver.kernel.org>; Mon, 27 Nov 2023 22:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A193F4014E;
	Mon, 27 Nov 2023 22:11:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A193F4014E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8QloclRPKByt; Mon, 27 Nov 2023 22:11:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 73160404E0;
	Mon, 27 Nov 2023 22:11:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73160404E0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AFA931BF407
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 22:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93E98404E0
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 22:11:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93E98404E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oPrrR41ohAcZ for <buildroot@lists.busybox.net>;
 Mon, 27 Nov 2023 22:11:27 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 20AA24014E
 for <buildroot@buildroot.org>; Mon, 27 Nov 2023 22:11:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20AA24014E
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40b402c36c4so17792485e9.1
 for <buildroot@buildroot.org>; Mon, 27 Nov 2023 14:11:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701123085; x=1701727885;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lWNGyAqlmr3cbQP3OzFYHKHdR9YuJcu166QdSpXr3AA=;
 b=MK3YGLQJx2DczTmHMQbwmQy1pUvHjGM8cL5q3qj5BuwFiv3X6Adof4OwwmcMQmtZyv
 UP0j6C6liIGuWJoF5+24QArLKpBWt42Rtkxtmdoqky8osm72EHy+DmWC34PPzKclbCz8
 L7zBEnZs6i7aI+/1kfrmq/56GdUatHrMqucZdDmQEIhIL0NyamQQmOlF1Q7/Se5Anekr
 UsyjwkUjwFf9NcIxFmasMTdfc1uRrA602dgWfilRiT0mwCGOmAMiQAMlTlln3qs4EUed
 vaLosB6H2Avpw/bq/tnn0z+QQnDOu0bBoG5qnl0oXl1Z4F/+Seh3vHzXsFfx7rmJeOwg
 NM9g==
X-Gm-Message-State: AOJu0Yz4anzsddetMfZzzcmQTh5U9MgFeecn4ba6giKkNouF2sTN3Aom
 mxYRravdCl3vQmfnr5ogb7IsFkW+M3Y=
X-Google-Smtp-Source: AGHT+IFFCmT1DIVhYQps5DnwsE83DcCw0VlyTSes0qAUQ8wasUV8klOQeBVmLch6BiyY2qeEDgJL+A==
X-Received: by 2002:a05:600c:3b99:b0:40b:402c:34eb with SMTP id
 n25-20020a05600c3b9900b0040b402c34ebmr6125274wms.16.1701123084535; 
 Mon, 27 Nov 2023 14:11:24 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 m19-20020a05600c4f5300b0040b2b38a1fasm15480909wmq.4.2023.11.27.14.11.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 14:11:23 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Nov 2023 23:11:19 +0100
Message-ID: <20231127221119.1361708-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701123085; x=1701727885; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lWNGyAqlmr3cbQP3OzFYHKHdR9YuJcu166QdSpXr3AA=;
 b=dTfmB/n4dvdlgRHq7fIhrILh3zr9NZECPEaHNwNj5eUBfLjkQ12U0uCDNZNKnKNdtO
 VFphWF1pTG/RmYtMAG80OKW2fduxZbDSaN8OBRwmqBUMJavMxq4ec2XC1rIHbdgDERzu
 amvUePsteclMbpdEWvxy8tf7JRBbBB7Vq7uIiBxyBstiZQvt1UzI/2eyM/AN4sx/q6cO
 HJZeWRsgx0KWvcHHXUlueYma9h9rvBJUkEDmqpr4oW6BnJm7BXMjokHq3KtBAN9ulGjR
 AT2w+vnIVH1Cc2h7z2yARglueAM1LbKHpLD8ZwhhmLYBBrPDxKc3LJAAK42gA3WW+wpn
 GiMg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dTfmB/n4
Subject: [Buildroot] [PATCH 1/1] package/gsl: fix musl build on m68k
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update patch to fix the following musl build failure with m68k which is
only raised (for an unknown reason) since bump to version 2.7.1 in commit
3e48f8358e519f9c24262a6549d8f6c78ee01add:

In file included from fp.c:6:
fp-gnum68k.c:21:10: fatal error: fpu_control.h: No such file or directory
   21 | #include <fpu_control.h>
      |          ^~~~~~~~~~~~~~~

Add also upstream link to first patch iteration which was sent in
November 2022 but didn't get it any reply (like most of the other emails
sent to bug-gsl@gnu.org ...)

Fixes:
 - http://autobuild.buildroot.org/results/e59636f6ac148807c1c67f09eef0e0a9f5d52303

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                                      | 1 -
 package/gsl/0001-configure.ac-fix-build-on-powerpc.patch | 7 ++++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 52f983e049..5dcd2b088b 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -529,7 +529,6 @@ package/graphite2/0001-don-t-install-a-libtool-file-with-static-library.patch Up
 package/grpc/0002-wrap_memcpy.cc-add-GPR_DISABLE_WRAPPED_MEMCPY.patch Upstream
 package/grpc/0003-host-grpc-only-cpp-plugin.patch Upstream
 package/grpc/0004-disable-unconditionally-downloading-api-repos.patch Upstream
-package/gsl/0001-configure.ac-fix-build-on-powerpc.patch Upstream
 package/gstreamer1/gstd/0001-Don-t-require-gstd-check-user-xenv.sh-for-systemd-se.patch Upstream
 package/guile/0001-calculate-csqrt_manually.patch Upstream
 package/guile/0002-Makefile.am-fix-build-without-makeinfo.patch Upstream
diff --git a/package/gsl/0001-configure.ac-fix-build-on-powerpc.patch b/package/gsl/0001-configure.ac-fix-build-on-powerpc.patch
index 13f6da4588..96ab780467 100644
--- a/package/gsl/0001-configure.ac-fix-build-on-powerpc.patch
+++ b/package/gsl/0001-configure.ac-fix-build-on-powerpc.patch
@@ -1,9 +1,9 @@
 From 84e62d57b90b41a0c96bb9fb6ec61ecaac76a1ab Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Sat, 5 Nov 2022 21:31:36 +0100
-Subject: [PATCH] configure.ac: fix build on powerpc
+Subject: [PATCH] configure.ac: fix build on powerpc and m68k
 
-Fix the following powerpc build failures on:
+Fix the following powerpc and m68k build failures on:
  - musl raised because fpu_control.h is not available:
 
 In file included from fp.c:8:
@@ -25,6 +25,7 @@ Fixes:
  - http://autobuild.buildroot.org/results/48403946bb4cda9013e51db59c1b2ffdcf4e2854
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://lists.gnu.org/archive/html/bug-gsl/2022-11/msg00000.html
 ---
  configure.ac | 8 ++++++++
  1 file changed, 8 insertions(+)
@@ -37,7 +38,7 @@ index bfd9ca30..1ee6dca0 100644
     fi
  fi
  
-+if test "$ac_cv_c_ieee_interface" = "gnuppc" ; then
++if test "$ac_cv_c_ieee_interface" = "gnuppc" -o "$ac_cv_c_ieee_interface" = "gnum68k" ; then
 +    AC_CACHE_CHECK([for _FPU_RC_NEAREST], ac_cv_c__fpu_rc_nearest,
 +    [ac_cv_c__fpu_rc_nearest=no
 +    AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[#include <fpu_control.h>
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
