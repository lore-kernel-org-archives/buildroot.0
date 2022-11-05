Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C2BC4332F
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 20:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74B56408AE;
	Sat,  5 Nov 2022 20:52:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74B56408AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cn-j2Vrd6XRV; Sat,  5 Nov 2022 20:52:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40183408BD;
	Sat,  5 Nov 2022 20:52:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40183408BD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B903F1BF283
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 20:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 93F2760803
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 20:52:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93F2760803
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bm6IUUONvaMN for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 20:52:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16D8360674
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 16D8360674
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 20:52:45 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 ja4-20020a05600c556400b003cf6e77f89cso6780220wmb.0
 for <buildroot@buildroot.org>; Sat, 05 Nov 2022 13:52:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v9R8atghe8JJJFSb8McaI3rDRRWkrHCzmDrjqwKZWZo=;
 b=vCeQNUKHCnUsRqPXz7sMPeBh5m5mx3Eu1Wl+mFBzpFYfNIRvr1in5/FCIKvn/7EGv+
 RXuUeRAuJ1B+lmpDb/trkT6BdhPT/mOZOpUsfNjPWthsB/rvjCtCwG/nrtFXnOgEjMiA
 JX2i59ezyH58ZPUXc9APDjigTW0AaKl5IkfGrrROj6cb6NbA8KwskRjpFVhOQSr0RIIi
 c5Gy4kvMxzAFECPOzOe2PRa9zbvirtahMJMX9a9Bt+I0WGJm3N1EgIqYxfRgxL92T2y3
 HUObm8GgCqhZ14y9/vkympHtaIQyR2updpwIFi+2jnRQLZLz2+8MNmBgIscQgJtMlIXJ
 GTwQ==
X-Gm-Message-State: ACrzQf0ILF7XgSEl4ZXHE7SfqVV7Du+OrxfsKBv4TSuySJOR4/iiz1rT
 3yTQU1DmrmV5EKXofM4LEyztanGZA0Q=
X-Google-Smtp-Source: AMsMyM7TEZg3MK+fmrze835fT0DcQM5V3Fjyr1uSTzWBlZhdaroGdy7eqkXBkeGs6lIaiFxzXp2r3Q==
X-Received: by 2002:a1c:440b:0:b0:3cf:4db1:d741 with SMTP id
 r11-20020a1c440b000000b003cf4db1d741mr28500966wma.197.1667681563811; 
 Sat, 05 Nov 2022 13:52:43 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 g12-20020adffc8c000000b0022cd96b3ba6sm3454242wrr.90.2022.11.05.13.52.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 13:52:43 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  5 Nov 2022 21:52:39 +0100
Message-Id: <20221105205239.300732-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=v9R8atghe8JJJFSb8McaI3rDRRWkrHCzmDrjqwKZWZo=;
 b=OFy/zoG+9Sh2NjTngPDi31mabuzHuYgDUbKQ181YgBIZIrLhvVfUOCbY/KZnQ8t8T6
 W4exls7jh2uUC+yn395iUTr7MI5HvNjjM4dYyX1rn7urUEcVD5gZeh4JkXFzQ+DOsweH
 KWDyC72X2dpofuQbeMRIIgzGGxLP0In6mvG/2FFXPNtCvA9RtdgUDdSXefQ1a6CM8MS2
 S2BazAXGc3GNd0IBtk5OECVNs44EOZp6Hp/Nu1547LzW1ZFqmYB7GAiEua3zf7h9IGmf
 tWZj0bBWJvaT5G+Sr1cgEJ7p+80litjN7fKEIvEgmoyLb4b2llyyqLlUWW7Qri/8LJmq
 YwBA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=OFy/zoG+
Subject: [Buildroot] [PATCH 1/1] package/gsl: fix powerpc build
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

Fix the following powerpc build failures on:
 - musl raised because fpu_control.h is not available:

In file included from fp.c:8:
fp-gnuppc.c:21:10: fatal error: fpu_control.h: No such file or directory
   21 | #include <fpu_control.h>
      |          ^~~~~~~~~~~~~~~

 - glibc raised because _FPU_RC_NEAREST is undefined if _SOFT_FLOAT is
   set:

   In file included from fp.c:8:
