Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 793E6C43334
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 15:19:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2A4B832DB;
	Tue, 14 Jun 2022 15:19:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bvozG36I6wZZ; Tue, 14 Jun 2022 15:19:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BD4183267;
	Tue, 14 Jun 2022 15:19:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1111F1BF4D7
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 15:19:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F384B60EB6
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 15:19:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zcjr0bcuGOrQ for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 15:19:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DA0BD607C0
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 15:19:00 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id n28so12120526edb.9
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 08:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :content-transfer-encoding;
 bh=IXtN43/29jF+SMRSqFeB6nBP0XEhKBvUHoPWcen+dJE=;
 b=Ul7jYSihdB84sHW/KTKP+jyX2oQITQOQS4DBxtfGxHmgsfwyZEAYB5o91gakvNvvZa
 WM++sTI6xxvXg2DeXk+qtTk7v6cBqI2Swhi5FNPMUl4nRsPotnTHGRBznXb4/tH5bt8u
 mxZy6Bg1BQnZGKguChDmE10foXRFiWjFHs0niYa/LqZmZxAes9+D1ftFUzXXaF9fSoms
 0PDCeUww4E+55NuVxbYnZUyZU31fdWPsaqJb63HGm0nlF8Yd+Lf9v/fp5OnDEMO+kblp
 K9zR50CiBp94aqB4NOZEMJkNSXrNoEfEvMlqGxYlJJU0rmI0TEfvgzTFnGng89CrsmFt
 FG1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding;
 bh=IXtN43/29jF+SMRSqFeB6nBP0XEhKBvUHoPWcen+dJE=;
 b=EiCuMj7UxCK1Yz2XSNy88U7KDxwF/s/3UHDlMYu2MkjyQ1bvUpo036OtgX4iDKIDFU
 hKuHztP7/BcTxlrCCMy2sIiLgQDsooVCXnYPbFp4a1Cboja/SYRJUftK31MV+LW64nRo
 Z97bMfPJnCN65/ckZWdBIzzynSohrEjkfGCL0rUT7flxH9sZhCdklMl4/o84Z7qU5HT4
 Edsyzb3ikMPjk3n4y2aIphTiNx5S4Ac3vv10J5sZ97cG27E5sA0xN3YJmui9dYdQAF/F
 R2FV0eBGafH8Rzmw3cranm2gJw8ElQGnzr3kIlaTBaUD5N/RybixaxnNNmjk2NtLmH+R
 Y8EA==
X-Gm-Message-State: AOAM532pFhqIEybYaxmCqLlAot3xp1AqEUauW0kOWII+vOxKZbs7R+o8
 GFqY+8WVJmRip9JXacYSauFgNe8iOgTGbQ==
X-Google-Smtp-Source: ABdhPJyjYO7C54o6rvzM3BsR79JZpkHNl/Qg6xBLfmXPzkXL0LCRac5prZCvKy9KwPDdbtlUk0GQgA==
X-Received: by 2002:a05:6402:2684:b0:431:497e:699e with SMTP id
 w4-20020a056402268400b00431497e699emr6520690edd.343.1655219938945; 
 Tue, 14 Jun 2022 08:18:58 -0700 (PDT)
