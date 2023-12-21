Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58ECBC46CCD
	for <buildroot@archiver.kernel.org>; Thu, 21 Dec 2023 13:17:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F94C60F76;
	Thu, 21 Dec 2023 13:17:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F94C60F76
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GRCHXj5FrWqw; Thu, 21 Dec 2023 13:17:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5AFF61070;
	Thu, 21 Dec 2023 13:17:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5AFF61070
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D50401BF3A0
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 13:17:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ADF9360B30
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 13:17:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADF9360B30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A33kdr0tieYx for <buildroot@lists.busybox.net>;
 Thu, 21 Dec 2023 13:17:02 +0000 (UTC)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B7BC160671
 for <buildroot@buildroot.org>; Thu, 21 Dec 2023 13:17:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7BC160671
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40c48d7a7a7so6013275e9.3
 for <buildroot@buildroot.org>; Thu, 21 Dec 2023 05:17:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703164619; x=1703769419;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mrBKkBa9vukcI2AL5Fzb2ybEoxR1EDA88FG3kkhs2zI=;
 b=dyiYn7zd+f/ZBA/H0hLk7dOSa0uM9t/aIOC8zpDKkRjUZa6TPDH5MC3pOJwm+StSVp
 xISLOWxqEF2BWYMxc2mtAAu3Pgz2T/t82qzk0RV9kUHDcvax5K4GRdLuFj5g7Gj9kPOB
 HDj/o+JWHSca7PjKrHJPw6yFqGER9QU97g77T3KksKO7D2zNBB+JfF38Gz/vTPvxmXkr
 FdxELJ7t5HZsOB7xRBh6GuA7g8WsSuIc8puVjqHI0Hid1mlqeQhwKfpuJQUbuoVaxYui
 pNMIgj6LsMmq2nfCBTcCT9IYYlRna2eHiC/CDNC1Jn3TNU/tfTtNkGoZhUOkvIXIG2up
 tC6A==
X-Gm-Message-State: AOJu0Yw3VDC7QAbUvtBGDH+aoOklRNdm+i/e1zwtZj8Mxr3EUv30hkMI
 cSykrhtwJWMWCp1iG56OkNf5Epy3azHzwPXBssSr9g==
X-Google-Smtp-Source: AGHT+IGlHS0ptiElVCoGRJepgP+iaUnDQnT0UpjdbgZQkdUyTtfMyyF4y+kVf75tlusbDcSBwrqrUQ==
X-Received: by 2002:a05:600c:3508:b0:40d:3ad5:7616 with SMTP id
 h8-20020a05600c350800b0040d3ad57616mr972275wmq.114.1703164619380; 
 Thu, 21 Dec 2023 05:16:59 -0800 (PST)
Received: from P-NAN-KHNOUM.nantes.intranet
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 c5-20020a05600c0a4500b0040c411da99csm11207796wmq.48.2023.12.21.05.16.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Dec 2023 05:16:58 -0800 (PST)
From: Antoine Coutant <antoine.coutant@smile.fr>
To: buildroot@buildroot.org
Date: Thu, 21 Dec 2023 14:16:47 +0100
Message-Id: <20231221131647.1339454-1-antoine.coutant@smile.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1703164619; x=1703769419;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mrBKkBa9vukcI2AL5Fzb2ybEoxR1EDA88FG3kkhs2zI=;
 b=GLiM/oCj7btjWu8TyUSYZx+0Lt8pbHkNbUrWy4HVFhJdOY0GxgfbyBdupx+JhDXEG4
 x7hK95CjvkoB8fyI5cXqJw3dE5czyTp8oRyfASJvRWD1GpfqfA1agYQG7GhTSlyM057R
 AXsrEOdtjP1YXeRGl6OAg28o5Lb63UxSSmtzYu+SU1uTqGHOhJqhVHxYb0GOeajUzSMx
 1DwApx0JYZJwm+ScU74zl9WuzYKARoCl2nqUH2qUfm32K5BgtrxC52DLvDuQY2w1c9B2
 53W9y5YeDAljX5Teb5F0M01u3NXxFvD032Xc8HpY5VTYSMJkEjDUtdW5nkZB0ST5JBFM
 iwpQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=GLiM/oCj
Subject: [Buildroot] [PATCH v2 1/1] package/meson: bump version to 1.3.0
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
Cc: Antoine Coutant <antoine.coutant@smile.fr>, bernd@kuhls.net,
 stsp2@yandex.ru, james.hilliard1@gmail.com, romain.naour@gmail.com,
 yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The meson upgrade from 1.1.1 to 1.2.0 have been reverted
because host-qemu (version v8.0.3) was searching
libraries in the build machine instead of buildroot host
directory [1].
$ grep -r LINK_ARGS  * | grep "\-L/usr"
build.ninja: LINK_ARGS =
    -L/usr/lib/gcc/x86_64-linux-gnu/10 \
    -L/usr/lib/gcc/x86_64-linux-gnu/10/../../../x86_64-linux-gnu -L/usr/lib/x86_64-linux-gnu \
    -L/usr/lib/gcc/x86_64-linux-gnu/10/../../../../lib -L/usr/lib \
    -L/lib/x86_64-linux-gnu \
    -L/lib/../lib \
    -L/usr/lib/../lib \
    -L/usr/lib/gcc/x86_64-linux-gnu/10/../../.. \
    -L/lib \
    -I/[...]/host/include \
    -L/[...]/host/lib \
    -I/[...]/host/include/libfdt \
    ...

