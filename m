Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E128C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 15:20:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 770E040A68;
	Sat,  4 Nov 2023 15:20:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 770E040A68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9YTY319kKY2X; Sat,  4 Nov 2023 15:20:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0886440A8A;
	Sat,  4 Nov 2023 15:20:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0886440A8A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7F0AF1BF584
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 15:20:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 656334049C
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 15:20:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 656334049C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1kH-7YY9U7a1 for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 15:20:03 +0000 (UTC)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 12787403C7
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 15:20:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12787403C7
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40806e4106dso18440965e9.1
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 08:20:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699111200; x=1699716000;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4ukhIf3zKPSHcUYX3yi+phIAfSj/PLZxK++e1vDfPlY=;
 b=j15Ow9ABY1L3qZg7ZCoFzDCkelV7r99K4/eHOOeL2A0i4+uJDvkySFfOfwJGaz/mEP
 IXYMIlOuBLSWbSfP3RQodItyI5ytVnDGux+dw/NswtCH7im0X94zUPo6nEvqRveH0ge/
 /z7EdX1nLyIjywLAE5d2Pfs1CqdeNIDRCsINB0y8pAtaWlG1r1COgGmojrDRF0nnsW7s
 rNQ85Zmzgd2c4XNmoAWFuoG0qKyhw6dMub3bpu0paAdPp3r993Yx+ThDBqgs3+VFAtq8
 r1+6NRTNf5wseyR7505GOnfGbOyt5A8OYBhxQoFJuploWExXnO7PmzoSP1j2DK7P1d5s
 +ImQ==
X-Gm-Message-State: AOJu0YwQA65NWCIxRnW0fUEJ4o2JekCJrceffyqbRRqc3UcgMblcAlg0
 fAR3+MdVvZFSLYv69+X0WyB97N4VIW4=
X-Google-Smtp-Source: AGHT+IETDtosJJ8lLsdr8jIE707MEEeWdeZI7mqv+ugX9Ekk9lil41iuW4CoSeqmKPr9nF9RYb7eHw==
X-Received: by 2002:a05:600c:4449:b0:408:36bb:5b0c with SMTP id
 v9-20020a05600c444900b0040836bb5b0cmr6398024wmn.7.1699111200078; 
 Sat, 04 Nov 2023 08:20:00 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 d8-20020a05600c34c800b0040770ec2c19sm6251805wmq.10.2023.11.04.08.19.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 08:19:59 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 16:19:44 +0100
Message-ID: <20231104151944.84393-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231104151944.84393-1-fontaine.fabrice@gmail.com>
References: <20231104151944.84393-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699111200; x=1699716000; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4ukhIf3zKPSHcUYX3yi+phIAfSj/PLZxK++e1vDfPlY=;
 b=V1zAmwMhpF76HwnlGyeV+CxxocSac2WNg3l/RuldWlyzONpZN6xsPa6QZbvZxd1rPl
 gbuejqJ4oIgHYibD+y4WHFLpxKZnxihI0cOKQmHq3LujI0fbuB7N9UyHzNK7GrZvlVZt
 BD5R0Bg1QxzAFxYQBqjI1QioMtz9IsIXTTxitCE0vnKZ1WvrLMNaOGWmnqHQb2Fhoj2Z
 Oi/kG8yRx5b6UG7pHvjY85Ae/QJA5qidqVEkrGC6QS1+7A84dGZJE8d7UJa6Qnga/qKC
 qNoOGyRvZ+1td7hDG2d3JiQaDgpVk1IU2VkA4cBMw7SPX50WQe0NXReXOU90o/dMJ/mq
 aAWQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=V1zAmwMh
Subject: [Buildroot] [PATCH 2/2] package/nut: fix python build
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
 ...hon.m4-allow-overriding-of-PYTHON-2-.patch | 105 ++++++++++++++++++
 package/nut/nut.mk                            |  15 +++
 2 files changed, 120 insertions(+)
 create mode 100644 package/nut/0002-m4-nut_check_python.m4-allow-overriding-of-PYTHON-2-.patch

diff --git a/package/nut/0002-m4-nut_check_python.m4-allow-overriding-of-PYTHON-2-.patch b/package/nut/0002-m4-nut_check_python.m4-allow-overriding-of-PYTHON-2-.patch
new file mode 100644
index 0000000000..cea3b49a99
--- /dev/null
+++ b/package/nut/0002-m4-nut_check_python.m4-allow-overriding-of-PYTHON-2-.patch
@@ -0,0 +1,105 @@
+From 511ee899ee687216fa8fcf2231a60941b9e4cf81 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 3 Nov 2023 14:34:54 +0100
+Subject: [PATCH 2/2] m4/nut_check_python.m4: allow overriding of
+ PYTHON{2,3}_SITE_PACKAGES
+
+Allow the end-user to override PYTHON{2,3}_SITE_PACKAGES as this can be
+useful when cross-compiling
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