fp-gnuppc.c: In function 'gsl_ieee_set_mode':
fp-gnuppc.c:53:15: error: '_FPU_RC_NEAREST' undeclared (first use in this function)
   53 |       mode |= _FPU_RC_NEAREST ;
      |               ^~~~~~~~~~~~~~~

These build failures are raised since the addition of the package in
commit 9d9f7feba4ffbfeb54479f1ad90d47acca1a6f0b

Fixes:
 - http://autobuild.buildroot.org/results/d73e116c81bf16d2e55fced215d6bd3b382fef10
 - http://autobuild.buildroot.org/results/48403946bb4cda9013e51db59c1b2ffdcf4e2854

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...01-configure.ac-fix-build-on-powerpc.patch | 53 +++++++++++++++++++
 package/gsl/gsl.mk                            |  2 +
 2 files changed, 55 insertions(+)
 create mode 100644 package/gsl/0001-configure.ac-fix-build-on-powerpc.patch

diff --git a/package/gsl/0001-configure.ac-fix-build-on-powerpc.patch b/package/gsl/0001-configure.ac-fix-build-on-powerpc.patch
new file mode 100644
index 0000000000..13f6da4588
--- /dev/null
+++ b/package/gsl/0001-configure.ac-fix-build-on-powerpc.patch
@@ -0,0 +1,53 @@
+From 84e62d57b90b41a0c96bb9fb6ec61ecaac76a1ab Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 5 Nov 2022 21:31:36 +0100
+Subject: [PATCH] configure.ac: fix build on powerpc
+
+Fix the following powerpc build failures on:
+ - musl raised because fpu_control.h is not available:
+
+In file included from fp.c:8:
+fp-gnuppc.c:21:10: fatal error: fpu_control.h: No such file or directory
+   21 | #include <fpu_control.h>
+      |          ^~~~~~~~~~~~~~~
+
+ - glibc raised because _FPU_RC_NEAREST is undefined if _SOFT_FLOAT is
+   set:
+
+   In file included from fp.c:8:
+fp-gnuppc.c: In function 'gsl_ieee_set_mode':
+fp-gnuppc.c:53:15: error: '_FPU_RC_NEAREST' undeclared (first use in this function)
+   53 |       mode |= _FPU_RC_NEAREST ;
+      |               ^~~~~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/d73e116c81bf16d2e55fced215d6bd3b382fef10
+ - http://autobuild.buildroot.org/results/48403946bb4cda9013e51db59c1b2ffdcf4e2854
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index bfd9ca30..1ee6dca0 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -389,6 +389,14 @@ if test "$ac_cv_c_ieee_interface" = "gnux86" ; then
+    fi
+ fi
+ 
++if test "$ac_cv_c_ieee_interface" = "gnuppc" ; then
++    AC_CACHE_CHECK([for _FPU_RC_NEAREST], ac_cv_c__fpu_rc_nearest,
++    [ac_cv_c__fpu_rc_nearest=no
++    AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[#include <fpu_control.h>
++]], [[ unsigned short mode = _FPU_RC_NEAREST ; ]])],[ac_cv_c__fpu_rc_nearest="yes"],[ac_cv_c_ieee_interface=unknown])
++    ])
++fi
++
+ ac_tr_ieee_interface=HAVE_`echo $ac_cv_c_ieee_interface | tr 'abcdefghijklmnopqrstuvwxyz' 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'`_IEEE_INTERFACE
+ AC_DEFINE_UNQUOTED($ac_tr_ieee_interface,1,[IEEE Interface Type])
+ 
+-- 
+2.35.1
+
diff --git a/package/gsl/gsl.mk b/package/gsl/gsl.mk
index 416955b72c..3604f9836c 100644
--- a/package/gsl/gsl.mk
+++ b/package/gsl/gsl.mk
@@ -10,6 +10,8 @@ GSL_INSTALL_STAGING = YES
 GSL_LICENSE = GPL-3.0
 GSL_LICENSE_FILES = COPYING
 GSL_CONFIG_SCRIPTS = gsl-config
+# We're patching configure.ac
+GSL_AUTORECONF = YES
 
 # uClibc pretends to have fenv support as it installs <fenv.h>, but in
 # practice, it only implements it for i386. Problem reported upstream
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
