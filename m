Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D5C3C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 21:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57B35417E4;
	Mon,  6 Nov 2023 21:41:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57B35417E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eQ1TK_oSf32l; Mon,  6 Nov 2023 21:41:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 700F54208D;
	Mon,  6 Nov 2023 21:41:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 700F54208D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2501F1BF3A6
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:41:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B6BC82064
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:41:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B6BC82064
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rZPR1vdpTYRw for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 21:41:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA77082073
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 21:41:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA77082073
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C095386AC4; Mon,  6 Nov 2023 21:41:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Nov 2023 22:40:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 68e619142b33a551d79b6896001f1b253bbcbd76
X-Git-Newrev: 7ccbe5f598a199f7defa6d22e2abfbf22dc14943
X-Patchwork-Hint: ignore
Message-Id: <20231106214130.C095386AC4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nut: fix python build
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7ccbe5f598a199f7defa6d22e2abfbf22dc14943
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...k_python.m4-allow-overriding-of-PYTHON-2-.patch | 106 +++++++++++++++++++++
 package/nut/nut.mk                                 |  15 +++
 2 files changed, 121 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
