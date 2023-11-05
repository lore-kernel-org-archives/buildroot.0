Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B33C9C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 16:58:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28E8B4013D;
	Sun,  5 Nov 2023 16:58:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28E8B4013D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EFYt0YWM_ml9; Sun,  5 Nov 2023 16:58:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B9CA84013F;
	Sun,  5 Nov 2023 16:58:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9CA84013F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D794E1BF584
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 16:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A6C5E4014E
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 16:58:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6C5E4014E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Evufco0K-ci for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 16:58:28 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DF1014013F
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 16:58:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF1014013F
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40806e4106dso22140115e9.1
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 08:58:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699203505; x=1699808305;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3kAWG1m0FhRpiZUGFzUUtivepNtIdKDkZUM5SCb6bck=;
 b=nFBfcGPQVTXK0X1wK/LZXXK48VFnXe1Bx3C1JXXHn8kxFvQUn4+A7o9OkwjKTcAcNR
 1Fhh491lsQrlKMmvl6C22Li4oKNJqPwMWmxbn18rRJkORt6MKJjq2Jw5msSwSp+HhUCC
 Xsg0uuBVwvZ/1V6tw6w2LWRXd6OMSpkws+oSN4fEu3vcxAZ/1WMmWKCTMATpGJR0hgE/
 8bt1oed5iO2TMP147Iiti46ErbzhVeS0dKbQpxBX6bkemX1Iy+RjOFkDn8DSparjmnMp
 aUOxVaT2w7VGprtcqDWia3j2nxSDGV0nzGemzvdj7+3R/Ujm8HCPstPMpWluEZMn9wvH
 KYxA==
X-Gm-Message-State: AOJu0YxZYP65/IS+tR9mwLOFgXvPV8BFL+iRgnlFgJvtOJBbTDKiY1Zx
 wfU+c3Y+gFPjNswHRe0C4fqOkAYU8G8=
X-Google-Smtp-Source: AGHT+IFhIH/6NNPQO7iFJxvcMx0mcsn2a8qcJyCNjwl+LQPoZJWzkZ+yID0VfAJgZymKr05dQNQGoA==
X-Received: by 2002:a05:600c:5488:b0:408:3634:b81e with SMTP id
 iv8-20020a05600c548800b004083634b81emr9834962wmb.13.1699203504556; 
 Sun, 05 Nov 2023 08:58:24 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 ha7-20020a05600c860700b004080f0376a0sm9200164wmb.42.2023.11.05.08.58.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 08:58:24 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 17:58:22 +0100
Message-ID: <20231105165822.94701-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699203505; x=1699808305; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3kAWG1m0FhRpiZUGFzUUtivepNtIdKDkZUM5SCb6bck=;
 b=W+Qfltj1w0KZpvgzXlauGqgVruIMM/qq1KiAvC80Bngj/XhQhk95g4+4vparx0Q4Jg
 dFFjMdVzYmZl69jC5XGnooLebJwUDJJDkY3082gp8GmrxftNKcyncDI51q/7aPIDj5uY
 XWO5ece8YeGOFBHbr88LZ1sRVWm7s7EzChYIpZTfePqX1lN0HJBS5E2jNZ0RpyNeasrd
 pUCXulK7Qx3HM7IhoqZIzwqZxDWSs9P/U+oaf/MIWTKxs0eB49TUwGE6oxMrYqB76Izm
 UtrcqN4E5aqFvnJE05tzv6+VSCfZyN2iSDHwxynSl9oL60tzODXpLHi7CinkdF7ZxVZX
 gKdg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=W+Qfltj1
Subject: [Buildroot] [PATCH v2,1/1] package/nut: fix python build
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
Cc: Bernd Kuhls <bernd@kuhls.net>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump to version 2.8.1 in
commit 9c874557aa863d5282ca38b28a379730297496c8 and
https://github.com/networkupstools/nut/commit/cada4bc8c4051fb961ae7c21d0bb329f79cc330c
and
https://github.com/networkupstools/nut/commit/902ce1327e912dfb6198900204b12e6804d1224b:

checking python3 site-packages location... /home/thomas/autobuild/instance-3/output-1/host/lib/python3.11/site-packages
[...]
 /usr/bin/install -c -m 644 module/PyNUT.py '/home/thomas/autobuild/instance-3/output-1/host/powerpc64le-buildroot-linux-gnu/sysroot/home/thomas/autobuild/instance-3/output-1/host/lib/python3.11/site-packages'
[...]
nut: installs files in /home/thomas/autobuild/instance-3/output-1/host/powerpc64le-buildroot-linux-gnu/sysroot//home/thomas/autobuild/instance-3/output-1