Received: from cephalopod (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 fy38-20020a1709069f2600b00711d88ae162sm5109082ejc.24.2022.06.14.08.18.58
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 08:18:58 -0700 (PDT)
Date: Tue, 14 Jun 2022 17:18:57 +0200
From: Ben Hutchings <ben.hutchings@mind.be>
To: buildroot@buildroot.org
Message-ID: <Yqim4TOtcyKtFHJj@cephalopod>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [Buildroot] [PATCH] package/zlib-ng: Add upstream patch to fix
 build with uclibc
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with uclibc on arm architectures (and
similar on powerpc):

/home/buildroot/autobuild/instance-2/output-1/build/zlib-ng-2.0.6/arch/arm/=
armfeature.c:4:12: fatal error: sys/auxv.h: No such file or directory
    4 | #  include <sys/auxv.h>
      |            ^~~~~~~~~~~~
compilation terminated.

Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
---
 ...-sys-auxv.h-exists-at-configure-time.patch | 90 +++++++++++++++++++
 1 file changed, 90 insertions(+)
 create mode 100644 package/zlib-ng/0003-zlib-ng-check-that-sys-auxv.h-exis=
ts-at-configure-time.patch

diff --git a/package/zlib-ng/0003-zlib-ng-check-that-sys-auxv.h-exists-at-c=
onfigure-time.patch b/package/zlib-ng/0003-zlib-ng-check-that-sys-auxv.h-ex=
ists-at-configure-time.patch
new file mode 100644
index 0000000000..ba8297cda7
--- /dev/null
+++ b/package/zlib-ng/0003-zlib-ng-check-that-sys-auxv.h-exists-at-configur=
e-time.patch
@@ -0,0 +1,90 @@
+From e1baa6b439c06f3d0e6be3e381cc746ffb55aee1 Mon Sep 17 00:00:00 2001
+From: Mika Lindqvist <postmaster@raasu.org>
+Date: Wed, 13 Apr 2022 01:22:29 +0300
+Subject: [PATCH] Check that sys/auxv.h exists at configure time and add
+ preprocessor define for it. * Protect including sys/auxv.h in all relevant
+ files with the new preprocessor define * Test for both existence of both
+ sys/auxv.h and getauxval() with both cmake and configure
+
+[Ben Hutchings: Backport to 2.0.6:
+ - Drop the s390 changes
+ - Change some filenames]
+
+Backported from: e1baa6b439c06f3d0e6be3e381cc746ffb55aee1
+Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
+---
+ CMakeLists.txt        |    4 ++++
+ arch/arm/armfeature.c |    2 +-
+ arch/power/power.c    |    5 ++++-
+ configure             |   13 +++++++++++++
+ 4 files changed, 22 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 0dd196130..e4e4b7332 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -338,6 +338,10 @@ endif()
+ #
+ # Check for standard/system includes
+ #
++check_include_file(sys/auxv.h  HAVE_SYS_AUXV_H)
++if(HAVE_SYS_AUXV_H)
++    add_definitions(-DHAVE_SYS_AUXV_H)
++endif()
+ check_include_file(sys/sdt.h   HAVE_SYS_SDT_H)
+ if(HAVE_SYS_SDT_H)
+     add_definitions(-DHAVE_SYS_SDT_H)
+diff --git a/arch/arm/arm_features.c b/arch/arm/arm_features.c
+index 195c94992..f6b67687f 100644
+--- a/arch/arm/armfeature.c
++++ b/arch/arm/armfeature.c
+@@ -1,6 +1,6 @@
+ #include "../../zutil.h"
+ =

+-#if defined(__linux__)
++#if defined(__linux__) && defined(HAVE_SYS_AUXV_H)
+ #  include <sys/auxv.h>
+ #  ifdef ARM_ASM_HWCAP
+ #    include <asm/hwcap.h>
+diff --git a/arch/power/power_features.c b/arch/power/power_features.c
+index 9186b40d8..65599d9a7 100644
+--- a/arch/power/power.c
++++ b/arch/power/power.c
+@@ -1,9 +1,12 @@
+ /* POWER feature check
+  * Copyright (C) 2020 Matheus Castanho <msc@linux.ibm.com>, IBM
++ * Copyright (C) 2021-2022 Mika T. Lindqvist <postmaster@raasu.org>
+  * For conditions of distribution and use, see copyright notice in zlib.h
+  */
+ =

+-#include <sys/auxv.h>
++#ifdef HAVE_SYS_AUXV_H
++#  include <sys/auxv.h>
++#endif
+ #include "../../zutil.h"
+ =

+ Z_INTERNAL int power_cpu_has_arch_2_07;
+diff --git a/configure b/configure
+index aed1909cc..a357e1c8a 100755
+--- a/configure
++++ b/configure
+@@ -776,6 +776,19 @@ else
+   echo "Checking for strerror... No." | tee -a configure.log
+ fi
+ =

++# check for getauxval() for architecture feature detection at run-time
++cat > $test.c <<EOF
++#include <sys/auxv.h>
++int main() { return getauxval(0); }
++EOF
++if try $CC $CFLAGS -o $test $test.c $LDSHAREDLIBC; then
++  echo "Checking for getauxval() in sys/auxv.h... Yes." | tee -a configur=
e.log
++  CFLAGS=3D"${CFLAGS} -DHAVE_SYS_AUXV_H"
++  SFLAGS=3D"${SFLAGS} -DHAVE_SYS_AUXV_H"
++else
++  echo "Checking for getauxval() in sys/auxv.h... No." | tee -a configure=
.log
++fi
++
+ # We need to remove zconf.h from source directory if building outside of =
it
+ if [ "$SRCDIR" !=3D "$BUILDDIR" ]; then
+     rm -f $SRCDIR/zconf${SUFFIX}.h
-- =

2.30.2

-- =

Ben Hutchings =B7 Senior Embedded Software Engineer, Essensium-Mind =B7 min=
d.be
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