Upgrading qemu to version v8.1.0 solves the problem:
$ grep -r LINK_ARGS  * | grep "\-L/usr"
build.ninja: LINK_ARGS =
    -I/[...]/host/include \
    -L/[...]/host/lib \
    -I/[...]/host/include/libfdt \
    ...

Those two tests were done with the same buildroot version
(2023.08) on the same machine were the bug appeared. Using,
git bisect, in this environment, it was found that the
problem was fixed in qemu by the commit [2].

Thus, it is possible that the problem was introduced by
improper use of meson by qemu <= v8.0.3. Also, meson has
been updated to version 1.2.0 and 1.3.0 in yocto and it
doesn't seem to create any issue. [3]

The original problem is no longer present and some
projects require meson >= 1.3.0 (e.g. mesa3d with
rusticl).

"pkgconfig" field is deprecated by meson 1.3.0 and
replaced by "pkg-config". See: [4]

The patch that adds the pkg_config_static property has
been rebased.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/acfdf21f0b752e844a33c70a0fd2f82f4534a5a0
[2] https://gitlab.com/qemu-project/qemu/-/commit/Fc9a809e0d28417fa1e7f7efc19f845bda4c1be9
[3] https://github.com/yoctoproject/poky/commits/master/meta/recipes-devtools/meson
[4] https://mesonbuild.com/Release-notes-for-1-3-0.html#machine-files-pkgconfig-field-deprecated-and-replaced-by-pkgconfig

Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
---
Changes v1 -> v2:
	- Explain why cross-compilation.conf.in is changed.
	- Correct the buildroot version
	  (2028.08) -> (2023.08)
---
 ...dencies-base.py-add-pkg_config_stati.patch | 29 ++++++++++---------
 package/meson/meson.hash                      |  4 +--
 package/meson/meson.mk                        |  2 +-
 support/misc/cross-compilation.conf.in        |  2 +-
 4 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/package/meson/0002-mesonbuild-dependencies-base.py-add-pkg_config_stati.patch b/package/meson/0002-mesonbuild-dependencies-base.py-add-pkg_config_stati.patch
index 8e15d3210c..49a0ef93dc 100644
--- a/package/meson/0002-mesonbuild-dependencies-base.py-add-pkg_config_stati.patch
+++ b/package/meson/0002-mesonbuild-dependencies-base.py-add-pkg_config_stati.patch
@@ -1,4 +1,4 @@
-From 3d6a2db2270346236dd6247e0648ea0c949ba468 Mon Sep 17 00:00:00 2001
+From 59934e2116e025ecfe23baf6febc4a0eb85f60cd Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Sat, 15 Feb 2020 15:13:59 +0100
 Subject: [PATCH] mesonbuild/dependencies/base.py: add pkg_config_static
@@ -20,24 +20,25 @@ Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Signed-off-by: Romain Naour <romain.naour@gmail.com>
 [Rebased on 0.57.1]
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+[rebased on 1.3.0]
+Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
 ---
- mesonbuild/dependencies/pkgconfig.py | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
+ mesonbuild/dependencies/pkgconfig.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/mesonbuild/dependencies/pkgconfig.py b/mesonbuild/dependencies/pkgconfig.py
-index 1e8d9132e..d902ba215 100644
+index e86206b88..94888657d 100644
 --- a/mesonbuild/dependencies/pkgconfig.py
 +++ b/mesonbuild/dependencies/pkgconfig.py
-@@ -338,7 +338,8 @@ class PkgConfigDependency(ExternalDependency):
-         env = None
-         libcmd = ['--libs']
- 
--        if self.static:
-+        if self.static or \
-+            (self.env.properties[self.for_machine].get('pkg_config_static', None) == 'true'):
-             libcmd.append('--static')
- 
-         libcmd.append(self.name)
+@@ -169,7 +169,7 @@ class PkgConfigCLI(PkgConfigInterface):
+             env['PKG_CONFIG_ALLOW_SYSTEM_LIBS'] = '1'
+         args: T.List[str] = []
+         args += self._define_variable_args(define_variable)
+-        if static:
++        if static or (self.env.properties[self.for_machine].get('pkg_config_static', None) == 'true'):
+             args.append('--static')
+         args += ['--libs', name]
+         ret, out, err = self._call_pkgbin(args, env=env)
 -- 
 2.25.1
 
diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index cb36b674fa..8678ba5985 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/1.1.1/meson-1.1.1.tar.gz.asc
-sha256  d04b541f97ca439fb82fab7d0d480988be4bd4e62563a5ca35fadb5400727b1c  meson-1.1.1.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/1.3.0/meson-1.3.0.tar.gz.asc
+sha256  4ba253ef60e454e23234696119cbafa082a0aead0bd3bbf6991295054795f5dc  meson-1.3.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 503aca8c25..eec4c908f6 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 1.1.1
+MESON_VERSION = 1.3.0
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
diff --git a/support/misc/cross-compilation.conf.in b/support/misc/cross-compilation.conf.in
index 3c5812b131..21cec10b82 100644
--- a/support/misc/cross-compilation.conf.in
+++ b/support/misc/cross-compilation.conf.in
@@ -10,7 +10,7 @@ ar = '@TARGET_AR@'
 strip = '@TARGET_STRIP@'
 cmake = '@BR2_CMAKE@'
 fortran = '@TARGET_FC@'
-pkgconfig = '@PKGCONF_HOST_BINARY@'
+pkg-config = '@PKGCONF_HOST_BINARY@'
 g-ir-compiler = '@STAGING_DIR@/usr/bin/g-ir-compiler'
 g-ir-scanner = '@STAGING_DIR@/usr/bin/g-ir-scanner'
 rust = ['@TARGET_RUSTC@', '--target', '@RUSTC_TARGET_NAME@' ]
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