Fixes:
 - http://autobuild.buildroot.org/results/0b2d0e292a9872f7ab7c2eeccbb7bb12e4afe36c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Add Upstream link to patch

 ...hon.m4-allow-overriding-of-PYTHON-2-.patch | 106 ++++++++++++++++++
 package/nut/nut.mk                            |  15 +++
 2 files changed, 121 insertions(+)
 create mode 100644 package/nut/0002-m4-nut_check_python.m4-allow-overriding-of-PYTHON-2-.patch

diff --git a/package/nut/0002-m4-nut_check_python.m4-allow-overriding-of-PYTHON-2-.patch b/package/nut/0002-m4-nut_check_python.m4-allow-overriding-of-PYTHON-2-.patch
new file mode 100644
index 0000000000..d2571cf438
--- /dev/null
+++ b/package/nut/0002-m4-nut_check_python.m4-allow-overriding-of-PYTHON-2-.patch
@@ -0,0 +1,106 @@
+From 511ee899ee687216fa8fcf2231a60941b9e4cf81 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 3 Nov 2023 14:34:54 +0100
+Subject: [PATCH] m4/nut_check_python.m4: allow overriding of
+ PYTHON{2,3}_SITE_PACKAGES
+
+Allow the end-user to override PYTHON{2,3}_SITE_PACKAGES as this can be
+useful when cross-compiling
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/networkupstools/nut/pull/2147
+---
+ m4/nut_check_python.m4 | 60 +++++++++++++++++++++---------------------
+ 1 file changed, 30 insertions(+), 30 deletions(-)
+
+diff --git a/m4/nut_check_python.m4 b/m4/nut_check_python.m4
+index 995a3e7c..7f29558e 100644
+--- a/m4/nut_check_python.m4
++++ b/m4/nut_check_python.m4
+@@ -116,17 +116,17 @@ AC_DEFUN([NUT_CHECK_PYTHON],
+         AM_CONDITIONAL([HAVE_PYTHON], [test -n "${PYTHON}" && test "${PYTHON}" != "no"])
+         AS_IF([test -n "${PYTHON}" && test "${PYTHON}" != "no"], [
+             export PYTHON
+-            AC_MSG_CHECKING([python site-packages location])
+-            PYTHON_SITE_PACKAGES="`${PYTHON} -c 'import site; print(site.getsitepackages().pop(0))'`"
+-            AS_CASE(["$PYTHON_SITE_PACKAGES"],
+-                [*:*], [
+-                    dnl Note: on Windows MSYS2 this embeds "C:/msys64/mingw..." into the string [nut#1584]
+-                    PYTHON_SITE_PACKAGES="`cd "$PYTHON_SITE_PACKAGES" && pwd`"
+-                    ]
+-                )
+-            AC_MSG_RESULT([${PYTHON_SITE_PACKAGES}])
++            AC_CACHE_CHECK([python site-packages location], [nut_cv_PYTHON_SITE_PACKAGES], [
++                nut_cv_PYTHON_SITE_PACKAGES="`${PYTHON} -c 'import site; print(site.getsitepackages().pop(0))'`"
++                AS_CASE(["$nut_cv_PYTHON_SITE_PACKAGES"],
++                    [*:*], [
++                        dnl Note: on Windows MSYS2 this embeds "C:/msys64/mingw..." into the string [nut#1584]
++                        nut_cv_PYTHON_SITE_PACKAGES="`cd "$nut_cv_PYTHON_SITE_PACKAGES" && pwd`"
++                        ]
++                   )
++               ])
+             ])
+-        AC_SUBST([PYTHON_SITE_PACKAGES], [${PYTHON_SITE_PACKAGES}])
++        AC_SUBST([PYTHON_SITE_PACKAGES], [${nut_cv_PYTHON_SITE_PACKAGES}])
+         AM_CONDITIONAL([HAVE_PYTHON_SITE_PACKAGES], [test x"${PYTHON_SITE_PACKAGES}" != "x"])
+     ])
+ ])
+@@ -228,17 +228,17 @@ AC_DEFUN([NUT_CHECK_PYTHON2],
+         AM_CONDITIONAL([HAVE_PYTHON2], [test -n "${PYTHON2}" && test "${PYTHON2}" != "no"])
+         AS_IF([test -n "${PYTHON2}" && test "${PYTHON2}" != "no"], [
+             export PYTHON2
+-            AC_MSG_CHECKING([python2 site-packages location])
+-            PYTHON2_SITE_PACKAGES="`${PYTHON2} -c 'import site; print(site.getsitepackages().pop(0))'`"
+-            AS_CASE(["$PYTHON2_SITE_PACKAGES"],
+-                [*:*], [
+-                    dnl Note: on Windows MSYS2 this embeds "C:/msys64/mingw..." into the string [nut#1584]
+-                    PYTHON2_SITE_PACKAGES="`cd "$PYTHON2_SITE_PACKAGES" && pwd`"
+-                    ]
+-                )
+-            AC_MSG_RESULT([${PYTHON2_SITE_PACKAGES}])
++            AC_CACHE_CHECK([python2 site-packages location], [nut_cv_PYTHON2_SITE_PACKAGES], [
++                nut_cv_PYTHON2_SITE_PACKAGES="`${PYTHON2} -c 'import site; print(site.getsitepackages().pop(0))'`"
++                AS_CASE(["$nut_cv_PYTHON2_SITE_PACKAGES"],
++                    [*:*], [
++                        dnl Note: on Windows MSYS2 this embeds "C:/msys64/mingw..." into the string [nut#1584]
++                        nut_cv_PYTHON2_SITE_PACKAGES="`cd "$nut_cv_PYTHON2_SITE_PACKAGES" && pwd`"
++                        ]
++                    )
++                ])
+             ])
+-        AC_SUBST([PYTHON2_SITE_PACKAGES], [${PYTHON2_SITE_PACKAGES}])
++        AC_SUBST([PYTHON2_SITE_PACKAGES], [${nut_cv_PYTHON2_SITE_PACKAGES}])
+         AM_CONDITIONAL([HAVE_PYTHON2_SITE_PACKAGES], [test x"${PYTHON2_SITE_PACKAGES}" != "x"])
+     ])
+ ])
+@@ -340,17 +340,17 @@ AC_DEFUN([NUT_CHECK_PYTHON3],
+         AM_CONDITIONAL([HAVE_PYTHON3], [test -n "${PYTHON3}" && test "${PYTHON3}" != "no"])
+         AS_IF([test -n "${PYTHON3}" && test "${PYTHON3}" != "no"], [
+             export PYTHON3
+-            AC_MSG_CHECKING([python3 site-packages location])
+-            PYTHON3_SITE_PACKAGES="`${PYTHON3} -c 'import site; print(site.getsitepackages().pop(0))'`"
+-            AS_CASE(["$PYTHON3_SITE_PACKAGES"],
+-                [*:*], [
+-                    dnl Note: on Windows MSYS2 this embeds "C:/msys64/mingw..." into the string [nut#1584]
+-                    PYTHON3_SITE_PACKAGES="`cd "$PYTHON3_SITE_PACKAGES" && pwd`"
+-                    ]
+-                )
+-            AC_MSG_RESULT([${PYTHON3_SITE_PACKAGES}])
++            AC_CACHE_CHECK([python3 site-packages location], [nut_cv_PYTHON3_SITE_PACKAGES], [
++                nut_cv_PYTHON3_SITE_PACKAGES="`${PYTHON3} -c 'import site; print(site.getsitepackages().pop(0))'`"
++                AS_CASE(["$nut_cv_PYTHON3_SITE_PACKAGES"],
++                    [*:*], [
++                        dnl Note: on Windows MSYS2 this embeds "C:/msys64/mingw..." into the string [nut#1584]
++                        nut_cv_PYTHON3_SITE_PACKAGES="`cd "$nut_cv_PYTHON3_SITE_PACKAGES" && pwd`"
++                        ]
++                    )
++                ])
+             ])
+-        AC_SUBST([PYTHON3_SITE_PACKAGES], [${PYTHON3_SITE_PACKAGES}])
++        AC_SUBST([PYTHON3_SITE_PACKAGES], [${nut_cv_PYTHON3_SITE_PACKAGES}])
+         AM_CONDITIONAL([HAVE_PYTHON3_SITE_PACKAGES], [test x"${PYTHON3_SITE_PACKAGES}" != "x"])
+     ])
+ ])
+-- 
+2.42.0
+
diff --git a/package/nut/nut.mk b/package/nut/nut.mk
index ba71319f90..371c783783 100644
--- a/package/nut/nut.mk
+++ b/package/nut/nut.mk
@@ -12,6 +12,7 @@ NUT_SELINUX_MODULES = apache nut
 NUT_INSTALL_STAGING = YES
 NUT_DEPENDENCIES = host-pkgconf
 # We're patching m4/nut_compiler_family.m4
+# We're patching m4/nut_check_python.m4
 NUT_AUTORECONF = YES
 
 # Put the PID files in a read-write place (/var/run is a tmpfs)
@@ -20,6 +21,8 @@ NUT_CONF_OPTS = \
 	--with-altpidpath=/var/run/upsd \
 	--with-dev \
 	--without-doc \
+	--without-python \
+	--without-python2 \
 	--with-user=nut \
 	--with-group=nut
 
@@ -107,4 +110,16 @@ else
 NUT_CONF_OPTS += --without-ssl
 endif
 
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+NUT_DEPENDENCIES += python3
+NUT_CONF_ENV += nut_cv_PYTHON3_SITE_PACKAGES=/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
+NUT_CONF_OPTS += \
+	--with-pynut \
+	--with-python3
+else
+NUT_CONF_OPTS += \
+	--without-pynut \
+	--without-python3
+endif
+
 $(eval $(autotools-package))
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
